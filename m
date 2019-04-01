Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id C75327CFFD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:32:27 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id v10so8284251iom.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EBuSFHJ9rwnC1+JjBSRFHwMb5NgorfOwh0qBkGN2PNM=;
	b=Mk6mJoa+YVeARYbaK70yJxuwSj6O1MSCGc542bEQ95pdvkMuHH3TJ9MCMb7A0gcxFm
	f3pa8pQYw54OhLqz3DHx1uWQDFMACP23adY0wblld1QNUNGS/olbvnySVjHUKXElw/nW
	3cfdUkOEXwbA/RmYGix5d0xNoWlI9C9V1aFJnseHO796LSvFQI1QgGY90ak9Jv1sy+TD
	Tm31XES0hvHff2bm7nue0/orpKQ/OYPldvJfrmRGAcoZM3ARca8vogIwLIUjZ1a/O1hE
	LcuvDBrBUZd5s9wKFVIlK4+4fXlkUv2DjwM4KknjyAgrwKC4OrfcAkdW/vtyCUqTiyd0
	4kJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EBuSFHJ9rwnC1+JjBSRFHwMb5NgorfOwh0qBkGN2PNM=;
	b=st+fZbTf4oKm/atcdfVGV0FZtnzcVv4JtJBcBmSgZCfO/OKTaE43b2W73fyuWO2wqx
	c3a7pCVLtwQEz9at40PaPFQvcczOF8jg9Ip3govzoP61PWVIF0BpIZktflxbbbQYE8Nd
	nn5mW2EE44RKxj56a2BrX/QoOEVDktcahEpLOcZ/0tlZErnBp0emhNsghiHO3mRqjTaf
	lbuXUzF2Ix/r6wG8u4YiWf7EY5zEF973uDnDOt2u55eV0dkX6I7Ud9lttMQzRc0kWHy1
	UlIwKhVNeiZrfHHYsExNcFED3at4CCyuyhuvC9eXrif594UFLTFV3zYhLZFvV+2lyAgn
	BqtA==
X-Gm-Message-State: APjAAAW73d66rJVWKSFbGYFAubUreSsP58obGN+MTmQ681QsZAPUuDCx
	HztaMr9CArMs5NDXPlXmOVTMNCQGR1+8cyLE2LRkYw==
X-Google-Smtp-Source: APXvYqwjFlgdHo3cgMexq9Hka2CCL0t/tn5+hozc8gocxBanhvcIaj4NoEuxiZ27tGpUmj3+lezA8jhNnruS/vWIZNY=
X-Received: by 2002:a6b:7112:: with SMTP id q18mr44796839iog.5.1554136348819; 
	Mon, 01 Apr 2019 09:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190328011405.13868-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190328011405.13868-1-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 17:32:16 +0100
Message-ID: <CAJTo0LachdBNVnDHErMt3JM26LU-9enzKteKpo_bAPMdsZTP0g@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils:upgrade 8.30 -> 8.31
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
X-List-Received-Date: Mon, 01 Apr 2019 16:32:27 -0000
Content-Type: text/plain; charset="UTF-8"

Breaks with musl:

| /data/poky-tmp/musl/work/corei7-64-poky-linux-musl/coreutils/8.31-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/8.3.0/ld:
lib/libcoreutils.a(strtold.o):/usr/src/debug/coreutils/8.31-r0/build/../coreutils-8.31/lib/strtod.c:305:
multiple definition of `minus_zero';
lib/libcoreutils.a(strtod.o):/usr/src/debug/coreutils/8.31-r0/build/../coreutils-8.31/lib/strtod.c:305:
first defined here

Ross

On Thu, 28 Mar 2019 at 01:14, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Upgrade from coreutils_8.30.bb to coreutils_8.31.bb
> Change the md5 of file://src/ls.c beacuse of the date change in the file
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../coreutils/{coreutils_8.30.bb => coreutils_8.31.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/coreutils/{coreutils_8.30.bb => coreutils_8.31.bb} (95%)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> similarity index 95%
> rename from meta/recipes-core/coreutils/coreutils_8.30.bb
> rename to meta/recipes-core/coreutils/coreutils_8.31.bb
> index 8f4ee55712..d171ec93a9 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.30.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
>  BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>  LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                    file://src/ls.c;beginline=1;endline=15;md5=dbe356a88b09c29232b083d1ff8ac82a"
> +                    file://src/ls.c;beginline=1;endline=15;md5=c456f9896277a0543e3866777ccc0255"
>  DEPENDS = "gmp libcap"
>  DEPENDS_class-native = ""
>
> @@ -20,8 +20,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>            "
>
> -SRC_URI[md5sum] = "ab06d68949758971fe744db66b572816"
> -SRC_URI[sha256sum] = "e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"
> +SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
> +SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
>
>  EXTRA_OECONF_class-native = "--without-gmp"
>  EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

