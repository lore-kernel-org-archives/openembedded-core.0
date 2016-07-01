Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BB3D66012C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:33:32 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so746696qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WsLOpUsbR0SqMBsUdKiBEs0TGgb1u4YTxbjQ/DP0L2k=;
	b=pCIs0V95KI/qhWnWBLs/cpOOei881lhL11a5rdiS/6ueVAlyBaTgBF4bx0oHi9bU3Y
	QxC+jUHIsSSffOyn9SpkS36xho0zE4/mvi76I8XaCbpmLf3OT6JcMF7a4kbG3rzx27oD
	+bw9efD9jR9WBycmnVEZYVPQPCIDsZ02xGv2/I3RgVFI7PPq4SEG4sPtzj3trZQgV1n5
	yCp/6jHCIVCP4Pe6HP/dqTLFCI6LavsSs2dPsONRjfwrOW/bdxgFt+nCSKKZ0P7Fvc1z
	3jLq4JzKuPNZmi0z4HxoEPclsEAGVxFinrOr2Hw301SDopSvfhBdQO6tO/OrzRsTFPdp
	LTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WsLOpUsbR0SqMBsUdKiBEs0TGgb1u4YTxbjQ/DP0L2k=;
	b=Y3q09jbrHlQbQs9fpMC9KO35sDKVljjodauKTXSxQQFl2Atjcwe8Lfx7mcfhzQGvcs
	xyXE/PTconywaTivvl2G3Tfv53rl11IdDRtYyqitUCAfY8bvTj7Oh2QhtBWikuHk/Lgu
	i4B+UNIn22hoqI8wpgVI1pM8QQ8nh8YJg3TTSsPAyLedJT8903FlM5leMVHeboZFgFkR
	1WFtezASTK0+xtT8+QqWqgHb6mjmA4q+9zJ3fasS83S22C4/Cj/2dOVXZm0Hh1G3jW8D
	SJris4cBVEB6bIsYnD110eADHmebRKdVCU2a/vyAhRLhEb3fwC7+nHyhNEfm+LiXo1Lt
	nUXQ==
X-Gm-Message-State: ALyK8tKrNLY+HK9IrI587ATqeNkBL5f8g6ZsVdNUj4deDsqUGS1VV7t2jiZCj8mdsvZ/rWf4D5QxNfCS/pmHTQ==
X-Received: by 10.55.122.69 with SMTP id v66mr28400812qkc.26.1467383613222;
	Fri, 01 Jul 2016 07:33:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 07:33:03 -0700 (PDT)
In-Reply-To: <1467376136-19506-1-git-send-email-ross.burton@intel.com>
References: <1467376136-19506-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 07:33:03 -0700
Message-ID: <CAMKF1so2kDtp4CGG_RWF-Hz2KOehLtXxsMi7T9MJ_-8QMr1S3Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gcc: remove unused patch
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
X-List-Received-Date: Fri, 01 Jul 2016 14:33:35 -0000
Content-Type: text/plain; charset=UTF-8

oops, seems my .gitignore has become too greedy. Thanks for fixing it.

On Fri, Jul 1, 2016 at 5:28 AM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...-Symlink-c-header-in-target_triplet-for-S.patch | 49 ----------------------
>  1 file changed, 49 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
>
> diff --git a/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch b/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
> deleted file mode 100644
> index c598a0d..0000000
> --- a/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 0ef3d75514ee5a74b7c04ea36423cff97843fbb8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 10 May 2016 01:07:24 -0700
> -Subject: [PATCH] gcc-runtime: Symlink c++ header in target_triplet for SDK use
> -
> -We build SDKs such that gcc-cross-candian is built for only one
> -target *-*-linux and then use -muclibc or -mmusl to let it compile
> -code for other libc variants. This works fine when libc = glibc
> -however it does not work for c++ programs when libc != glibc since
> -there are c++ headers installed under ${includedir}/c++/${BINV}/${TARGET_SYS}
> -which is fine when gcc-runtime and gcc-cross-candian uses same --target options
> -gxx includedir searches in right triplet, but it fails with musl/uclibc
> -since gcc will look for glibc based triplet but gcc-runtime will install
> -them under musl/uclibc triplet.
> -
> -This patch symlinks the musl/uclibc triplet to glibc triplet when libc != glibc
> -
> -This fixes SDKs for musl/uclibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - meta/recipes-devtools/gcc/gcc-runtime.inc | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> -index 8639c1c..8e4d5eb 100644
> ---- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> -+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> -@@ -70,13 +70,15 @@ do_install () {
> -       if [ -d ${D}${infodir} ]; then
> -               rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> -       fi
> -+}
> -+
> -+do_install_append_class-target () {
> -       if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> -               ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
> -       fi
> --      if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
> -+      if [ "${TARGET_OS}" = "linux-gnuspe" -o "${TCLIBC}" != "glibc" ]; then
> -               ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> -       fi
> --      chown -R root:root ${D}
> - }
> -
> - INHIBIT_DEFAULT_DEPS = "1"
> ---
> -2.8.2
> -
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

