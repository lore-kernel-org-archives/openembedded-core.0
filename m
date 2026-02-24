Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BCFEFB817
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:32:18 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15964.1771921929064086194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 00:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wsyZxNWR;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43770c94dfaso5131454f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 00:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771921927; x=1772526727; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4lsx654RiUhZHw+qDTj70bChVB730gWsAppFm/2r0g=;
        b=wsyZxNWRyIbh6qTSW3x61Dz9P2/zqKxgZfr71ko7KaoiKmRP712WJfguVZ0xnLDJGJ
         cTZceZ/Jbxsas9vu071yawwBgBNCrEYpvWDXvzniGSrfQoKiHuZXBOfLQxsBLEtGtU5m
         aNACug743HFAhhn/IaA9qTikOfV/V8apJ2OW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771921927; x=1772526727;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4lsx654RiUhZHw+qDTj70bChVB730gWsAppFm/2r0g=;
        b=oDssy5XuIoViLhiIwfBSIuzoLyX56I0UZGWbxxGc7RyoLGNAXUn8lIVdOqew4SEuOi
         mQ7q79f9tb7YqU0sTFjHZV1QdQ94oQf+Yx9Q1nrUqcuhFB2/T2KxGlEuVJQdLMH6D6GY
         CfztV9KLuKADDjoYMS1PNHady1STtr7IS+xxaG4RADCzifDxVDI9YjMAMYdd3DUpazhg
         v9gq2lcN77HkGCCCFtmOgw60rL3y/ekwrgjqdPWcn3+lsg/euh21qZBtOp9HTqDiQMS7
         Ppt875grbv21LYbq/2F0F1IHd92FzPFH4+XEFwVs2XwAgjNaSPt2UsVEZfqfkVPJq9ku
         /TeA==
X-Forwarded-Encrypted: i=1; AJvYcCWsUKsNuQR2UrKht9eQ+OnvCjsVuPcRbwOc8ysbJxsGD9f0KVWfECduZ4yx3o9G2IpQ/VB5yZJO+RQDzvqaibt0uA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywe+OEJLYOfvtG/UmxHgk77s7FcpvtBVPEfdXfKHCpUSG2OY8Lp
	fPtGXR8FRP9zWgV1tRt2mw6bhnxnbvFvTousINH0Pg5JAtjqhIdWWOaU3zpvvCN/MoYfVM3hpBA
	bshiG
X-Gm-Gg: ATEYQzwC9znyty8agacwuwVsRk/Yne4ZPSSVbnoiol4sBChKdqC/O0MwIVCVT+ueFb2
	K87Zsx81d1Wq+cqvwn7h2co1rQuUWRK7JnY+Ttd54cDfs7tBcwc2K+z5AZU/pFc7MTimhDRLjae
	0N0215vmqZCH4zK7NQRtgcneAszOuputHufjQnSTMNB3mI3cqSo5/gSfCDxHNASDObwNWSFbcNh
	vlb9j/k8LZ78uYPzZUplD7hVY+W3A0cNEheCyED8gX6qQwSTu3UleEvBG04k+eG9v/O1t7JRKtg
	/xvAkY1Ho4NMF64X4LxZTNNFXQgWYts/lje/n8sgPwIACsBntyp/rjFsNR7aj2qGniDusiiib3F
	DwNFE8ErWamA0+M/nl0twaV76AsVWZ09d9wTxHXIJCT5GhmKmd+TyUuhfu8vNlL2kkrTqcU0mYu
	6awiTQYXtuhTh058XKbQ+KMdACb8Ll56zN2qDqKBwX7drtcC/wkSWAK/YxcpfYOxnVYdAyL1XjC
	z/n4uJYOWE=
X-Received: by 2002:a05:6000:200e:b0:439:6f10:fc19 with SMTP id ffacd0b85a97d-4396f18a3bbmr20718145f8f.55.1771921927230;
        Tue, 24 Feb 2026 00:32:07 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00db8sm24491444f8f.12.2026.02.24.00.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:32:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:32:06 +0100
Message-Id: <DGN1WFB3YFYQ.3KW1WPXOKD2SO@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260217130823.393314-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260217130823.393314-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231747

On Tue Feb 17, 2026 at 2:08 PM CET, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_24.0.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..a30475319c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From 2a89ce91220e50c1b667bd9d5075e1fd10c1fed2 Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpat=
h
> +
> +Use os.path.commonpath() instead of commonprefix()
> +
> +CVE: CVE-2026-1703
> +
> +Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4=
faa9594e05d02ca05a413a2a4e7735]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + news/+1ee322a1.bugfix.rst            | 1 +
> + src/pip/_internal/utils/unpacking.py | 2 +-
> + tests/unit/test_utils_unpacking.py   | 2 ++

Hello,

Looks like this patch does not apply:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/68/builds/3314/st=
eps/13/logs/stdio:
  ERROR: python3-pip-native-24.0-r0 do_patch: Applying patch 'CVE-2026-1703=
.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-64/build/b=
uild/tmp/work/x86_64-linux/python3-pip-native/24.0/pip-24.0'
  CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-64/build/bu=
ild/tmp/work/x86_64-linux/python3-pip-native/24.0/recipe-sysroot-native/etc=
/quiltrc push', 0, "stdout: Applying patch CVE-2026-1703.patch
  patching file news/+1ee322a1.bugfix.rst
  patching file src/pip/_internal/utils/unpacking.py
  can't find file to patch at input line 44
  Perhaps you used the wrong -p or --strip option?
  The text leading up to this was:
  --------------------------
  |diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
  |index 1f0b59dbd..724ca0be8 100644
  |--- a/tests/unit/test_utils_unpacking.py
  |+++ b/tests/unit/test_utils_unpacking.py
  --------------------------
  No file to patch.  Skipping patch.
  1 out of 1 hunk ignored
  Patch CVE-2026-1703.patch does not apply (enforce with -f)
  stderr: ")

Can you check please?

Thanks!

> + 3 files changed, 4 insertions(+), 1 deletion(-)
> + create mode 100644 news/+1ee322a1.bugfix.rst
> +
> +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
> +new file mode 100644
> +index 000000000..edb1b320c
> +--- /dev/null
> ++++ b/news/+1ee322a1.bugfix.rst
> +@@ -0,0 +1 @@
> ++Use a path-segment prefix comparison, not char-by-char.
> +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/ut=
ils/unpacking.py
> +index 78b5c13ce..0b26525fb 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -=
> bool:
> +     abs_directory =3D os.path.abspath(directory)
> +     abs_target =3D os.path.abspath(target)
> +=20
> +-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
> ++    prefix =3D os.path.commonpath([abs_directory, abs_target])
> +     return prefix =3D=3D abs_directory
> +=20
> +=20
> +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
> +index 1f0b59dbd..724ca0be8 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: Tuple[str, str], expected: bool) -> =
None:
> +--=20
> +2.44.4
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/reci=
pes-devtools/python/python3-pip_24.0.bb
> index be4a29500a..35428260c3 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
> =20
>  inherit pypi python_setuptools_build_meta
> =20
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \
> +            "
> =20
>  SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b30=
1b718fe6f593aba2"
> =20


--=20
Yoann Congal
Smile ECS


