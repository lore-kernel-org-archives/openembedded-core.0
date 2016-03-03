Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 263AF770FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 15:55:33 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id l127so31790995iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AuYoyLawz8+n82m0GsUy0HWNP/oOGlTUAzclus8G1N8=;
	b=yRhxb1MEdxY3SEwLD41/fzuO1dyWkwPX6s2j0iDRNyohpL77LSAy6RXDB1njHyEv6O
	YiyLo6DI5pB0ZqrMA7afLyehyGfGqKAU83CS7auLRhiGR9nKLOqexJLeL/hZduJTA8Iv
	TpPjElEb0ud2N293fdTMKn63yM2ofUkwh1yk/FXpIOB15h81LCsmanXJr/GmgwZBipVc
	mqPR3g/9k4KTluJURDwd1ZMzcXXv0zjKJo+UKxB2kRSeMyoXMsxUrVcKtJKp31mECWU2
	qpm948C1TQVTrChDqsjcIqooGS45ykMfAFOvxaPVbQPJNBAzyU7IrwUa68Xf4DmU32rf
	Ka+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AuYoyLawz8+n82m0GsUy0HWNP/oOGlTUAzclus8G1N8=;
	b=Vv0Moz4jEetOi59fuvFEXQjDBA+9+0YhupQhwSdRNuGhwr22CJNgie2+JgZiRqxRls
	8flylk+lqI3e3ZgUe41CaKGMPI+6B2p/UFZtgWPXu2fLylMJlG2cSOsq66Kf9Mxdg+E3
	fMV6Kzdi+JU1h1TlNnwwuZWO3gdjQAq0PUDi5j7hMV7XmWmLMrW3HR8xA3X0UBvzIakS
	ZB0giMes7LbodwxIndGSetV6PhRgli43QPvgWfd8O0BFKnhML2U2xq1X/lkz4noxtSJv
	l4UyoHn5hsrSm4Eyb4/quvfmsRxSmwornFzmmmPSE13Aa4iFP3gmuSs7lphCJFQSEd85
	+w2A==
X-Gm-Message-State: AD7BkJJD0GtDI/69AK4sNK+LxCnEKr0M7l+ENVBDWDpwOrYBJOy89zZs8QAPAVkNJ5472sE10MAesD9e0rUnbz2w
X-Received: by 10.107.185.8 with SMTP id j8mr3354906iof.94.1457020534346; Thu,
	03 Mar 2016 07:55:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.6.195 with HTTP; Thu, 3 Mar 2016 07:54:54 -0800 (PST)
In-Reply-To: <1457014986.25131.69.camel@linuxfoundation.org>
References: <1457014986.25131.69.camel@linuxfoundation.org>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 3 Mar 2016 15:54:54 +0000
Message-ID: <CAPhnLPBC-ACSg4TcJtqaNhqssMhzv7oCBGM5FUGxzYbNwJr7dw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Michael Halstead <michael@yoctoproject.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Thu, 03 Mar 2016 15:55:35 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2016 at 14:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm not sure people realise quite how much pain we've been suffering
> this week trying to get things stabilised for M3. To illustrate the
> kinds of problems, let me give an idea of the issues in the past few
> days. The resolved list:
>
> * gobject-introspection has sstate relocation issues
> * gobject-introspection was missing a dependency
> * allarch contamination issues from gnomebase defaulting to g-i
> * gobject-introspection fails on x32
> * oe-selftest failures from the vm class changes
> * random createrepo issue
> * autobuilder workers were replaced with new distros
>   - one had firewall problems
>   - two had network interface problems
>   - another had VNC issues causing sanity test failures
> * there were autobuilder configuration changes
>   - eSDK changes failed initial
>   - increased ptest coverage failed initially
>   - uninative tarball publishing wasn't correct
>   - handle meta-poky transition
>   - handle adt-installer removal
> * uninative output name issues (BUILD_ARCH verses SDK_ARCH)
> * uninative sstate interaction issues (NATIVESDKSTRING)
> * ongoing pseudo retry issues
> * bitbake unpack improvements broke
> * canterall fonts broke oe-selftest
> * unsafe script references broke sanity tests
> * unsafe binary references broke in sanity tests due to prelink problem
> * meta-yocto -> meta-poky had multiple problems
> * race in do_rootfs_wicenv
> * eudev change broke oe-selftest
> * rpm upgrade went through multiple different build failures
> * toaster references to meta-yocto
> * I screwed up manually fixing a simple merge breaking builds. Twice :(
>
> Things which still break:
>
> * rpm upgrade causes smart remove to not function
> * gobject-introspection breaks on multilib with python-pygobject file
>   location issue
> * gobject-introspection fails on musl
> * createrepo has occasional failure with checksum mismatch
> * oe-selftest signing failure
> * sato application launch failures from glib issues due to prelink
> * meta-fsl-ppc breaks on eudev change (patch pending)
> * meta-fsl-ppc breakage blocks AB artefact publishing
>
> There are only a small number of us who dive in and try and untangle
> the twisted web of which patch is causing which issue and try and put
> these things on a path to resolution
>
> With this level of issues, we're simply not able to consider things
> like "why aren't you testing X?" or "can you test this patch to this
> component to get debugging?". There are 101 things that many of us
> would love to do but we need to improve the turnaround time of the
> tests we have. There are some simple things that come to mind that we
> could do:
>
> a) optimisation of oe-selftest. Currently it takes around 8 hours but
> we could cut that time massively with some optimisation around the
> sstate cache and the way the tests are written. This one does catch
> many valid issues but its way too slow. Parallelism is also an option
> here.
>
> b) switch to uninative by default to improve native/cross artefact
> reuse on the autobuilder. I have patches queued in -next to test this,
> see if we could switch to it.
>
> c) switch to the new AB cluster when its ready (newer/faster hardware)
>

We're expecting the new AB cluster to be available this week. When it
is, I'll need a day to run it through the paces and make sure
everything is ok, but, expect this to be available around the 7th.

> Volunteers for a) would be most welcome, other ideas welcome too.
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

