Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3B76A7F639
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 05:21:30 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id 38so2896139qtb.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 21:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bxdpOh7QX+XJuXLjnWmA9h0ofZLCHkCyI2RwCJREutU=;
	b=CB7u5tGpFLZZeQv5Rst3D8S94yTuPFdJhOStRstqYA3rkLfSMtVxYDVuSproTNWMa1
	2v7iQvLtp6q8DNl+jYQln+/FSvusYhU5Y3Gs34toLeXIwlqdTVhqY1bfDYAGQZkNjhxJ
	fN6Ec6Co/Eixn8n+Flph+yX3JeF7/7sib6HZUzCHhGcZC8KuGDooY+vVnfKjsd/urcIn
	Q7OVK/9r4j7R+arAYzIaf75251MCcutT482WSWGwrVdRbkk18D11I/EUwRECsLjlWks6
	PH3gA4ikDFtlppuR8pIikPbMG1Jr5/zbS+zcqL7CxdykTPESR4xUzi/YPcFOTGVax7Ak
	y7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bxdpOh7QX+XJuXLjnWmA9h0ofZLCHkCyI2RwCJREutU=;
	b=ABJVOqPLEQwPyBVxezWm1RzBADEUIdOt90Ncpa76XK1VNEmLLQuSLs5FCnQxw+wB+A
	WRXG0k9snU7WubXR7PcAFLVKicrRumyoIoIiPj6eNu8hV7MR0P7EDlUTuFhj7Rbpx9O+
	6pKtyTuR9947xzb4R53+dvOIzXEgGnsV/OIuQLOt+4k3wwM7W/SHF03gKuSgQfyiwo5n
	WK+O94fIGu97rr2W+8DaNm1icI2164Lf5/Dg3JIs7cbWfHQXRvJkP9OPMJfpkUnR15/n
	egusZjhkwGHPSV+LJEvCLPnz3t+xu265EpTEm1ITLJZP9Qe7n593CJsUBeuCK00sRvl0
	nuKg==
X-Gm-Message-State: APjAAAWu9RhDfr54DBiDQa9DtZc9XE9frxrb7Hc1VQp0W3rN7zIn6ETj
	uMx++DMvnMhReHdpezJgygc0YbdAm95EuijZoms=
X-Google-Smtp-Source: APXvYqzreF3gz9ccRpxtkyTFT0G0H0WPSqpOKv4+SOsYpgsA0dNX4ZuEcPy0xGFdd+kHvi8U5fxI/oG64Wf+sZLH9nU=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr18858154qtj.80.1576387290883; 
	Sat, 14 Dec 2019 21:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
In-Reply-To: <20191212181436.1322-7-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Dec 2019 21:21:04 -0800
Message-ID: <CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Sun, 15 Dec 2019 05:21:30 -0000
Content-Type: text/plain; charset="UTF-8"

this fails with python 3.7

https://errors.yoctoproject.org/Errors/Details/297314/

On Thu, Dec 12, 2019 at 10:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++++++++
>  .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> new file mode 100644
> index 00000000000..053108ad50b
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> @@ -0,0 +1,24 @@
> +From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 2 Dec 2019 18:16:41 +0100
> +Subject: [PATCH] meson.build: fix builds with python 3.8
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 1da81d5..3e0db38 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -24,7 +24,7 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
> +
> + pymod = import('python')
> + python = pymod.find_installation(get_option('python'))
> +-python_dep = python.dependency(required : true)
> ++python_dep = dependency('python3-embed', required : true)
> +
> + python_abi_flags = python.get_variable('ABIFLAGS', '')
> + pylib_loc = get_option('libpython-dir')
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> index b770ec060e1..0382360ec26 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
> @@ -5,7 +5,9 @@ SECTION = "multimedia"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
>
> -SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> +SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
> +           file://0001-meson.build-fix-builds-with-python-3.8.patch \
> +           "
>  SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
>  SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

