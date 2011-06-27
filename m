Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QbCwg-0005Kt-7W
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 16:37:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2011 07:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,432,1304319600"; d="scan'208";a="18825755"
Received: from unknown (HELO [10.255.13.48]) ([10.255.13.48])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2011 07:34:07 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimxJghenX5KgaN+oP-cyywABbpEtQ@mail.gmail.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
	<13b6560cbb0a8a498266eba93e93f71fb34be9c2.1308777703.git.bruce.ashfield@windriver.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0730@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0731@shsmsx502.ccr.corp.intel.com>
	<BANLkTimxJghenX5KgaN+oP-cyywABbpEtQ@mail.gmail.com>
Date: Mon, 27 Jun 2011 09:34:06 -0500
Message-ID: <1309185246.2288.11.camel@elnicho>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	"koen@dominion.thruhere.net" <koen@dominion.thruhere.net>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/2] linux-yocto: update meta SRCREV for new config groups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 14:37:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2011-06-27 at 05:56 -0700, Bruce Ashfield wrote:
> 2011/6/27 Cui, Dexuan <dexuan.cui@intel.com>:
> > Cui, Dexuan wrote:
> >> Hi, I got the following ERROR with the patch:
> >>
> >> Log data follows:
> >>> Unstaged changes after reset:
> >>> M arch/powerpc/boot/dts/mpc8315erdb.dts
> >>> Deleted branch meta-temp (was cf7d7e5).
> >>> WARNING: addon feature "features/taskstats" was not found
> >>> ERROR: required features were not found. aborting
> >>> ERROR: Function 'do_patch' failed
> >>
> >> Maybe we forgot to push the proper commits into the linux-yocto git
> >> repo?
> > BTW, I'm building emenlow with today's poky master (commit a1f79a7896b) and mete-intel (commit 76d1178ba).
> >

Just noticed that you were using emenlow so updated the meta-intel
SRCREVs, maybe that was the problem?

Tom

> > After I reverted the line
> > KERNEL_FEATURES_append=" features/taskstats",
> > at least linux-yocto's do_patch can work.
> 
> It isn't this. Can you check your local clone in git2/downloads ? Everything
> that is required is already on the servers, I double checked with a clean build
> on a clean machine, so there's nothing left to push or fix.
> 
> Bruce
> 
> >
> > Thanks,
> > -- Dexuan
> >>
> >>
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >> Of Bruce Ashfield Sent: 2011年6月23日 5:29
> >> To: richard.purdie@linuxfoundation.org
> >> Cc: dvhart@linux.intel.com; openembedded-core@lists.openembedded.org;
> >> koen@dominion.thruhere.net; Wold, Saul
> >> Subject: [OE-core] [PATCH 1/2] linux-yocto: update meta SRCREV for
> >> new config groups
> >>
> >> Updating the SRCREV for the kernel repo's meta branch to capture
> >> the following commits:
> >>
> >>   94fa015 meta: add taskstats experimental feature group
> >>   4fb2ed5 meta: enable freezer support
> >>   88d619e meta: enable fuse and cuse as modules
> >>   f465827 meta: add namespaces + experimental configs
> >>   fbdd376 meta: add devtmpfs config group
> >>   b04f6d9 meta: re-enable cgroups options in the standard kernel
> >>
> >> There's also a change to the recipe itself to trigger the taskstats
> >> optional config items by default. This is to allow the introduction
> >> of these changes gradually, since other recipes inheriting the kernel
> >> can add or ignore these options at their convenience.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> ---
> >>  meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    5 +++--
> >>  1 files changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
> >> b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
> >> index 2ee801e..90943c2 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
> >> @@ -20,9 +20,9 @@ SRCREV_machine_qemuppc =
> >>  "9d278962ff228ea9627a85b0d21ed717246ebf1f" SRCREV_machine_qemux86 =
> >>  "57545699dff0b384bb16be74b0358059da5cce6a" SRCREV_machine_qemux86-64
> >>  = "5d36c23eecdc9663c9c3a2a511d4872d3b3fd669" SRCREV_machine =
> >> "12646d158aced2ba0122787bd56ff554e371091c" -SRCREV_meta =
> >> "8888d948e0ddbc5f37bd3dc23cc1b398ab230e2e" +SRCREV_meta =
> >> "94fa015b130e96a3b6242a8ac4ff4cca9406951f"
> >>
> >> -PR = "r18"
> >> +PR = "r19"
> >>  PV = "${LINUX_VERSION}+git${SRCPV}"
> >>  SRCREV_FORMAT = "meta_machine"
> >>
> >> @@ -33,6 +33,7 @@ COMPATIBLE_MACHINE =
> >>  "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)" # Functionality flags
> >>  KERNEL_REVISION_CHECKING ?= "t"
> >>  KERNEL_FEATURES="features/netfilter"
> >> +KERNEL_FEATURES_append=" features/taskstats"
> >>  KERNEL_FEATURES_append_qemux86=" cfg/sound"
> >>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> 
> 




