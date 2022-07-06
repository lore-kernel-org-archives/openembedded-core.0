Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A24C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 10:40:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.4603.1657103998780933905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PceYqKX+;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id r138so10668392qke.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/gcRLhWZZz4JB21E3mnN9pMmhhZHdyfXRijznFeGXBo=;
        b=PceYqKX+nDYVQHzNHDJBiWT+fEXHsIK9sJOTBQfH8H3cM9AUDb3coaQ+teVYvhdZTP
         5AJNc/6UdqCWsg/y8VIZUXzTXUsxbAeScOXzs68jdSVJ9sb5/RqoUfXRa7d1Y+VprqOn
         kzI25cn/wZONLQwS/HgP9GcNVKvpwNNqG339OSdw4qopXZ65g8JccEHNAieLpwbDMzEf
         5MVrS86cf0JqjsxJ0Mx3udNVfSX/3xhXa7ZjDo9vbU8Wt1yIuDYyULpydsoy0CsF6Gln
         ORkhPDLGgyKWetEGcjODbMTRohjQ3qkZCAkiFiU+2qWlI+/xHkYTUfcIdcWBljZU5HRH
         aZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/gcRLhWZZz4JB21E3mnN9pMmhhZHdyfXRijznFeGXBo=;
        b=hv9NymgwuTCZuaDUEaU/iurNYfoJ93Ota5lkKzaspCNuU0GH2Y/cLBQDWjg3rJAod6
         jx4ob5eqDGPUDd3/1VIdHpMAaPCaaRxN34WQSAleT10y6lnBgWJ7U5zbO4e4YUUgSqhS
         K+Q8W2a8rfnTC5Biot2SaI104ziCr+M+qdnI0H6Z2x6jxGaMYkG4L3NiUaiGrl9LGXrc
         8mYJcJdoxbF2raD3zNAVBONpMl3Y5zsZsxDOvHYKRJ2YE56QfAOVDQJoWg8uReXhnVyx
         hV6i6jzFceKqRn3x5GqLadKGLFl1JP8ZNW6/igF7w/ar+SBmO0yvrKIyI7X/dFn49kdQ
         hcWw==
X-Gm-Message-State: AJIora/z3iupFhWoZmgPfRgR70sZUnr5kaC7HPIkoFdXneTEVIb4K5Hb
	VH8T866p3VXn0TnWx8eEiPalOSVoZ20zNxH3BTs=
X-Google-Smtp-Source: 
 AGRyM1vL87Iv8jKS4eluEdZIz3qBIN6V6q6qhs59ml3AztThooZC4mxCHjuOHDsxbJQ48rzyHrZ/xVqlpp+Qp37HKe0=
X-Received: by 2002:a05:620a:448a:b0:6af:3a05:f73c with SMTP id
 x10-20020a05620a448a00b006af3a05f73cmr27518128qkp.72.1657103997644; Wed, 06
 Jul 2022 03:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220706080721.3072553-1-alex@linutronix.de>
 <20220706080721.3072553-20-alex@linutronix.de>
In-Reply-To: <20220706080721.3072553-20-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2022 06:39:46 -0400
Message-ID: 
 <CAMKF1soyCB6WGUCpPhbzjt5=7pr6gSeJSjg5a58wkqh7rGJ04g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 20/27] python3-mako: upgrade 1.2.0 -> 1.2.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000022b4f305e3209774"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 10:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167717

--00000000000022b4f305e3209774
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 6, 2022 at 4:07 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.2.0.bb =>
> python3-mako_1.2.1.bb} (73%)
>
> diff --git a/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-mako_1.2.0.bb
> rename to meta/recipes-devtools/python/python3-mako_1.2.1.bb
> index 11e5f326bd..8155c37984 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> +++ b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
> @@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
>  HOMEPAGE = "http://www.makotemplates.org/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
>

You forgot to mention What changed here

>
>  PYPI_PACKAGE = "Mako"
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =
> "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
> +SRC_URI[sha256sum] =
> "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
>
>  RDEPENDS:${PN} = "${PYTHON_PN}-html \
>                    ${PYTHON_PN}-markupsafe \
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167707):
> https://lists.openembedded.org/g/openembedded-core/message/167707
> Mute This Topic: https://lists.openembedded.org/mt/92202189/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000022b4f305e3209774
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 6, 2022 at 4:07 AM Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alexander Kanavin &lt=
;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de=
</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-mako_1.2.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-mako_1.2.0.bb</a> =3D&gt; <a href=3D"http://py=
thon3-mako_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.=
1.bb</a>}=C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-mako_1=
.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a> =3D=
&gt; <a href=3D"http://python3-mako_1.2.1.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-mako_1.2.1.bb</a>} (73%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a><br>
similarity index 73%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a><br>
index 11e5f326bd..8155c37984 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.1.bb</a><br>
@@ -2,13 +2,13 @@ SUMMARY =3D &quot;Templating library for Python&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.makotemplates.org/" rel=3D"n=
oreferrer" target=3D"_blank">http://www.makotemplates.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00=
a6a18d&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dad08dd28df88e64b35bcac27c8=
22ee34&quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">You forgot to me=
ntion What changed here=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0PYPI_PACKAGE =3D &quot;Mako&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;9a7c7e922b87db3686210cf49d5d767033a41d4010b28=
4e747682c92bddd8b39&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffc=
c146c9de17e717b0307&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-html \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-markupsafe \<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167707): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167707" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167707</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92202189/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92202189/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000022b4f305e3209774--

