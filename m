Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5573.1630416767390514701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ahz44iM9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id q11so27723445wrr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MAlVOiWy25yz6jv7wG9IWh/m5Q/qwzfokx46GX/SWiU=;
        b=ahz44iM9joel6ccTZO0uda1Uw3sGdUKAAnPy6SzM4Dks/oAbJr9xzEzqbhSzEQdYhe
         qpZAUV6N5boxsDurasZ30LdiGoOXUeJnNotbJxtQAZmOBz7s/tYK5f12oMwF6/51vfsT
         EGj5xFQsJkBsLVj4p9aeYAqAVPy7WmL+NTl4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MAlVOiWy25yz6jv7wG9IWh/m5Q/qwzfokx46GX/SWiU=;
        b=HWa7ZL2pl8/mRCJCpoQz+K26sPKgQhlhN5SRELTDTYqqlSUjCJ9mLVzD6+iQrZSLZT
         gh9A6gs6k7GYdUDT3lhy5/ByT+Px3EORZIzLT+5NiRHO17jVFhJh1rcunccuRke/YhEh
         sP6vCkRFns2S/7YvMeSz62lhhQrsMsCBfsFAgBY17YXmB5UeZOUFSqCzNL1AfJHAfFJv
         MY6iVIYX2bjipu8qDm7wrJcF8OpauMK6UfiTsxPdb9cIsY1ejSOfQYHnQB4Gv5KiK5vC
         6qPyL0hneb9iptk/W4gcRC3lMrJjex7QDf2vPEbk74QD7H9bVjqVujWed1VsSL3NJLY0
         eA5A==
X-Gm-Message-State: AOAM530c1bdOy4u22o+jR4prLgYS0SoAkRivbnzNrDpc49Az/FA27PJR
	HWrZXVy88cf2LEqYjqYo1Ig0KQ==
X-Google-Smtp-Source: ABdhPJyKZ/lb7ePwLbqrLRzwF+oE+FwAvGuLzWnlqeknDYdN66JNW2YvbgEjfoaTYNHCqvPik2GZIg==
X-Received: by 2002:a05:6000:160c:: with SMTP id u12mr2776269wrb.128.1630416765851;
        Tue, 31 Aug 2021 06:32:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id j17sm18173833wrh.67.2021.08.31.06.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:32:45 -0700 (PDT)
Message-ID: <d1d90fb8282b9cab972d7227c0f25632b4c51b13.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zboszor@pr.hu, Jon Mason <jdmason@kudzu.us>, Andrey Zhizhikin
	 <andrey.z@gmail.com>
Cc: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, OE
	Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Aug 2021 14:32:42 +0100
In-Reply-To: <f52a6dae-426c-34f3-448d-e4ba50b23438@pr.hu>
References: <20210823145450.103319-1-zboszor@pr.hu>
	 <20210827073712.2766816-1-zboszor@pr.hu>
	 <20210827073712.2766816-4-zboszor@pr.hu>
	 <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
	 <b75df7be-03d8-e454-60b8-1651fc935ca5@gmail.com>
	 <CAHtQpK7SPixiNareJoFjeFHfc_NaD9sGnnQ4hrDU1+NLYicdOQ@mail.gmail.com>
	 <CAPoiz9xDN1Mx6B_TWFn0FYArM1+Y1PoXmY5TBqMBo4CHk3KfiA@mail.gmail.com>
	 <f52a6dae-426c-34f3-448d-e4ba50b23438@pr.hu>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-08-31 at 06:28 +0200, Zoltan Boszormenyi via lists.openembedded.org
wrote:
> 2021. 08. 30. 21:51 keltezéssel, Jon Mason írta:
> > On Mon, Aug 30, 2021 at 6:26 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > 
> > > On Mon, Aug 30, 2021 at 12:06 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
> > > > 
> > > > 2021. 08. 30. 11:30 keltezéssel, Andrey Zhizhikin írta:
> > > > > Hello Zoltan,
> > > > > 
> > > > > On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
> > > > > lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
> > > > > > From: Zoltán Böszörményi <zboszor@gmail.com>
> > > > > > 
> > > > > > If the kernel configuration enables module signing but no key
> > > > > > is provided, then the kernel generates one during the kernel build.
> > > > > > 
> > > > > > The current runtime-dependency references (with only package names
> > > > > > without full versions) allow mixed package installations from different
> > > > > > rebuilds of the same kernel version.
> > > > > > 
> > > > > > This creates an issue because then the modules either don't work
> > > > > > or taint the kernel.
> > > > > > 
> > > > > > Tighten RDEPENDS with the full package version, i.e. use (= ${EXTENDPKGV})
> > > > > > markers for inter-package dependencies.
> > > > > > 
> > > > > > The kernel will pull in the kernel-modules subpackage of the same
> > > > > > exact version automatically if KERNEL_SPLIT_MODULES="0" is set.
> > > > > > Otherwise the situation is the same as with the old default with
> > > > > > one subpackage per kernel module where they have to be upgraded
> > > > > > manually.
> > > > > > 
> > > > > > Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> > > > > > ---
> > > > > >    meta/classes/kernel.bbclass | 13 +++++++------
> > > > > >    1 file changed, 7 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > I'm seeing errors during the do_rootfs() with this patch applied,
> > > > > there are few messages like this:
> > > > > 
> > > > >    * Solver encountered 1 problem(s):
> > > > >    * Problem 1/1:
> > > > >    *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> > > > > requires kernel-5.13.13+g91381833a4e2, but none of the providers can
> > > > > be installed
> > > > >    *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> > > > > requires kernel-module-libchacha-5.13.13+g91381833a4e2, but none of
> > > > > the providers can be installed
> > > > >    *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> > > > > requires kernel-image-5.13.13+g91381833a4e2 =
> > > > > 5.13.13+git0+91381833a4-r0, but none of the providers can be installed
> > > > >    *   - conflicting requests
> > > > >    *   - nothing provides kernel-image-image-5.13.13+g91381833a4e2 =
> > > > > 5.13.13+gitAUTOINC+91381833a4-r0 needed by
> > > > 
> > > > This seems to be the problem.
> > > > Is there a "kernel-image-image-5.13.13" built from your kernel recipe?
> > > 
> > > Yes, it is produced. But for some reasons opkg cannot resolve it
> > > during the do_rootfs(), which is quite odd.
> > 
> > I'm seeing the same issue.  All of the BSPs that I set the kernel to
> > not be 5.13 (i.e., 5.10, 5.4, etc) fail.  For example,
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/1544819828
> > If I set the PACKAGE_CLASS to be rpm instead of ipk, everything works
> > as expected.  So, there must be some difference in the dep calculation
> > in ipk.
> 
> Interesting.
> 
> Can you both please try setting KERNEL_SPLIT_MODULES="0" in your kernel recipe?
> In my testing, it works for both ipk and rpm properly.
> 
> I am thinking that probably the full version dependency should
> only be used in the KERNEL_SPLIT_MODULES="0" case.
> This can be easily tested, unlike the packaging method.

Ross noticed it was failing with unexpanded AUTOINC references. That made me
realise that using the unexpanded version of the variable in these cases might
help. I've sent out that patch for review/testing.

Cheers,

Richard

