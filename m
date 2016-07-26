Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BD18C607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 16:27:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2016 09:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="1024287840"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.94])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2016 09:27:57 -0700
Message-ID: <1469550475.2740.9.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 17:27:55 +0100
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.20.4 (3.20.4-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Allows to copy symlinks to DUTs with testimage
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
X-List-Received-Date: Tue, 26 Jul 2016 16:27:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-07-26 at 07:39 +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> Currently when using the install functionality in the DUT without
> package
> manager, if you copy a symlink the function will fail.
> 
> These series will change the behaviour and will allow to recreate the
> symlinks in the DUT.
> 
> [YOCTO #9932]


Would oe.path.copytree() work instead of using shutil.copytree()?
copytree() was added because shutil was quite slow for our usage.

Regards,

Joshua

