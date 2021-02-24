Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.182.1614193534427858638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 11:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=guRY+nnF;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zbodek@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id v22so3868361edx.13
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 11:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OiJwyKKQ3OH05iKaYp1MjZNB3GlSHt8W/KOIGyIeW38=;
        b=guRY+nnFAiwUQ+NvrEA/6VH8OuHFioWN3NdpQHY8/KfHfYh+g0L4HLJ9od0MYXgqbc
         7KFxpXftepIUn86R6MreBsYDiP+K5lXOWxP31I8TK4/dzJ7yYp6Bi9HYeQAu8ujol7RN
         WuQrOm8fUFVXcLAUdqlAZt1iQpbxpgtGPgclmBlAAlihpQEzONc2fAiNwJj+qnMDOM93
         Juo6ubWpa0rMM1MWlhCvdOewvQROqJZT16bEfTjYO4MprZBIPvLBgJoFSMu8W+jQsjPV
         TWFzmIRZ/Id2rtSiWoqjjd/JMBus0QV+YbdreWk8Z8WepEk6oXwNHNUfoVKfuBuvYES4
         UALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OiJwyKKQ3OH05iKaYp1MjZNB3GlSHt8W/KOIGyIeW38=;
        b=N6QnmbfR7khsAj6TNYa2ayj5GWj0SCM6Q5gBEyS7P3iUpTKGylp06QzErlP55c8+on
         8l7EC1PXmJRuFL6VoZ5QoSWROoTX2kACAI3MATYHq+6JLfuRvMBODK1+BIsMe8TIQnSM
         geOiX6P5oFGkqS0b/vnBk347Qbqp+OX3bhMSlLztSY7PIQSbWO9Tun5oHL2LVyySpbvV
         DPHkKAMaeJawo6Z6J+FuOXSsmTGrRLH46H7wRZskGhiFsNspPaLeTw+VmAI7DefyWlzQ
         nrQ4rghnMDZFHezcIwh7gioH68Gzv9WDWDokvzmJE1e8gnADAccjgs02ZEXypCLBLDLt
         ilXg==
X-Gm-Message-State: AOAM530gAOD1fclhRZtQXlOFdWScHBVfbNzgaqCtDMp86TwC26iqCrDM
	B/aNWjNtKZUO0S2l4LUfK1c29pj2soCykHLoVyU=
X-Google-Smtp-Source: ABdhPJy3AebgABW/HwG01plqPAEN+dEKo8h6LcPFbK9GrixqsPAsrCFa6RO6tTuP2k8dtULdr6QfLkXRSZgiMB96Fqs=
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr35169913edt.130.1614193532059;
 Wed, 24 Feb 2021 11:05:32 -0800 (PST)
MIME-Version: 1.0
References: <166535D1ACD90C64.29685@lists.openembedded.org>
 <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com>
 <8dd288691c4ec3dc0843a365cd45fa50102d0e99.camel@intel.com>
 <1666730B1A5C43B4.22789@lists.openembedded.org> <CALF_Txn4rpdz8FUmsiM+9v0tAbH32WkwjE3i_Xjq5bF2D-yLNA@mail.gmail.com>
 <CAOSpxda1rAGG0P3Dj86mLBemWDN2CUP9A6wE7HXKksXEvRb0QQ@mail.gmail.com>
In-Reply-To: <CAOSpxda1rAGG0P3Dj86mLBemWDN2CUP9A6wE7HXKksXEvRb0QQ@mail.gmail.com>
From: "Zbigniew Bodek" <zbodek@gmail.com>
Date: Wed, 24 Feb 2021 20:05:21 +0100
Message-ID: <CALF_TxnONvmdf7yPqTT1whD65i8WdVU4CVzWLe6H=84ySK6oGQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
To: Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, 
	"andrei.gherzan@huawei.com" <andrei.gherzan@huawei.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"wojciech.zmuda@huawei.com" <wojciech.zmuda@huawei.com>, 
	"zbigniew.bodek@huawei.com" <zbigniew.bodek@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Steve, I appreciate it.

Kind regards
Zbigniew

=C5=9Br., 24 lut 2021 o 19:14 Steve Sakoman <steve@sakoman.com> napisa=C5=
=82(a):
>
> On Wed, Feb 24, 2021 at 5:36 AM Zbigniew Bodek <zbodek@gmail.com> wrote:
> >
> > So... does anyone have some comments or anything against integrating
> > this change?
>
> I'm currently testing this patch for dunfell.  If all goes well it
> will be in the patch set I send for review in the near future.
>
> Steve
>
> > Kind regards
> > Zbigniew
> >
> > wt., 23 lut 2021 o 19:13 Zbigniew Bodek via lists.openembedded.org
> > <zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
> > >
> > > Hi Anuj,
> > >
> > > I just checked and yes, it's needed for gatesgarth too.
> > >
> > > Kind regards
> > > Zbigniew
> > >
> > > wt., 23 lut 2021 o 16:33 Mittal, Anuj <anuj.mittal@intel.com> napisa=
=
=C5=82(a):
> > > >
> > > > Is this change needed for the version in gatesgarth too?
> > > >
> > > > Thanks,
> > > >
> > > > Anuj
> > > >
> > > > On Tue, 2021-02-23 at 13:24 +0100, Zbigniew Bodek wrote:
> > > > > Any comments, questions, remarks to that?
> > > > >
> > > > > Kind regards
> > > > > Zbigniew
> > > > >
> > > > > pt., 19 lut 2021 o 18:20 Zbigniew Bodek via lists.openembedded.o=
rg
> > > > > <zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
> > > > > >
> > > > > > From: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > > > >
> > > > > > Problem spotted on dunfell-23.0.4
> > > > > >
> > > > > > Normally, unversioned .so is removed from -dev (default) packa=
ge
> > > > > > however it is still being referred by other agents, such as
> > > > > > webkitgtk.
> > > > > > That can be observed while executing i.e. Epiphany Browser.
> > > > > >
> > > > > > For instance:
> > > > > > platformInitializeWebProcess()
> > > > > > calls
> > > > > > wpe_loader_init("libWPEBackend-fdo-1.0.so")
> > > > > >
> > > > > > as a result one can see:
> > > > > > --------------------
> > > > > > wpe_loader_init could not load the library 'libWPEBackend-fdo-
> > > > > > 1.0.so':
> > > > > > libWPEBackend-fdo-1.0.so: cannot open shared object file:
> > > > > > No such file or directory
> > > > > > --------------------
> > > > > >
> > > > > > "master" branch contains a bumped-up version of webkitgtk
> > > > > > to which this issue does not apply (the code has changed).
> > > > > >
> > > > > > Forcefully keep this .so symlink to resolve the problem in dun=
fell.
> > > > > >
> > > > > > Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > > > > ---
> > > > > >  meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > > b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > > index cd2f7fabda..165fc74dde 100644
> > > > > > --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > > > @@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
> > > > > >  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.=
xz"
> > > > > >  SRC_URI[sha256sum] =3D
> > > > > > "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb2=
99d"
> > > > > >
> > > > > > +FILES_${PN} +=3D "${libdir}/libWPEBackend-fdo-1.0.so"
> > > > > > +FILES_SOLIBSDEV =3D ""
> > > > > > +INSANE_SKIP_${PN} +=3D "dev-so"
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > >
> > >=20
> > >
