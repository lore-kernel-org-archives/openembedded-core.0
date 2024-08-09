Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB131C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 13:32:05 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.84071.1723210319922660415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 06:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S54DKkhB;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0e88873825so2033435276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723210319; x=1723815119; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez8Gwu/LxP+5KVIzIJgUvJciTBssjUFWQavW74+Oc6c=;
        b=S54DKkhBSFt7Zm2zp2bMhcoCOiv23Eru9ZXmrs4NkcQFHEbFvqhUd6wKVlIfBSOB/u
         xLgfdXe2oE7iMbG1fDyDrzcx6MU79BL9LoaEYPhQIasIMFIZ8VorPOoczvqM7xhCehjb
         6GvRB/LievlOcFv8eVOL3klB+yorzAaO3Z5sww8w65pTiXMa8gHNx/NsnlbqSJhjxRyo
         Jjx4Aw9+g9cm72P4NYhpokP67KcmRK7Q5LGkYuuZjkxttwTGiL6lpxa7nyUZ6mh2ZwuB
         MaHN/uaMw062iB0GMRIgEATXbqbw59fkBKTUpFtOEkGqmgtx/Zp7OvGFC7pCdFAxqCRJ
         XSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723210319; x=1723815119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez8Gwu/LxP+5KVIzIJgUvJciTBssjUFWQavW74+Oc6c=;
        b=G5swgir6lV/Gd5noCgeORWzdRL/xSR/fReqtSm4s7TFFn1c/ux7qTsiDU6yOJV91nr
         VCwBOeb71CZGa42wlFKciFBk3QYJyYGQI/82xsqJH6qSMocI2+Nb3vbbYBctmsJkT2kR
         Tmh/5r8EAt+F7DOwoBSkVg1ZqUecKrfW7ay808roT0KFcvrmuPTzMXVlCDYu61xo6kns
         4NJcnEKDlccasv63l+b0+2MlD6IpuuobOHyke2vEvlji1dXQPoQmcVF+M2PNwrXQgE3E
         rN1PPbk6TPauANrh/zpmDD24fFLO4CUmTAQ6vonORX+eQReriQLHuCx+19SccHyfh7z+
         eKyw==
X-Gm-Message-State: AOJu0YzS8m9JfuXXRGyphoihl/IFykTwr5H4T2xdIukgHe3pHZcH8Mf2
	1gQPHRMLN92AN8XyU2jqdqFqq5taC7TY3kCbA8OQSWX+Cd26cVYHGcbvnArAGE1UAabo1aVnio0
	4BpAW8T9dpQUxtdvYuY+Jtml1V8Yz1g==
X-Google-Smtp-Source: AGHT+IGj3gDVaO1AHELG4r7nEGCoP2V265NTzhETUqIWSIQtPlh2PIE2k6jGgY8K+HsSlAhkbhDSBG3ezO0UBlBpJ5M=
X-Received: by 2002:a05:690c:3301:b0:631:4da3:17ee with SMTP id
 00721157ae682-69ec8e7a719mr16991617b3.40.1723210318975; Fri, 09 Aug 2024
 06:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240809123609.4107749-1-tgamblin@baylibre.com>
In-Reply-To: <20240809123609.4107749-1-tgamblin@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 9 Aug 2024 06:31:47 -0700
Message-ID: <CANx9H-D9C+4yzC9ePqJ5EtP64ZqOm7267YpWw1nA2Cq0ZTi82A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-cython: upgrade 3.0.10 -> 3.0.11
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef9bf0061f402af1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 13:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203173

--000000000000ef9bf0061f402af1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 5:36=E2=80=AFAM Trevor Gamblin via lists.openembedde=
d.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

> The upstream package changed from uppercase to lowercase in "Cython", so
> adjust PYPI_PACKAGE and the sed call in cython_fix_sources to match.
>
> Changelog (https://github.com/cython/cython/releases/tag/3.0.11-1):
>
> Features added
> --------------
>
> * The C++11 ``emplace*`` methods were added to ``libcpp.deque``.
>   Patch by Somin An.  (Github issue :issue:`6159`)
>
> Bugs fixed
> ----------
>
> * The exception check value of functions declared in pxd files was not
> always applied in 3.0.10.
>   (Github issue :issue:`6122`)
>
> * A crash on exception deallocations was fixed.
>   (Github issue :issue:`6022`)
>
> * A crash was fixed when assigning a zero-length slice to a memoryview.
>   Patch by Michael Man.  (Github issue :issue:`6227`)
>
> * ``libcpp.optional.value()`` could crash if it raised a C++ exception.
>   Patch by Alexander Condello.  (Github issue :issue:`6190`)
>
> * The return type of ``str()`` was mishandled, leading to crashes with
> ``language_level=3D3``.
>   (Github issue :issue:`6166`)
>
> * ``bytes.startswith/endswith()`` failed for non-bytes substrings (e.g.
> ``bytearray``).
>   (Github issue :issue:`6168`)
>
> * Fused ctuples crashed Cython.
>   (Github issue :issue:`6068`)
>
> * A compiler crash was fixed when using extension types in fused types.
>   (Github issue :issue:`6204`)
>
> * The module cleanup code was incorrect for globally defined memory view
> slices.
>   (Github issue :issue:`6276`)
>
> * Some adaptations were made to enable compilation in Python 3.13.
>   (Github issues :issue:`5997`, :issue:`6182`, :issue:`6251`)
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../{python3-cython_3.0.10.bb =3D> python3-cython_3.0.11.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-cython_3.0.10.bb =3D>
> python3-cython_3.0.11.bb} (93%)
>
> diff --git a/meta/recipes-devtools/python/python3-cython_3.0.10.bb
> b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
> similarity index 93%
> rename from meta/recipes-devtools/python/python3-cython_3.0.10.bb
> rename to meta/recipes-devtools/python/python3-cython_3.0.11.bb
> index 86ae5f25e9..6e1f599aa7 100644
> --- a/meta/recipes-devtools/python/python3-cython_3.0.10.bb
> +++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
> @@ -6,9 +6,9 @@ and the messy, low-level world of C."
>  SECTION =3D "devel/python"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62bc9f69c"
> -PYPI_PACKAGE =3D "Cython"
> +PYPI_PACKAGE =3D "cython"


This would be the default behavior. So this line can simply be dropped. But
we need to make sure the upstream version check still works for AUH/devtool
latest-version. Sometimes the behavior is unexpected based on the pypi
URLs/paths.

>
>
> -SRC_URI[sha256sum] =3D
> "dcc96739331fb854dcf503f94607576cfe8488066c61ca50dfd55836f132de99"
> +SRC_URI[sha256sum] =3D
> "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff"
>
>  inherit pypi setuptools3
>
> @@ -45,7 +45,7 @@ cython_fix_sources () {
>                 ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Tempita/_tempita.c \
>
> ${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
>                 if [ -e $f ]; then
> -                       sed -i -e
> 's#${WORKDIR}/Cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
> +                       sed -i -e
> 's#${WORKDIR}/cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
>                 fi
>         done
>  }
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203171):
> https://lists.openembedded.org/g/openembedded-core/message/203171
> Mute This Topic: https://lists.openembedded.org/mt/107806931/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ef9bf0061f402af1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 9, 2024 at 5:36=E2=80=AFAM Trevor Gamblin via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;tga=
mblin=3D<a href=3D"mailto:baylibre.com@lists.openembedded.org">baylibre.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">The upstre=
am package changed from uppercase to lowercase in &quot;Cython&quot;, so<br=
>
adjust PYPI_PACKAGE and the sed call in cython_fix_sources to match.<br>
<br>
Changelog (<a href=3D"https://github.com/cython/cython/releases/tag/3.0.11-=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/cython/cython/re=
leases/tag/3.0.11-1</a>):<br>
<br>
Features added<br>
--------------<br>
<br>
* The C++11 ``emplace*`` methods were added to ``libcpp.deque``.<br>
=C2=A0 Patch by Somin An.=C2=A0 (Github issue :issue:`6159`)<br>
<br>
Bugs fixed<br>
----------<br>
<br>
* The exception check value of functions declared in pxd files was not alwa=
ys applied in 3.0.10.<br>
=C2=A0 (Github issue :issue:`6122`)<br>
<br>
* A crash on exception deallocations was fixed.<br>
=C2=A0 (Github issue :issue:`6022`)<br>
<br>
* A crash was fixed when assigning a zero-length slice to a memoryview.<br>
=C2=A0 Patch by Michael Man.=C2=A0 (Github issue :issue:`6227`)<br>
<br>
* ``libcpp.optional.value()`` could crash if it raised a C++ exception.<br>
=C2=A0 Patch by Alexander Condello.=C2=A0 (Github issue :issue:`6190`)<br>
<br>
* The return type of ``str()`` was mishandled, leading to crashes with ``la=
nguage_level=3D3``.<br>
=C2=A0 (Github issue :issue:`6166`)<br>
<br>
* ``bytes.startswith/endswith()`` failed for non-bytes substrings (e.g. ``b=
ytearray``).<br>
=C2=A0 (Github issue :issue:`6168`)<br>
<br>
* Fused ctuples crashed Cython.<br>
=C2=A0 (Github issue :issue:`6068`)<br>
<br>
* A compiler crash was fixed when using extension types in fused types.<br>
=C2=A0 (Github issue :issue:`6204`)<br>
<br>
* The module cleanup code was incorrect for globally defined memory view sl=
ices.<br>
=C2=A0 (Github issue :issue:`6276`)<br>
<br>
* Some adaptations were made to enable compilation in Python 3.13.<br>
=C2=A0 (Github issues :issue:`5997`, :issue:`6182`, :issue:`6251`)<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-cython_3.0.10.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-cython_3.0.10.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3-cython_3.0.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_=
3.0.11.bb</a>}=C2=A0 | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-cython=
_3.0.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.10.bb</=
a> =3D&gt; <a href=3D"http://python3-cython_3.0.11.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-cython_3.0.11.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cython_=
3.0.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.10.bb</a=
> b/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.0.11.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.11.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cython_3=
.0.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.10.bb</a>=
<br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.0=
.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.11.bb</a><b=
r>
index 86ae5f25e9..6e1f599aa7 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.0.10.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.10.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.0.11.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.0.11.bb</a><br>
@@ -6,9 +6,9 @@ and the messy, low-level world of C.&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D61c3ee8961575861f=
a86c7e62bc9f69c&quot;<br>
-PYPI_PACKAGE =3D &quot;Cython&quot;<br>
+PYPI_PACKAGE =3D &quot;cython&quot;</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">This would be the default behavior. So this line can si=
mply be dropped. But we need to make sure the upstream version check still =
works for AUH/devtool latest-version. Sometimes the behavior is unexpected =
based on the pypi URLs/paths.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
-SRC_URI[sha256sum] =3D &quot;dcc96739331fb854dcf503f94607576cfe8488066c61c=
a50dfd55836f132de99&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7146dd2af8682b4ca61331851e6aebce9fe5158e75300=
343f80c07ca80b1faff&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
@@ -45,7 +45,7 @@ cython_fix_sources () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}${TARGET_DBG=
SRC_DIR}/Cython/Tempita/_tempita.c \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}${libdir}/${=
PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $f ]; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e &#39;s#${WORKDIR}/Cython-${PV}#${TARGET_DBGSRC_DIR}#g&#=
39; $f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e &#39;s#${WORKDIR}/cython-${PV}#${TARGET_DBGSRC_DIR}#g&#=
39; $f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203171): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203171" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203171</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107806931/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107806931/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ef9bf0061f402af1--

