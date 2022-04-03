Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24443C48BD2
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web09.24436.1649003204485597428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 09:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O/g+WsxB;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 47so3752720vki.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUXIbMfwdhBLjiPNFIqoVWIwM8y90z6gz0Alptisydc=;
        b=O/g+WsxBqvue99IrZR+aEcz+hSqU0daLAlwQ+/oHpj7CRY9FOLc8RFQdj6VNfegLFs
         Icwv4SVvkpp3eeRXuaizajHBfGZEuqPGu3e/ETmucOAnMczBDOIXzx0f03A62/xhvQY3
         AgsYlt8DmAnDDbflLV+Rw5MCV1/yiuAtA6rTfwT1Pl9XXT2C5l7t98w6dTbSXOgyhUly
         +Gy2cDeAEzXymg7Pk1yuHh0DucxayzAiEAbsixr0CdjhIhVd0B2pXGaFCkhMYkkvmeZh
         HwgdkeHdXymQm/+limqMnQLfOJKk48wJQYliFW2IJlZiCJ89EnqwxsjmbIgNCK7Kjyq2
         EYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUXIbMfwdhBLjiPNFIqoVWIwM8y90z6gz0Alptisydc=;
        b=4hHMHylrdk7lVyY9jjB2iCFmbZqm5XfdoGqxrERE+K6cBzqMloJCkf17QVX+Zpqs2+
         Gg/RB2Ot71a1xeFp1gFAfoeBFPITh6xDVthTyrbKkNOwaJ9aBPwKFjWCsm8vwCWqOfF6
         nqnoGUPUaK7ur+P9XLaG+QawBzTr3AnHFKaLPaehaajA/H7ijpK/lWVUlF12lpIep6Uw
         NxJP52fBxGEr1dVUm/SuDs3xz1zfARlKo0oT0sjqEHqrkKhY1XmGWUn90wxLWwJRpi7D
         ACbIbpDvuye3Hi6SDaaJKXdDrBvseeeeNxe1xCXCWHs8FmGQWmx8uYv9CcdLUTYTvmBM
         TI4w==
X-Gm-Message-State: AOAM533gAjv9Cc/bsxze7ZNietnRCPNEAESUg1dQYrbTeaF9gwp+PaVa
	RBMi5uTNKsDQX5rdd3UX+S6uT16ny48D+9BCNgE=
X-Google-Smtp-Source: 
 ABdhPJyU08h/ZpOLy6go3FfRw7TFJVeSisxconC8jof+Is96rzuBh7iboiOBSqF5vvCDcYrfbEMtjwqDO8Cj5ZAND4Y=
X-Received: by 2002:a05:6122:895:b0:344:4ff6:581a with SMTP id
 21-20020a056122089500b003444ff6581amr1108116vkf.40.1649003203512; Sun, 03 Apr
 2022 09:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220403151409.2664838-1-adrian.freihofer@siemens.com>
In-Reply-To: <20220403151409.2664838-1-adrian.freihofer@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 3 Apr 2022 18:25:56 +0200
Message-ID: 
 <CA+chaQdHK-KBh3PZO8tJPMmJrpJbPbAVvy72QTDeMM0ab=L9vg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] boost-native: fix build on recent host
 distros
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000002dcb9205dbc27a02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163965

--0000000000002dcb9205dbc27a02
Content-Type: text/plain; charset="UTF-8"

I've already sent fix for this earlier this week, see
https://lists.openembedded.org/g/openembedded-core/message/163944

On Sun, Apr 3, 2022 at 5:14 PM Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> The same build error as reported with Solaris occurred on a Fedora 35
> machine. The problem is already fixed upstream.
> Related PR:
>  https://github.com/boostorg/thread/pull/297
> Related commit:
>
> https://github.com/boostorg/thread/commit/e54f7e39606b807b8f9fc84fbd58cafeabea6562
>
> Since the patch only deals with a build warning, it seems safe to apply
> it always not just for native builds.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
>  ...-elide-a-warning-that-caused-Solaris.patch | 26 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644
> meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
>
> diff --git a/meta/recipes-support/boost/boost_1.72.0.bb
> b/meta/recipes-support/boost/boost_1.72.0.bb
> index df1cc16937..23595da930 100644
> --- a/meta/recipes-support/boost/boost_1.72.0.bb
> +++ b/meta/recipes-support/boost/boost_1.72.0.bb
> @@ -9,4 +9,5 @@ SRC_URI += " \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
>             file://0001-revert-cease-dependence-on-range.patch \
>             file://0001-added-typedef-executor_type.patch \
> +
>  file://0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch \
>             "
> diff --git
> a/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
> b/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
> new file mode 100644
> index 0000000000..97111ce2f8
> --- /dev/null
> +++
> b/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
> @@ -0,0 +1,26 @@
> +From 019dd7cea49659e45e12d2b44480c133372ab401 Mon Sep 17 00:00:00 2001
> +From: Rob Boehne <robb@datalogics.com>
> +Date: Wed, 20 Nov 2019 11:25:20 -0600
> +Subject: [PATCH] Revert change to elide a warning that caused Solaris
> builds
> + to fail.
> +
> +---
> + boost/thread/pthread/thread_data.hpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/boost/thread/pthread/thread_data.hpp
> b/boost/thread/pthread/thread_data.hpp
> +index aefbeb43c..bc9b1367a 100644
> +--- a/boost/thread/pthread/thread_data.hpp
> ++++ b/boost/thread/pthread/thread_data.hpp
> +@@ -57,7 +57,7 @@ namespace boost
> + #else
> +           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
> + #endif
> +-#if PTHREAD_STACK_MIN > 0
> ++#ifdef PTHREAD_STACK_MIN
> +           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
> + #endif
> +           size = ((size+page_size-1)/page_size)*page_size;
> +--
> +2.35.1
> +
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163960):
> https://lists.openembedded.org/g/openembedded-core/message/163960
> Mute This Topic: https://lists.openembedded.org/mt/90221152/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002dcb9205dbc27a02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve already sent fix for this earlier this week, see=
=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/163944">https://lists.openembedded.org/g/openembedded-core/message/163944<=
/a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Apr 3, 2022 at 5:14 PM Adrian Freihofer &lt;<a href=3D"mailto:ad=
rian.freihofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The same build error as=
 reported with Solaris occurred on a Fedora 35<br>
machine. The problem is already fixed upstream.<br>
Related PR:<br>
=C2=A0<a href=3D"https://github.com/boostorg/thread/pull/297" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/boostorg/thread/pull/297</a><br>
Related commit:<br>
=C2=A0<a href=3D"https://github.com/boostorg/thread/commit/e54f7e39606b807b=
8f9fc84fbd58cafeabea6562" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/boostorg/thread/commit/e54f7e39606b807b8f9fc84fbd58cafeabea6562</a><=
br>
<br>
Since the patch only deals with a build warning, it seems safe to apply<br>
it always not just for native builds.<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D"=
noreferrer" target=3D"_blank">boost_1.72.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +<=
br>
=C2=A0...-elide-a-warning-that-caused-Solaris.patch | 26 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 27 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/boost/files/0001-Revert-chang=
e-to-elide-a-warning-that-caused-Solaris.patch<br>
<br>
diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" =
rel=3D"noreferrer" target=3D"_blank">boost_1.72.0.bb</a> b/meta/recipes-sup=
port/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D"noreferrer" target=3D"=
_blank">boost_1.72.0.bb</a><br>
index df1cc16937..23595da930 100644<br>
--- a/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D"=
noreferrer" target=3D"_blank">boost_1.72.0.bb</a><br>
+++ b/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D"=
noreferrer" target=3D"_blank">boost_1.72.0.bb</a><br>
@@ -9,4 +9,5 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-dont-setup-compiler-f=
lags-m32-m64.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-revert-cease-dependen=
ce-on-range.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-added-typedef-executo=
r_type.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-change-to-elid=
e-a-warning-that-caused-Solaris.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a=
-warning-that-caused-Solaris.patch b/meta/recipes-support/boost/files/0001-=
Revert-change-to-elide-a-warning-that-caused-Solaris.patch<br>
new file mode 100644<br>
index 0000000000..97111ce2f8<br>
--- /dev/null<br>
+++ b/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warnin=
g-that-caused-Solaris.patch<br>
@@ -0,0 +1,26 @@<br>
+From 019dd7cea49659e45e12d2b44480c133372ab401 Mon Sep 17 00:00:00 2001<br>
+From: Rob Boehne &lt;<a href=3D"mailto:robb@datalogics.com" target=3D"_bla=
nk">robb@datalogics.com</a>&gt;<br>
+Date: Wed, 20 Nov 2019 11:25:20 -0600<br>
+Subject: [PATCH] Revert change to elide a warning that caused Solaris buil=
ds<br>
+ to fail.<br>
+<br>
+---<br>
+ boost/thread/pthread/thread_data.hpp | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/boost/thread/pthread/thread_data.hpp b/boost/thread/pthread/t=
hread_data.hpp<br>
+index aefbeb43c..bc9b1367a 100644<br>
+--- a/boost/thread/pthread/thread_data.hpp<br>
++++ b/boost/thread/pthread/thread_data.hpp<br>
+@@ -57,7 +57,7 @@ namespace boost<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::size_t page_size =3D ::sysco=
nf( _SC_PAGESIZE);<br>
+ #endif<br>
+-#if PTHREAD_STACK_MIN &gt; 0<br>
++#ifdef PTHREAD_STACK_MIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size&lt;PTHREAD_STACK_MIN) si=
ze=3DPTHREAD_STACK_MIN;<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D ((size+page_size-1)/page=
_size)*page_size;<br>
+-- <br>
+2.35.1<br>
+<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163960): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163960" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163960</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90221152/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90221152/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002dcb9205dbc27a02--

