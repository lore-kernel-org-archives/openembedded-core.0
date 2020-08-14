Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.13712.1597392454188750318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 01:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k4K40YaH;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id l2so7541687wrc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cJ8y2FQD92Zw78oCw3GfqMntbX0LIbzH5mvQ3/AyY1Y=;
        b=k4K40YaHdmv3hYcNi+E/L183wLa1EwbuDnMy10setzL4OB7vOM0j2obMnY3gUWOyMt
         ucxEkyxjKCAS5JGiK3fhyqu7f2I6S+0XyG3mTZFZi305Kxz2z28VrH2iwfOApZz4k9Gf
         6/lN8vdBNcvTeCWGN4y7cHwHopAEzr98Hr7DDm77rS0kA2OEwlbtvNRfyL8+w6y99EHc
         dYmENxI51LVfsjABwXdBpKOdKB2tr77zorb/4Qs7EnouPCu5Gx7L+IYp+0GcUn8w1fsW
         SLsvRyO6HmvvClpkoRmeJ70h0SB71UwN4bL2yCONzstedADvQpExtzY3mQ/2Q4KtgzOF
         f/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cJ8y2FQD92Zw78oCw3GfqMntbX0LIbzH5mvQ3/AyY1Y=;
        b=p1PxyC6Daf5zny6mPsREIvYdy2Ru+0S4B/WaX/SHvqx49XuwkxdOQ7iwvAtRiuCLYP
         hO3RRE9Sl+cwAH9h86JCFG0VQqi0XLXVFFSSmFUgxKovYv6Yuoad3/JVuiiG+uOcLmUm
         zqDsFmKDTfDARgrnvQvz2mPl2m1Ts9Xjd3+BZmSH0hzGwGXdjVh0WOYEKO6tSlRVHENQ
         iAHOj4h/kMWU7vg01RxqgWeKE4wLTnrGsfBAUZqmgAbESo1WRp8F6BzpecNz2QPj37oX
         4HygIXpRHNZTyOGXaz8aK0w9dLdBvHT5L3W+UlO4811h+8xMApFXi9sZI2ada9Pxh8zH
         Pb6A==
X-Gm-Message-State: AOAM531Y3Aegrg7kECca3lieSY5EKGEMpOHW1AEGY2QEnCyhRkukk/66
	3IDSJtNzf6rxhE8QFU8GJ8uPxFu4iZ5LoiYSf8A=
X-Google-Smtp-Source: ABdhPJyBc2r45mI32U+q8PFnCl7uLGr2ocBQBKZb0laUNNZ6HE4ZIhfJUiXKGCe+0AJvQNJBND87P9w2zAQfQUv0tLo=
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr1584887wrs.216.1597392452661;
 Fri, 14 Aug 2020 01:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200813102117.8726-1-liu.ming50@gmail.com> <20200813102117.8726-3-liu.ming50@gmail.com>
 <CAMKF1sr7W8s1X_zZUR1DoKJHgcYxFD3kQ-PzyL2S1VCvFOD-QQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr7W8s1X_zZUR1DoKJHgcYxFD3kQ-PzyL2S1VCvFOD-QQ@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Fri, 14 Aug 2020 10:07:22 +0200
Message-ID: <CALatG=43JagasKY=-8Lz73qeTSDv6U5k+veG6XdcQ18vippm4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, sergio.prado@toradex.com, 
	Max Krummenacher <max.krummenacher@toradex.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000b536df05acd1e929"

--000000000000b536df05acd1e929
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I am on board that RRECOMMENDS_${PN}-bin_append_class-target =3D "
u-boot-default-env" might be better, will change to that in V3, but this
error probably due to you dont have RPROVIDES_${PN}-env +=3D
"u-boot-default-env" in your uboot recipe?

//Ming Liu

Khem Raj <raj.khem@gmail.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8814=E6=97=A5=
 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=9A

> On Thu, Aug 13, 2020 at 3:21 AM Ming Liu <liu.ming50@gmail.com> wrote:
> >
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
> > 41b5188 fixed install for static target, fixed BUILD_DOC acknowledgeme=
nt
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
> > Also change it to be a git recipe, and add u-boot-default-env to
> > RRECOMMENDS since /etc/u-boot-initial-env is being referred in
> > libubootenv source.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../u-boot/{libubootenv_0.2.bb =3D> libubootenv_git.bb}       | 6 +++=
+--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >  rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb =3D>
> libubootenv_git.bb} (84%)
> >
> > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> b/meta/recipes-bsp/u-boot/libubootenv_git.bb
> > similarity index 84%
> > rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > rename to meta/recipes-bsp/u-boot/libubootenv_git.bb
> > index 3820ba262e..59b9703d61 100644
> > --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > +++ b/meta/recipes-bsp/u-boot/libubootenv_git.bb
> > @@ -10,9 +10,9 @@ LICENSE =3D "LGPL-2.1"
> >  LIC_FILES_CHKSUM =3D
> "file://Licenses/lgpl-2.1.txt;md5=3D4fbd65380cdd255951079008b364516c"
> >  SECTION =3D "libs"
> >
> > -PV =3D "0.2+git${SRCPV}"
> > +PV =3D "0.3+git${SRCPV}"
> >  SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps"
> > -SRCREV =3D "86bd30a14e153a18f670b25708795253d8736f0f"
> > +SRCREV =3D "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -24,4 +24,6 @@ DEPENDS =3D "zlib"
> >  PROVIDES +=3D "u-boot-fw-utils"
> >  RPROVIDES_${PN}-bin +=3D "u-boot-fw-utils"
> >
> > +RRECOMMENDS_${PN}-bin_class-target +=3D "u-boot-default-env"
> > +
>
> should this be
> RRECOMMENDS_${PN}-bin_append_class-target =3D "u-boot-default-env"
>
> I see
>
> ERROR: Nothing RPROVIDES 'u-boot-default-env' (but
>
> /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/=
recipes-bsp/u-boot/
> libubootenv_git.bb
> RDEPENDS on or otherwise requires it)
>
>
> >  BBCLASSEXTEND =3D "native"
> > --
> > 2.28.0
> >
> >=20
>

--000000000000b536df05acd1e929
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, I am on board that RRECOMMENDS_${PN}-bin_append_=
class-target =3D &quot; u-boot-default-env&quot; might be better, will chan=
ge to that in V3, but this error probably due to you dont=C2=A0have=C2=A0RP=
ROVIDES_${PN}-env +=3D &quot;u-boot-default-env&quot; in your uboot recipe?=
</div><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; =E6=96=BC 2020=E5=B9=B48=E6=9C=
=
=8814=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=887:05=E5=AF=AB=E9=81=93=
=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, Aug 13, 2020 at 3:21 AM Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.=
com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"=
_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Update libubootenv to the latest 0.3 release, which comprises the<br>
&gt; following commits:<br>
&gt;<br>
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
&gt; 41b5188 fixed install for static target, fixed BUILD_DOC acknowledgem=
ent<br>
&gt; 86bd30a Restore ability to feed script file via stdin, using `-s -`.<=
br>
&gt; c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP<br>
&gt; f4b9cde Allow negative offsets<br>
&gt; 45bf92a Detect sector size if not found in config<br>
&gt; 9f59db6 uboot_env: remove unused variables<br>
&gt; 65d243e README: libubootenv is now in oe-core<br>
&gt; ba952d0 BUG: variable lists not released in close()<br>
&gt; 690f868 Variables are not removed when loading from file<br>
&gt; 9e3586a Make sure there&#39;s no file descriptor leakage in case of e=
rror<br>
&gt; 03647c4 Check config file defines a non-zero Sector size<br>
&gt; 3b2d4f1 Check environment size from fw_env.config<br>
&gt; 879c073 Do not hardcode path for install<br>
&gt; d9c639b libubootenv: add pkg-config support<br>
&gt; cc628ee libuboot: wrap libuboot in extern &quot;C&quot; for C++<br>
&gt; ```<br>
&gt;<br>
&gt; Also change it to be a git recipe, and add u-boot-default-env to<br>
&gt; RRECOMMENDS since /etc/u-boot-initial-env is being referred in<br>
&gt; libubootenv source.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" t=
arget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../u-boot/{<a href=3D"http://libubootenv_0.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">libubootenv_0.2.bb</a> =3D&gt; <a href=3D"http://li=
bubootenv_git.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_git.bb</=
a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-bsp/u-boot/{<a href=3D"http://libubootenv_0=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> =3D&gt; =
<a href=3D"http://libubootenv_git.bb" rel=3D"noreferrer" target=3D"_blank">=
libubootenv_git.bb</a>} (84%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> b/meta/re=
cipes-bsp/u-boot/<a href=3D"http://libubootenv_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libubootenv_git.bb</a><br>
&gt; similarity index 84%<br>
&gt; rename from meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; rename to meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_git.b=
b" rel=3D"noreferrer" target=3D"_blank">libubootenv_git.bb</a><br>
&gt; index 3820ba262e..59b9703d61 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_git.bb" r=
el=3D"noreferrer" target=3D"_blank">libubootenv_git.bb</a><br>
&gt; @@ -10,9 +10,9 @@ LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://Licenses/lgpl-2.1.txt;md5=3D4=
fbd65380cdd255951079008b364516c&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.3+git${SRCPV}&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/sbabic/lib=
ubootenv;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/=
sbabic/libubootenv;protocol=3Dhttps</a>&quot;<br>
&gt; -SRCREV =3D &quot;86bd30a14e153a18f670b25708795253d8736f0f&quot;<br>
&gt; +SRCREV =3D &quot;ad253cfdb07c8492f2ee46a52fbc607ad0b96414&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; @@ -24,4 +24,6 @@ DEPENDS =3D &quot;zlib&quot;<br>
&gt;=C2=A0 PROVIDES +=3D &quot;u-boot-fw-utils&quot;<br>
&gt;=C2=A0 RPROVIDES_${PN}-bin +=3D &quot;u-boot-fw-utils&quot;<br>
&gt;<br>
&gt; +RRECOMMENDS_${PN}-bin_class-target +=3D &quot;u-boot-default-env&quo=
t;<br>
&gt; +<br>
<br>
should this be<br>
RRECOMMENDS_${PN}-bin_append_class-target =3D &quot;u-boot-default-env&quo=
t;<br>
<br>
I see<br>
<br>
ERROR: Nothing RPROVIDES &#39;u-boot-default-env&#39; (but<br>
/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/re=
cipes-bsp/u-boot/<a href=3D"http://libubootenv_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libubootenv_git.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
<br>
<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000b536df05acd1e929--
