Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5682278F5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:02:34 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e19-v6so18364322qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dVIokNaLCz68Vm1d2nSMZXExyWwJYPJsD/WJivWtbsc=;
	b=eBDHR10MN+GKfnK5LDSp9B4ULRo8Gwd1nPnhnfkjJ+9ASVjcQmwotUwe8DWpEldbZ9
	TM4TIc6SZTaGoIsAG+BF6/sarNXM/luKDUSitAfFVrwEipYiQrB2CNTGHH+jn4NJnMXv
	JtRcmPmtdSXf5e0HBy7xGV1PXnYuFzstU2o789UooHPF8+FxWcom+7Yc+TlzYDnZkuoa
	hPWNn/9zEsfHjWOODtYTg9NhTYaHval8kFOjZlBkx5rLU6NV8MGaGb46Ibhk5qM7YwG7
	4V55ydHdnBIS4ZFD9dYZoN+k8mW3c+GF+vNoChdMwuTIx9wIyECJKv7w56ajV4bYrHl1
	VjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dVIokNaLCz68Vm1d2nSMZXExyWwJYPJsD/WJivWtbsc=;
	b=nwH2Q9A0z2owsJIlsQct+1nB10lwZWfrrLL8xYMyyMmIokyNAen22MrwjXaw1dF6WD
	yr1EbpaDxIqNtBn6FVeWn1QfErO246qMlN3xx3iwdpmoj9IjLw65Q1mg1rC/Jn7YmXs1
	QSGr6wMl7IRtUlqoqDocOEkRaxBwlqPp+KmQNx6QXzFvA1nCk4kq7gNM62aLQQg5wT4E
	DuC9ZcemtZJOVt33Bg+ixNSghV4xfPd3qAPWFsl2EKvLI8xHvGxgcEpkatJqL8Ou3H7u
	Y/kRj69Ke9Ea73DgoYruTYfDRowiCsmt9euxYwGQfZn/2rN76FhGZaTnDJ0ESRvID7rM
	Eryw==
X-Gm-Message-State: AOUpUlHY/kWyN15FK9xv4kyVxqJgjibagAEn1+q2MfJNTTN1dvg3rkn/
	NI2o1uc2cWMyAYXvO3UXZZgZ66ouJmPrX/Ecxow=
X-Google-Smtp-Source: AA+uWPyJKEGjGdGIG9ODZsArQRUAkRHg1fxPQE055cIJ4POFGSZx0cD/UtSD7tA8fprDDNme0cubANj34YzL19njKvU=
X-Received: by 2002:a0c:e0c8:: with SMTP id
	x8-v6mr16249456qvk.74.1534183354894; 
	Mon, 13 Aug 2018 11:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
	<20180813142835.5309-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180813142835.5309-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 11:02:07 -0700
Message-ID: <CAMKF1sqa1UGPUXpiMjb8D_9RPVRKCgQqKGMqC2mBfVeH0tD9dQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] xf86-video-intel: Fix for glibc
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
X-List-Received-Date: Mon, 13 Aug 2018 18:02:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 13, 2018 at 7:29 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> It fails to build wi9th glibc 2.28, add the missing required header inclusion.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../xorg-driver/xf86-video-intel/glibc.patch  | 25 +++++++++++++++++++
>  .../xorg-driver/xf86-video-intel_git.bb       |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
> new file mode 100644
> index 00000000000..ada9eb5e52c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/glibc.patch
> @@ -0,0 +1,25 @@
> +Add a missing include needed for glibc 2.28 to avoid:
> +
> +| ../../git/tools/backlight_helper.c: In function 'main':
> +| ../../git/tools/backlight_helper.c:54:34: error: implicit declaration of function 'major' [-Werror=implicit-function-declaration]
> +|   if (fd < 0 || fstat(fd, &st) || major(st.st_dev))
> +|                                   ^~~~~
> +| ../../git/tools/backlight_helper.c:54:34: warning: nested extern declaration of 'major' [-Wnested-externs]
> +| cc1: some warnings being treated as errors
> +| Makefile:666: recipe for target 'backlight_helper.o' failed
> +
> +Upstream-Status: Pending
> +RP 2018/8/12
> +
> +Index: git/tools/backlight_helper.c
> +===================================================================
> +--- git.orig/tools/backlight_helper.c
> ++++ git/tools/backlight_helper.c
> +@@ -8,6 +8,7 @@
> +
> + #include <sys/types.h>
> + #include <sys/stat.h>
> ++#include <sys/sysmacros.h>

for OE this is perfectly fine, however, I think if we checked for this
header in configure.ac with AC_CHECK_HEADERS and then did a
conditional include e..g

#ifdef HAVE_SYS_SYSMACROS_H
#include <sys/sysmacros.h>
#endif

will make it upstream-able since this header is relatively new in glibc

> +
> + #if MAJOR_IN_MKDEV
> + #include <sys/mkdev.h>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> index 5cc4eefc785..655fd4dc692 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> @@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
>
>  SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
>             file://0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch \
> +           file://glibc.patch \
>             "
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

