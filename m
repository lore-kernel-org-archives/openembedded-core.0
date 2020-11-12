Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.2211.1605175400700204866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 02:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uCA9OZTO;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id r14so2871991vsa.13
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 02:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vW5qFtwXuHnJIHTkQMkWMytxUaHzJ0U2cANGKE61reQ=;
        b=uCA9OZTOsmvuTG3D8SX0vdC6nJZTsk2XZvqDQSbLOUX0DnQq1lHRE3eV1RncO8hX3/
         kYVOkSjhV6nV7obLXV46Ax0Qz0iOvozaNp49S9E09ipudykIKCBZOonfbkFtz1KB9y5C
         dJIw8pdbTFSDjExsk5YQ7c+rf3tEM/mEKycq34IajS0g9bdZkwwSKmsj5dtjVwYiIm/T
         aOqv/HXUQD1j1FAiby+yzxzON4cDS5EVpzI2sGAZa0ZYAnLTeCk1oax/jAF0KL/hF5ZG
         ZQAmLNepyYR1uPTMeKqHvhlMpMOEZmOI2F//626qzZ1JV0aGfUcxMtfubeqaZ2J48rnT
         Yk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vW5qFtwXuHnJIHTkQMkWMytxUaHzJ0U2cANGKE61reQ=;
        b=p1Ey8sXoLvZdO+vFPCihUidrt4bpQGUntAjDf2UVVNwQHi7pfnzJCUOyN6Pru99hv0
         ey7Lz09T/eT+cvKLh1v4pBBUqc7x9t7lGXRnZWhq7jewn1/YpQDXqAwMXHlwb6hyXb7s
         jGwd2Tr8gey/o13JDP65Bwo6VHmAoATVOxkPvURU/k5GTSQ04btvo2lI8WE8q+qzX67d
         SmiW1pd1LWHR3Oeo5AMeJg86JHloze6mxJ0rX/Tk5hZUSjZmYYgsw3mB74rapwQtDLXx
         Ukb9C+yLshBy+6AmJGQY1bVnlDXdjQUyVGPWvNIWTZ5Q3b6ojgw8gPmgAT8TF87lFdOL
         bQqw==
X-Gm-Message-State: AOAM533zBBlhgM+yhtd4G6y7hXm/I03wQzMBlDSekNh1Pg2+ryBWU8eP
	GyUuNPpyJzoyHXhC+iRBFfXNTbH4r5UyOiniUuQ=
X-Google-Smtp-Source: ABdhPJxwEtP2JFbO0B42fH8mZEwIv2sG8YMRg220J4k7ARaNrOcra94XYyEz//6jtwpXNY4oCciUA/W+v8KQuG5HYy4=
X-Received: by 2002:a05:6102:4a6:: with SMTP id r6mr12317969vsa.41.1605175399847;
 Thu, 12 Nov 2020 02:03:19 -0800 (PST)
MIME-Version: 1.0
References: <1604893131-60530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAAnfSTvGf5YJaXF=sPrf_3HH1EoxznD+2F-==jaPrJVUJ1xV4g@mail.gmail.com>
 <bbdb2694c9f04c0481ca6b9c77a0cd11@G08CNEXMBPEKD04.g08.fujitsu.local>
 <6f631420-d617-2a76-f2c1-9ff7633180d6@gmail.com> <a36d536b01e846c8be579d7f0b55cdfa@G08CNEXMBPEKD04.g08.fujitsu.local>
In-Reply-To: <a36d536b01e846c8be579d7f0b55cdfa@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 11:03:08 +0100
Message-ID: <CANNYZj9adi=AMTZphvGN4mvjR5T_4cTqDVizc7BOurwMcszy9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008298dd05b3e605fb"

--0000000000008298dd05b3e605fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are several ways to find out what depends on a recipe: you can for
example do it with a simple grep:

ak@linux-f9zs:~/development/poky/meta> grep -ilr "\Wicu\W" *
classes/rm_work.bbclass
conf/distro/include/maintainers.inc
recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb
recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TR=
UE-macros-by-.patch

recipes-sato/webkit/webkitgtk_2.30.2.bb
recipes-support/boost/boost.inc
recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
recipes-support/icu/icu/fix-install-manx.patch
recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
recipes-support/icu/icu_68.1.bb
recipes-support/vte/vte_0.62.1.bb
recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
recipes-support/libical/libical_3.0.8.bb



Alex



On Thu, 12 Nov 2020 at 10:26, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Thank you very much, this is indeed a way, but the storage space of our
> test environment is limited, not enough to support bitbake world on
> multiple platforms. Is there any other way?
>
> Zang Ruochen
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Thursday, November 12, 2020 12:15 PM
> > To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujitsu=
.com>; Ross Burton
> > <ross@burtonini.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
> >
> >
> >
> > On 11/11/20 6:45 PM, zangrc wrote:
> > > Sorry, we will improve in the future, but we don=E2=80=99t know how =
to
> determine
> > which recipes need to be tested during the upgrade. Is there any way y=
ou
> can
> > provide us?
> > >
> >
> > one way would be to do bitbake -k world,
> >
> > > Zang Ruochen
> > >
> > >> -----Original Message-----
> > >> From: Ross Burton <ross@burtonini.com>
> > >> Sent: Wednesday, November 11, 2020 6:49 PM
> > >> To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fuji=
tsu.com>
> > >> Cc: OE-core <openembedded-core@lists.openembedded.org>
> > >> Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -> 68.1
> > >>
> > >> Please remember to build more than just a single recipe when testin=
g,
> > >> in particular dependents.  This upgrade broke libical and webkitgtk=
,
> > >> which resulted in three iterations though the autobuilder and me
> > >> finding/backporting fixes as appropriate.
> > >>
> > >> Ross
> > >>
> > >> On Mon, 9 Nov 2020 at 03:39, zangrc <zangrc.fnst@cn.fujitsu.com>
> wrote:
> > >>>
> > >>> -License-Update:The address changes are as follows:
> > >>>   # Project: http://code.google.com/p/lao-dictionary/
> > >>>   # Dictionary:
> http://lao-dictionary.googlecode.com/git/Lao-Dictionary.txt
> > >>>   # License:
> > >>> http://lao-dictionary.googlecode.com/git/Lao-Dictionary-LICENSE.tx=
t
> > >>>
> > >>> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > >>> ---
> > >>>  meta/recipes-support/icu/{icu_67.1.bb =3D> icu_68.1.bb} | 6 +++--=
-
> > >>>  1 file changed, 3 insertions(+), 3 deletions(-)  rename
> > >>> meta/recipes-support/icu/{icu_67.1.bb =3D> icu_68.1.bb} (95%)
> > >>>
> > >>> diff --git a/meta/recipes-support/icu/icu_67.1.bb
> > >>> b/meta/recipes-support/icu/icu_68.1.bb
> > >>> similarity index 95%
> > >>> rename from meta/recipes-support/icu/icu_67.1.bb
> > >>> rename to meta/recipes-support/icu/icu_68.1.bb
> > >>> index 9e8091ba01..98aa6b7be6 100644
> > >>> --- a/meta/recipes-support/icu/icu_67.1.bb
> > >>> +++ b/meta/recipes-support/icu/icu_68.1.bb
> > >>> @@ -83,7 +83,7 @@ FILES_libicuio =3D "${libdir}/libicuio.so.*"
> > >>>
> > >>>  BBCLASSEXTEND =3D "native nativesdk"
> > >>>
> > >>> -LIC_FILES_CHKSUM =3D
> > >> "file://../LICENSE;md5=3Da3808a5b70071b07f87ff2205e4d75a0"
> > >>> +LIC_FILES_CHKSUM =3D
> > >> "file://../LICENSE;md5=3D002d2fdc32d17f0ec06e9a47f2c0c8d0"
> > >>>
> > >>>  def icu_download_version(d):
> > >>>      pvsplit =3D d.getVar('PV').split('.') @@ -112,8 +112,8 @@ SRC=
_URI
> > >>> =3D "${BASE_SRC_URI};name=3Dcode \  SRC_URI_append_class-target =
=3D "\
> > >>>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
> > >>>            "
> > >>> -SRC_URI[code.sha256sum] =3D
> > >>
> > "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5
> > >> dc"
> > >>> -SRC_URI[data.sha256sum] =3D
> > >>
> > "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4
> > >> a7e"
> > >>> +SRC_URI[code.sha256sum] =3D
> > >>
> > "a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb2
> > >> 9f2d"
> > >>> +SRC_URI[data.sha256sum] =3D
> > >>
> > "03ea8b4694155620548c8c0ba20444f1e7db246cc79e3b9c4fc7a960b160d
> > >> 510"
> > >>>
> > >>>  UPSTREAM_CHECK_REGEX =3D "icu4c-(?P<pver>\d+(_\d+)+)-src"
> > >>>  UPSTREAM_CHECK_URI =3D "https://github.com/unicode-
> > org/icu/releases"
> > >>> --
> > >>> 2.25.1
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>
> > >>
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> >
>
>
>
>
>=20
>
>

--0000000000008298dd05b3e605fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There are several ways to find out what depends on a =
recipe: you can for example do it with a simple grep:</div><div><br></div><=
div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">ak@linux-f9zs:~/development/poky/meta&gt;=
 grep -ilr &quot;\Wicu\W&quot; *
</span><br>classes/rm_work.bbclass
<br>conf/distro/include/maintainers.inc
<br>recipes-graphics/harfbuzz/<a href=3D"http://harfbuzz_2.7.2.bb">harfbuz=
z_2.7.2.bb</a>
<br>recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-an=
d-TRUE-macros-by-.patch
<br>recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.bb">webkitgtk_2=
.30.2.bb</a>
<br>recipes-support/boost/boost.inc
<br>recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
<br>recipes-support/icu/icu/fix-install-manx.patch
<br>recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
<br>recipes-support/icu/<a href=3D"http://icu_68.1.bb">icu_68.1.bb</a>
<br>recipes-support/vte/<a href=3D"http://vte_0.62.1.bb">vte_0.62.1.bb</a>
<br>recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
<br>recipes-support/libical/<a href=3D"http://libical_3.0.8.bb">libical_3.=
0.8.bb</a><br>
<br><br></span></div><div><br></div><div>Alex<br></div><div><br></div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, 12 Nov 2020 at 10:26, zangrc &lt;<a href=3D"mailto:zangr=
c.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Thank you very much, this =
is indeed a way, but the storage space of our test environment is limited, =
not enough to support bitbake world on multiple platforms. Is there any oth=
er way?<br>
<br>
Zang Ruochen<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Thursday, November 12, 2020 12:15 PM<br>
&gt; To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 &lt;<a href=3D"mailto:=
zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a=
>&gt;; Ross Burton<br>
&gt; &lt;<a href=3D"mailto:ross@burtonini.com" target=3D"_blank">ross@burt=
onini.com</a>&gt;<br>
&gt; Cc: OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedde=
d.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<b=
r>
&gt; Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -&gt; 68.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 11/11/20 6:45 PM, zangrc wrote:<br>
&gt; &gt; Sorry, we will improve in the future, but we don=E2=80=99t know =
how to determine<br>
&gt; which recipes need to be tested during the upgrade. Is there any way =
you can<br>
&gt; provide us?<br>
&gt; &gt;<br>
&gt; <br>
&gt; one way would be to do bitbake -k world,<br>
&gt; <br>
&gt; &gt; Zang Ruochen<br>
&gt; &gt;<br>
&gt; &gt;&gt; -----Original Message-----<br>
&gt; &gt;&gt; From: Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com" =
target=3D"_blank">ross@burtonini.com</a>&gt;<br>
&gt; &gt;&gt; Sent: Wednesday, November 11, 2020 6:49 PM<br>
&gt; &gt;&gt; To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 &lt;<a href=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fu=
jitsu.com</a>&gt;<br>
&gt; &gt;&gt; Cc: OE-core &lt;<a href=3D"mailto:openembedded-core@lists.op=
enembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org<=
/a>&gt;<br>
&gt; &gt;&gt; Subject: Re: [OE-core] [PATCH] icu: upgrade 67.1 -&gt; 68.1<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Please remember to build more than just a single recipe when=
 testing,<br>
&gt; &gt;&gt; in particular dependents.=C2=A0 This upgrade broke libical a=
nd webkitgtk,<br>
&gt; &gt;&gt; which resulted in three iterations though the autobuilder an=
d me<br>
&gt; &gt;&gt; finding/backporting fixes as appropriate.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Ross<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, 9 Nov 2020 at 03:39, zangrc &lt;<a href=3D"mailto:za=
ngrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&=
gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; -License-Update:The address changes are as follows:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0# Project: <a href=3D"http://code.google.com=
/p/lao-dictionary/" rel=3D"noreferrer" target=3D"_blank">http://code.google=
.com/p/lao-dictionary/</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0# Dictionary: <a href=3D"http://lao-dictiona=
ry.googlecode.com/git/Lao-Dictionary.txt" rel=3D"noreferrer" target=3D"_bla=
nk">http://lao-dictionary.googlecode.com/git/Lao-Dictionary.txt</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0# License:<br>
&gt; &gt;&gt;&gt; <a href=3D"http://lao-dictionary.googlecode.com/git/Lao-=
Dictionary-LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">http://lao-dic=
tionary.googlecode.com/git/Lao-Dictionary-LICENSE.txt</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc=
.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<=
br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 meta/recipes-support/icu/{<a href=3D"http://icu_67=
.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a> =3D&gt; <a href=
=
=3D"http://icu_68.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_68.1.bb</=
a>} | 6 +++---<br>
&gt; &gt;&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)=C2=
=
=A0 rename<br>
&gt; &gt;&gt;&gt; meta/recipes-support/icu/{<a href=3D"http://icu_67.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a> =3D&gt; <a href=3D"ht=
tp://icu_68.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_68.1.bb</a>} (95=
%)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/meta/recipes-support/icu/<a href=3D"http://=
icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt;&gt;&gt; b/meta/recipes-support/icu/<a href=3D"http://icu_68.1.bb=
" rel=3D"noreferrer" target=3D"_blank">icu_68.1.bb</a><br>
&gt; &gt;&gt;&gt; similarity index 95%<br>
&gt; &gt;&gt;&gt; rename from meta/recipes-support/icu/<a href=3D"http://i=
cu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt;&gt;&gt; rename to meta/recipes-support/icu/<a href=3D"http://icu=
_68.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_68.1.bb</a><br>
&gt; &gt;&gt;&gt; index 9e8091ba01..98aa6b7be6 100644<br>
&gt; &gt;&gt;&gt; --- a/meta/recipes-support/icu/<a href=3D"http://icu_67.=
1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt;&gt;&gt; +++ b/meta/recipes-support/icu/<a href=3D"http://icu_68.=
1.bb" rel=3D"noreferrer" target=3D"_blank">icu_68.1.bb</a><br>
&gt; &gt;&gt;&gt; @@ -83,7 +83,7 @@ FILES_libicuio =3D &quot;${libdir}/lib=
icuio.so.*&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt; &quot;file://../LICENSE;md5=3Da3808a5b70071b07f87ff2205e4d75=
a0&quot;<br>
&gt; &gt;&gt;&gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt; &quot;file://../LICENSE;md5=3D002d2fdc32d17f0ec06e9a47f2c0c8=
d0&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 def icu_download_version(d):<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 pvsplit =3D d.getVar(&#39;PV&#39;).s=
plit(&#39;.&#39;) @@ -112,8 +112,8 @@ SRC_URI<br>
&gt; &gt;&gt;&gt; =3D &quot;${BASE_SRC_URI};name=3Dcode \=C2=A0 SRC_URI_ap=
pend_class-target =3D &quot;\<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00=
01-Disable-LDFLAGSICUDT-for-Linux.patch \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;&gt;&gt; -SRC_URI[code.sha256sum] =3D<br>
&gt; &gt;&gt;<br>
&gt; &quot;94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5<=
br>
&gt; &gt;&gt; dc&quot;<br>
&gt; &gt;&gt;&gt; -SRC_URI[data.sha256sum] =3D<br>
&gt; &gt;&gt;<br>
&gt; &quot;7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4<b=
r>
&gt; &gt;&gt; a7e&quot;<br>
&gt; &gt;&gt;&gt; +SRC_URI[code.sha256sum] =3D<br>
&gt; &gt;&gt;<br>
&gt; &quot;a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb2<br=
>
&gt; &gt;&gt; 9f2d&quot;<br>
&gt; &gt;&gt;&gt; +SRC_URI[data.sha256sum] =3D<br>
&gt; &gt;&gt;<br>
&gt; &quot;03ea8b4694155620548c8c0ba20444f1e7db246cc79e3b9c4fc7a960b160d<b=
r>
&gt; &gt;&gt; 510&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;icu4c-(?P&lt;pver&g=
t;\d+(_\d+)+)-src&quot;<br>
&gt; &gt;&gt;&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gi=
thub.com/unicode-" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
unicode-</a><br>
&gt; org/icu/releases&quot;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; 2.25.1<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; <br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008298dd05b3e605fb--
