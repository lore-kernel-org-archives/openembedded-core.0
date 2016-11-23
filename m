Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D4F3E607A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:26:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 23 Nov 2016 05:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,538,1473145200"; d="scan'208";a="194880880"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2016 05:26:50 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D56E26A4006;
	Wed, 23 Nov 2016 05:26:07 -0800 (PST)
Date: Wed, 23 Nov 2016 15:26:42 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161123132642.GB13863@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
	<fd75ccfd4bbd3420f72b32c815feb92b06b2b9fb.1479887010.git.maciej.borzecki@rndity.com>
	<20161123112356.GA12545@linux.intel.com>
	<CAD4b0_JG7ApGTZ7BxHtfv53Z-T_jKQxN9fYrEBpcHvWaiRFsKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_JG7ApGTZ7BxHtfv53Z-T_jKQxN9fYrEBpcHvWaiRFsKg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 5/7] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Wed, 23 Nov 2016 13:26:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 23, 2016 at 12:39:26PM +0100, Maciej Borzęcki wrote:
> On Wed, Nov 23, 2016 at 12:23 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Wed, Nov 23, 2016 at 08:46:31AM +0100, Maciej Borzecki wrote:
> >> Replace repeated core-image-minimal with Wic class field.
> >>
> >> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> >> ---
> >>  meta/lib/oeqa/selftest/wic.py | 111 +++++++++++++++++++++++++++---------------
> >>  1 file changed, 73 insertions(+), 38 deletions(-)
> >>
> >> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> >> index 2db14445956bc5adcf1e755844bbdb69edcb468f..37ed2c6de5a7f22f982f921476fa392304995b2e 100644
> >> --- a/meta/lib/oeqa/selftest/wic.py
> >> +++ b/meta/lib/oeqa/selftest/wic.py
> >> @@ -57,6 +57,8 @@ class Wic(oeSelfTest):
> >>      resultdir = "/var/tmp/wic/build/"
> >>      image_is_ready = False
> >>
> >> +    OE_IMAGE = "core-image-minimal"
> >> +
> >>      def setUpLocal(self):
> >>          """This code is executed before each test method."""
> >>          arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
> >> @@ -75,7 +77,7 @@ class Wic(oeSelfTest):
> >>                  tools += ' syslinux syslinux-native'
> >>              bitbake(tools)
> >>
> >> -            bitbake('core-image-minimal')
> >> +            bitbake(self.OE_IMAGE)
> >>              Wic.image_is_ready = True
> > I'd agree with Ross here - it looks less readable.
> > How it would look if we decide to add test case for another image?
> >
> 
> The usual way would be to:
> 
> class WicSatoImage(Wic):
>     OE_IMAGE = "core-image-sato"
> 
> But I think you make a fair point. The patch introduces unnecessary
> complexity, and is not really needed right now. I'll drop this patch if next
> version will be necessary.
> 
> Can you take a look at the rest of the patchset as well?
>
I already did. The patchset looks good to me. Thank you for your work!
+1

--
Regards,
Ed

