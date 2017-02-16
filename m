Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC3F77235
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:39:47 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id r136so1630954vke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q8UcPC8J3yVMM32+7NlIXbSG+eMmYVEC2gsEAoozhLE=;
	b=D0M3w62JpzK0l7md4w28ahLxTKD7xqlvm1TIWD4o0TAxZHp1+IKgC9fQXfChRdf/lP
	CNLGafIGBnP9+vhyQSMbApUmKi0Zze+bvV53C+WHZq0nJuP+rspdua1F4Jovekx+d1k+
	xbuhUbZbgxJjSqI3Wb3SFqZ/37PJI3S8ZIkuX44FCkMhK1mUoEqtgPPSM5VyS5UJU7+B
	w9JsoNOj1NwHLeQ5335fjpDF512qnL6EqPAnBr48zqFdJiGZWnGKEriQiGn9a/HFclzf
	S2WagEFeqD4CX+xR50bgQwvMRa50DFuxT8offUeVJuNtoJ5rxaogf00cwZT4Qx/+XHvW
	c7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q8UcPC8J3yVMM32+7NlIXbSG+eMmYVEC2gsEAoozhLE=;
	b=h1z2zAMLXceJc9PP2XAslLYhBqJoXGcakR4Q/x4Kjnb0zFp2Z+yyKg3xHWUqyu/cIs
	h5BaSp3lFR5CcQiHJ4OSftdTJ7LomPEmMSeNBLzZ3RTSZ5Y8XpmQAQWj6nX9UPoQuN2h
	Tkq2DdEPRkLPEnNzp4Ijkt/GVPXePttnd4K3sFEVOB2gFBp2WMHiL4v4SXABTrgQzsE+
	rKgXmiHpxBkq1LM/QS3LdjLjth5hXrVur+8Fj48hmLP4vWutK11STj5RJXN5PTwuMOEt
	azbYDqPP6W/bpv5V+DRIMFdAq8ZPyIaBedM7PZs87kY3Sle5uacxbRFIJkBZBSq+OXGg
	4uYw==
X-Gm-Message-State: AMke39nPRj1MoqFdf8oB7UZa6eDSEQobj0QJ/7I7pKYiy2+0tef6hTEYXDYyFSLp7lw7y9TRNcPuSeD8NE1r+w==
X-Received: by 10.31.197.196 with SMTP id v187mr1377314vkf.84.1487259588350;
	Thu, 16 Feb 2017 07:39:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 16 Feb 2017 07:39:17 -0800 (PST)
In-Reply-To: <1487241290-6188-3-git-send-email-obi@opendreambox.org>
References: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
	<1487241290-6188-3-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Feb 2017 07:39:17 -0800
Message-ID: <CAMKF1sqB+nL1kRny7e9JCfdYO7fkOEKQoqCngm09hgSURLeR=Q@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] ffmpeg: Build libpostproc even if global gpl flag is unset
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
X-List-Received-Date: Thu, 16 Feb 2017 15:39:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 16, 2017 at 2:34 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> The libpostproc package has an explicit GPLv2+ license tag.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  ...figure-allow-libpostproc-without-gpl-flag.patch | 34 ++++++++++++++++++++++
>  meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch
> new file mode 100644
> index 0000000..dc11f34
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-configure-allow-libpostproc-without-gpl-flag.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: inappropriate [distro-specific]
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +
> +From 9c28ed17d1184ee95819e4c576373c20fe2c3600 Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Sat, 11 Feb 2017 22:57:42 +0100
> +Subject: [PATCH] configure: allow libpostproc without gpl flag
> +
> +There may be GPL'ed programs in a distribution which want libpostproc,
> +while other GPL-incompatible programs use some of the other libraries
> +provided by ffmpeg.
> +
> +Since we know the license of libpostproc, we mark the resulting binary
> +package accordingly instead of refusing to build it.


this changes the documented behavior IMO we should discuss it upstream
otherwise it will be hard to explain this to legal people.

> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index d60ffd8..cd53e6c 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3135,7 +3135,7 @@ avdevice_deps="avformat avcodec avutil"
> + avfilter_deps="avutil"
> + avformat_deps="avcodec avutil"
> + avresample_deps="avutil"
> +-postproc_deps="avutil gpl"
> ++postproc_deps="avutil"
> + swresample_deps="avutil"
> + swscale_deps="avutil"
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> index dc33bb4..555c72b 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> @@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://mips64_cpu_detection.patch \
>             file://0001-avutil-log-avoid-build-error-if-valgrind-was-removed.patch \
> +           file://0002-configure-allow-libpostproc-without-gpl-flag.patch \
>            "
>  SRC_URI[md5sum] = "e34d1b92c5d844f2a3611c741a6dba18"
>  SRC_URI[sha256sum] = "3f01bd1fe1a17a277f8c84869e5d9192b4b978cb660872aa2b54c3cc8a2fedfc"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

