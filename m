Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id CC9227C615
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 15:59:00 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id y20so7313174qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 07:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AS8LJJTO/cnG0lWf0LOCygtx0R20Wvi0sTp/58FTikQ=;
	b=nieowa68jGsqyUMQCzNXWNzmCAEHVenJyMEAjvPDXtS5//oo//ji2/otReW8NG3hGu
	AIzIcpgc7neqAABX0HAsDVxtpJNEkV4Qd6wVXZNtgMytnt8urO/s+hrQMTKTOJNSLYlx
	F4t9JhnbxnugcDJgiheZsqlaH4CZR0DrTXlWAaU+PaT6iJf835qe4ZkuP7OxzZ9JaKlg
	XIoLG5bcEMn48s0djwbPiuN+KJITs1yTkGSKfX2/oulFayyX10cPLHJvw59mrPgi6U1y
	0mJtYsODbOH9kKxEpwG+AGK1KYTCBE2adqeGB853J+SRZL0t8S9XyrJiXQ3IklvUmsyj
	rAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AS8LJJTO/cnG0lWf0LOCygtx0R20Wvi0sTp/58FTikQ=;
	b=Flg3tI20RmnvpXOhgRw8urywtDznqIuCdE0p2J6bjKaISMVrAZNj7Q85p1RIwAkqvP
	+Whk2kekM5OAYIy8hmWiWQU2/YCMZr05tlYbt9ctH/2Nsn9Y2lS1uEP5eb5aDtFKSLop
	OOxEZXzMV2lsNskY0J+ckLk0s3jyQwyF6Mhtw2/RSt0UVP4Ikt74T7n7CowdWy8jOcag
	LCzRi/WrY0CuJhXUwiCryIfwKiIBSkQ9i3MQAdooa+Q2HMrvAXRfwBmRClgd0Plu90Ym
	bMxnrbzoDDBgK+JoQyY7793rsw5/HF8OScJzNx0UJ4FbpKO5egYxXLNBYzoAXHiUrZNm
	SoKQ==
X-Gm-Message-State: AHQUAuZslVODCNQ54aYDafPTBur6SydZvkLU8DkTEUxwgx0S1CsU0q45
	Yf0VQss3k0z6/rBj9ipSmbYMJJRt4/HwXu200SY=
X-Google-Smtp-Source: AHgI3IZ8shkjj3/RnXjmgjPix9Hijr6ebOTM3tTxvDfEp3W38DDh9UYP4X0U7gjRVd0a2b86P5nLuaWxG9ZCM/94Udg=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr3687083qtn.253.1550159941619; 
	Thu, 14 Feb 2019 07:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20190214054857.18876-1-anuj.mittal@intel.com>
	<20190214054857.18876-3-anuj.mittal@intel.com>
In-Reply-To: <20190214054857.18876-3-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Feb 2019 07:58:35 -0800
Message-ID: <CAMKF1sqiTB5-pPBQw8xSdg0h=_GTQ4MTtdqATM8_HvWJmWd+-Q@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] pixman: upgrade 0.34.0 -> 0.38.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 15:59:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 13, 2019 at 9:49 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> For changes, see:
>
> https://cgit.freedesktop.org/pixman/log/?qt=range&q=pixman-0.38.0...pixman-0.34.0
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../xorg-lib/pixman/asm_include.patch         | 29 -------------------
>  .../{pixman_0.34.0.bb => pixman_0.38.0.bb}    |  5 ++--
>  2 files changed, 2 insertions(+), 32 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
>  rename meta/recipes-graphics/xorg-lib/{pixman_0.34.0.bb => pixman_0.38.0.bb} (89%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch b/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
> deleted file mode 100644
> index b52a5707d6..0000000000
> --- a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fixes errors like
> -
> -Assembler messages:
> -Fatal error: can't create .libs/pixman-mips-dspr2-asm.o: No such file or directory
> -
> -it works with glibc because it uses gcc fixed-headers but thats not right.
> -
> -We move the include under C block
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -Index: pixman-0.32.6/pixman/pixman-private.h
> -===================================================================
> ---- pixman-0.32.6.orig/pixman/pixman-private.h
> -+++ pixman-0.32.6/pixman/pixman-private.h
> -@@ -1,4 +1,3 @@
> --#include <float.h>
> -
> - #ifndef PIXMAN_PRIVATE_H
> - #define PIXMAN_PRIVATE_H
> -@@ -17,6 +16,8 @@
> -
> - #ifndef __ASSEMBLER__
> -
> -+#include <float.h>
> -+
> - #ifndef PACKAGE
> - #  error config.h must be included before pixman-private.h
> - #endif
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
> rename to meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
> index c290fa4614..49c3d62342 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
> @@ -31,11 +31,10 @@ EXTRA_OECONF_class-nativesdk = "--disable-gtk"
>
>  SRC_URI += "\
>              file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
> -           file://asm_include.patch \

can you confirm you tested a build with musl/mips ?

>             file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
>  "
>
> -SRC_URI[md5sum] = "002a4fcb644ddfcb4b0e4191576a0d59"
> -SRC_URI[sha256sum] = "39ba3438f3d17c464b0cb8be006dacbca0ab5aee97ebde69fec7ecdbf85794a0"
> +SRC_URI[md5sum] = "04ecad28edcc14e7eb5f7ed6df29c7a0"
> +SRC_URI[sha256sum] = "b768e3f7895ddebdc0f07478729d9cec4fe0a9d2201f828c900d67b0e5b436a8"
>
>  REQUIRED_DISTRO_FEATURES = ""
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

