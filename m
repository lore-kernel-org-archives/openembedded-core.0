Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web09.7645.1625812799898544340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vE7JrdrW;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id e15so1949891vkp.13
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 23:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y1tHMeiCYNtV6zoxR7F622kdfXQUhO4mp/fG2Mryt28=;
        b=vE7JrdrWi2WBuh2TFxoSzZE0oi3QjN+P6Nfk+OJKc2+hPEwl+NC2Cig8KeHwxxxjYV
         1ld5gUzHAipDTqXhvE0pk2dqtlK1EKSyD6s8TQDfSV4CMUdFMIQAy9zh5iGGo0zxEc1F
         MrGkkK+NSQPEBmjg67jPz5+eDt3lEL4DYT/y/cxP/qeYTs4q8gaYuep2ITuCMm1AKHeh
         iD4SaXpJjWqnaB6nh5GIHtNbl7NHd0WgtmksmmcJNJOYEHaeOF1OZStD4e4SZRzt5gQX
         s6uD48boqN2HXnibIxjiWiUZmGxke1PLo7dMuXPPVR+GDwL73JAh01SO8lsEw/WMI1BN
         glaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y1tHMeiCYNtV6zoxR7F622kdfXQUhO4mp/fG2Mryt28=;
        b=VazbXx2Fj+05Mjcz3or6/iVtvBcvERObet82unwgU03rOg9qfOi3qeYFezbdgRbk5q
         M2MyaJ0wxfmuUOhaOpecMLsfk6MoDwO8cBSzlYHno2faLsw/eyf33zmFZv/Ccp/tlccL
         6WRaUS1OljMeazwaHySqaLBmJBI3EfWs18bYjdpICXqXfjuBPQ/b0oZnRCio7Nrm1TTp
         DbhppCEs5RziKgt4oTEciKQZYMdSL17WR00igjeJUPPVXrW7MCCv9Unp01sa9zDc9qeD
         BnHxxjeyKf82d8nByPd1RfrVs9BT5SO9jR2kk7GLN6AiZsl1RgWACypU0oVz/LSJHVcQ
         3RiQ==
X-Gm-Message-State: AOAM531YwDCGcSi2tYtj9qoU84pxT0PmJbpuCDxUyIgvZG1YvjY3P58k
	dtRgi6ew6PrCM82yG7MqM8PXVgO43XbmcOZYh0s=
X-Google-Smtp-Source: ABdhPJxyE6J0TedALeXOmoMFbTRtoUdfKrwXWw9Gx/+9ilujAJGPHg6fwhoIfRsMWzGVoDGU3xpQH178ikZm/4k8u14=
X-Received: by 2002:a05:6122:c9b:: with SMTP id ba27mr22422821vkb.0.1625812799036;
 Thu, 08 Jul 2021 23:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <1625789993-7875-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1625789993-7875-1-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 9 Jul 2021 08:39:47 +0200
Message-ID: <CANNYZj_=gUJQGgWA2_SVfVruyb=TVCFu5WukAkbsKOC5G4QxWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b9fb505c6ab0ae4"

--0000000000005b9fb505c6ab0ae4
Content-Type: text/plain; charset="UTF-8"

The patch file itself needs to be deleted, and commit message adjusted to
explain it's been merged upstream.

Alex

On Fri, 9 Jul 2021 at 02:20, wangmy <wangmy@fujitsu.com> wrote:

> refresh reproducibility.patch
>
> v57.1.0
> -------
>
> Changes
> ^^^^^^^
> * #2692: Globs are now sorted in 'license_files' restoring reproducibility
> by eliminating variance from disk order.
> * #2714: Update to distutils at pypa/distutils@e2627b7.
> * #2715: Removed reliance on deprecated ssl.match_hostname by removing the
> ssl support. Now any index operations rely on the native SSL implementation.
>
> Documentation changes
> ^^^^^^^^^^^^^^^^^^^^^
> * #2604: Revamped the backward/cross tool compatibility section to remove
>   some confusion.
>   Add some examples and the version since when ``entry_points`` are
>   supported in declarative configuration.
>   Tried to make the reading flow a bit leaner, gather some informations
>   that were a bit dispersed.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...on3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_57.0.0.bb =>
> python3-setuptools_57.1.0.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
> b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
> index a15b51e31c..c066d8209f 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
> @@ -8,10 +8,9 @@ inherit pypi setuptools3
>
>  SRC_URI_append_class-native = "
> file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>
> -SRC_URI += "file://0001-change-shebang-to-python3.patch \
> -            file://reproducibility.patch"
> +SRC_URI += "file://0001-change-shebang-to-python3.patch"
>
> -SRC_URI[sha256sum] =
> "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
> +SRC_URI[sha256sum] =
> "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
>
>  DEPENDS += "${PYTHON_PN}"
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000005b9fb505c6ab0ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch file itself needs to be deleted, and commit=
 message adjusted to explain it&#39;s been merged upstream.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, 9 Jul 2021 at 02:20, wangmy &lt;<a href=3D"=
mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">refresh reproducibility.patch<=
br>
<br>
v57.1.0<br>
-------<br>
<br>
Changes<br>
^^^^^^^<br>
* #2692: Globs are now sorted in &#39;license_files&#39; restoring reprodu=
cibility by eliminating variance from disk order.<br>
* #2714: Update to distutils at pypa/distutils@e2627b7.<br>
* #2715: Removed reliance on deprecated ssl.match_hostname by removing the=
 ssl support. Now any index operations rely on the native SSL implementatio=
n.<br>
<br>
Documentation changes<br>
^^^^^^^^^^^^^^^^^^^^^<br>
* #2604: Revamped the backward/cross tool compatibility section to remove<=
br>
=C2=A0 some confusion.<br>
=C2=A0 Add some examples and the version since when ``entry_points`` are<b=
r>
=C2=A0 supported in declarative configuration.<br>
=C2=A0 Tried to make the reading flow a bit leaner, gather some informatio=
ns<br>
=C2=A0 that were a bit dispersed.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://on3-setuptools_57.0.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">on3-setuptools_57.0.0.bb</a> =3D&gt; <a href=3D"http://pyth=
on3-setuptools_57.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setu=
ptools_57.1.0.bb</a>} | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-setup=
tools_57.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57=
.0.0.bb</a> =3D&gt; <a href=3D"http://python3-setuptools_57.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-setuptools_57.1.0.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-setupt=
ools_57.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.=
0.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols_57.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1=
.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols_57.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.0=
.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-setuptool=
s_57.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1.0=
.bb</a><br>
index a15b51e31c..c066d8209f 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_57=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.0.0.bb<=
/a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_57=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1.0.bb<=
/a><br>
@@ -8,10 +8,9 @@ inherit pypi setuptools3<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; file://0001-conditionally-do-=
not-fetch-code-by-easy_install.patch&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reproducibility.patch&qu=
ot;<br>
+SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;401cbf33a7bf817d08014d51560fc003b895c4cdc1a5=
b521ad2969e928a07535&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63af=
ddd82d681de4d22a597b&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${PYTHON_PN}&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005b9fb505c6ab0ae4--
