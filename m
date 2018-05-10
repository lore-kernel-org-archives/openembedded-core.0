Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40054751AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 13:01:49 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e12-v6so2873669iob.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LmKjIgJU/tUGL+wQJNsdcrRo8ZhuuYZykHU6lmCnqys=;
	b=yieow5gEAHpzJXxssSZhyzXNgcUulGQ1rAvxQpnMqKsKdtm4qef732exAsrh1/1osf
	f1wIanKPNiWQ4aRQt7h+Iet8xqPfS1/zuUeaJuFPU5wzJ524352tI1qUhqJjqnbeEsKQ
	IlBSnotMNNu4UGRYetzKN0qD/faCgOeZZkVW7rRNPRTj7gD5Xl05RJXw4QX/Gg3MpoDt
	6GGGC3IisE7M1S3Nj94UduUBPR7ULejkXkwcDwHLNxlwh2aa3MGgW+0AE6hviQWjuoos
	xSJLbFyL0sYUX1/jm6DymKyGXIRgJru7OpR4hy0ibgP94LAnOMK10ZDHGgfyaqAOZ8Pq
	8OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LmKjIgJU/tUGL+wQJNsdcrRo8ZhuuYZykHU6lmCnqys=;
	b=BeFSCwHwG3SS/HwBFRgSDY8oyRUmJoz1mk45BbhY9jHOHpKWtvWF6A7/LKLnkZ6p81
	ol3I6FYGAs9Iw4UuIDXjfr332K/fF9y/Z0DLBz/Fa5SszQI4SET9p+qtU4z6Ya/XOGLn
	cdrCVr5ltv8xIhUEfXtmkhTlxTj1MM6sEtI4C1irv7RjRDr60233k6ko6W25XipYbhmE
	J3fbIPsp9w1+dioMUPxFdSNMLG1x5eixahX7m9Wpcfj8Wtl9Fv2Vy3yEqewRDJv1fuof
	vodWPDKVbXeHuGfGPCKufixM3yYT9aFjSiJDY1xczN7RwWquOBmyd98aAmB0qb49/AvA
	kd4w==
X-Gm-Message-State: ALKqPweMWgv4Y/d98pnehdiJiChSmHjjrXR0DqioPxruEPlzttrXJknm
	1V7NeALkGFuqfjLv0iNSqGNFYNku058/NeF4sj9HNA==
X-Google-Smtp-Source: AB8JxZqHe/XWGmaQ+Ld/xBX6GxWOM+s8ERa8CTaaWGDsBd5PrTqq5p6rDhfiPCm53DijJN00zrrg5LaTs7iz3ZfSMOw=
X-Received: by 2002:a6b:b74b:: with SMTP id
	h72-v6mr1309523iof.201.1525957310290; 
	Thu, 10 May 2018 06:01:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 10 May 2018 06:01:29 -0700 (PDT)
In-Reply-To: <20180510122036.15212-1-Martin.Jansa@gmail.com>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 May 2018 14:01:29 +0100
Message-ID: <CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc
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
X-List-Received-Date: Thu, 10 May 2018 13:01:50 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build here:

 coreutils/lib.a(mktemp.o): In function `mktemp_main':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/coreutils/mktemp.c:105:
warning: the use of `mktemp' is dangerous, better use `mkstemp' or
`mkdtemp'
| util-linux/lib.a(mount.o): In function `xdr_fhstatus':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1057:
undefined reference to `xdr_u_int'
| util-linux/lib.a(mount.o): In function `xdr_fhandle':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1052:
undefined reference to `xdr_opaque'
| util-linux/lib.a(mount.o): In function `xdr_mountstat3':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1089:
undefined reference to `xdr_enum'
| util-linux/lib.a(mount.o): In function `xdr_fhandle3':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1071:
undefined reference to `xdr_bytes'
| util-linux/lib.a(mount.o): In function `xdr_mountres3_ok':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1080:
undefined reference to `xdr_int'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1080:
undefined reference to `xdr_array'
| util-linux/lib.a(mount.o): In function `xdr_dirpath':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1066:
undefined reference to `xdr_string'
| util-linux/lib.a(mount.o): In function `get_mountport':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1145:
undefined reference to `pmap_getmaps'
| util-linux/lib.a(mount.o): In function `nfsmount':
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1662:
undefined reference to `clnttcp_create'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1677:
undefined reference to `authunix_create_default'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1652:
undefined reference to `clntudp_create'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1672:
undefined reference to `clnt_spcreateerror'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1702:
undefined reference to `clnt_sperror'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1707:
undefined reference to `clnt_sperror'
| /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:1788:
undefined reference to `pmap_getport'

Ross

On 10 May 2018 at 13:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> * We dropped in-tree obsoleted rpc from glibc and now busybox builds
>   which had CONFIG_FEATURE_MOUNT_NFS enabled were failing with:
>   | util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or directory
>   |  # include <rpc/rpc.h>
>   |            ^~~~~~~~~~~
>   | compilation terminated.
>   | make[1]: *** [util-linux/mount.o] Error 1
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox.inc       | 6 +++---
>  meta/recipes-core/busybox/busybox/defconfig | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index d1675c37aa..2db19ed317 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -3,7 +3,7 @@ DESCRIPTION = "BusyBox combines tiny versions of many common UNIX utilities into
>  HOMEPAGE = "http://www.busybox.net"
>  BUGTRACKER = "https://bugs.busybox.net/"
>
> -DEPENDS += "kern-tools-native"
> +DEPENDS += "kern-tools-native libtirpc"
>
>  # bzip2 applet in busybox is based on lightly-modified bzip2 source
>  # the GPL is version 2 only
> @@ -15,8 +15,8 @@ SECTION = "base"
>  # Whether to split the suid apps into a seperate binary
>  BUSYBOX_SPLIT_SUID ?= "1"
>
> -export EXTRA_CFLAGS = "${CFLAGS}"
> -export EXTRA_LDFLAGS = "${LDFLAGS}"
> +export EXTRA_CFLAGS = "${CFLAGS} -I${STAGING_INCDIR}/tirpc"
> +export EXTRA_LDFLAGS = "${LDFLAGS} -ltirpc"
>
>  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index fbb5fd852c..816555fc21 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -638,7 +638,7 @@ CONFIG_MOUNT=y
>  # CONFIG_FEATURE_MOUNT_VERBOSE is not set
>  # CONFIG_FEATURE_MOUNT_HELPERS is not set
>  # CONFIG_FEATURE_MOUNT_LABEL is not set
> -# CONFIG_FEATURE_MOUNT_NFS is not set
> +CONFIG_FEATURE_MOUNT_NFS=y
>  # CONFIG_FEATURE_MOUNT_CIFS is not set
>  CONFIG_FEATURE_MOUNT_FLAGS=y
>  CONFIG_FEATURE_MOUNT_FSTAB=y
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

