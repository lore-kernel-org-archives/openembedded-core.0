Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66481C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:37:58 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.7525.1720510670086606660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 00:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GrI3cTYA;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee9b1b422fso21889481fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720510668; x=1721115468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6etNtCPneikRevpc9eImZ2qd371xk2mgMzH9rzVJICY=;
        b=GrI3cTYAkajPpEJ/fCSIdb1/uzG9MAfizEOh4GWfy3sfu/TAENceyduuPhe213/F8Z
         JI0+LpuDg58vLhGXegMcGF+/HaWhd30ItUS9I0rZxg9KNHdi5ZKvTsmldwQUpCsCxs2W
         s7PJ5QIlrz9EaNT6PAM+cICrMI4iipLGG+CWHCFbBUeKf1HDfCcwRK5u24XHX7HkYDkj
         2oQHRLNdMbTFcyNbEpBO7ayGHn3gIEpup80lovLsxPnFnuaNu71a07Tz79GHfLdQl2tk
         pn1J9aP3nF+GXy8hgRQhNu0eM8c8Ogve7Mx9AARmPlb4NNDA1ijpMc0xnojUH23AQliZ
         YvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510668; x=1721115468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6etNtCPneikRevpc9eImZ2qd371xk2mgMzH9rzVJICY=;
        b=N9rQic6nmzQYAlNUwP261R8S72yQftI8kZhiXLIpzh60/7rKT6ldM5TmB4G/yUz/6i
         SAxLC8yEobWvH28J57lc6Wc+uUdeACfYIPC5AlBiSYwz4FaP2U+YsS2Hn+WJW88fR8l4
         EplNf15Gj+5G/3EiDEGBwNc7xFSWNlWSLaL3/LoSe8UulVMeOPZAaZ9v1DCEDbLZkIPZ
         3j56h9bsdzXIyq9XJJZSMIFlseIf+ZescA69z1gORaWGKDlnBQNaK7hlSPj5XrE7wfzQ
         O20/l68jy45Ypa/X94xB1N5PUosEIpoi07Hhj4xkAWGeUbOvwQd/LC4JvkA+c1oTqaQU
         wHxA==
X-Gm-Message-State: AOJu0YxWdEsiyjPexwO90HXCOzKgtd1zgbFqVDiFKwUenTZttuzbloCM
	hcPbi3TzCYhPsTYW1pCNwn3Yn5b/+yuYgmsTBIGjOKVENjF5YLUnt/fg56fo8Exau1mpNOnkhcG
	ecLOlwXNDOJitSc0ecvMkxj0ZXLU=
X-Google-Smtp-Source: AGHT+IGRT9198aR/d2ZqmRpfppk/I3yk981Bn//XaWQjyeXjL2etuPuwk3lhfiJXxThW5m/dveP5RY02UtwjyoeDlMw=
X-Received: by 2002:a2e:9d8e:0:b0:2ec:3f79:dcd5 with SMTP id
 38308e7fff4ca-2eeb46d031fmr3749001fa.18.1720510667745; Tue, 09 Jul 2024
 00:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240709073158.1037728-1-changqing.li@windriver.com>
In-Reply-To: <20240709073158.1037728-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jul 2024 09:37:36 +0200
Message-ID: <CANNYZj-29_xM5FOM9WGFg-z3cEjg=uge=Aa5xiYgqRSFrAci_A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] vulkan-samples: fix
 do_compile error when -Og enabled
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ef47f061ccb9b69"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 07:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201646

--0000000000002ef47f061ccb9b69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We haven=E2=80=99t updated Vulkan-samples in a while, can you check if the =
issue
still occurs on the latest revision?

Patches like this are difficult to remove, once added because one is
expected to =E2=80=98prove=E2=80=99 they=E2=80=99re not needed, so I=E2=80=
=99d rather update.

Alex

On Tue 9. Jul 2024 at 9.32, Changqing Li via lists.openembedded.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> When debug build is enabled(-Og is used), vulkan-samples do_compile
> failed with error:
> In function 'ZSTD_compressBlock_lazy_generic',
>     inlined from 'ZSTD_compressBlock_greedy' at
> TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21914:12:
> TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21551:30:
> error: inlining failed in call to 'always_inline'
> 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
>  | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21736:32:
> note: called from here
> |             size_t const ml2 =3D searchMax(ms, ip, iend, &offsetFound);
>
> Refer [1], always_inline is not suggested to use with indirect function
> call, replace always_inline with inline to fix the issue
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52 +++++++++++++++++++
>  .../vulkan/vulkan-samples_git.bb              |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644
> meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INL=
INE_TEMPLATE-with-inline.patch
>
> diff --git
> a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_I=
NLINE_TEMPLATE-with-inline.patch
> b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_I=
NLINE_TEMPLATE-with-inline.patch
> new file mode 100644
> index 0000000000..22538d4119
> --- /dev/null
> +++
> b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_I=
NLINE_TEMPLATE-with-inline.patch
> @@ -0,0 +1,52 @@
> +From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 9 Jul 2024 04:29:11 +0000
> +Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE with inline
> +
> +Refer [1], always-inline is not suggested to be used if you have indirec=
t
> ++calls. so replace FORCE_INLINE_TEMPLATE with inline to fix error:
> +In function 'ZSTD_compressBlock_lazy_generic',
> +    inlined from 'ZSTD_compressBlock_greedy' at
> TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_par=
ty/ktx/lib/basisu/zstd/zstd.c:21914:12:
> +TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_pa=
rty/ktx/lib/basisu/zstd/zstd.c:21551:30:
> error: inlining failed in call to 'always_inline'
> 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
> + | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
> +      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_pa=
rty/ktx/lib/basisu/zstd/zstd.c:21736:32:
> note: called from here
> +|             size_t const ml2 =3D searchMax(ms, ip, iend, &offsetFound)=
;
> +
> +Upstream-Status: Inappropriate [ Latest upstream ktx don't have this par=
t
> code ]
> +
> +Has report this issue to upstream Vulkan-Samples, refer [2]
> +
> +[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931
> +[2] https://github.com/KhronosGroup/Vulkan-Samples/issues/1089
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + lib/basisu/zstd/zstd.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/basisu/zstd/zstd.c b/lib/basisu/zstd/zstd.c
> +index eaf13738..423f149e 100644
> +--- a/lib/basisu/zstd/zstd.c
> ++++ b/lib/basisu/zstd/zstd.c
> +@@ -21548,7 +21548,7 @@ size_t ZSTD_HcFindBestMatch_generic (
> + }
> +
> +
> +-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
> ++static inline size_t ZSTD_HcFindBestMatch_selectMLS (
> +                         ZSTD_matchState_t* ms,
> +                         const BYTE* ip, const BYTE* const iLimit,
> +                         size_t* offsetPtr)
> +@@ -21596,7 +21596,7 @@ static size_t
> ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS (
> + }
> +
> +
> +-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
> ++static inline size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
> +                         ZSTD_matchState_t* ms,
> +                         const BYTE* ip, const BYTE* const iLimit,
> +                         size_t* offsetPtr)
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> index d60c0f3190..4e688e44a7 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -10,6 +10,7 @@ SRC_URI =3D "gitsm://
> github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmain;protoc
>
> file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=3Dthi=
rd_party/spdlog
> \
>
> file://0001-Deprecate-u8string_view.patch;patchdir=3Dthird_party/spdlog \
>             file://32bit.patch \
> +
>  file://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;patch=
dir=3Dthird_party/ktx
> \
>             "
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201645):
> https://lists.openembedded.org/g/openembedded-core/message/201645
> Mute This Topic: https://lists.openembedded.org/mt/107118822/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002ef47f061ccb9b69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We haven=E2=80=99t updated Vulkan-samples in a while, can=
 you check if the issue still occurs on the latest revision?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Patches like this are difficult to re=
move, once added because one is expected to =E2=80=98prove=E2=80=99 they=E2=
=80=99re not needed, so I=E2=80=99d rather update.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Jul 2024 at 9.32, Changqing L=
i via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;<a href=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"mailto:wi=
ndriver.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)">From: Changqing Li &lt;<a href=3D"ma=
ilto:changqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.c=
om</a>&gt;<br>
<br>
When debug build is enabled(-Og is used), vulkan-samples do_compile<br>
failed with error:<br>
In function &#39;ZSTD_compressBlock_lazy_generic&#39;,<br>
=C2=A0 =C2=A0 inlined from &#39;ZSTD_compressBlock_greedy&#39; at TOPDIR/tm=
p-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/=
basisu/zstd/zstd.c:21914:12:<br>
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party=
/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to &#3=
9;always_inline&#39; &#39;ZSTD_HcFindBestMatch_selectMLS&#39;: function not=
 considered for inlining<br>
=C2=A0| FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~<br>
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party=
/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t const ml2 =3D searc=
hMax(ms, ip, iend, &amp;offsetFound);<br>
<br>
Refer [1], always_inline is not suggested to use with indirect function<br>
call, replace always_inline with inline to fix the issue<br>
<br>
[1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D107931</a><br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52 ++++++++++++++++++=
+<br>
=C2=A0.../vulkan/<a href=3D"http://vulkan-samples_git.bb" rel=3D"noreferrer=
" target=3D"_blank">vulkan-samples_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 53 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-z=
std.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch<br>
<br>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replac=
e-FORCE_INLINE_TEMPLATE-with-inline.patch b/meta/recipes-graphics/vulkan/vu=
lkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch<br=
>
new file mode 100644<br>
index 0000000000..22538d4119<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE=
_INLINE_TEMPLATE-with-inline.patch<br>
@@ -0,0 +1,52 @@<br>
+From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Tue, 9 Jul 2024 04:29:11 +0000<br>
+Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE with inline<br>
+<br>
+Refer [1], always-inline is not suggested to be used if you have indirect<=
br>
++calls. so replace FORCE_INLINE_TEMPLATE with inline to fix error:<br>
+In function &#39;ZSTD_compressBlock_lazy_generic&#39;,<br>
+=C2=A0 =C2=A0 inlined from &#39;ZSTD_compressBlock_greedy&#39; at TOPDIR/t=
mp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib=
/basisu/zstd/zstd.c:21914:12:<br>
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_part=
y/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to &#=
39;always_inline&#39; &#39;ZSTD_HcFindBestMatch_selectMLS&#39;: function no=
t considered for inlining<br>
+ | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~<br>
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_part=
y/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t const ml2 =3D sear=
chMax(ms, ip, iend, &amp;offsetFound);<br>
+<br>
+Upstream-Status: Inappropriate [ Latest upstream ktx don&#39;t have this p=
art code ]<br>
+<br>
+Has report this issue to upstream Vulkan-Samples, refer [2]<br>
+<br>
+[1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D107931</a><br>
+[2] <a href=3D"https://github.com/KhronosGroup/Vulkan-Samples/issues/1089"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/KhronosGroup/Vulka=
n-Samples/issues/1089</a><br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ lib/basisu/zstd/zstd.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/basisu/zstd/zstd.c b/lib/basisu/zstd/zstd.c<br>
+index eaf13738..423f149e 100644<br>
+--- a/lib/basisu/zstd/zstd.c<br>
++++ b/lib/basisu/zstd/zstd.c<br>
+@@ -21548,7 +21548,7 @@ size_t ZSTD_HcFindBestMatch_generic (<br>
+ }<br>
+ <br>
+ <br>
+-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (<br>
++static inline size_t ZSTD_HcFindBestMatch_selectMLS (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ZSTD_matchState_t* ms,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const BYTE* ip, const BYTE* const iLimit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t* offsetPtr)<br>
+@@ -21596,7 +21596,7 @@ static size_t ZSTD_HcFindBestMatch_dedicatedDictSe=
arch_selectMLS (<br>
+ }<br>
+ <br>
+ <br>
+-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_extDict_selectMLS (<br>
++static inline size_t ZSTD_HcFindBestMatch_extDict_selectMLS (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ZSTD_matchState_t* ms,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const BYTE* ip, const BYTE* const iLimit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t* offsetPtr)<br>
+-- <br>
+2.44.0<br>
+<br>
diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_=
git.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a> b/me=
ta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_git.bb" rel=3D"=
noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><br>
index d60c0f3190..4e688e44a7 100644<br>
--- a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><br>
+++ b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-samples_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">vulkan-samples_git.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/Kh=
ronosGroup/Vulkan-Samples.git;branch=3Dmain;protoc" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/KhronosGroup/Vulkan-Samples.git;branch=3Dmain;prot=
oc</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-use-LFS64-func=
tions-on-linux-musl.patch;patchdir=3Dthird_party/spdlog \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Deprecate-u8string_vi=
ew.patch;patchdir=3Dthird_party/spdlog \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://32bit.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-zstd.c-replace-FORCE_=
INLINE_TEMPLATE-with-inline.patch;patchdir=3Dthird_party/ktx \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201645): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201645" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201645</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107118822/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107118822/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002ef47f061ccb9b69--

