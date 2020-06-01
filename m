Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.30233.1590985515353994624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 21:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tUsuqNZd;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id w3so7914408qkb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 21:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbGX6XHnPkJpyZJvVmLPHSM1l1K7wuB8kQTQfurGQyg=;
        b=tUsuqNZdKPtffT+pisdOEr2m+aAkrPRLXNBiLT5MNKzAOjriRrehcE/Q80kODzakVd
         EVS7K753zWBuY69GcASpszk9Kg2JSw5FsoaL+3auSXYLFIldZSnUMaspyEr7fOhNEhxl
         67bgVv9/RLB3iN7urMuRWlpSOtHmTX57mo1hwnmI8WoxwBwkDoRYnL5J1g9VIoJOMSUR
         7N4gVd6GXGLJZ4FYXzeH9LsR1X4Om1zKkVJnfAU5N6hp25TO8JF7vWWYSm1J8+02NukB
         hVyaliS1DoyC/hpnfCnr4PpfDbFdfFQk1dZtIrF+qHrTzzvdSXXXYq5fzZrkNRafRqrg
         qWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbGX6XHnPkJpyZJvVmLPHSM1l1K7wuB8kQTQfurGQyg=;
        b=hE6cujklo5E2MQL+vHyK0fLseM34nSr/a0JjJmsTqHwT6JihC0OAmtUdy2xpW1txhl
         q5t+k76apBV8F6RnGotrC88IQ4mRloLgGRpWSHlztf9zZnt2kCDDhioXPUMGMjITppFc
         Kpkonk8gUKkeY4kbVR0wuh6imKe5PEy2A6e3V+g39os80WOFC1s+nMXpD0ZEq4IgErQF
         Osnc+tzjSBoMzKsqJGtbeBuG7hFPBwuGNXG/mZfH7tqO6l9RXjt3G8yi6HUOsB5vEsDw
         eLtm5RxCvTy6+gvwIxOgvB6kRUPsqjaWKjgjt78PA3Ozgm4PQXJ95IYIWDFk8Hhj4+Vk
         1B2Q==
X-Gm-Message-State: AOAM531gYF/lCXNLJeI1LVz2LZT/7wyGXprcihIHjS2iABPzr+disR2e
	0TPSqaPi/bhj48MFxxc2qLFNNtHgXtBn4F+WMzQ=
X-Google-Smtp-Source: ABdhPJxCnx95p8i5bC9nBmwhaIwFuYZQMTotZrDHUEGMdsleOmbKWIyC+tm8KQ7yRuzSQQ1spSXe+oHlYJfgivn07xg=
X-Received: by 2002:a37:4c97:: with SMTP id z145mr18240532qka.165.1590985514335;
 Sun, 31 May 2020 21:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <1590772282-43066-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1590772282-43066-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAMKF1sqXOp88HSgjgHBqyq_=LT7hJnnAgaYg79NfmpPDXu_1mg@mail.gmail.com> <b7e6b91ece4e43a594113456040b105c@G08CNEXMBPEKD04.g08.fujitsu.local>
In-Reply-To: <b7e6b91ece4e43a594113456040b105c@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 31 May 2020 21:25:03 -0700
Message-ID: <CAMKF1sr3X=sw6PYoBPmm32tGvneJiuGRDDMMSQEgKL_r=1TVag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -> 47.1.1
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006cc4a305a6fe2ec4"

--0000000000006cc4a305a6fe2ec4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2020 at 6:03 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> I am investigating, and patchv2 will be sent after the investigation is
> successful.
>

I have sent an update for failing recipe which fixes it so this patch
should be ok now

>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Monday, June 1, 2020 8:24 AM
> To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujitsu.c=
om>
> Cc: Patches and discussions about the oe-core layer <
> openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -> 47.1=
.1
>
> This fails zopeinterface module builds see
>
> https://errors.yoctoproject.org/Errors/Details/414650/
>
> On Fri, May 29, 2020 at 1:11 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrot=
e:
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  meta/recipes-devtools/python/python-setuptools.inc  |  4 ++--
> >  .../0001-change-shebang-to-python3.patch            | 13 +-----------=
-
> >  ...tools_45.2.0.bb =3D> python3-setuptools_47.1.1.bb} |  0
> >  3 files changed, 3 insertions(+), 14 deletions(-)  rename
> > meta/recipes-devtools/python/{python3-setuptools_45.2.0.bb =3D>
> > python3-setuptools_47.1.1.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > b/meta/recipes-devtools/python/python-setuptools.inc
> > index e9ad93dbee..c91cca9f06 100644
> > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > @@ -12,8 +12,8 @@ SRC_URI_append_class-native =3D "
> > file://0001-conditionally-do-not-fetch-code-by-e
> >
> >  SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
> >
> > -SRC_URI[md5sum] =3D "0c956eea142af9c2b02d72e3c042af30"
> > -SRC_URI[sha256sum] =3D
> "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992ae3397f"
> > +SRC_URI[md5sum] =3D "6e9de90b242fdd60ef59f497424ce13a"
> > +SRC_URI[sha256sum] =3D
> "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
> >
> >  DEPENDS +=3D "${PYTHON_PN}"
> >
> > diff --git
> > a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-
> > to-python3.patch
> > b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-
> > to-python3.patch
> > index 33af8daed7..6dcf52771b 100644
> > ---
> > a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-
> > to-python3.patch
> > +++ b/meta/recipes-devtools/python/python3-setuptools/0001-change-sheb
> > +++ ang-to-python3.patch
> > @@ -8,8 +8,7 @@ Upstream-Status: Pending
> >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >  ---
> >   pkg_resources/_vendor/appdirs.py   | 2 +-
> > - setuptools/command/easy_install.py | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> >
> >  diff --git a/pkg_resources/_vendor/appdirs.py
> > b/pkg_resources/_vendor/appdirs.py
> >  index ae67001..933e398 100644
> > @@ -21,16 +20,6 @@ index ae67001..933e398 100644
> >   # -*- coding: utf-8 -*-
> >   # Copyright (c) 2005-2010 ActiveState Software Inc.
> >   # Copyright (c) 2013 Eddy Petri=C8=99or
> > -diff --git a/setuptools/command/easy_install.py
> > b/setuptools/command/easy_install.py
> > -index abca1ae..6bcdc98 100644
> > ---- a/setuptools/command/easy_install.py
> > -+++ b/setuptools/command/easy_install.py
> > -@@ -1,4 +1,4 @@
> > --#!/usr/bin/env python
> > -+#!/usr/bin/env python3
> > - """
> > - Easy Install
> > - ------------
> >  --
> >  2.24.1
> >
> > diff --git a/meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
> > b/meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
> > rename to meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
> > --
> > 2.17.1
> >
> >
> >
> >
>
>
>
>
>=20
>

--0000000000006cc4a305a6fe2ec4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 31, 2020 at 6:03 PM zangrc &lt;<a href=3D"mail=
to:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">I am investigating, and patchv2 will be sent after =
the investigation is successful.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have sent an =
update for failing recipe which fixes it so this patch should be ok now=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)"><br>
-----Original Message-----<br>
From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt; <br>
Sent: Monday, June 1, 2020 8:24 AM<br>
To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 &lt;<a href=3D"mailto:zangr=
c.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;=
<br>
Cc: Patches and discussions about the oe-core layer &lt;<a href=3D"mailto:=
openembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-co=
re@lists.openembedded.org</a>&gt;<br>
Subject: Re: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -&gt; 47.=
1.1<br>
<br>
This fails zopeinterface module builds see<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/414650/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/414650/</a><br>
<br>
On Fri, May 29, 2020 at 1:11 AM zangrc &lt;<a href=3D"mailto:zangrc.fnst@c=
n.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/python-setuptools.inc=C2=A0 |=C2=
=A0 4 ++--<br>
&gt;=C2=A0 .../0001-change-shebang-to-python3.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 13 +------------<br>
&gt;=C2=A0 ...<a href=3D"http://tools_45.2.0.bb" rel=3D"noreferrer" target=
=
=3D"_blank">tools_45.2.0.bb</a> =3D&gt; <a href=3D"http://python3-setuptoo=
ls_47.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_47.1.=
1.bb</a>} |=C2=A0 0<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 14 deletions(-)=C2=A0 rename =
<br>
&gt; meta/recipes-devtools/python/{<a href=3D"http://python3-setuptools_45=
.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_45.2.0.bb<=
/a> =3D&gt; <br>
&gt; <a href=3D"http://python3-setuptools_47.1.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-setuptools_47.1.1.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python-setuptools.inc <br>
&gt; b/meta/recipes-devtools/python/python-setuptools.inc<br>
&gt; index e9ad93dbee..c91cca9f06 100644<br>
&gt; --- a/meta/recipes-devtools/python/python-setuptools.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python-setuptools.inc<br>
&gt; @@ -12,8 +12,8 @@ SRC_URI_append_class-native =3D &quot; <br>
&gt; file://0001-conditionally-do-not-fetch-code-by-e<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch&=
quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;0c956eea142af9c2b02d72e3c042af30&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf=
49bab26b407fe67992ae3397f&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;6e9de90b242fdd60ef59f497424ce13a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f=
758b7cd674af09a92736aff74&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${PYTHON_PN}&quot;<br>
&gt;<br>
&gt; diff --git <br>
&gt; a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang=
-<br>
&gt; to-python3.patch <br>
&gt; b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang=
-<br>
&gt; to-python3.patch<br>
&gt; index 33af8daed7..6dcf52771b 100644<br>
&gt; --- <br>
&gt; a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang=
-<br>
&gt; to-python3.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3-setuptools/0001-change-she=
b<br>
&gt; +++ ang-to-python3.patch<br>
&gt; @@ -8,8 +8,7 @@ Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@=
windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0pkg_resources/_vendor/appdirs.py=C2=A0 =C2=A0| 2 +-<br>
&gt; - setuptools/command/easy_install.py | 2 +-<br>
&gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; + 1 files changed, 1 insertions(+), 1 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/pkg_resources/_vendor/appdirs.py <br>
&gt; b/pkg_resources/_vendor/appdirs.py<br>
&gt;=C2=A0 index ae67001..933e398 100644<br>
&gt; @@ -21,16 +20,6 @@ index ae67001..933e398 100644<br>
&gt;=C2=A0 =C2=A0# -*- coding: utf-8 -*-<br>
&gt;=C2=A0 =C2=A0# Copyright (c) 2005-2010 ActiveState Software Inc.<br>
&gt;=C2=A0 =C2=A0# Copyright (c) 2013 Eddy Petri=C8=99or<br>
&gt; -diff --git a/setuptools/command/easy_install.py <br>
&gt; b/setuptools/command/easy_install.py<br>
&gt; -index abca1ae..6bcdc98 100644<br>
&gt; ---- a/setuptools/command/easy_install.py<br>
&gt; -+++ b/setuptools/command/easy_install.py<br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --#!/usr/bin/env python<br>
&gt; -+#!/usr/bin/env python3<br>
&gt; - &quot;&quot;&quot;<br>
&gt; - Easy Install<br>
&gt; - ------------<br>
&gt;=C2=A0 --<br>
&gt;=C2=A0 2.24.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-s=
etuptools_45.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptool=
s_45.2.0.bb</a> <br>
&gt; b/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_4=
7.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_47.1.1.bb=
</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-se=
tuptools_45.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools=
_45.2.0.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-setu=
ptools_47.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_4=
7.1.1.bb</a><br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000006cc4a305a6fe2ec4--
