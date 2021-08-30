Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.2225.1630353085466879155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 12:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=NaTPzGdQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id t190so17005750qke.7
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FQhsfe8zNRe2CDWnXPrvr1PmELdHYGojLTQQ1cy8q6Y=;
        b=NaTPzGdQbQ2ACbpKO1hVMfmV33vviHzwHExDwgluT31g8en8HOdVffBYWT2LW7E2JK
         /Pd/bRz0OMGJUcTuANmtQvGKWq95LdrfZ7cQApEg0mivw1q+BqvbFnZ4FBbEcqARO1vY
         VNYZXvoreqCtH/3q5fpJw7J3cZT24cV8FVUMmywXl7RciGtu4RhBSiiw86BAL+Uzs+Gy
         g9lUmxBNMt7+Rjrb8nxlOQU0x6TlBvtkOScoeNol1N2Xh+Mo+4gXwjb/5Wtb2mND1+M5
         /oWAzao8WGzRVCJxDP5gobpkCvT/NP8HZub7xVSC8vaC2l48o8P40t3+zAByrSdk3P/X
         U/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FQhsfe8zNRe2CDWnXPrvr1PmELdHYGojLTQQ1cy8q6Y=;
        b=HULESG8gyoRbj9stCR6SOPvs/pZKVE5gS63TMZiMSpfXGQGX/KhkMitgh1z/bsr5H8
         J7Ygw1fdMIWX+Gv+cc12MZEFS4VuV7gOMGZXjkesbl3Lx9vOm7yntAHgHfOfzGe9OPTT
         RmTFAToFkeTirXVKXraJ8v3NXCRVFa9Cs3N+AGjVhXn1ejGQ9P7eUuOvIZCSYq92m7oY
         kQkhKG4J9cSkZPbOA18sxdtYM4HKSN2U4gyO85FC3A5Wk51Yo7XEMOczb5vu6R4xdaeg
         5DXTTlmdDy5obY12gpL3pumSVjZvRJklioXdCmMl9HLjg66+vbi9lFSVq3wB7P1QKDu5
         hdAg==
X-Gm-Message-State: AOAM530/e9MLs8yQKDCuJzr8Owl9srcz7igcpv4XslObzsYG8fQsOLq9
	eJuISq6BgJ12M6HGNq5jihl4dG27S0T6fKUQecOtpg==
X-Google-Smtp-Source: ABdhPJwLXMOIngr9HzxtV1XnwvZv2t7OuL91ni9fcEXyXP26R7AmFDCS2gQQaKBNeaQIOyn9yFigj6a5S6a4XkpBRn0=
X-Received: by 2002:a05:620a:1105:: with SMTP id o5mr23615553qkk.278.1630353084533;
 Mon, 30 Aug 2021 12:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210823145450.103319-1-zboszor@pr.hu> <20210827073712.2766816-1-zboszor@pr.hu>
 <20210827073712.2766816-4-zboszor@pr.hu> <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
 <b75df7be-03d8-e454-60b8-1651fc935ca5@gmail.com> <CAHtQpK7SPixiNareJoFjeFHfc_NaD9sGnnQ4hrDU1+NLYicdOQ@mail.gmail.com>
In-Reply-To: <CAHtQpK7SPixiNareJoFjeFHfc_NaD9sGnnQ4hrDU1+NLYicdOQ@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 30 Aug 2021 15:51:13 -0400
Message-ID: <CAPoiz9xDN1Mx6B_TWFn0FYArM1+Y1PoXmY5TBqMBo4CHk3KfiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	zboszor@pr.hu, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 6:26 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote=
:
>
> On Mon, Aug 30, 2021 at 12:06 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <=
zboszor@gmail.com> wrote:
> >
> > 2021. 08. 30. 11:30 keltez=C3=A9ssel, Andrey Zhizhikin =C3=ADrta:
> > > Hello Zoltan,
> > >
> > > On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
> > > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote=
:
> > >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> > >>
> > >> If the kernel configuration enables module signing but no key
> > >> is provided, then the kernel generates one during the kernel build.
> > >>
> > >> The current runtime-dependency references (with only package names
> > >> without full versions) allow mixed package installations from differ=
ent
> > >> rebuilds of the same kernel version.
> > >>
> > >> This creates an issue because then the modules either don't work
> > >> or taint the kernel.
> > >>
> > >> Tighten RDEPENDS with the full package version, i.e. use (=3D ${EXTE=
NDPKGV})
> > >> markers for inter-package dependencies.
> > >>
> > >> The kernel will pull in the kernel-modules subpackage of the same
> > >> exact version automatically if KERNEL_SPLIT_MODULES=3D"0" is set.
> > >> Otherwise the situation is the same as with the old default with
> > >> one subpackage per kernel module where they have to be upgraded
> > >> manually.
> > >>
> > >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> > >> ---
> > >>   meta/classes/kernel.bbclass | 13 +++++++------
> > >>   1 file changed, 7 insertions(+), 6 deletions(-)
> > >>
> > > I'm seeing errors during the do_rootfs() with this patch applied,
> > > there are few messages like this:
> > >
> > >   * Solver encountered 1 problem(s):
> > >   * Problem 1/1:
> > >   *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-5.13.13=
+git0+91381833a4-r0.imx8mp_lpddr4_evk
> > > requires kernel-5.13.13+g91381833a4e2, but none of the providers can
> > > be installed
> > >   *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8mp_lpdd=
r4_evk
> > > requires kernel-module-libchacha-5.13.13+g91381833a4e2, but none of
> > > the providers can be installed
> > >   *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-=
r0.imx8mp_lpddr4_evk
> > > requires kernel-image-5.13.13+g91381833a4e2 =3D
> > > 5.13.13+git0+91381833a4-r0, but none of the providers can be installe=
d
> > >   *   - conflicting requests
> > >   *   - nothing provides kernel-image-image-5.13.13+g91381833a4e2 =3D
> > > 5.13.13+gitAUTOINC+91381833a4-r0 needed by
> >
> > This seems to be the problem.
> > Is there a "kernel-image-image-5.13.13" built from your kernel recipe?
>
> Yes, it is produced. But for some reasons opkg cannot resolve it
> during the do_rootfs(), which is quite odd.

I'm seeing the same issue.  All of the BSPs that I set the kernel to
not be 5.13 (i.e., 5.10, 5.4, etc) fail.  For example,
https://gitlab.com/jonmason00/meta-arm/-/jobs/1544819828
If I set the PACKAGE_CLASS to be rpm instead of ipk, everything works
as expected.  So, there must be some difference in the dep calculation
in ipk.


Thanks,
Jon

> > For me, a kernel-image-bzimage-x.y.z is built.
> >
> > > kernel-image-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_=
lpddr4_evk
> > >   *
> > >   * Solution 1:
> > >   *   - do not ask to install a package providing kernel-modules
> > >
> > > Reverting this commit does solve it, but I would like to understand
> > > more on what should be done in order to use this new mechanism you've
> > > introduced. Do you have any suggestion on what should be adapted in
> > > the BSP layer to have those RDEPENDS properly resolved?
> > >
> > > Package manager is set for me to IPK.
> > >
> > > Setting KERNEL_SPLIT_MODULES=3D"1" does not solve the issue.
> >
> > This is the default.
> > But setting it to "0" won't change whether the
> > kernel-image-image-x.y.z subpackage gets built or not.
> >
>
>
> --
> Regards,
> Andrey.
>
>=20
>
