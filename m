Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 41B8D761D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 11:30:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 03 Mar 2016 03:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="900272923"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.114])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2016 03:30:33 -0800
Message-ID: <1457004633.3025.13.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: "Viguera, Javier" <Javier.Viguera@digi.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 Mar 2016 11:30:33 +0000
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB790570@dor-sms-xch01.digi.com>
References: <1456337679-4602-1-git-send-email-javier.viguera@digi.com>
	<1457003268.3025.9.camel@linux.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB790570@dor-sms-xch01.digi.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 03 Mar 2016 11:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-03-03 at 11:22 +0000, Viguera, Javier wrote:
> Hi Joshua,
> 
> > 
> > -----Original Message-----
> > From: Joshua G Lock [mailto:joshua.g.lock@linux.intel.com] 
> > Sent: Thursday, March 03, 2016 12:08 PM
> > To: Viguera, Javier; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [jethro][PATCH] bluez5: allow D-Bus to spawn
> > obexd in systems without systemd
> > 
> > This looks like a valid patch for the master branch too?
> Absolutely. That's why I sent both patches together, one for master
> and this one for Jethro.
> 
> See the one for master: 
> 
> http://patchwork.openembedded.org/patch/116389/

Ah, I hadn't seen that patch as I was only looking at patches tagged
jethro. We can consider this change for jethro once it lands in master.

> 
> By the way, for Jethro I sent also a different patch (master
> backport):
> 
> http://patchwork.openembedded.org/patch/116661/
> 
> This last one is already in master and it would be great to have it
> in Jethro as well.

I just included this patch in a consolidated Jethro pull request.

Regards,

Joshua

