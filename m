Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.5711.1630418084344188639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cdPVhdxi;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id z2so38779355lft.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JTYQgxkuAU2jOoZP4x3L+isYr+M5t+7oTRb8klQuVvA=;
        b=cdPVhdxibpHc04wg4t0U8TeNJmVdG2ZMQwaEihbu50pfED0hqwzm6FUnGynnzh2R6Z
         HA5jT/9J6tR43Oxh8pDAkOm8sW8xaEt4cQ+fYxTaEkX552kx9mbc7vdJryveUFNuu+Ts
         aU7XSml1Yuj6N/QOslUeQHKfaELmZSPwc/IjjnzbOwpSpkmhxBKETvs2IDvfuymnwc0G
         PRsSebp1UU7QdY3YGZqmuiG2Oa1iFiv5u88ZqBAnmIAOwnnjKaKtpIYAxu3oC4fZ3AHK
         LN4MezOxFh39oOk41MDqDeIkbb+MepI4Y142hYHAi6udfg+83QkWflMRL1zVyQKG/hEC
         Tvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JTYQgxkuAU2jOoZP4x3L+isYr+M5t+7oTRb8klQuVvA=;
        b=itfmfVX48aht8Yr9pwmT11vNGqaNvmw6AB+zMGSIM4Kuy5PhrDi09ZnWTdev8cMQwk
         3UgZa7L2yYw9i6N3Q+NdGEcYfCfvWcgczZQb7mFgbk9QxQYRyMSMoMVETz64nwv2HDYj
         zXxiRQ0Yer/24FNXlgCv1OvMDoB+sBJ7rT/cegOFJkm48sOyxlRGd7KPK+RX4zpH7/hR
         0R1HETfhPQnzf1yHKOa2cZGwRrAj2gCxbLbE3QNWNF6A0laRMXy0V9RfJ6VXSxcBaceb
         zqTahpb3tWAjKZGIA0U+ShSXnlKQlaiFvbVvqcxpqujXaOf+jQqE2pVP+oEgiRzunylb
         MFPg==
X-Gm-Message-State: AOAM531QC7IG0CNdjDnd5MLa1c2xUDzifVx/t3avnJvZnMKIvRtV8ryZ
	XMp0bqFc+xdQmM5BUm7GdOIvnNd2Dtpjtb5wsjnJU1OPeRqRHQ==
X-Google-Smtp-Source: ABdhPJx+4CxP5aT6eQj7iTYYAh0PLpNDZvpyQEbEed230Dgq8WKxH4cvT6GcZ4he7Ey5py1qN5DE8AfVrDlFdGzEjj4=
X-Received: by 2002:a05:6512:ba8:: with SMTP id b40mr22216402lfv.50.1630418082695;
 Tue, 31 Aug 2021 06:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210823145450.103319-1-zboszor@pr.hu> <20210827073712.2766816-1-zboszor@pr.hu>
 <20210827073712.2766816-4-zboszor@pr.hu> <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
 <b75df7be-03d8-e454-60b8-1651fc935ca5@gmail.com> <CAHtQpK7SPixiNareJoFjeFHfc_NaD9sGnnQ4hrDU1+NLYicdOQ@mail.gmail.com>
 <CAPoiz9xDN1Mx6B_TWFn0FYArM1+Y1PoXmY5TBqMBo4CHk3KfiA@mail.gmail.com>
 <f52a6dae-426c-34f3-448d-e4ba50b23438@pr.hu> <d1d90fb8282b9cab972d7227c0f25632b4c51b13.camel@linuxfoundation.org>
In-Reply-To: <d1d90fb8282b9cab972d7227c0f25632b4c51b13.camel@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 31 Aug 2021 15:54:07 +0200
Message-ID: <CAHtQpK7+7jUNsN2EuZrDJ2P_1VJAMkgrQm0ZePr+gth1gho6NQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: zboszor@pr.hu, Jon Mason <jdmason@kudzu.us>, 
	=?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On Tue, Aug 31, 2021 at 3:32 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-08-31 at 06:28 +0200, Zoltan Boszormenyi via lists.openembed=
ded.org
> wrote:
> > 2021. 08. 30. 21:51 keltez=C3=A9ssel, Jon Mason =C3=ADrta:
> > > On Mon, Aug 30, 2021 at 6:26 AM Andrey Zhizhikin <andrey.z@gmail.com>=
 wrote:
> > > >
> > > > On Mon, Aug 30, 2021 at 12:06 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
> > > > >
> > > > > 2021. 08. 30. 11:30 keltez=C3=A9ssel, Andrey Zhizhikin =C3=ADrta:
> > > > > > Hello Zoltan,
> > > > > >
> > > > > > On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
> > > > > > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org>=
 wrote:
> > > > > > > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> > > > > > >
> > > > > > > If the kernel configuration enables module signing but no key
> > > > > > > is provided, then the kernel generates one during the kernel =
build.
> > > > > > >
> > > > > > > The current runtime-dependency references (with only package =
names
> > > > > > > without full versions) allow mixed package installations from=
 different
> > > > > > > rebuilds of the same kernel version.
> > > > > > >
> > > > > > > This creates an issue because then the modules either don't w=
ork
> > > > > > > or taint the kernel.
> > > > > > >
> > > > > > > Tighten RDEPENDS with the full package version, i.e. use (=3D=
 ${EXTENDPKGV})
> > > > > > > markers for inter-package dependencies.
> > > > > > >
> > > > > > > The kernel will pull in the kernel-modules subpackage of the =
same
> > > > > > > exact version automatically if KERNEL_SPLIT_MODULES=3D"0" is =
set.
> > > > > > > Otherwise the situation is the same as with the old default w=
ith
> > > > > > > one subpackage per kernel module where they have to be upgrad=
ed
> > > > > > > manually.
> > > > > > >
> > > > > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com>
> > > > > > > ---
> > > > > > >    meta/classes/kernel.bbclass | 13 +++++++------
> > > > > > >    1 file changed, 7 insertions(+), 6 deletions(-)
> > > > > > >
> > > > > > I'm seeing errors during the do_rootfs() with this patch applie=
d,
> > > > > > there are few messages like this:
> > > > > >
> > > > > >    * Solver encountered 1 problem(s):
> > > > > >    * Problem 1/1:
> > > > > >    *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-=
5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
> > > > > > requires kernel-5.13.13+g91381833a4e2, but none of the provider=
s can
> > > > > > be installed
> > > > > >    *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8=
mp_lpddr4_evk
> > > > > > requires kernel-module-libchacha-5.13.13+g91381833a4e2, but non=
e of
> > > > > > the providers can be installed
> > > > > >    *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+9138=
1833a4-r0.imx8mp_lpddr4_evk
> > > > > > requires kernel-image-5.13.13+g91381833a4e2 =3D
> > > > > > 5.13.13+git0+91381833a4-r0, but none of the providers can be in=
stalled
> > > > > >    *   - conflicting requests
> > > > > >    *   - nothing provides kernel-image-image-5.13.13+g91381833a=
4e2 =3D
> > > > > > 5.13.13+gitAUTOINC+91381833a4-r0 needed by
> > > > >
> > > > > This seems to be the problem.
> > > > > Is there a "kernel-image-image-5.13.13" built from your kernel re=
cipe?
> > > >
> > > > Yes, it is produced. But for some reasons opkg cannot resolve it
> > > > during the do_rootfs(), which is quite odd.
> > >
> > > I'm seeing the same issue.  All of the BSPs that I set the kernel to
> > > not be 5.13 (i.e., 5.10, 5.4, etc) fail.  For example,
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/1544819828
> > > If I set the PACKAGE_CLASS to be rpm instead of ipk, everything works
> > > as expected.  So, there must be some difference in the dep calculatio=
n
> > > in ipk.
> >
> > Interesting.
> >
> > Can you both please try setting KERNEL_SPLIT_MODULES=3D"0" in your kern=
el recipe?
> > In my testing, it works for both ipk and rpm properly.
> >
> > I am thinking that probably the full version dependency should
> > only be used in the KERNEL_SPLIT_MODULES=3D"0" case.
> > This can be easily tested, unlike the packaging method.
>
> Ross noticed it was failing with unexpanded AUTOINC references. That made=
 me
> realise that using the unexpanded version of the variable in these cases =
might
> help. I've sent out that patch for review/testing.

This did solve the build issue! Thanks for narrowing it down!

>
> Cheers,
>
> Richard
>


--=20
Regards,
Andrey.
