Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A047C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:48:19 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.4296.1743587295818605832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N7uuCSjN;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so3059377e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743587295; x=1744192095; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qevKMmDwW9KEec9usi7yIsStQEDlfv9fjVo8UFV/npM=;
        b=N7uuCSjN6353apT07ZLQm34VBUjx2ey2l58k8p/deBcYEAlpMTIzl6H6pfCspxxkS+
         bkPswgBBFa/B9gje7Bq4DA8oXr5O/CLgjWYf9YsXgP/hPi+93Q1hN07snw/izc8NZt64
         sQ8IsN32CfPHMRtD2kGAfW6jKsVARxRqCOUAMl8lhzYECzmDXUVSJtiBtxlfjmAyICV7
         wnv5Nb+Gt+DNts5NK8aP5vztuYlWYFktHqSqDCW6J3ZnO77YGZKOXMtPiJMNvGWFs7rv
         0hkTDpcwLaK74ZD0nZ8bCTufLrrqjd2x5qkh5PMC89OO97Sz+TUSZ64OesWHoJyVh3ke
         nlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587295; x=1744192095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qevKMmDwW9KEec9usi7yIsStQEDlfv9fjVo8UFV/npM=;
        b=Dn+4hCYGOxYI0PBuwtLFXa0evG929nbzN0ZODyLXHBdueC0MLpvmH8IxwruRaJH9YC
         YlAXGz0LXuTXDrkBL4M/1vFmddT6BZ/PNoYvoZ2b9kcSCNLv7IHcMiFeS1AlMEz2Wswq
         J8R+G+WQeAJwptx17OGMs4hE/IvZzuNAnbiOCv0SyBX8gNQ7QUAweeE7Uvat97exzJ2M
         M2pH1Mnylz2sVBh5/SRJeUF/gM0RDisciM6j89gvFNOO+LUxXm1BwDZBuxvxHXrVToIx
         E8i49DKoJanETAJoQpfhBCZUdBaRfSi3iOmKUivUg7fg3JmNgUn4OGny3PsxT4s9rgi2
         fayA==
X-Forwarded-Encrypted: i=1; AJvYcCUCiRgkWTQRUp83h7Omw0UZbiTbsPmNsK3McSvXnJY0+pw7l5M8mPUW6taVN3mRtdBc7H3r3eEYxafGhp/IZw/1ew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzozPKnvaffQPJAn4WQXo8Yk1HMnd/h/oCcOnTrlsQIQP1Mxema
	U4+uZmEyB3t5qI8i8F0TqusTB8Yeets+OPCeoPIXu5cApiUaTNEH7yejs0PYGz3Niw4KlZuGykC
	cYQR8XC3hBfzboJAXP4zyv04+qAQ=
X-Gm-Gg: ASbGncsLxSk9pAtJWQivO8/r/Qzbeyq2El2HpTqucelVMBF8n0b9Op47DT3U79gIPsD
	dG9vwtiNG7jTIpBTMAAl9DtDR+qKkpMhK6dj3+lRcjq3zKxiMcev1pRel6uuiSp1jupvtZxYQ1k
	WcWgTyTW7wPEZd7bXudc3eObD0fkwcEMT627iUvQ==
X-Google-Smtp-Source: AGHT+IFZz1+XjMJ2UD+Ggb3Jdgt+2XABGuaEwUuBXWR+AyE4Exjnmkk9YGIEk+uytIJEVM75AClCSeaUxWeGP5duYC0=
X-Received: by 2002:a05:6102:2b82:b0:4c1:6feb:83aa with SMTP id
 ada2fe7eead31-4c6d38499cdmr12069610137.9.1743587294577; Wed, 02 Apr 2025
 02:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250402090749.2119-1-leimaohui@fujitsu.com> <20250402090749.2119-3-leimaohui@fujitsu.com>
In-Reply-To: <20250402090749.2119-3-leimaohui@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Apr 2025 10:48:03 +0100
X-Gm-Features: AQ5f1Jo2_LF6OdnBDtgv9ZZVxxhFqYxHJBhhbQ0KAQnxxN6NqgHdKBXT6qiy6Ec
Message-ID: <CANPvuRm=e2FqbEyo=3rVrq_n0kN5E4oy=02+Xt_qHtJA8NTk3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 02/10] gstreamer1.0: upgrade 1.24.12 -> 1.26.0
To: Lei Maohui <leimaohui@fujitsu.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000540a970631c88d98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214244

--000000000000540a970631c88d98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lei Maohui <leimaohui@fujitsu.com> escreveu (quarta, 2/04/2025 =C3=A0(s) 10=
:08):

> - add backport patch to fix undefined reference to `__atomic_fetch_add_8'
> issue
>   This patch is part of upstream commit, only pick
> subprojects/gstreamer/meson.build part that affect us
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/=
commits?commit_id=3Df2b5c0b6020b50f5173e449b45a6f7a7be31c48f
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../0001-Fix-atomic-64-issue-on-armv5.patch   | 36 +++++++++++++++++++
>  ...spect-the-idententaion-used-in-meson.patch |  6 ++--
>  ...ts-add-support-for-install-the-tests.patch | 16 ++++-----
>  ...s-use-a-dictionaries-for-environment.patch |  6 ++--
>  ...er-script-to-run-the-installed_tests.patch |  6 ++--
>  ...r1.0_1.24.12.bb =3D> gstreamer1.0_1.26.0.bb} |  3 +-
>  6 files changed, 55 insertions(+), 18 deletions(-)
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue-o=
n-armv5.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.12.bb =3D>
> gstreamer1.0_1.26.0.bb} (95%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue=
-on-armv5.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue=
-on-armv5.patch
> new file mode 100644
> index 0000000000..19a09f6829
> --- /dev/null
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-issue=
-on-armv5.patch
> @@ -0,0 +1,36 @@
> +From 459afbb556432eb417bff5a33719efd596ef7502 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Wed, 2 Apr 2025 08:16:51 +0000
> +Subject: [PATCH] Fix atomic 64 issue on armv5
> +
> +|
> /mnt/test/build_auh/tmp/work/armv5e-poky-linux-gnueabi/gstreamer1.0/1.26.=
0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-po=
ky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/14.2.0/ld:
> gst/libgstreamer-1.0.so.0.2600.0.p/gstbuffer.c.o: in function
> `gst_atomic_int64_inc':
> +| /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.c:180:(.text+0x38c8):
> undefined reference to `__atomic_fetch_add_8'
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/=
commits?commit_id=3Df2b5c0b6020b50f5173e449b45a6f7a7be31c48f
> ]
>

Hi Lei,

As you can see this patch touches more than one component, especially:
gstreamer, gst-plugin-base and gst-plugin-bad.
so your patchset should also include the same backports in those components=
.

Thanks

Jose


> +
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + meson.build | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index f4c146d..9c24596 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -599,6 +599,13 @@ if nsl_lib.found()
> +   network_deps +=3D nsl_lib
> + endif
> +
> ++# Check for libatomic for use of C11 atomics: some architectures need
> ++# to link explicitly to this library.
> ++# TODO: Once meson 1.7 is in use, this can be updated to
> ++# dependency('atomic')
> ++atomic_dep =3D cc.find_library('atomic', required: false)
> ++platform_deps +=3D atomic_dep
> ++
> + gir =3D find_program('g-ir-scanner', required :
> get_option('introspection'))
> + gnome =3D import('gnome')
> +
> +--
> +2.43.0
> +
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-i=
dententaion-used-in-meson.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-i=
dententaion-used-in-meson.patch
> index 0dd96bef01..5db93c5be1 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-i=
dententaion-used-in-meson.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-i=
dententaion-used-in-meson.patch
> @@ -1,4 +1,4 @@
> -From a9d99eea162dfb6dcd5cb90adb7dd9261ec676bc Mon Sep 17 00:00:00 2001
> +From cb49c5433f343aa9ae6c0656d2e835365330922b Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: respect the idententaion used in meson
> @@ -11,10 +11,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com=
>
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index 7d68212..bf0021f 100644
> +index e8419fc..4cc4618 100644
>  --- a/tests/check/meson.build
>  +++ b/tests/check/meson.build
> -@@ -146,11 +146,11 @@ foreach t : core_tests
> +@@ -149,11 +149,11 @@ foreach t : core_tests
>
>     if not skip_test
>       exe =3D executable(test_name, fname,
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> index 01d9535eb8..7274d3862f 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> @@ -1,4 +1,4 @@
> -From f0076c5801bd847c464e31ab11fdb06f1ad0fccd Mon Sep 17 00:00:00 2001
> +From d9ad7d4fd596ece5f7a2ce25ed583b5c302984cf Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: add support for install the tests
> @@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com=
>
>   create mode 100644 tests/check/template.test.in
>
>  diff --git a/meson.build b/meson.build
> -index dc9dbe2..55e85b3 100644
> +index f1be50c..f4c146d 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -645,6 +645,10 @@ if bashcomp_dep.found()
> +@@ -657,6 +657,10 @@ if bashcomp_dep.found()
>     endif
>   endif
>
> @@ -34,7 +34,7 @@ index dc9dbe2..55e85b3 100644
>
>   pkgconfig =3D import('pkgconfig')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 340fb58..5b87f68 100644
> +index 39255cf..78af552 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false,
> description : 'Enable poiso
> @@ -46,10 +46,10 @@ index 340fb58..5b87f68 100644
>   # Feature options
>   option('check', type : 'feature', value : 'auto', description : 'Build
> unit test libraries')
>  diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index bf0021f..9a8c42c 100644
> +index 4cc4618..f290e2e 100644
>  --- a/tests/check/meson.build
>  +++ b/tests/check/meson.build
> -@@ -125,10 +125,16 @@ test_defines =3D [
> +@@ -128,10 +128,16 @@ test_defines =3D [
>     '-UG_DISABLE_ASSERT',
>     '-UG_DISABLE_CAST_CHECKS',
>     '-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D"GST_STATE_IGNORE_ELEMENTS"',
> @@ -67,7 +67,7 @@ index bf0021f..9a8c42c 100644
>   # sanity checking
>   if get_option('check').disabled()
>     if get_option('tests').enabled()
> -@@ -151,6 +157,8 @@ foreach t : core_tests
> +@@ -154,6 +160,8 @@ foreach t : core_tests
>         include_directories : [configinc],
>         link_with : link_with_libs,
>         dependencies : gst_deps + test_deps,
> @@ -76,7 +76,7 @@ index bf0021f..9a8c42c 100644
>       )
>
>       env =3D environment()
> -@@ -162,6 +170,18 @@ foreach t : core_tests
> +@@ -165,6 +173,18 @@ foreach t : core_tests
>       env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir +
> '/gst-plugin-scanner')
>       env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-diction=
aries-for-environment.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-diction=
aries-for-environment.patch
> index 861046d2db..79e494a22a 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-diction=
aries-for-environment.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-diction=
aries-for-environment.patch
> @@ -1,4 +1,4 @@
> -From f9544b0e2d35bf9f9a89cff42bb741bc16e37cc8 Mon Sep 17 00:00:00 2001
> +From d24110809da4588354ad3df4ae99556e8c62838a Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sat, 24 Apr 2021 10:34:47 +0100
>  Subject: [PATCH] tests: use a dictionaries for environment
> @@ -14,10 +14,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com=
>
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
>  diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index 9a8c42c..6bb346a 100644
> +index f290e2e..a3ffcb6 100644
>  --- a/tests/check/meson.build
>  +++ b/tests/check/meson.build
> -@@ -161,14 +161,19 @@ foreach t : core_tests
> +@@ -164,14 +164,19 @@ foreach t : core_tests
>         install: installed_tests_enabled,
>       )
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> index cb47f7244f..4b1aad2616 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> @@ -1,4 +1,4 @@
> -From 39764bd2b9f9da4a07079f76a2f68baf40c143b9 Mon Sep 17 00:00:00 2001
> +From 3b9ae399b57cfb6e332fac6a90997a3abd33c819 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 2 May 2021 01:58:01 +0100
>  Subject: [PATCH] tests: add helper script to run the installed_tests
> @@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com=
>
>   create mode 100755 tests/check/template.sh.in
>
>  diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index 6bb346a..fe57935 100644
> +index a3ffcb6..b907dcf 100644
>  --- a/tests/check/meson.build
>  +++ b/tests/check/meson.build
> -@@ -185,6 +185,23 @@ foreach t : core_tests
> +@@ -188,6 +188,23 @@ foreach t : core_tests
>           install_dir: installed_tests_metadir,
>           configuration: test_conf
>         )
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> similarity index 95%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> index d224b80eb3..a908ecd166 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
> @@ -21,8 +21,9 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>             file://0002-tests-add-support-for-install-the-tests.patch \
>             file://0003-tests-use-a-dictionaries-for-environment.patch \
>
> file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
> +           file://0001-Fix-atomic-64-issue-on-armv5.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f5804df15b634bd22b1036f"
> +SRC_URI[sha256sum] =3D
> "1b2ee4028010c25b776effa7c396c7e3e1861b60b9417e416f4914abcdff279f"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
>                     check \
> --
> 2.43.0
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000540a970631c88d98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Lei Maohui &lt;=
<a href=3D"mailto:leimaohui@fujitsu.com">leimaohui@fujitsu.com</a>&gt; escr=
eveu (quarta, 2/04/2025 =C3=A0(s) 10:08):<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">- add backport patch to fix undefined reference t=
o `__atomic_fetch_add_8&#39; issue<br>
=C2=A0 This patch is part of upstream commit, only pick subprojects/gstream=
er/meson.build part that affect us<br>
=C2=A0 <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merg=
e_requests/8637/commits?commit_id=3Df2b5c0b6020b50f5173e449b45a6f7a7be31c48=
f" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstr=
eamer/gstreamer/-/merge_requests/8637/commits?commit_id=3Df2b5c0b6020b50f51=
73e449b45a6f7a7be31c48f</a><br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" targ=
et=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-atomic-64-issue-on-armv5.patch=C2=A0 =C2=A0| 36 ++++++++=
+++++++++++<br>
=C2=A0...spect-the-idententaion-used-in-meson.patch |=C2=A0 6 ++--<br>
=C2=A0...ts-add-support-for-install-the-tests.patch | 16 ++++-----<br>
=C2=A0...s-use-a-dictionaries-for-environment.patch |=C2=A0 6 ++--<br>
=C2=A0...er-script-to-run-the-installed_tests.patch |=C2=A0 6 ++--<br>
=C2=A0...<a href=3D"http://r1.0_1.24.12.bb" rel=3D"noreferrer" target=3D"_b=
lank">r1.0_1.24.12.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.26.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a>} |=C2=A0 3=
 +-<br>
=C2=A06 files changed, 55 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
1-Fix-atomic-64-issue-on-armv5.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.24.12.b=
b</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.26.0.bb" rel=3D"noreferrer" =
target=3D"_blank">gstreamer1.0_1.26.0.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic=
-64-issue-on-armv5.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0=
001-Fix-atomic-64-issue-on-armv5.patch<br>
new file mode 100644<br>
index 0000000000..19a09f6829<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-atomic-64-iss=
ue-on-armv5.patch<br>
@@ -0,0 +1,36 @@<br>
+From 459afbb556432eb417bff5a33719efd596ef7502 Mon Sep 17 00:00:00 2001<br>
+From: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_b=
lank">leimaohui@fujitsu.com</a>&gt;<br>
+Date: Wed, 2 Apr 2025 08:16:51 +0000<br>
+Subject: [PATCH] Fix atomic 64 issue on armv5<br>
+<br>
+| /mnt/test/build_auh/tmp/work/armv5e-poky-linux-gnueabi/gstreamer1.0/1.26=
.0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-p=
oky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/14.2.0/ld: gst/libgstreamer-1.=
0.so.0.2600.0.p/gstbuffer.c.o: in function `gst_atomic_int64_inc&#39;:<br>
+| /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.c:180:(.text+0x38c8): u=
ndefined reference to `__atomic_fetch_add_8&#39;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/8637/commits?commit_id=3Df2b5c0b6020b50f517=
3e449b45a6f7a7be31c48f" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_i=
d=3Df2b5c0b6020b50f5173e449b45a6f7a7be31c48f</a>]<br></blockquote><div><br>=
</div><div>Hi Lei,<br><br>As you can see this patch touches more than one c=
omponent, especially: gstreamer, gst-plugin-base and gst-plugin-bad.</div><=
div>so your patchset should also include the same backports in those compon=
ents.<br><br>Thanks</div><div><br>Jose<br>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+<br>
+Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@fujitsu.com" tar=
get=3D"_blank">leimaohui@fujitsu.com</a>&gt;<br>
+---<br>
+ meson.build | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index f4c146d..9c24596 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -599,6 +599,13 @@ if nsl_lib.found()<br>
+=C2=A0 =C2=A0network_deps +=3D nsl_lib<br>
+ endif<br>
+ <br>
++# Check for libatomic for use of C11 atomics: some architectures need<br>
++# to link explicitly to this library.<br>
++# TODO: Once meson 1.7 is in use, this can be updated to<br>
++# dependency(&#39;atomic&#39;)<br>
++atomic_dep =3D cc.find_library(&#39;atomic&#39;, required: false)<br>
++platform_deps +=3D atomic_dep<br>
++<br>
+ gir =3D find_program(&#39;g-ir-scanner&#39;, required : get_option(&#39;i=
ntrospection&#39;))<br>
+ gnome =3D import(&#39;gnome&#39;)<br>
+ <br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch<br>
index 0dd96bef01..5db93c5be1 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch<br>
@@ -1,4 +1,4 @@<br>
-From a9d99eea162dfb6dcd5cb90adb7dd9261ec676bc Mon Sep 17 00:00:00 2001<br>
+From cb49c5433f343aa9ae6c0656d2e835365330922b Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
=C2=A0Subject: [PATCH] tests: respect the idententaion used in meson<br>
@@ -11,10 +11,10 @@ Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
-index 7d68212..bf0021f 100644<br>
+index e8419fc..4cc4618 100644<br>
=C2=A0--- a/tests/check/meson.build<br>
=C2=A0+++ b/tests/check/meson.build<br>
-@@ -146,11 +146,11 @@ foreach t : core_tests<br>
+@@ -149,11 +149,11 @@ foreach t : core_tests<br>
<br>
=C2=A0 =C2=A0 if not skip_test<br>
=C2=A0 =C2=A0 =C2=A0 exe =3D executable(test_name, fname,<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0002-tests-add-support-for-install-the-tests.patch<br>
index 01d9535eb8..7274d3862f 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch<br>
@@ -1,4 +1,4 @@<br>
-From f0076c5801bd847c464e31ab11fdb06f1ad0fccd Mon Sep 17 00:00:00 2001<br>
+From d9ad7d4fd596ece5f7a2ce25ed583b5c302984cf Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
=C2=A0Subject: [PATCH] tests: add support for install the tests<br>
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 create mode 100644 tests/check/<a href=3D"http://template.test.in" r=
el=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index dc9dbe2..55e85b3 100644<br>
+index f1be50c..f4c146d 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -645,6 +645,10 @@ if bashcomp_dep.found()<br>
+@@ -657,6 +657,10 @@ if bashcomp_dep.found()<br>
=C2=A0 =C2=A0 endif<br>
=C2=A0 endif<br>
<br>
@@ -34,7 +34,7 @@ index dc9dbe2..55e85b3 100644<br>
<br>
=C2=A0 pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index 340fb58..5b87f68 100644<br>
+index 39255cf..78af552 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
=C2=A0@@ -16,6 +16,7 @@ option(&#39;poisoning&#39;, type : &#39;boolean&#39=
;, value : false, description : &#39;Enable poiso<br>
@@ -46,10 +46,10 @@ index 340fb58..5b87f68 100644<br>
=C2=A0 # Feature options<br>
=C2=A0 option(&#39;check&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;, description : &#39;Build unit test libraries&#39;)<br>
=C2=A0diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
-index bf0021f..9a8c42c 100644<br>
+index 4cc4618..f290e2e 100644<br>
=C2=A0--- a/tests/check/meson.build<br>
=C2=A0+++ b/tests/check/meson.build<br>
-@@ -125,10 +125,16 @@ test_defines =3D [<br>
+@@ -128,10 +128,16 @@ test_defines =3D [<br>
=C2=A0 =C2=A0 &#39;-UG_DISABLE_ASSERT&#39;,<br>
=C2=A0 =C2=A0 &#39;-UG_DISABLE_CAST_CHECKS&#39;,<br>
=C2=A0 =C2=A0 &#39;-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D&quot;GST_STATE_IG=
NORE_ELEMENTS&quot;&#39;,<br>
@@ -67,7 +67,7 @@ index bf0021f..9a8c42c 100644<br>
=C2=A0 # sanity checking<br>
=C2=A0 if get_option(&#39;check&#39;).disabled()<br>
=C2=A0 =C2=A0 if get_option(&#39;tests&#39;).enabled()<br>
-@@ -151,6 +157,8 @@ foreach t : core_tests<br>
+@@ -154,6 +160,8 @@ foreach t : core_tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directories : [configinc],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_with : link_with_libs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies : gst_deps + test_deps,<br>
@@ -76,7 +76,7 @@ index bf0021f..9a8c42c 100644<br>
=C2=A0 =C2=A0 =C2=A0 )<br>
<br>
=C2=A0 =C2=A0 =C2=A0 env =3D environment()<br>
-@@ -162,6 +170,18 @@ foreach t : core_tests<br>
+@@ -165,6 +173,18 @@ foreach t : core_tests<br>
=C2=A0 =C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_SCANNER_1_0&#39;, gst_scanner_=
dir + &#39;/gst-plugin-scanner&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_LOADING_WHITELIST&#39;, &#39;g=
streamer&#39;)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0/0003-tests-use-a-dictionaries-for-environment.patch<br>
index 861046d2db..79e494a22a 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch<br>
@@ -1,4 +1,4 @@<br>
-From f9544b0e2d35bf9f9a89cff42bb741bc16e37cc8 Mon Sep 17 00:00:00 2001<br>
+From d24110809da4588354ad3df4ae99556e8c62838a Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 24 Apr 2021 10:34:47 +0100<br>
=C2=A0Subject: [PATCH] tests: use a dictionaries for environment<br>
@@ -14,10 +14,10 @@ Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 13 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
-index 9a8c42c..6bb346a 100644<br>
+index f290e2e..a3ffcb6 100644<br>
=C2=A0--- a/tests/check/meson.build<br>
=C2=A0+++ b/tests/check/meson.build<br>
-@@ -161,14 +161,19 @@ foreach t : core_tests<br>
+@@ -164,14 +164,19 @@ foreach t : core_tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install: installed_tests_enabled,<br>
=C2=A0 =C2=A0 =C2=A0 )<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_test=
s.patch<br>
index cb47f7244f..4b1aad2616 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch<br>
@@ -1,4 +1,4 @@<br>
-From 39764bd2b9f9da4a07079f76a2f68baf40c143b9 Mon Sep 17 00:00:00 2001<br>
+From 3b9ae399b57cfb6e332fac6a90997a3abd33c819 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 2 May 2021 01:58:01 +0100<br>
=C2=A0Subject: [PATCH] tests: add helper script to run the installed_tests<=
br>
@@ -18,10 +18,10 @@ Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 create mode 100755 tests/check/<a href=3D"http://template.sh.in" rel=
=3D"noreferrer" target=3D"_blank">template.sh.in</a><br>
<br>
=C2=A0diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
-index 6bb346a..fe57935 100644<br>
+index a3ffcb6..b907dcf 100644<br>
=C2=A0--- a/tests/check/meson.build<br>
=C2=A0+++ b/tests/check/meson.build<br>
-@@ -185,6 +185,23 @@ foreach t : core_tests<br>
+@@ -188,6 +188,23 @@ foreach t : core_tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_metadir,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration: test_conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.24.12.bb=
</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.2=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0_1.24.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.24.12.bb<=
/a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a><=
br>
index d224b80eb3..a908ecd166 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.24=
.12.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.24.12.bb</a><br=
>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.26=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.0.bb</a><br>
@@ -21,8 +21,9 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x" rel=3D"noreferrer" target=3D=
"_blank">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.ta=
r.x</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-tests-add-support-for=
-install-the-tests.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-tests-use-a-dictionar=
ies-for-environment.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-tests-add-helper-scri=
pt-to-run-the-installed_tests.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-atomic-64-issue-o=
n-armv5.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f580=
4df15b634bd22b1036f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1b2ee4028010c25b776effa7c396c7e3e1861b60b9417=
e416f4914abcdff279f&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check=
 \<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000540a970631c88d98--

