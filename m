Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.189585.1598252170964918292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CtrK1IX9;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id a5so7521177wrm.6
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8LvnmTLRTm33YOkG7jhdMTLkY5OpSUDmZQ/k4czrS4M=;
        b=CtrK1IX9S2SO6kzXxIrLyJSsNIWK9JUGcPV2A81eGrPeSIIIIqR9Gn3S01AfpfOTYb
         VbO0okm/o+HX3VXrAQG2fKLYJ36wioPdi0LE+CqAvqfjgc6qaQImDzTKjJYkt6oTOKcQ
         a4eNvP9ouB9wXuA8Rx/HOqXeFBIP8+NYksJNEGLP1baSR7ZKF1xfqeA5pCj21Els8MXY
         k0ikv9t8Q/5ywY2Ynmel5+RJCQtbgnh6nMyQ71zETDwMJ0nBNa+g6w7N3TNhIaDhBOhW
         kxI6zT4qgTcrUmolHuxIikvAw+HvBlzHHOIRUz19PL0BArpppc/pHTOA75Mr5JA7ix/d
         /uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LvnmTLRTm33YOkG7jhdMTLkY5OpSUDmZQ/k4czrS4M=;
        b=sFVvXwzfZvbRbT6u3tZw8NntxP3tbhcYs4li0LWk0azFfDP1hIbOpCnNwgy0s+m3l1
         hLqiUqQUbBMSDGIv1nZRsE3CJE3bGr/tHYy4LYF8ZUlmIb77E2/na1UXJgZ2KvR5bgkX
         yyoOT9VckkKgrm8pvM8l7/3HYK99yDvn8ygVwhNXFO9RIR3eFf5wThqo12UUjGC3MXRa
         /lnbXTmanVTwX68u6GwT/hX/3YSwtywkYESqgYLJVmH1a4vOjDFRofo8kXL81ES16wK3
         a8KIdevrz6am2MMdGpmwJKRSZmmds6P0iiXZZPT7xRXfuy97kSi13hP9wMzvYmseivrZ
         y8qg==
X-Gm-Message-State: AOAM5336uzfDN7UxQreQa1Ge6iMcBzKFKp7ibqySWk1klDalptNs/xkE
	ZPZeaUU6sG+9NLbm1TQMoft6jb6l4jM4I28o1o0=
X-Google-Smtp-Source: ABdhPJwCVH09gfBRyoNki/ySDHF8iIwAv/H8V6qvmeuyVWiosnXg24jOs07cC/DMGLAsQgcEg15LUEY9v9TE398Kn1A=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4563708wrs.419.1598252169343;
 Sun, 23 Aug 2020 23:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200822152207.32161-1-liu.ming50@gmail.com> <20200822152207.32161-4-liu.ming50@gmail.com>
 <ad755709393c57c583a79c8b9d2308f2f2c3fafa.camel@intel.com>
In-Reply-To: <ad755709393c57c583a79c8b9d2308f2f2c3fafa.camel@intel.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Mon, 24 Aug 2020 08:56:04 +0200
Message-ID: <CALatG=4yamjD-WJAS5WsS8s6UATJx=5jb_4ACXB3afU6MWQrHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [dunfell 3/3] libubootenv: uprev to v0.3
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"sergio.prado@toradex.com" <sergio.prado@toradex.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"stefan.agner@toradex.com" <stefan.agner@toradex.com>, 
	"max.krummenacher@toradex.com" <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000d0b89405ad9a1447"

--000000000000d0b89405ad9a1447
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Anuj:

Thanks for the review, I think this is a good suggestion, maybe we can let
it inherit uboot-config bbclass. Will send a patch to master.

//Ming Liu

Mittal, Anuj <anuj.mittal@intel.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=BC=9A

> On Sat, 2020-08-22 at 17:22 +0200, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Update libubootenv to the latest 0.3 release, which comprises the
> > following commits:
> >
> > ```
> > 1efed83 Increase max length for device name
> > 6f4fc1c uboot_env: Use canonicalized pathname when reading device
> > 23b3086 Fix bug introduced by commit 52a70114
> > ed1a53e Dont store to device if no value changes
> > 4a0a466 Merge pull request #7 from TomzBench/cmake-fix
> > 6117831 Added Coverity badge
> > 49372a1 Fix coverity #293496
> > 69a6819 Fix coverity #293503 and #293507
> > 258bf52 Fix coverity #293501
> > aa52e61 Fix coverity #293505
> > 52a7011 Fix coverity #293504 and #293506
> > e822218 Fix coverity #293495 and #293497
> > 23b305f Fix coverity #293499
> > 25ef1f6 Add coverity setup for Travis
> > 41b5188 fixed install for static target, fixed BUILD_DOC
> > acknowledgement
> > 86bd30a Restore ability to feed script file via stdin, using `-s -`.
> > c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP
> > f4b9cde Allow negative offsets
> > 45bf92a Detect sector size if not found in config
> > 9f59db6 uboot_env: remove unused variables
> > 65d243e README: libubootenv is now in oe-core
> > ba952d0 BUG: variable lists not released in close()
> > 690f868 Variables are not removed when loading from file
> > 9e3586a Make sure there's no file descriptor leakage in case of error
> > 03647c4 Check config file defines a non-zero Sector size
> > 3b2d4f1 Check environment size from fw_env.config
> > 879c073 Do not hardcode path for install
> > d9c639b libubootenv: add pkg-config support
> > cc628ee libuboot: wrap libuboot in extern "C" for C++
> > ```
> >
> > Also add u-boot-default-env to RRECOMMENDS since
> > /etc/u-boot-initial-env is being referred in libubootenv source, and
> > turns libubootenv's PACKAGE_ARCH to be MACHINE_ARCH since
> > u-boot-default-env is a machine-arch package.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 02d55cd35aac15095fc44f0cf8f9e7a71638f485)
> > ---
> >  .../u-boot/{libubootenv_0.2.bb =3D> libubootenv_0.3.bb}      | 7
> > +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >  rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb =3D>
> > libubootenv_0.3.bb} (82%)
> >
> > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> > similarity index 82%
> > rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> > index ea29b668e8..47e64f9114 100644
> > --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> > @@ -10,9 +10,8 @@ LICENSE =3D "LGPL-2.1"
> >  LIC_FILES_CHKSUM =3D "file://Licenses/lgpl-
> > 2.1.txt;md5=3D4fbd65380cdd255951079008b364516c"
> >  SECTION =3D "libs"
> >
> > -PV =3D "0.2+git${SRCPV}"
> >  SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps"
> > -SRCREV =3D "f4b9cde3815abe84a98079cedd515283ea08c16b"
> > +SRCREV =3D "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -24,4 +23,8 @@ DEPENDS =3D "zlib"
> >  PROVIDES +=3D "u-boot-fw-utils"
> >  RPROVIDES_${PN}-bin +=3D "u-boot-fw-utils"
> >
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +RRECOMMENDS_${PN}-bin_append_class-target =3D " u-boot-default-env"
> > +
>
> This causes world builds to fail when uboot build is skipped for a
> MACHINE value for example when UBOOT_CONFIG or UBOOT_MACHINE is not
> defined. Perhaps this recipe should also be skipped in those cases?
>
> Thanks,
>
> Anuj
>

--000000000000d0b89405ad9a1447
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Anuj:<div><br></div><div>Thanks for the review, I thin=
k this is a good suggestion, maybe we can let it inherit uboot-config bbcla=
ss. Will send a patch to master.</div><div><br></div><div>//Ming Liu=C2=A0<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mit=
tal@intel.com</a>&gt; =E6=96=BC 2020=E5=B9=B48=E6=9C=8824=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8A=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2020-08-22 at 17:22 =
+0200, Ming Liu wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Update libubootenv to the latest 0.3 release, which comprises the<br>
&gt; following commits:<br>
&gt; <br>
&gt; ```<br>
&gt; 1efed83 Increase max length for device name<br>
&gt; 6f4fc1c uboot_env: Use canonicalized pathname when reading device<br>
&gt; 23b3086 Fix bug introduced by commit 52a70114<br>
&gt; ed1a53e Dont store to device if no value changes<br>
&gt; 4a0a466 Merge pull request #7 from TomzBench/cmake-fix<br>
&gt; 6117831 Added Coverity badge<br>
&gt; 49372a1 Fix coverity #293496<br>
&gt; 69a6819 Fix coverity #293503 and #293507<br>
&gt; 258bf52 Fix coverity #293501<br>
&gt; aa52e61 Fix coverity #293505<br>
&gt; 52a7011 Fix coverity #293504 and #293506<br>
&gt; e822218 Fix coverity #293495 and #293497<br>
&gt; 23b305f Fix coverity #293499<br>
&gt; 25ef1f6 Add coverity setup for Travis<br>
&gt; 41b5188 fixed install for static target, fixed BUILD_DOC<br>
&gt; acknowledgement<br>
&gt; 86bd30a Restore ability to feed script file via stdin, using `-s -`.<b=
r>
&gt; c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP<br>
&gt; f4b9cde Allow negative offsets<br>
&gt; 45bf92a Detect sector size if not found in config<br>
&gt; 9f59db6 uboot_env: remove unused variables<br>
&gt; 65d243e README: libubootenv is now in oe-core<br>
&gt; ba952d0 BUG: variable lists not released in close()<br>
&gt; 690f868 Variables are not removed when loading from file<br>
&gt; 9e3586a Make sure there&#39;s no file descriptor leakage in case of er=
ror<br>
&gt; 03647c4 Check config file defines a non-zero Sector size<br>
&gt; 3b2d4f1 Check environment size from fw_env.config<br>
&gt; 879c073 Do not hardcode path for install<br>
&gt; d9c639b libubootenv: add pkg-config support<br>
&gt; cc628ee libuboot: wrap libuboot in extern &quot;C&quot; for C++<br>
&gt; ```<br>
&gt; <br>
&gt; Also add u-boot-default-env to RRECOMMENDS since<br>
&gt; /etc/u-boot-initial-env is being referred in libubootenv source, and<b=
r>
&gt; turns libubootenv&#39;s PACKAGE_ARCH to be MACHINE_ARCH since<br>
&gt; u-boot-default-env is a machine-arch package.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit 02d55cd35aac15095fc44f0cf8f9e7a71638f485)<b=
r>
&gt; ---<br>
&gt;=C2=A0 .../u-boot/{<a href=3D"http://libubootenv_0.2.bb" rel=3D"norefer=
rer" target=3D"_blank">libubootenv_0.2.bb</a> =3D&gt; <a href=3D"http://lib=
ubootenv_0.3.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.3.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 | 7<br>
&gt; +++++--<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-bsp/u-boot/{<a href=3D"http://libubootenv_0.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> =3D&gt;<b=
r>
&gt; <a href=3D"http://libubootenv_0.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libubootenv_0.3.bb</a>} (82%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.bb" rel=3D=
"noreferrer" target=3D"_blank">libubootenv_0.3.bb</a><br>
&gt; similarity index 82%<br>
&gt; rename from meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; rename to meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.bb=
" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.3.bb</a><br>
&gt; index ea29b668e8..47e64f9114 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" re=
l=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.bb" re=
l=3D"noreferrer" target=3D"_blank">libubootenv_0.3.bb</a><br>
&gt; @@ -10,9 +10,8 @@ LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://Licenses/lgpl-<br>
&gt; 2.1.txt;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 <br>
&gt; -PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/sbabic/libu=
bootenv;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/s=
babic/libubootenv;protocol=3Dhttps</a>&quot;<br>
&gt; -SRCREV =3D &quot;f4b9cde3815abe84a98079cedd515283ea08c16b&quot;<br>
&gt; +SRCREV =3D &quot;ad253cfdb07c8492f2ee46a52fbc607ad0b96414&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -24,4 +23,8 @@ DEPENDS =3D &quot;zlib&quot;<br>
&gt;=C2=A0 PROVIDES +=3D &quot;u-boot-fw-utils&quot;<br>
&gt;=C2=A0 RPROVIDES_${PN}-bin +=3D &quot;u-boot-fw-utils&quot;<br>
&gt;=C2=A0 <br>
&gt; +PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; +<br>
&gt; +RRECOMMENDS_${PN}-bin_append_class-target =3D &quot; u-boot-default-e=
nv&quot;<br>
&gt; +<br>
<br>
This causes world builds to fail when uboot build is skipped for a<br>
MACHINE value for example when UBOOT_CONFIG or UBOOT_MACHINE is not<br>
defined. Perhaps this recipe should also be skipped in those cases?<br>
<br>
Thanks,<br>
<br>
Anuj<br>
</blockquote></div>

--000000000000d0b89405ad9a1447--
