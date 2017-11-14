Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD1F78544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 22:48:42 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u3so1348065pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQwz+8O6aJSW7mhCUiqqDJ353Of+7U6Atoc0OBGJ6Lo=;
	b=YzUYxDXrTn7qiy8bcpRC67wlD99sVUk5qhGEe8HWc8AQI52o6mf7QKh7UzKwgqOGsV
	2AWWD09leGh73W+wYDUKGgRgp+XPSbJGQRN6hPFel8R4lF58Iq5ClSq0X50HnOA6URBo
	/BTAPGB9i9WTdj2Au3c4y+pl/T62rGQpsDNKKNd5DKMKfiX/8jkQDWu3wspb54ISOVJd
	sfHAei+5HKjprRjC84bAIWotdVxRpwymb+a2LF/MDWQJeNGJeImVManlxJ9Vusg02Vc4
	DFnrPYzpHhEddbYyMHWiR/INKfJnm+c+eeBT91pRDu0IqCy3lHqCdJ0MmAYeEqykaKwU
	4e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQwz+8O6aJSW7mhCUiqqDJ353Of+7U6Atoc0OBGJ6Lo=;
	b=cjbvzEpE1ePYLjxcv7sTlj/WsiizbX882mfe8EFJ9ApeRgzRlJp64My3toly7CvEZX
	S60NDeVEwwscJn9wLwSRvSPhTFm/6RxZrZUd6nTmkWDHPUfElq7yYsWJKcz+XKIcs1hx
	XbsJg7fUy2xBiJahUJPFJcyNge70t2o/1Hb1r4u+4VRgTOzjJhsQzk2XShqdc9Vz0B/D
	aUZ4XaS3Cxm42pT7Rv0yhOyyEdvT5bvbbcNt2FybU5Q3zGXx0HfP5GgQ97ZMAUV7CDN0
	rFfNnJaRp6xfA8u5jQa4WErPjTdN9Mq3dRlbquFuhy537AvgcktnfELbS7cpU0j/m4vj
	xHyw==
X-Gm-Message-State: AJaThX7mzL2SUs6DVmZdnYxfl22SY3ceQOp0y71PDRe71dQ7dxvVty1a
	xloccSpGU/+RuMByHvaGDTh/4nmRLgP9vxE767U=
X-Google-Smtp-Source: AGs4zMYIjQ0Irqoh5lv5H3YK9vAriUktET/R2p1PtNt3wkDsvaYK3DBLDyi3BE2pSasNJSLfPWj1vAP9M1TMcZY83OM=
X-Received: by 10.101.74.129 with SMTP id b1mr13727891pgu.341.1510699723414;
	Tue, 14 Nov 2017 14:48:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Tue, 14 Nov 2017 14:48:12 -0800 (PST)
In-Reply-To: <1510294213-1343-1-git-send-email-armccurdy@gmail.com>
References: <1510294213-1343-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2017 14:48:12 -0800
Message-ID: <CAMKF1spjzuTvL9cK8WKJRandgQKSjyUkZKKnBtXoHrWg6aOq5g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc6: enable FL_LPAE flag for armv7ve cores
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
X-List-Received-Date: Tue, 14 Nov 2017 22:48:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 9, 2017 at 10:10 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The following commit added the FL_LPAE flag to FL_FOR_ARCH7VE, but
> neglected to also add it to the armv7ve compatible cores defined in
> arm-cores.def.
>
>   https://github.com/gcc-mirror/gcc/commit/af2d9b9e58e8be576c53d94f30c48c68146b0c98
>
> The result is that gcc 6.4 now refuses to allow -march=armv7ve and
> -mcpu=XXX to be used together, even when -mcpu is set to an armv7ve
> compatible core:
>
>   arm-linux-gnueabi-gcc -march=armv7ve -mcpu=cortex-a7 -Werror ...
>   error: switch -mcpu=cortex-a7 conflicts with -march=armv7ve switch [-Werror]
>
> Fix by defining flags for armv7ve compatible cores directly from
> FL_FOR_ARCH7VE, rather than re-creating the armv7ve flags
> independently by combining FL_FOR_ARCH7A with the armv7ve specific
> FL_THUMB_DIV and FL_ARM_DIV flags.
>

this looks good. I will give it a try out.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
>  ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch | 67 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
> index a42b7d8..942b39f 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.4.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
> @@ -80,6 +80,7 @@ SRC_URI = "\
>  "
>  BACKPORTS = "\
>             file://CVE-2016-6131.patch \
> +           file://0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch \
>  "
>  SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
>  SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
> new file mode 100644
> index 0000000..9ee029c
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
> @@ -0,0 +1,67 @@
> +From 22fcc126fad61a8e9ddaaabbc8036644273642dc Mon Sep 17 00:00:00 2001
> +From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 9 Nov 2017 14:34:28 +0000
> +Subject: [PATCH] enable FL_LPAE flag for armv7ve cores
> +
> +The following commit added the FL_LPAE flag to FL_FOR_ARCH7VE, but
> +neglected to also add it to the armv7ve compatible cores defined in
> +arm-cores.def.
> +
> +  https://github.com/gcc-mirror/gcc/commit/af2d9b9e58e8be576c53d94f30c48c68146b0c98
> +
> +The result is that gcc 6.4 now refuses to allow -march=armv7ve and
> +-mcpu=XXX to be used together, even when -mcpu is set to an armv7ve
> +compatible core:
> +
> +  arm-linux-gnueabi-gcc -march=armv7ve -mcpu=cortex-a7 -Werror ...
> +  error: switch -mcpu=cortex-a7 conflicts with -march=armv7ve switch [-Werror]
> +
> +Fix by defining flags for armv7ve compatible cores directly from
> +FL_FOR_ARCH7VE, rather than re-creating the armv7ve flags
> +independently by combining FL_FOR_ARCH7A with the armv7ve specific
> +FL_THUMB_DIV and FL_ARM_DIV flags.
> +
> +Upstream-Status: Backport
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@254584 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + gcc/config/arm/arm-cores.def | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/gcc/config/arm/arm-cores.def b/gcc/config/arm/arm-cores.def
> +index 829b839..ca37e6f 100644
> +--- a/gcc/config/arm/arm-cores.def
> ++++ b/gcc/config/arm/arm-cores.def
> +@@ -145,12 +145,12 @@ ARM_CORE("cortex-m0plus.small-multiply",cortexm0plussmallmultiply, cortexm0plus,
> + /* V7 Architecture Processors */
> + ARM_CORE("generic-armv7-a",   genericv7a, genericv7a,         7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex)
> + ARM_CORE("cortex-a5",         cortexa5, cortexa5,             7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a5)
> +-ARM_CORE("cortex-a7",         cortexa7, cortexa7,             7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a7)
> ++ARM_CORE("cortex-a7",         cortexa7, cortexa7,             7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a7)
> + ARM_CORE("cortex-a8",         cortexa8, cortexa8,             7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a8)
> + ARM_CORE("cortex-a9",         cortexa9, cortexa9,             7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), cortex_a9)
> +-ARM_CORE("cortex-a12",                cortexa12, cortexa17,           7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
> +-ARM_CORE("cortex-a15",                cortexa15, cortexa15,           7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a15)
> +-ARM_CORE("cortex-a17",                cortexa17, cortexa17,           7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
> ++ARM_CORE("cortex-a12",                cortexa12, cortexa17,           7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
> ++ARM_CORE("cortex-a15",                cortexa15, cortexa15,           7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a15)
> ++ARM_CORE("cortex-a17",                cortexa17, cortexa17,           7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
> + ARM_CORE("cortex-r4",         cortexr4, cortexr4,             7R,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7R), cortex)
> + ARM_CORE("cortex-r4f",                cortexr4f, cortexr4f,           7R,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7R), cortex)
> + ARM_CORE("cortex-r5",         cortexr5, cortexr5,             7R,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_ARM_DIV | FL_FOR_ARCH7R), cortex)
> +@@ -162,8 +162,8 @@ ARM_CORE("cortex-m3",              cortexm3, cortexm3,             7M,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED |
> + ARM_CORE("marvell-pj4",               marvell_pj4, marvell_pj4,       7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7A), marvell_pj4)
> +
> + /* V7 big.LITTLE implementations */
> +-ARM_CORE("cortex-a15.cortex-a7", cortexa15cortexa7, cortexa7, 7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a15)
> +-ARM_CORE("cortex-a17.cortex-a7", cortexa17cortexa7, cortexa7, 7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV | FL_FOR_ARCH7A), cortex_a12)
> ++ARM_CORE("cortex-a15.cortex-a7", cortexa15cortexa7, cortexa7, 7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a15)
> ++ARM_CORE("cortex-a17.cortex-a7", cortexa17cortexa7, cortexa7, 7A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_FOR_ARCH7VE), cortex_a12)
> +
> + /* V8 Architecture Processors */
> + ARM_CORE("cortex-a32",        cortexa32, cortexa53,   8A,     ARM_FSET_MAKE_CPU1 (FL_LDSCHED | FL_CRC32 | FL_FOR_ARCH8A), cortex_a35)
> +--
> +1.9.1
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

