Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.8617.1614181003060373394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 07:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHf3Cw3P;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: zbodek@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id h19so3034770edb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 07:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JbKN1pr35RvVHujrLBihR+Fp608lqUeRvlC/qntPblg=;
        b=QHf3Cw3P8f10d3iq2V9XRJQ1tO+nz8CpisXApxpPor/x2amu1J2olsGMZ5is6FJje2
         p1tDApMDf+X7RZZVPAL684r7J34jysPYX/bLwssER7gV8WmBvlx+sI7bLv4mKeh4Uoaq
         Ll7S+dy2iv2pCD6akKolUFYoWmyLzkka8kDgo3zw/EZn4MU1mdT9HEitmDYfTi2hCLrp
         O2TZ5tbOUP3LH+ODF8u32qv7gx+JR/at63dhEIHuw3oxu3ainjStl3XHg57NG0278D9v
         h+59yzle0hyZ3YgqxERnehpIOhJFTv5/NfHDPBW0UZN8Mllery0Sz+Jb+l4rNZJk9Suf
         sovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JbKN1pr35RvVHujrLBihR+Fp608lqUeRvlC/qntPblg=;
        b=scaAhsrc+Qbt2kXYfVYxU1x7QYgUEzGF8zJqb00Ra1w9bV2JtCp+sdAdWAIgPoAPK/
         6slaIA9otxTkplIfx2+Ojoc7813I4dlto95Qt82QoCVEOPEkPTYelIT9cT/n7IhHn++7
         eJ+rRt23RBxRdRH0NM7vdWkDA+sGXI79AnWJ2kY720UEOQvXhq0Fy97KyCAMX1mPyb1t
         Z/9+DssFn0ya+SC0ZKUqiPNcxlmizc9aRcNpnZdlrUfTvfL+SUXsBlEHnLiGb1wrCdpc
         FbqneTEVQXDZnvjXI1MpXoPGvuwACyfYSIn/Us9L/Q6/vAvrnxJ/KnbgEbGnGH5vxqVX
         7vTw==
X-Gm-Message-State: AOAM531Ixtf7MxUsZr5vtPItm3JQDLySB9Emb0Ae6t//dBPIeOEL8XxP
	UOs+3gGCOPSwN7x0O18dokOTKspNU48ixBDu0+O8inMzfis=
X-Google-Smtp-Source: ABdhPJyu3ce0aawgJtiD7xYcyddA1RwdM8AgE52crmBL0aVzHywac3kxcHXoLe0UDtJIC3YNqd1rpBPVvt9U1Gy6dn0=
X-Received: by 2002:a05:6402:c96:: with SMTP id cm22mr791062edb.128.1614181001232;
 Wed, 24 Feb 2021 07:36:41 -0800 (PST)
MIME-Version: 1.0
References: <166535D1ACD90C64.29685@lists.openembedded.org>
 <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com>
 <8dd288691c4ec3dc0843a365cd45fa50102d0e99.camel@intel.com> <1666730B1A5C43B4.22789@lists.openembedded.org>
In-Reply-To: <1666730B1A5C43B4.22789@lists.openembedded.org>
From: "Zbigniew Bodek" <zbodek@gmail.com>
Date: Wed, 24 Feb 2021 16:36:30 +0100
Message-ID: <CALF_Txn4rpdz8FUmsiM+9v0tAbH32WkwjE3i_Xjq5bF2D-yLNA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"andrei.gherzan@huawei.com" <andrei.gherzan@huawei.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>, 
	"wojciech.zmuda@huawei.com" <wojciech.zmuda@huawei.com>, 
	"zbigniew.bodek@huawei.com" <zbigniew.bodek@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So... does anyone have some comments or anything against integrating
this change?

Kind regards
Zbigniew

wt., 23 lut 2021 o 19:13 Zbigniew Bodek via lists.openembedded.org
<zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
>
> Hi Anuj,
>
> I just checked and yes, it's needed for gatesgarth too.
>
> Kind regards
> Zbigniew
>
> wt., 23 lut 2021 o 16:33 Mittal, Anuj <anuj.mittal@intel.com> napisa=C5=
=82(a):
> >
> > Is this change needed for the version in gatesgarth too?
> >
> > Thanks,
> >
> > Anuj
> >
> > On Tue, 2021-02-23 at 13:24 +0100, Zbigniew Bodek wrote:
> > > Any comments, questions, remarks to that?
> > >
> > > Kind regards
> > > Zbigniew
> > >
> > > pt., 19 lut 2021 o 18:20 Zbigniew Bodek via lists.openembedded.org
> > > <zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
> > > >
> > > > From: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > >
> > > > Problem spotted on dunfell-23.0.4
> > > >
> > > > Normally, unversioned .so is removed from -dev (default) package
> > > > however it is still being referred by other agents, such as
> > > > webkitgtk.
> > > > That can be observed while executing i.e. Epiphany Browser.
> > > >
> > > > For instance:
> > > > platformInitializeWebProcess()
> > > > calls
> > > > wpe_loader_init("libWPEBackend-fdo-1.0.so")
> > > >
> > > > as a result one can see:
> > > > --------------------
> > > > wpe_loader_init could not load the library 'libWPEBackend-fdo-
> > > > 1.0.so':
> > > > libWPEBackend-fdo-1.0.so: cannot open shared object file:
> > > > No such file or directory
> > > > --------------------
> > > >
> > > > "master" branch contains a bumped-up version of webkitgtk
> > > > to which this issue does not apply (the code has changed).
> > > >
> > > > Forcefully keep this .so symlink to resolve the problem in dunfell=
.
> > > >
> > > > Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > > ---
> > > >  meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > index cd2f7fabda..165fc74dde 100644
> > > > --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > > @@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
> > > >  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> > > >  SRC_URI[sha256sum] =3D
> > > > "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
> > > >
> > > > +FILES_${PN} +=3D "${libdir}/libWPEBackend-fdo-1.0.so"
> > > > +FILES_SOLIBSDEV =3D ""
> > > > +INSANE_SKIP_${PN} +=3D "dev-so"
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > >
> >
>
>=20
>
