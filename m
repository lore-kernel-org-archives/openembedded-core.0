Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web09.7961.1626076132246701382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 00:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PEEiVSc1;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id h16so3771288vkk.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=19e7E4BPnQYoUwV99LHegApxPkYpvLFgq9NYyoMVEEw=;
        b=PEEiVSc1qSwP8tLknHHr4QxsLnoPAlugJHgQIeH4euNeamRnGjjKfpclOuL/qbT80T
         kNgNW9u8MmviPZU08WJTqS720Tpstek06rGhsv9HWVSAJnwDr2UMc1h9aisOLH32wErq
         xQAfSqp7Q80Ya8pA5IBeqESZediHxjbTzv0Xu9FFALaA1pfazP6wVLfo7YatXyn7gjN0
         q70/zkmnnrMh4SHRPctWcK+fAh3NTI+tiFOuMuIXoXDgu4dD2rpY3klAUoPasqRDw7AT
         wiMQcyFt0AJD1iY8MCqyBumOsz4A5uOCQSkxwmbu95dKBOWQSjq7yr9Se6j3uBS3cP31
         bcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=19e7E4BPnQYoUwV99LHegApxPkYpvLFgq9NYyoMVEEw=;
        b=R8KsNsXw+9VnqNaPzDuxXq7EcWMWnnK5s6M3Dbz6Xn4dyuo6nr0+GkcwlzFnhNzV60
         G2eCK5bT+lBYxUEEi1TRlZhwHerL98OpCPtRoFrf2Law/TZQ7ZwwvNpSQLHkV3vz+OQA
         s64i6aOBSg17IqxYBSH4kYpFQISEastnUSk4IqP+sOAm2Hy+e/+1lezmbBIqTVHbX5rN
         gfkR6TSu98Ov11phS8VcTYHLJKFSwgwfFFUDUB4tMFGY4jkxuzwFB6SwZiRQkA8p5ROw
         Wp4rGPBMBVqJSJMaU+N68UaP1bDgMLM6y6nAJnXwyt8jAfXQ7auVA2leaqjA/hfXSuEY
         jd3A==
X-Gm-Message-State: AOAM531CzIw5wnGsx2zswV5LSj8tsP4JAgb4mI2qREAyMudi1CnRTAHj
	l+I0yiBSSDvqXn/kxVw/NUsoyhKqvvUK5ARBP+M=
X-Google-Smtp-Source: ABdhPJw5re4rf7epm0AxQ4zPhA2jJJV0zfzNEP4uMv5CYBMxzeck8dEeLxTV5ec6eP1k7EVYwVENYhkA8meNSPAQKBo=
X-Received: by 2002:a1f:960a:: with SMTP id y10mr41779131vkd.8.1626076131463;
 Mon, 12 Jul 2021 00:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <1626052555-16162-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1626052555-16162-1-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Jul 2021 09:48:40 +0200
Message-ID: <CANNYZj-HZDupeZ5xX2tibaLSZFGHngWAW3WQE8oLAYG-vGroYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003194aa05c6e85a19"

--0000000000003194aa05c6e85a19
Content-Type: text/plain; charset="UTF-8"

Sorry, but the file is still not deleted. Please remember to look at the
patches before sending them.

Alex

On Mon, 12 Jul 2021 at 03:16, wangmy <wangmy@fujitsu.com> wrote:

> reproducibility.patch
> deleted since it's been merged upstream.
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

--0000000000003194aa05c6e85a19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, but the file is still not deleted. Please reme=
mber to look at the patches before sending them.<br></div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 12 Jul 2021 at 03:16, wangmy &lt;<a href=3D"mailto=
:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">reproducibility.patch<br>
deleted since it&#39;s been merged upstream.<br>
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

--0000000000003194aa05c6e85a19--
