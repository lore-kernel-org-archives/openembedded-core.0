Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3A48605FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 10:38:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 22 Mar 2016 03:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,376,1455004800"; d="scan'208";a="768944929"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.4.152])
	by orsmga003.jf.intel.com with ESMTP; 22 Mar 2016 03:38:01 -0700
Message-ID: <1458643079.3186.4.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 22 Mar 2016 10:37:59 +0000
In-Reply-To: <56EFDCAC.6080806@digi.com>
References: <1456337679-4602-1-git-send-email-javier.viguera@digi.com>
	<1457003268.3025.9.camel@linux.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB790570@dor-sms-xch01.digi.com>
	<1457004633.3025.13.camel@linux.intel.com> <56EFDCAC.6080806@digi.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Cc: Javier Viguera <javier.viguera@digi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2016 10:38:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

On Mon, 2016-03-21 at 12:36 +0100, Javier Viguera wrote:
> Hi Joshua
> 
> On 03/03/16 12:30, Joshua G Lock wrote:
> > Ah, I hadn't seen that patch as I was only looking at patches
> > tagged
> > jethro. We can consider this change for jethro once it lands in
> > master.
> > 
> This has been finally merged into master.
> 
> Would you now consider cherry-picking it into *jethro* ?

Could you consider cherry-picking this fix for Jethro?

http://git.openembedded.org/openembedded-core/commit/?id=75c5dc8d4a5506
bf5b89292a96c7b9f91e9d71c8

---

bluez5: allow D-Bus to spawn obexd in systems without systemd
This includes a proper D-Bus service file for obexd in systems that do
not support systemd.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

---

Thanks,

Joshua

