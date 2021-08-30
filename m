Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.15207.1630319186121530310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 03:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MERiXTL/;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id m18so16030368lfl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 03:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X9XSBtvpx5Xn4Pf8dKC3zMpoxtwxBItA3xAs14ZnBA8=;
        b=MERiXTL/Rd+S+1SDaf0CIxMIwlm+mEXW1L2f5pnY9P4jNRNhohdnjkZmI/UrjYJ8jo
         LimrGk1pwX37gLugKoSmYrlO6S9O8A1z385bFo9QpMy4epYcFQy3VPRrOl9kswmMnpro
         H9r62OGrlI1w08P9YRVqBMZyIgvMC9ZJtJ+2/qY2mth9dm6N8DlO821nKVFPVlyuYMs0
         Whyun/6a7Nntwm06KWzazgDISoltdM1PcB5yjDxPSdBn0RGGOHKjUTJqPjijqK6lP/0y
         +0VVgGihTvAOqVlRTTmxBLxvnCABWGZUxqKNt02NPjGV9qBw/DgEXatN70ecjPaoD3Q7
         gYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X9XSBtvpx5Xn4Pf8dKC3zMpoxtwxBItA3xAs14ZnBA8=;
        b=EN0TlqR9dUU5+DlFsIpiPiMZE1O/plwv+uEt3tSTpSNDH9JH5tlcBWh7Lc33uNqAgk
         8H2NQ6hDIswF+xk3NmggMiEYZY3jmCam7qcim7AJu7c4PupiKNWeuCmZnJk3g7fNkq0j
         tsHnzxgR5k35ShYCsOomSyG+SufmFvfZ77B+RLK8mPChYvEuE/0pxqrchiP3gdGWngz7
         QdGaqSQ/otXftGw7/fXLpUORwnyy0LlyHUq5xALKhXscGKj5p6ogdlqPxzYJJdxcpALU
         zI1gceQ0QEB8r9tCejr1IrjvyTes5Y9F6Q6x9FLwroyK/rWKmMg4YNTrgUKKiHuMfR2T
         nS9w==
X-Gm-Message-State: AOAM530MDRFiL13/TDWZrFWzVgMSatsNlNl05MDMNoUWnZersZLWv0DA
	MfIxg3AyPcLSyFRUM4frn4ABh12eXlwoyyl8c+k=
X-Google-Smtp-Source: ABdhPJzUqi85mYbsNcN3+wMRHZEGNX0Wl18/ftMNCeRNwG1jeKivFPcfFOByEmhpttNYI7Wg39a5gcV3rnrTY74aPF4=
X-Received: by 2002:a05:6512:ba8:: with SMTP id b40mr17347264lfv.50.1630319184042;
 Mon, 30 Aug 2021 03:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210823145450.103319-1-zboszor@pr.hu> <20210827073712.2766816-1-zboszor@pr.hu>
 <20210827073712.2766816-4-zboszor@pr.hu> <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
 <b75df7be-03d8-e454-60b8-1651fc935ca5@gmail.com>
In-Reply-To: <b75df7be-03d8-e454-60b8-1651fc935ca5@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 30 Aug 2021 12:25:50 +0200
Message-ID: <CAHtQpK7SPixiNareJoFjeFHfc_NaD9sGnnQ4hrDU1+NLYicdOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: zboszor@pr.hu, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2021 at 12:06 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zb=
oszor@gmail.com> wrote:
>
> 2021. 08. 30. 11:30 keltez=C3=A9ssel, Andrey Zhizhikin =C3=ADrta:
> > Hello Zoltan,
> >
> > On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
> > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>
> >> If the kernel configuration enables module signing but no key
> >> is provided, then the kernel generates one during the kernel build.
> >>
> >> The current runtime-dependency references (with only package names
> >> without full versions) allow mixed package installations from differen=
t
> >> rebuilds of the same kernel version.
> >>
> >> This creates an issue because then the modules either don't work
> >> or taint the kernel.
> >>
> >> Tighten RDEPENDS with the full package version, i.e. use (=3D ${EXTEND=
PKGV})
> >> markers for inter-package dependencies.
> >>
> >> The kernel will pull in the kernel-modules subpackage of the same
> >> exact version automatically if KERNEL_SPLIT_MODULES=3D"0" is set.
> >> Otherwise the situation is the same as with the old default with
> >> one subpackage per kernel module where they have to be upgraded
> >> manually.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta/classes/kernel.bbclass | 13 +++++++------
> >>   1 file changed, 7 insertions(+), 6 deletions(-)
> >>
> > I'm seeing errors during the do_rootfs() with this patch applied,
> > there are few messages like this:
> >
> >   * Solver encountered 1 problem(s):
> >   * Problem 1/1:
> >   *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-5.13.13+g=
it0+91381833a4-r0.imx8mp_lpddr4_evk
> > requires kernel-5.13.13+g91381833a4e2, but none of the providers can
> > be installed
> >   *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4=
_evk
> > requires kernel-module-libchacha-5.13.13+g91381833a4e2, but none of
> > the providers can be installed
> >   *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0=
.imx8mp_lpddr4_evk
> > requires kernel-image-5.13.13+g91381833a4e2 =3D
> > 5.13.13+git0+91381833a4-r0, but none of the providers can be installed
> >   *   - conflicting requests
> >   *   - nothing provides kernel-image-image-5.13.13+g91381833a4e2 =3D
> > 5.13.13+gitAUTOINC+91381833a4-r0 needed by
>
> This seems to be the problem.
> Is there a "kernel-image-image-5.13.13" built from your kernel recipe?

Yes, it is produced. But for some reasons opkg cannot resolve it
during the do_rootfs(), which is quite odd.

> For me, a kernel-image-bzimage-x.y.z is built.
>
> > kernel-image-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lp=
ddr4_evk
> >   *
> >   * Solution 1:
> >   *   - do not ask to install a package providing kernel-modules
> >
> > Reverting this commit does solve it, but I would like to understand
> > more on what should be done in order to use this new mechanism you've
> > introduced. Do you have any suggestion on what should be adapted in
> > the BSP layer to have those RDEPENDS properly resolved?
> >
> > Package manager is set for me to IPK.
> >
> > Setting KERNEL_SPLIT_MODULES=3D"1" does not solve the issue.
>
> This is the default.
> But setting it to "0" won't change whether the
> kernel-image-image-x.y.z subpackage gets built or not.
>


--=20
Regards,
Andrey.
