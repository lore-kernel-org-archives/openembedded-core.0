Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0F00665C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:12:38 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so117568234qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UpwE7s2vMywRK1L1COIWaxDJDonIzSeVde0QxrVb8qg=;
	b=DuGjpvfaCaPwpPbYynudrCnksLi9UR9hwN4Oz+xpYkDnMIHjOPocmZklqbma9RR7+7
	7XTmb/XsZYj7FdbG5c9EcU9Ki/jp6SrxGN0DssiCHmBVwVZUXLok3f723Mf+M1yJPtK4
	hK1ql9P60+vncbE16iaMYEPBy5lO9wdE/0BXXKH7JyV0uIqIOz2NbJKJKm3TV+AMxS9U
	XkqpBHQP4UA1m0DV5kiTZ9kpVBFiuANTC4nIT3XhQtizw58sTwpIFZcbh/rI+Q/1bqml
	4PwNpIe7UFLZOsNzjzxkDf3Xxa/p0CGzUHQnspsae8U5D6PtRcDqQgkVZzIg/sf63XMA
	mWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UpwE7s2vMywRK1L1COIWaxDJDonIzSeVde0QxrVb8qg=;
	b=ISNsjtclDcOUQ2aUgrkVjI0c4tIwWHxADYU9yFMpKAX/3Q212iSMe9LnhCidrf21Ur
	xUOTqn+U29CsRK6CQcgQ54tVv8VJBkzjDSW44B8lakLTyvdwuP0MUTF7fB0u0GM40cH3
	RiMu8bZKQrObgip5WPvbWjI61AKaVRfcQN0HEotbAj/sdfjCwhgGMXa1ni5e+yIrIMaB
	1lBiU0+Ow/vJlOgl1baSJEhv0l0FJWfgO1h5V6/M5cHgGQA4kuOJuyd3ibVREESrugTH
	peFUeEXupf6B08imuepITRHYEgDwmf8TFfpKRBD9MqQNj+k9mi9lvF+V84ldfeCFolIJ
	vTDg==
X-Gm-Message-State: AKaTC02JVOntToipJCRHdSnw0hL+CJRdB2WenKmaFPS2W6LxapUkvg+sRI5bLn6r7QDs9yzuHSG3GDNwyfCDHO3Y
X-Received: by 10.237.36.154 with SMTP id t26mr17157201qtc.188.1480327958597; 
	Mon, 28 Nov 2016 02:12:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 28 Nov 2016 02:12:18 -0800 (PST)
In-Reply-To: <20161123092807.28693-2-raj.khem@gmail.com>
References: <20161123092807.28693-1-raj.khem@gmail.com>
	<20161123092807.28693-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Nov 2016 10:12:18 +0000
Message-ID: <CAJTo0LaWCT3zZEqYt4P5_vMApf2FY1b02iYkY25-nznbv9bE0A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/2] systemd: Upgrade to 232
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
X-List-Received-Date: Mon, 28 Nov 2016 10:12:39 -0000
Content-Type: multipart/alternative; boundary=001a1141058e1fa823054259b66d

--001a1141058e1fa823054259b66d
Content-Type: text/plain; charset=UTF-8

This still breaks systemd-boot.

NOTE: Applying patch
'0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch'
(../meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch)
ERROR: Command Error: 'quilt --quiltrc
TOPDIR/tmp/sysroots/x86_64-linux/etc/quiltrc push' exited with 0  Output:
Applying patch
0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
patching file Makefile.am
Hunk #1 FAILED at 247.
Hunk #2 succeeded at 320 (offset -1 lines).
Hunk #3 FAILED at 2906.
2 out of 3 hunks FAILED -- rejects in file Makefile.am
patching file configure.ac
Patch 0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch does
not apply (enforce with -f)

Ross

On 23 November 2016 at 09:28, Khem Raj <raj.khem@gmail.com> wrote:

> * Drop support for rcS.d SysV init scripts.
>   These are prone to cause dependency loops, and almost all packages with
>   rcS scripts now ship a native systemd service.
>
> * Drop mount propagation patch, it only happens with libseccomp, OE doesnt
>   enable it
>
> * kdbus option has disappeared from configure
>
> * Ignore dev-so for PN now since systemd introduced private .so see
>   https://github.com/systemd/systemd/issues/3810
>
> * Add libnss* to PACKAGES_DYNAMIC for libnss-resolve to work correctly
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd.inc              |   4 +-
>  ....c-Change-the-default-device-timeout-to-2.patch |   8 +-
>  ...r-getty-to-agetty-in-console-setup-system.patch |  10 +-
>  .../systemd/0003-define-exp10-if-missing.patch     |  12 +-
>  ...nv-when-secure-versions-are-not-available.patch |  21 ++--
>  ...t-install-dependency-links-at-install-tim.patch |  10 +-
>  ...heck-for-additional-features-that-uclibc-.patch |  10 +-
>  ...pper-instead-of-looking-for-relative-opti.patch |  38 ++----
>  ...wn-Use-execvpe-only-when-libc-supports-it.patch |  16 +--
>  ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |  27 +++--
>  ...0010-implment-systemd-sysv-install-for-OE.patch |   6 +-
>  ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  12 +-
>  .../systemd/0012-rules-whitelist-hd-devices.patch  |  21 ++--
>  ...-Make-root-s-home-directory-configurable.patch} |  90 +++++---------
>  ...tor-add-support-for-executing-scripts-und.patch | 133
> ---------------------
>  ...vert-rules-remove-firmware-loading-rules.patch} |   6 +-
>  ...remove-userspace-firmware-loading-suppor.patch} |  58 +++++----
>  ...0015-systemd-user-avoid-using-system-auth.patch |  35 ------
>  ...patch => 0016-make-test-dir-configurable.patch} |  21 ++--
>  ...=> 0017-remove-duplicate-include-uchar.h.patch} |  10 +-
>  ...h => 0018-check-for-uchar.h-in-configure.patch} |  16 ++-
>  ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  20 ++--
>  ...sing.h-for-getting-secure_getenv-definiti.patch |  27 -----
>  .../systemd/systemd/CVE-2016-7795.patch            |  69 -----------
>  ...dev-re-enable-mount-propagation-for-udevd.patch |  31 -----
>  .../systemd/{systemd_230.bb => systemd_232.bb}     |  24 ++--
>  26 files changed, 196 insertions(+), 539 deletions(-)
>  rename meta/recipes-core/systemd/systemd/{0014-Make-root-s-
> home-directory-configurable.patch => 0013-Make-root-s-home-directory-configurable.patch}
> (66%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0013-sysv-generator-
> add-support-for-executing-scripts-und.patch
>  rename meta/recipes-core/systemd/systemd/{0016-Revert-rules-
> remove-firmware-loading-rules.patch => 0014-Revert-rules-remove-firmware-loading-rules.patch}
> (84%)
>  rename meta/recipes-core/systemd/systemd/{0017-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch => 0015-Revert-udev-remove-
> userspace-firmware-loading-suppor.patch} (89%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0015-systemd-user-
> avoid-using-system-auth.patch
>  rename meta/recipes-core/systemd/systemd/{0018-make-test-dir-configurable.patch
> => 0016-make-test-dir-configurable.patch} (77%)
>  rename meta/recipes-core/systemd/systemd/{0019-remove-
> duplicate-include-uchar.h.patch => 0017-remove-duplicate-include-uchar.h.patch}
> (81%)
>  rename meta/recipes-core/systemd/systemd/{0020-check-for-uchar.h-in-configure.patch
> => 0018-check-for-uchar.h-in-configure.patch} (76%)
>  rename meta/recipes-core/systemd/systemd/{0022-socket-util-don-
> t-fail-if-libc-doesn-t-support-IDN.patch => 0019-socket-util-don-t-fail-
> if-libc-doesn-t-support-IDN.patch} (69%)
>  delete mode 100644 meta/recipes-core/systemd/
> systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
>  delete mode 100644 meta/recipes-core/systemd/
> systemd/udev-re-enable-mount-propagation-for-udevd.patch
>  rename meta/recipes-core/systemd/{systemd_230.bb => systemd_232.bb} (96%)
>
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index f800f42..29e0be6 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,12 +14,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=
> 751419260aa954499f7abaabaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=
> 4fbd65380cdd255951079008b364516c"
>
> -SRCREV = "3a74d4fc90cb322a4784a3515bef7118c8f8c5ba"
> +SRCREV = "a1e2ef7ec912902d8142e7cb5830cbfb47dba86c"
>
>  SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
>
> -PV = "230+git${SRCPV}"
> -
>  S = "${WORKDIR}/git"
>
>  LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
> diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-
> Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/
> systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
> index f7ef7a3..ee2cd6c 100644
> --- a/meta/recipes-core/systemd/systemd/0001-core-device.c-
> Change-the-default-device-timeout-to-2.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-
> Change-the-default-device-timeout-to-2.patch
> @@ -1,7 +1,7 @@
> -From 3bc4552117879f57522b5972b724729ca993f1ea Mon Sep 17 00:00:00 2001
> +From a544d6d15f5c418084f322349aafe341128d5fca Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 14 Dec 2015 04:09:19 +0000
> -Subject: [PATCH 01/36] core/device.c: Change the default device timeout
> to 240
> +Subject: [PATCH 01/19] core/device.c: Change the default device timeout
> to 240
>   sec.
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=UTF-8
> @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/core/device.c b/src/core/device.c
> -index d201dc5..340d62a 100644
> +index c572a67..f90774e 100644
>  --- a/src/core/device.c
>  +++ b/src/core/device.c
>  @@ -112,7 +112,7 @@ static void device_init(Unit *u) {
> @@ -29,5 +29,5 @@ index d201dc5..340d62a 100644
>           u->ignore_on_isolate = true;
>   }
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0002-units-Prefer-
> getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/
> systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
> index 28939eb..951a28d 100644
> --- a/meta/recipes-core/systemd/systemd/0002-units-Prefer-
> getty-to-agetty-in-console-setup-system.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-units-Prefer-
> getty-to-agetty-in-console-setup-system.patch
> @@ -1,7 +1,7 @@
> -From e5f405aba347d216e7f2b73d7dd681b13be442e3 Mon Sep 17 00:00:00 2001
> +From 8736d9b9bb492f60e8f3a1a7fb5a05ba3201d86b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 20 Feb 2015 05:29:15 +0000
> -Subject: [PATCH 02/36] units: Prefer getty to agetty in console setup
> systemd
> +Subject: [PATCH 02/19] units: Prefer getty to agetty in console setup
> systemd
>   units
>
>  Upstream-Status: Inappropriate [configuration specific]
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/units/getty@.service.m4 b/units/getty@.service.m4
> -index 46164ab..bdf6ec8 100644
> +index 5b82c13..e729469 100644
>  --- a/units/getty@.service.m4
>  +++ b/units/getty@.service.m4
> -@@ -27,7 +27,7 @@ ConditionPathExists=/dev/tty0
> +@@ -33,7 +33,7 @@ ConditionPathExists=/dev/tty0
>
>   [Service]
>   # the VT is cleared by TTYVTDisallocate
> @@ -40,5 +40,5 @@ index 4522d0d..e6d499d 100644
>   Restart=always
>   UtmpIdentifier=%I
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
> b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
> index e62d580..37c6ac5 100644
> --- a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
> +++ b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
> @@ -1,4 +1,7 @@
> -Subject: [PATCH 03/36] define exp10 if missing
> +From b383c286f58184575216b2bf6f185ba2ad648956 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 19:25:45 -0800
> +Subject: [PATCH 03/19] define exp10 if missing
>
>  Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-
> fix-build-on-uClibc-exp10.patch
>
> @@ -8,16 +11,15 @@ Upstream-Status: Pending
>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   src/basic/missing.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index 651e414..fafa233 100644
> +index 4c013be..4a3fd9c 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -1013,4 +1013,9 @@ typedef int32_t key_serial_t;
> +@@ -1078,4 +1078,9 @@ typedef int32_t key_serial_t;
>
>   #endif
>
> @@ -28,5 +30,5 @@ index 651e414..fafa233 100644
>  +
>   #include "missing_syscall.h"
>  --
> -2.8.3
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-
> secure-versions-are-not-available.patch b/meta/recipes-core/systemd/
> systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
> index 989a1fa..ab2cbe0 100644
> --- a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-
> secure-versions-are-not-available.patch
> +++ b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-
> secure-versions-are-not-available.patch
> @@ -1,7 +1,7 @@
> -From bb8d8148b16572ae17d3c308552cf73915386b05 Mon Sep 17 00:00:00 2001
> +From 5765cda4f7243e240b1e8723dc536fb20503d544 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 12 Sep 2015 19:10:04 +0000
> -Subject: [PATCH 04/36] Use getenv when secure versions are not available
> +Date: Wed, 9 Nov 2016 19:28:32 -0800
> +Subject: [PATCH 04/19] Use getenv when secure versions are not available
>
>  musl doesnt implement secure version, so we default
>  to it if configure does not detect a secure imeplementation
> @@ -9,19 +9,14 @@ to it if configure does not detect a secure
> imeplementation
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Upstream-Status: Denied
>  ---
> - src/basic/missing.h | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> + src/basic/missing.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index ee7e7ea..3170429 100644
> +index 4a3fd9c..4936873 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -585,12 +585,11 @@ static inline int name_to_handle_at(int fd, const
> char *name, struct file_handle
> -         return syscall(__NR_name_to_handle_at, fd, name, handle,
> mnt_id, flags);
> - }
> - #endif
> --
> - #ifndef HAVE_SECURE_GETENV
> +@@ -529,7 +529,7 @@ struct btrfs_ioctl_quota_ctl_args {
>   #  ifdef HAVE___SECURE_GETENV
>   #    define secure_getenv __secure_getenv
>   #  else
> @@ -31,5 +26,5 @@ index ee7e7ea..3170429 100644
>   #endif
>
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-
> install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/
> systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index f69e26e..7016e98 100644
> --- a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-
> install-dependency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-
> install-dependency-links-at-install-tim.patch
> @@ -1,7 +1,7 @@
> -From 3436b12d40bf4f4ab7e3e16600e5f6c35a470da4 Mon Sep 17 00:00:00 2001
> +From 74450f0dbad2f8478c26eeaa46d4e4a987858f45 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 20 Feb 2015 05:03:44 +0000
> -Subject: [PATCH 05/36] binfmt: Don't install dependency links at install
> time
> +Subject: [PATCH 05/19] binfmt: Don't install dependency links at install
> time
>   for the binfmt services
>
>  use [Install] blocks so that they get created when the service is enabled
> @@ -24,10 +24,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   3 files changed, 8 insertions(+), 4 deletions(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 03341fc..629740f 100644
> +index 50da458..29ed1dd 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -4387,10 +4387,6 @@ INSTALL_DIRS += \
> +@@ -4635,10 +4635,6 @@ INSTALL_DIRS += \
>         $(prefix)/lib/binfmt.d \
>         $(sysconfdir)/binfmt.d
>
> @@ -70,5 +70,5 @@ index d53073e..8c57ee0 100644
>  +[Install]
>  +WantedBy=sysinit.target
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0006-configure-Check-
> for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/
> systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
> index 0d63755..43a0d3f 100644
> --- a/meta/recipes-core/systemd/systemd/0006-configure-Check-
> for-additional-features-that-uclibc-.patch
> +++ b/meta/recipes-core/systemd/systemd/0006-configure-Check-
> for-additional-features-that-uclibc-.patch
> @@ -1,7 +1,7 @@
> -From bb6f1d8a000b337280541afde7cccdcfe03cdeb1 Mon Sep 17 00:00:00 2001
> +From 82d837b76618a773485b96e38b7b91083a7437e8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 20 Feb 2015 05:05:45 +0000
> -Subject: [PATCH 06/36] configure: Check for additional features that
> uclibc
> +Subject: [PATCH 06/19] configure: Check for additional features that
> uclibc
>   doesnt support
>
>  This helps in supporting uclibc which does not have all features that
> @@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 18 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index f51533c..0239fd0 100644
> +index 7f6b3b9..7c4b5a2 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -112,6 +112,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount],
> [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
> +@@ -110,6 +110,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount],
> [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
>
>   AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln
> doesn't support --relative ***])])
>
> @@ -44,5 +44,5 @@ index f51533c..0239fd0 100644
>
>   AC_CHECK_TOOL(OBJCOPY, objcopy)
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-
> instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/
> systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> index 12f6ace..fad69a5 100644
> --- a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-
> instead-of-looking-for-relative-opti.patch
> +++ b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-
> instead-of-looking-for-relative-opti.patch
> @@ -1,31 +1,22 @@
> -From fa5e137fbd2fb081ae897575377d718ee8cb6349 Mon Sep 17 00:00:00 2001
> +From a3482c91642cf568b3ac27fa6c0cb3c6b30669b7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 20 Dec 2015 04:20:28 +0000
> -Subject: [PATCH 07/36] use lnr wrapper instead of looking for --relative
> +Date: Wed, 9 Nov 2016 19:32:14 -0800
> +Subject: [PATCH 07/19] use lnr wrapper instead of looking for --relative
>   option for ln
>
>  Upstream-Status: Inappropriate [OE-Specific]
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - Makefile.am  | 6 +++---
> + Makefile.am  | 2 +-
>   configure.ac | 2 --
> - 2 files changed, 3 insertions(+), 5 deletions(-)
> + 2 files changed, 1 insertion(+), 3 deletions(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 629740f..82b6553 100644
> +index 29ed1dd..02f4017 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -243,7 +243,7 @@ define move-to-rootlibdir
> -               $(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
> -               so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
> -               rm -f $(DESTDIR)$(libdir)/$$libname && \
> --              $(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name
> $(DESTDIR)$(libdir)/$$libname && \
> -+              lnr $(DESTDIR)$(rootlibdir)/$$so_img_name
> $(DESTDIR)$(libdir)/$$libname && \
> -               mv $(DESTDIR)$(libdir)/$$libname.*
> $(DESTDIR)$(rootlibdir); \
> -       fi
> - endef
> -@@ -317,7 +317,7 @@ define install-relative-aliases
> +@@ -320,7 +320,7 @@ define install-relative-aliases
>         while [ -n "$$1" ]; do \
>                 $(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
>                 rm -f $(DESTDIR)$$dir/$$2 && \
> @@ -34,20 +25,11 @@ index 629740f..82b6553 100644
>                 shift 2 || exit $$?; \
>         done
>   endef
> -@@ -2781,7 +2781,7 @@ systemd_dbus1_generator_LDADD = \
> - dbus1-generator-install-hook:
> -       $(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
> -       $(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/
> systemd-dbus1-generator
> --      $(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(
> systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/
> systemd-dbus1-generator
> -+      $(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator
> $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
> -
> - dbus1-generator-uninstall-hook:
> -       rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
>  diff --git a/configure.ac b/configure.ac
> -index 0239fd0..c5ab9d0 100644
> +index 7c4b5a2..b10c952 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin],
> [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
> +@@ -108,8 +108,6 @@ AC_PATH_PROG([SULOGIN], [sulogin],
> [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
>   AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount],
> [$PATH:/usr/sbin:/sbin])
>   AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount],
> [$PATH:/usr/sbin:/sbin])
>
> @@ -57,5 +39,5 @@ index 0239fd0..c5ab9d0 100644
>
>   AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0008-nspawn-Use-
> execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/
> systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
> index 6e6f199..586b5aa 100644
> --- a/meta/recipes-core/systemd/systemd/0008-nspawn-Use-
> execvpe-only-when-libc-supports-it.patch
> +++ b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-
> execvpe-only-when-libc-supports-it.patch
> @@ -1,7 +1,7 @@
> -From ae999ff50efb9cc82537adef7696c6f732afcfc8 Mon Sep 17 00:00:00 2001
> +From 96026a3763264eb41a2c3e374f232f6e543284a8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Feb 2015 05:10:37 +0000
> -Subject: [PATCH 08/36] nspawn: Use execvpe only when libc supports it
> +Date: Wed, 9 Nov 2016 19:33:49 -0800
> +Subject: [PATCH 08/19] nspawn: Use execvpe only when libc supports it
>
>  Upstream-Status: Denied [no desire for uclibc support]
>
> @@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 7 insertions(+)
>
>  diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> -index 5a68fec..65e65ec 100644
> +index 9b9ae90..19b47cd 100644
>  --- a/src/nspawn/nspawn.c
>  +++ b/src/nspawn/nspawn.c
> -@@ -111,6 +111,8 @@ typedef enum LinkJournal {
> +@@ -123,6 +123,8 @@ typedef enum LinkJournal {
>           LINK_GUEST
>   } LinkJournal;
>
> @@ -23,7 +23,7 @@ index 5a68fec..65e65ec 100644
>   static char *arg_directory = NULL;
>   static char *arg_template = NULL;
>   static char *arg_chdir = NULL;
> -@@ -2637,7 +2639,12 @@ static int inner_child(
> +@@ -2871,7 +2873,12 @@ static int inner_child(
>                   a[0] = (char*) "/sbin/init";
>                   execve(a[0], a, env_use);
>           } else if (!strv_isempty(arg_parameters))
> @@ -35,7 +35,7 @@ index 5a68fec..65e65ec 100644
>  +#endif /* HAVE_EXECVPE */
>           else {
>                   if (!arg_chdir)
> -                         chdir(home ?: "/root");
> +                         /* If we cannot change the directory, we'll end
> up in /, that is expected. */
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0009-util-bypass-
> unimplemented-_SC_PHYS_PAGES-system-conf.patch
> b/meta/recipes-core/systemd/systemd/0009-util-bypass-
> unimplemented-_SC_PHYS_PAGES-system-conf.patch
> index 116f3d4..f150bb0 100644
> --- a/meta/recipes-core/systemd/systemd/0009-util-bypass-
> unimplemented-_SC_PHYS_PAGES-system-conf.patch
> +++ b/meta/recipes-core/systemd/systemd/0009-util-bypass-
> unimplemented-_SC_PHYS_PAGES-system-conf.patch
> @@ -1,7 +1,7 @@
> -From 3498f488b27f90398d7c8d1d06aac5ab684370e8 Mon Sep 17 00:00:00 2001
> +From 085c8b6f253726ad547e7be84ff3f2b99701488b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 14 Dec 2015 00:47:53 +0000
> -Subject: [PATCH 09/36] util: bypass unimplemented _SC_PHYS_PAGES system
> +Date: Wed, 9 Nov 2016 19:38:07 -0800
> +Subject: [PATCH 09/19] util: bypass unimplemented _SC_PHYS_PAGES system
>   configuration API on uclibc
>
>  Upstream-Status: Inappropriate [uclibc-specific]
> @@ -12,12 +12,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 15 insertions(+)
>
>  diff --git a/src/basic/util.c b/src/basic/util.c
> -index ea1bed7..fdaf340 100644
> +index c1b5ca1..4c62d43 100644
>  --- a/src/basic/util.c
>  +++ b/src/basic/util.c
> -@@ -767,10 +767,25 @@ uint64_t physical_memory(void) {
> -         /* We return this as uint64_t in case we are running as 32bit
> -          * process on a 64bit kernel with huge amounts of memory */
> +@@ -742,6 +742,20 @@ uint64_t physical_memory(void) {
> +          * In order to support containers nicely that have a configured
> memory limit we'll take the minimum of the
> +          * physically reported amount of memory and the limit configured
> for the root cgroup, if there is any. */
>
>  +#ifdef __UCLIBC__
>  +        char line[128];
> @@ -33,14 +33,17 @@ index ea1bed7..fdaf340 100644
>  +        fclose(f);
>  +        return (uint64_t) mem;
>  +#else
> -         mem = sysconf(_SC_PHYS_PAGES);
> -         assert(mem > 0);
> +         sc = sysconf(_SC_PHYS_PAGES);
> +         assert(sc > 0);
>
> -         return (uint64_t) mem * (uint64_t) page_size();
> +@@ -762,6 +776,7 @@ uint64_t physical_memory(void) {
> +         lim *= ps;
> +
> +         return MIN(mem, lim);
>  +#endif
>   }
>
> - int update_reboot_param_file(const char *param) {
> + uint64_t physical_memory_scale(uint64_t v, uint64_t max) {
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
> b/meta/recipes-core/systemd/systemd/0010-implment-systemd-
> sysv-install-for-OE.patch
> index 75fa3a5..8828d6e 100644
> --- a/meta/recipes-core/systemd/systemd/0010-implment-systemd-
> sysv-install-for-OE.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-implment-systemd-
> sysv-install-for-OE.patch
> @@ -1,7 +1,7 @@
> -From 5f94f5ad46c1ded54c3797979d384e4c1eb77bb0 Mon Sep 17 00:00:00 2001
> +From 52726be92e2b841f744a96c378cc872ae0033a2b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 5 Sep 2015 06:31:47 +0000
> -Subject: [PATCH 10/36] implment systemd-sysv-install for OE
> +Subject: [PATCH 10/19] implment systemd-sysv-install for OE
>
>  Use update-rc.d for enabling/disabling and status command
>  to check the status of the sysv service
> @@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755
>       *)
>           usage ;;
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-
> Build-conditionally-when-HAVE_MYHOSTN.patch b/meta/recipes-core/systemd/
> systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
> index 34ae645..b01ae97 100644
> --- a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-
> Build-conditionally-when-HAVE_MYHOSTN.patch
> +++ b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-
> Build-conditionally-when-HAVE_MYHOSTN.patch
> @@ -1,7 +1,7 @@
> -From 2b2450f6b7197bff4637c0283e8784500471d083 Mon Sep 17 00:00:00 2001
> +From 3f6f45578b828e414f50c6822375073e7174236a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 14 Dec 2015 00:50:01 +0000
> -Subject: [PATCH 11/36] nss-mymachines: Build conditionally when
> +Subject: [PATCH 11/19] nss-mymachines: Build conditionally when
>   HAVE_MYHOSTNAME is set
>
>  Fixes build failures when building with --disable-myhostname
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 82b6553..b3f3343 100644
> +index 02f4017..420e0e0 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -4876,6 +4876,7 @@ SYSTEM_UNIT_ALIASES += \
> +@@ -5146,6 +5146,7 @@ SYSTEM_UNIT_ALIASES += \
>   BUSNAMES_TARGET_WANTS += \
>         org.freedesktop.machine1.busname
>
> @@ -25,7 +25,7 @@ index 82b6553..b3f3343 100644
>   libnss_mymachines_la_SOURCES = \
>         src/nss-mymachines/nss-mymachines.sym \
>         src/nss-mymachines/nss-mymachines.c
> -@@ -4896,6 +4897,7 @@ lib_LTLIBRARIES += \
> +@@ -5167,6 +5168,7 @@ rootlib_LTLIBRARIES += \
>         libnss_mymachines.la
>
>   endif
> @@ -34,5 +34,5 @@ index 82b6553..b3f3343 100644
>   polkitpolicy_in_files += \
>         src/machine/org.freedesktop.machine1.policy.in
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
> b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
> index 6143088..8666bdc 100644
> --- a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-
> hd-devices.patch
> +++ b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-
> hd-devices.patch
> @@ -1,7 +1,7 @@
> -From 5ebc0d87565a73710dea602c00b1586d5a1364e5 Mon Sep 17 00:00:00 2001
> -From: Patrick Ohly <patrick.ohly@intel.com>
> -Date: Wed, 16 Sep 2015 13:55:58 +0200
> -Subject: [PATCH 12/36] rules: whitelist hd* devices
> +From 8cc1ae11f54dcc38ee2168b0f99703b835dd3942 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 19:41:13 -0800
> +Subject: [PATCH 12/19] rules: whitelist hd* devices
>
>  qemu by default emulates IDE and the linux-yocto kernel(s) use
>  CONFIG_IDE instead of the more modern libsata, so disks appear as
> @@ -10,23 +10,24 @@ CONFIG_IDE instead of the more modern libsata, so
> disks appear as
>  Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
>
>  Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   rules/60-persistent-storage.rules | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/rules/60-persistent-storage.rules
> b/rules/60-persistent-storage.rules
> -index 0b14bb4..1c4d97a 100644
> +index c13d05c..b14fbed 100644
>  --- a/rules/60-persistent-storage.rules
>  +++ b/rules/60-persistent-storage.rules
> -@@ -6,7 +6,7 @@
> - ACTION=="remove", GOTO="persistent_storage_end"
> +@@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
> + ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1",
> GOTO="persistent_storage_end"
>
>   SUBSYSTEM!="block", GOTO="persistent_storage_end"
> --KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*
> |sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*",
> GOTO="persistent_storage_end"
> -+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*
> |hd*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*",
> GOTO="persistent_storage_end"
> +-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*
> |sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*",
> GOTO="persistent_storage_end"
> ++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*
> |hd*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*",
> GOTO="persistent_storage_end"
>
>   # ignore partitions that span the entire disk
>   TEST=="whole_disk", GOTO="persistent_storage_end"
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
> b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-
> directory-configurable.patch
> similarity index 66%
> rename from meta/recipes-core/systemd/systemd/0014-Make-root-s-home-
> directory-configurable.patch
> rename to meta/recipes-core/systemd/systemd/0013-Make-root-s-home-
> directory-configurable.patch
> index 2eea0ff..2b33337 100644
> --- a/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-
> directory-configurable.patch
> +++ b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-
> directory-configurable.patch
> @@ -1,4 +1,7 @@
> -Subject: [PATCH 14/36] Make root's home directory configurable
> +From 79e64a07840e0d97d66e46111f1c086bf83981b7 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 20:35:30 -0800
> +Subject: [PATCH 13/19] Make root's home directory configurable
>
>  OpenEmbedded has a configurable home directory for root. Allow
>  systemd to be built using its idea of what root's home directory
> @@ -11,23 +14,20 @@ https://github.com/systemd/systemd/issues/541
>
>  Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
> - Makefile.am                       | 2 ++
> - configure.ac                      | 7 +++++++
> - src/basic/user-util.c             | 4 ++--
> - src/core/namespace.c              | 2 +-
> - src/nspawn/nspawn.c               | 4 ++--
> - units/console-shell.service.m4.in | 4 ++--
> - units/emergency.service.in        | 4 ++--
> - units/rescue.service.in           | 4 ++--
> - 8 files changed, 20 insertions(+), 11 deletions(-)
> + Makefile.am                | 2 ++
> + configure.ac               | 7 +++++++
> + src/basic/user-util.c      | 4 ++--
> + src/nspawn/nspawn.c        | 4 ++--
> + units/emergency.service.in | 4 ++--
> + units/rescue.service.in    | 4 ++--
> + 6 files changed, 17 insertions(+), 8 deletions(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 305099a..88c1250 100644
> +index 420e0e0..3010b01 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -206,6 +206,7 @@ AM_CPPFLAGS = \
> +@@ -213,6 +213,7 @@ AM_CPPFLAGS = \
>         -DLIBDIR=\"$(libdir)\" \
>         -DROOTLIBDIR=\"$(rootlibdir)\" \
>         -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
> @@ -35,8 +35,8 @@ index 305099a..88c1250 100644
>         -DTEST_DIR=\"$(abs_top_srcdir)/test\" \
>         -I $(top_srcdir)/src \
>         -I $(top_builddir)/src/basic \
> -@@ -5863,6 +5864,7 @@ EXTRA_DIST += \
> - substitutions = \
> +@@ -6057,6 +6058,7 @@ substitutions = \
> +        '|rootlibdir=$(rootlibdir)|' \
>          '|rootlibexecdir=$(rootlibexecdir)|' \
>          '|rootbindir=$(rootbindir)|' \
>  +       '|roothomedir=$(roothomedir)|' \
> @@ -44,10 +44,10 @@ index 305099a..88c1250 100644
>          '|SYSTEMCTL=$(rootbindir)/systemctl|' \
>          '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
>  diff --git a/configure.ac b/configure.ac
> -index 329861a..01764f5 100644
> +index b10c952..dfc0bd3 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1478,6 +1478,11 @@ AC_ARG_WITH([rootlibdir],
> +@@ -1513,6 +1513,11 @@ AC_ARG_WITH([rootlibdir],
>           [with_rootlibdir=${libdir}])
>   AX_NORMALIZE_PATH([with_rootlibdir])
>
> @@ -59,7 +59,7 @@ index 329861a..01764f5 100644
>   AC_ARG_WITH([pamlibdir],
>           AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM
> modules]),
>           [],
> -@@ -1562,6 +1567,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
> +@@ -1598,6 +1603,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
>   AC_SUBST([pamconfdir], [$with_pamconfdir])
>   AC_SUBST([rootprefix], [$with_rootprefix])
>   AC_SUBST([rootlibdir], [$with_rootlibdir])
> @@ -67,7 +67,7 @@ index 329861a..01764f5 100644
>
>   AC_CONFIG_FILES([
>           Makefile
> -@@ -1653,6 +1659,7 @@ AC_MSG_RESULT([
> +@@ -1688,6 +1694,7 @@ AC_MSG_RESULT([
>           includedir:                        ${includedir}
>           lib dir:                           ${libdir}
>           rootlib dir:                       ${with_rootlibdir}
> @@ -76,10 +76,10 @@ index 329861a..01764f5 100644
>           SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
>           Build Python:                      ${PYTHON}
>  diff --git a/src/basic/user-util.c b/src/basic/user-util.c
> -index f65ca3e..da1101a 100644
> +index 938533d..3f9fdc4 100644
>  --- a/src/basic/user-util.c
>  +++ b/src/basic/user-util.c
> -@@ -123,7 +123,7 @@ int get_user_creds(
> +@@ -127,7 +127,7 @@ int get_user_creds(
>                           *gid = 0;
>
>                   if (home)
> @@ -88,7 +88,7 @@ index f65ca3e..da1101a 100644
>
>                   if (shell)
>                           *shell = "/bin/sh";
> -@@ -354,7 +354,7 @@ int get_home_dir(char **_h) {
> +@@ -387,7 +387,7 @@ int get_home_dir(char **_h) {
>           /* Hardcode home directory for root to avoid NSS */
>           u = getuid();
>           if (u == 0) {
> @@ -97,24 +97,11 @@ index f65ca3e..da1101a 100644
>                   if (!h)
>                           return -ENOMEM;
>
> -diff --git a/src/core/namespace.c b/src/core/namespace.c
> -index 203d122..45c0d11 100644
> ---- a/src/core/namespace.c
> -+++ b/src/core/namespace.c
> -@@ -415,7 +415,7 @@ int setup_namespace(
> -                         home_dir = strjoina("-", home_dir);
> -                         run_user_dir = prefix_roota(root_directory,
> "/run/user");
> -                         run_user_dir = strjoina("-", run_user_dir);
> --                        root_dir = prefix_roota(root_directory, "/root");
> -+                        root_dir = prefix_roota(root_directory,
> ROOTHOMEDIR);
> -                         root_dir = strjoina("-", root_dir);
> -
> -                         r = append_mounts(&m, STRV_MAKE(home_dir,
> run_user_dir, root_dir),
>  diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> -index 8ec0584..51df00b 100644
> +index 19b47cd..e42bf19 100644
>  --- a/src/nspawn/nspawn.c
>  +++ b/src/nspawn/nspawn.c
> -@@ -2739,7 +2739,7 @@ static int inner_child(
> +@@ -2798,7 +2798,7 @@ static int inner_child(
>           if (envp[n_env])
>                   n_env++;
>
> @@ -123,7 +110,7 @@ index 8ec0584..51df00b 100644
>               (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ?
> arg_user : "root") < 0) ||
>               (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ?
> arg_user : "root") < 0))
>                   return log_oom();
> -@@ -2816,7 +2816,7 @@ static int inner_child(
> +@@ -2882,7 +2882,7 @@ static int inner_child(
>           else {
>                   if (!arg_chdir)
>                           /* If we cannot change the directory, we'll end
> up in /, that is expected. */
> @@ -132,23 +119,8 @@ index 8ec0584..51df00b 100644
>
>                   execle("/bin/bash", "-bash", NULL, env_use);
>                   execle("/bin/sh", "-sh", NULL, env_use);
> -diff --git a/units/console-shell.service.m4.in b/units/
> console-shell.service.m4.in
> -index a345ec2..3caae7d 100644
> ---- a/units/console-shell.service.m4.in
> -+++ b/units/console-shell.service.m4.in
> -@@ -15,8 +15,8 @@ After=rc-local.service
> - Before=getty.target
> -
> - [Service]
> --Environment=HOME=/root
> --WorkingDirectory=-/root
> -+Environment=HOME=@roothomedir@
> -+WorkingDirectory=-@roothomedir@
> - ExecStart=-@SULOGIN@
> - ExecStopPost=-@SYSTEMCTL@ poweroff
> - Type=idle
>  diff --git a/units/emergency.service.in b/units/emergency.service.in
> -index 0de16f2..4826062 100644
> +index da68eb8..e25f879 100644
>  --- a/units/emergency.service.in
>  +++ b/units/emergency.service.in
>  @@ -15,8 +15,8 @@ Conflicts=syslog.socket
> @@ -160,10 +132,10 @@ index 0de16f2..4826062 100644
>  +Environment=HOME=@roothomedir@
>  +WorkingDirectory=-@roothomedir@
>   ExecStartPre=-/bin/plymouth --wait quit
> - ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in,
> type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot,
> "systemctl default" or ^D to\\ntry again to boot into default mode.'
> + ExecStartPre=-/bin/echo -e 'You are in emergency mode. After logging in,
> type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot,
> "systemctl default" or ^D to\\ntry again to boot into default mode.'
>   ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail
> --no-block default"
>  diff --git a/units/rescue.service.in b/units/rescue.service.in
> -index 92553f6..590ae17 100644
> +index 5feff69..a83439e 100644
>  --- a/units/rescue.service.in
>  +++ b/units/rescue.service.in
>  @@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
> @@ -174,9 +146,9 @@ index 92553f6..590ae17 100644
>  -WorkingDirectory=-/root
>  +Environment=HOME=@roothomedir@
>  +WorkingDirectory=-@roothomedir@
> - ExecStartPre=-/bin/plymouth quit
> - ExecStartPre=-/bin/echo -e 'Welcome to rescue mode! After logging in,
> type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot,
> "systemctl default" or ^D to\\nboot into default mode.'
> + ExecStartPre=-/bin/plymouth --wait quit
> + ExecStartPre=-/bin/echo -e 'You are in rescue mode. After logging in,
> type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot,
> "systemctl default" or ^D to\\nboot into default mode.'
>   ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail
> --no-block default"
>  --
> -2.8.3
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0013-sysv-generator-
> add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/
> systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> deleted file mode 100644
> index ac67f65..0000000
> --- a/meta/recipes-core/systemd/systemd/0013-sysv-generator-
> add-support-for-executing-scripts-und.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 6736de4a3caf9a0b3c888c6cc05103ab1b86907d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 14 Dec 2015 05:09:53 +0000
> -Subject: [PATCH 13/36] sysv-generator: add support for executing scripts
> under
> - /etc/rcS.d/
> -
> -To be compatible, all services translated from scripts under /etc/rcS.d
> would
> -run before services translated from scripts under /etc/rcN.d.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/sysv-generator/sysv-generator.c | 47 ++++++++++++++++++++++++++++--
> -------
> - 1 file changed, 36 insertions(+), 11 deletions(-)
> -
> -diff --git a/src/sysv-generator/sysv-generator.c
> b/src/sysv-generator/sysv-generator.c
> -index b5925a4..ea06d6a 100644
> ---- a/src/sysv-generator/sysv-generator.c
> -+++ b/src/sysv-generator/sysv-generator.c
> -@@ -44,7 +44,8 @@
> -
> - typedef enum RunlevelType {
> -         RUNLEVEL_UP,
> --        RUNLEVEL_DOWN
> -+        RUNLEVEL_DOWN,
> -+        RUNLEVEL_SYSINIT
> - } RunlevelType;
> -
> - static const struct {
> -@@ -59,6 +60,9 @@ static const struct {
> -         { "rc4.d",  SPECIAL_MULTI_USER_TARGET, RUNLEVEL_UP },
> -         { "rc5.d",  SPECIAL_GRAPHICAL_TARGET,  RUNLEVEL_UP },
> -
> -+        /* Debian style rcS.d, also adopted by OE */
> -+        { "rcS.d",  SPECIAL_SYSINIT_TARGET,   RUNLEVEL_SYSINIT},
> -+
> -         /* Standard SysV runlevels for shutdown */
> -         { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
> -         { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
> -@@ -67,7 +71,7 @@ static const struct {
> -            directories in this order, and we want to make sure that
> -            sysv_start_priority is known when we first load the
> -            unit. And that value we only know from S links. Hence
> --           UP must be read before DOWN */
> -+           UP/SYSINIT must be read before DOWN */
> - };
> -
> - static const char *arg_dest = "/tmp";
> -@@ -86,6 +90,8 @@ typedef struct SysvStub {
> -         bool has_lsb;
> -         bool reload;
> -         bool loaded;
> -+        bool default_dependencies;
> -+        bool from_rcsd;
> - } SysvStub;
> -
> - static void free_sysvstub(SysvStub *s) {
> -@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap
> *all_services) {
> -                 if (s->has_lsb && other->has_lsb)
> -                         continue;
> -
> --                if (other->sysv_start_priority < s->sysv_start_priority)
> {
> --                        r = strv_extend(&s->after, other->name);
> -+                /* All scripts under /etc/rcS.d should execute before
> scripts under
> -+                 * /etc/rcN.d */
> -+                if (!other->from_rcsd && s->from_rcsd) {
> -+                        r = strv_extend(&s->before, other->name);
> -                         if (r < 0)
> -                                 return log_oom();
> -
> --                } else if (other->sysv_start_priority >
> s->sysv_start_priority) {
> --                        r = strv_extend(&s->before, other->name);
> -+                } else if (other->from_rcsd && !s->from_rcsd) {
> -+                        r = strv_extend(&s->after, other->name);
> -                         if (r < 0)
> -                                 return log_oom();
> --                } else
> --                        continue;
> -+                } else {
> -+                        if (other->sysv_start_priority <
> s->sysv_start_priority) {
> -+                                r = strv_extend(&s->after, other->name);
> -+                                if (r < 0)
> -+                                        return log_oom();
> -+                        }
> -+                        else if (other->sysv_start_priority >
> s->sysv_start_priority) {
> -+                                r = strv_extend(&s->before, other->name);
> -+                                if (r < 0)
> -+                                        return log_oom();
> -+                        }
> -+                        else
> -+                                continue;
> -+                }
> -
> -                 /* FIXME: Maybe we should compare the name here
> lexicographically? */
> -         }
> -@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp,
> Hashmap *all_services) {
> -                                 return log_oom();
> -
> -                         service->sysv_start_priority = -1;
> -+                        service->default_dependencies = true;
> -+                        service->from_rcsd = false;
> -                         service->name = name;
> -                         service->path = fpath;
> -                         name = fpath = NULL;
> -@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const
> LookupPaths *lp, Hashmap *all_servic
> -
> -                                 if (de->d_name[0] == 'S')  {
> -
> --                                        if (rcnd_table[i].type ==
> RUNLEVEL_UP)
> -+                                        if (rcnd_table[i].type ==
> RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
> -
>  service->sysv_start_priority = MAX(a*10 + b, service->sysv_start_priority);
> --
> -+
> service->default_dependencies = (rcnd_table[i].type ==
> RUNLEVEL_SYSINIT)?false:true;
> -+                                                service->from_rcsd =
> (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
> -+                                        }
> -                                         r = set_ensure_allocated(&runlevel_services[i],
> NULL);
> -                                         if (r < 0) {
> -                                                 log_oom();
> -@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const
> LookupPaths *lp, Hashmap *all_servic
> -                                         }
> -
> -                                 } else if (de->d_name[0] == 'K' &&
> --                                           (rcnd_table[i].type ==
> RUNLEVEL_DOWN)) {
> -+                                           (rcnd_table[i].type ==
> RUNLEVEL_DOWN ||
> -+                                            rcnd_table[i].type ==
> RUNLEVEL_SYSINIT)) {
> -
> -                                         r = set_ensure_allocated(&shutdown_services,
> NULL);
> -                                         if (r < 0) {
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-core/systemd/systemd/0016-Revert-rules-
> remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/
> systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
> similarity index 84%
> rename from meta/recipes-core/systemd/systemd/0016-Revert-rules-
> remove-firmware-loading-rules.patch
> rename to meta/recipes-core/systemd/systemd/0014-Revert-rules-
> remove-firmware-loading-rules.patch
> index 66905b5..ed7c68f 100644
> --- a/meta/recipes-core/systemd/systemd/0016-Revert-rules-
> remove-firmware-loading-rules.patch
> +++ b/meta/recipes-core/systemd/systemd/0014-Revert-rules-
> remove-firmware-loading-rules.patch
> @@ -1,7 +1,7 @@
> -From 7311ecc745c17d6ed9fd9cf43039648483a87605 Mon Sep 17 00:00:00 2001
> +From 0f47cfcb16e8e40a90a9221f9995f8cd8a915c22 Mon Sep 17 00:00:00 2001
>  From: Jonathan Liu <net147@gmail.com>
>  Date: Thu, 19 Mar 2015 15:01:29 +1100
> -Subject: [PATCH 16/36] Revert "rules: remove firmware loading rules"
> +Subject: [PATCH 14/19] Revert "rules: remove firmware loading rules"
>
>  This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
>  Userspace firmware loading support is needed for Linux < 3.7.
> @@ -24,5 +24,5 @@ index 0000000..f0ae684
>  +
>  +SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0017-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch
> b/meta/recipes-core/systemd/systemd/0015-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch
> similarity index 89%
> rename from meta/recipes-core/systemd/systemd/0017-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch
> rename to meta/recipes-core/systemd/systemd/0015-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch
> index 642625f..f31d211 100644
> --- a/meta/recipes-core/systemd/systemd/0017-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch
> +++ b/meta/recipes-core/systemd/systemd/0015-Revert-udev-
> remove-userspace-firmware-loading-suppor.patch
> @@ -1,4 +1,7 @@
> -Subject: [PATCH 17/36] Revert "udev: remove userspace firmware loading
> +From 4d28d9a7d8d69fb429955d770e53e7a81640da24 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 20:45:23 -0800
> +Subject: [PATCH 15/19] Revert "udev: remove userspace firmware loading
>   support"
>
>  This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
> @@ -10,21 +13,21 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   Makefile.am                      |  12 +++
> - README                           |   4 +-
> + README                           |   6 +-
>   TODO                             |   1 +
> - configure.ac                     |  22 ++++++
> + configure.ac                     |  18 +++++
>   src/udev/udev-builtin-firmware.c | 154 ++++++++++++++++++++++++++++++
> +++++++++
>   src/udev/udev-builtin.c          |   3 +
>   src/udev/udev.h                  |   6 ++
>   src/udev/udevd.c                 |  13 ++++
> - 8 files changed, 213 insertions(+), 2 deletions(-)
> + 8 files changed, 210 insertions(+), 3 deletions(-)
>   create mode 100644 src/udev/udev-builtin-firmware.c
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 305099a..e774976 100644
> +index 3010b01..229492a 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -3706,6 +3706,18 @@ libudev_core_la_LIBADD = \
> +@@ -3791,6 +3791,18 @@ libudev_core_la_LIBADD = \
>         $(BLKID_LIBS) \
>         $(KMOD_LIBS)
>
> @@ -44,10 +47,17 @@ index 305099a..e774976 100644
>   libudev_core_la_SOURCES += \
>         src/udev/udev-builtin-kmod.c
>  diff --git a/README b/README
> -index ca8993c..87f3297 100644
> +index 9f5bc93..f60ae11 100644
>  --- a/README
>  +++ b/README
> -@@ -56,8 +56,8 @@ REQUIREMENTS:
> +@@ -50,14 +50,14 @@ REQUIREMENTS:
> +           CONFIG_PROC_FS
> +           CONFIG_FHANDLE (libudev, mount and bind mount handling)
> +
> +-        udev will fail to work with the legacy sysfs layout:
> ++        Udev will fail to work with the legacy sysfs layout:
> +           CONFIG_SYSFS_DEPRECATED=n
> +
>           Legacy hotplug slows down the system and confuses udev:
>             CONFIG_UEVENT_HELPER_PATH=""
>
> @@ -59,10 +69,10 @@ index ca8993c..87f3297 100644
>
>           Some udev rules and virtualization detection relies on it:
>  diff --git a/TODO b/TODO
> -index fac9ccf..2645582 100644
> +index baaac94..1ab1691 100644
>  --- a/TODO
>  +++ b/TODO
> -@@ -642,6 +642,7 @@ Features:
> +@@ -658,6 +658,7 @@ Features:
>   * initialize the hostname from the fs label of /, if /etc/hostname does
> not exist?
>
>   * udev:
> @@ -71,13 +81,13 @@ index fac9ccf..2645582 100644
>     - kill scsi_id
>     - add trigger --subsystem-match=usb/usb_device device
>  diff --git a/configure.ac b/configure.ac
> -index 329861a..af85405 100644
> +index dfc0bd3..1de0066 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1361,6 +1361,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb],
> [disable hardware database
> +@@ -1394,6 +1394,23 @@ AM_CONDITIONAL(HAVE_MYHOSTNAME, [test
> "$have_myhostname" = "yes"])
> + AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware
> database support])],
> +        enable_hwdb=$enableval, enable_hwdb=yes)
>   AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
> -
> - # ------------------------------------------------------------
> ------------------
>  +AC_ARG_WITH(firmware-path,
>  +       AS_HELP_STRING([--with-firmware-path=DIR[[[:DIR[...]]]]],
>  +          [Firmware search path (default="")]),
> @@ -93,19 +103,15 @@ index 329861a..af85405 100644
>  +done
>  +IFS=$OLD_IFS
>  +AC_SUBST(FIRMWARE_PATH)
> -+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1,
> [Define if FIRMWARE is availabe]) ])
> ++AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1,
> [Define if FIRMWARE is available]) ])
>  +AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
> -+
> -+# ------------------------------------------------------------
> ------------------
> +
> + # ------------------------------------------------------------
> ------------------
>   have_manpages=no
> - AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable
> manpages]))
> - AC_PATH_PROG([XSLTPROC], [xsltproc])
> -@@ -1656,6 +1675,9 @@ AC_MSG_RESULT([
> +@@ -1698,6 +1715,7 @@ AC_MSG_RESULT([
>           SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
>           SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
>           Build Python:                      ${PYTHON}
> -+        Installation Python:               ${PYTHON_BINARY}
> -+        sphinx binary:                     ${SPHINX_BUILD}
>  +        firmware path:                     ${FIRMWARE_PATH}
>           PAM modules dir:                   ${with_pamlibdir}
>           PAM configuration dir:             ${with_pamconfdir}
> @@ -309,7 +315,7 @@ index 8433e8d..d32366d 100644
>   extern const struct udev_builtin udev_builtin_input_id;
>   extern const struct udev_builtin udev_builtin_keyboard;
>  diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> -index e9dd2f4..0abc28e 100644
> +index d336ee0..81e5dc5 100644
>  --- a/src/udev/udevd.c
>  +++ b/src/udev/udevd.c
>  @@ -125,6 +125,9 @@ struct event {
> @@ -322,7 +328,7 @@ index e9dd2f4..0abc28e 100644
>   };
>
>   static inline struct event *node_to_event(struct udev_list_node *node) {
> -@@ -614,6 +617,10 @@ static int event_queue_insert(Manager *manager,
> struct udev_device *dev) {
> +@@ -613,6 +616,10 @@ static int event_queue_insert(Manager *manager,
> struct udev_device *dev) {
>           event->devnum = udev_device_get_devnum(dev);
>           event->is_block = streq("block", udev_device_get_subsystem(dev)
> );
>           event->ifindex = udev_device_get_ifindex(dev);
> @@ -333,7 +339,7 @@ index e9dd2f4..0abc28e 100644
>
>           log_debug("seq %llu queued, '%s' '%s'",
> udev_device_get_seqnum(dev),
>                udev_device_get_action(dev), udev_device_get_subsystem(dev)
> );
> -@@ -699,6 +706,12 @@ static bool is_devpath_busy(Manager *manager, struct
> event *event) {
> +@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager *manager, struct
> event *event) {
>                           return true;
>                   }
>
> @@ -347,5 +353,5 @@ index e9dd2f4..0abc28e 100644
>                   if (event->devpath[common] == '/') {
>                           event->delaying_seqnum = loop_event->seqnum;
>  --
> -2.8.3
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
> b/meta/recipes-core/systemd/systemd/0015-systemd-user-
> avoid-using-system-auth.patch
> deleted file mode 100644
> index 6e6f344..0000000
> --- a/meta/recipes-core/systemd/systemd/0015-systemd-user-
> avoid-using-system-auth.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Subject: [PATCH 15/36] systemd-user: avoid using system-auth
> -
> -In OE, we don't provide system-auth, instead, we use common-* files.
> -So modify systemd-user file to use common-* files.
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - src/login/systemd-user.m4 | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/login/systemd-user.m4 b/src/login/systemd-user.m4
> -index f188a8e..862d8d7 100644
> ---- a/src/login/systemd-user.m4
> -+++ b/src/login/systemd-user.m4
> -@@ -2,11 +2,11 @@
> - #
> - # Used by systemd --user instances.
> -
> --account  include system-auth
> -+account  include common-account
> -
> - m4_ifdef(`HAVE_SELINUX',
> - session  required pam_selinux.so close
> - session  required pam_selinux.so nottys open
> - )m4_dnl
> - session  required pam_loginuid.so
> --session  include system-auth
> -+session  include common-session
> ---
> -2.8.3
> -
> diff --git a/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
> b/meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
> similarity index 77%
> rename from meta/recipes-core/systemd/systemd/0018-make-test-dir-
> configurable.patch
> rename to meta/recipes-core/systemd/systemd/0016-make-test-dir-
> configurable.patch
> index 5d13e4a..10d1df5 100644
> --- a/meta/recipes-core/systemd/systemd/0018-make-test-dir-
> configurable.patch
> +++ b/meta/recipes-core/systemd/systemd/0016-make-test-dir-
> configurable.patch
> @@ -1,4 +1,7 @@
> -Subject: [PATCH 18/36] make test dir configurable
> +From 218bbc555a37f9373fbb7f03c744eb65109d3470 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 20:47:37 -0800
> +Subject: [PATCH 16/19] make test dir configurable
>
>  Upstream-Status: Pending
>
> @@ -6,17 +9,17 @@ test maybe be run on target in cross-compile
> environment, and test dir
>  is not the compilation dir, so make it configurable
>
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   Makefile.am  | 2 +-
>   configure.ac | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index a94636a..dbd3386 100644
> +index 229492a..e997d82 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -207,7 +207,7 @@ AM_CPPFLAGS = \
> +@@ -214,7 +214,7 @@ AM_CPPFLAGS = \
>         -DROOTLIBDIR=\"$(rootlibdir)\" \
>         -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
>         -DROOTHOMEDIR=\"$(roothomedir)\" \
> @@ -26,10 +29,10 @@ index a94636a..dbd3386 100644
>         -I $(top_builddir)/src/basic \
>         -I $(top_srcdir)/src/basic \
>  diff --git a/configure.ac b/configure.ac
> -index 45aae8a..c53fae2 100644
> +index 1de0066..b12e320 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1518,6 +1518,11 @@ AC_ARG_WITH([roothomedir],
> +@@ -1535,6 +1535,11 @@ AC_ARG_WITH([roothomedir],
>           [],
>           [with_roothomedir=/root])
>
> @@ -41,7 +44,7 @@ index 45aae8a..c53fae2 100644
>   AC_ARG_WITH([pamlibdir],
>           AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM
> modules]),
>           [],
> -@@ -1603,6 +1608,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
> +@@ -1621,6 +1626,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
>   AC_SUBST([rootprefix], [$with_rootprefix])
>   AC_SUBST([rootlibdir], [$with_rootlibdir])
>   AC_SUBST([roothomedir], [$with_roothomedir])
> @@ -49,7 +52,7 @@ index 45aae8a..c53fae2 100644
>
>   AC_CONFIG_FILES([
>           Makefile
> -@@ -1695,6 +1701,7 @@ AC_MSG_RESULT([
> +@@ -1712,6 +1718,7 @@ AC_MSG_RESULT([
>           lib dir:                           ${libdir}
>           rootlib dir:                       ${with_rootlibdir}
>           root home dir:                     ${with_roothomedir}
> @@ -58,5 +61,5 @@ index 45aae8a..c53fae2 100644
>           SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
>           Build Python:                      ${PYTHON}
>  --
> -2.8.3
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch
> b/meta/recipes-core/systemd/systemd/0017-remove-duplicate-
> include-uchar.h.patch
> similarity index 81%
> rename from meta/recipes-core/systemd/systemd/0019-remove-duplicate-
> include-uchar.h.patch
> rename to meta/recipes-core/systemd/systemd/0017-remove-duplicate-
> include-uchar.h.patch
> index 17592f8..77dbd6e 100644
> --- a/meta/recipes-core/systemd/systemd/0019-remove-duplicate-
> include-uchar.h.patch
> +++ b/meta/recipes-core/systemd/systemd/0017-remove-duplicate-
> include-uchar.h.patch
> @@ -1,14 +1,12 @@
> -From 3ca534935460647fed66e31aaa90b364e29eab5c Mon Sep 17 00:00:00 2001
> +From e78af874fc9f3d3af49498b8207109993d93a596 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 22 Feb 2016 05:59:01 +0000
> -Subject: [PATCH 1/2] remove duplicate include uchar.h
> +Subject: [PATCH 17/19] remove duplicate include uchar.h
>
>  missing.h already includes it
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> -Upstream-Status: Pending
> -
>   src/basic/escape.h | 1 -
>   src/basic/utf8.h   | 1 -
>   2 files changed, 2 deletions(-)
> @@ -26,7 +24,7 @@ index deaa4de..36d437c 100644
>   #include "string-util.h"
>   #include "missing.h"
>  diff --git a/src/basic/utf8.h b/src/basic/utf8.h
> -index 12c272d..bea93a6 100644
> +index f9b9c94..6ac9a3c 100644
>  --- a/src/basic/utf8.h
>  +++ b/src/basic/utf8.h
>  @@ -22,7 +22,6 @@
> @@ -38,5 +36,5 @@ index 12c272d..bea93a6 100644
>   #include "macro.h"
>   #include "missing.h"
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch
> b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.
> h-in-configure.patch
> similarity index 76%
> rename from meta/recipes-core/systemd/systemd/0020-check-for-uchar.
> h-in-configure.patch
> rename to meta/recipes-core/systemd/systemd/0018-check-for-uchar.
> h-in-configure.patch
> index a027fad..5824033 100644
> --- a/meta/recipes-core/systemd/systemd/0020-check-for-uchar.
> h-in-configure.patch
> +++ b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.
> h-in-configure.patch
> @@ -1,23 +1,21 @@
> -From e06eec89a22719c38e257fe07afff18e359114cb Mon Sep 17 00:00:00 2001
> +From 7cc0b19d244023c7b3e557765b03b7971e047f29 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 22 Feb 2016 06:02:38 +0000
> -Subject: [PATCH 2/2] check for uchar.h in configure
> +Subject: [PATCH 18/19] check for uchar.h in configure
>
>  Use ifdef to include uchar.h
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> -Upstream-Status: Pending
> -
>   configure.ac        | 1 +
>   src/basic/missing.h | 2 ++
>   2 files changed, 3 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index ecc3e6b..62f934e 100644
> +index b12e320..4e6dfdf 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -297,6 +297,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" =
> "xyes"])
> +@@ -298,6 +298,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" =
> "xyes"])
>
>   # ------------------------------------------------------------
> ------------------
>
> @@ -26,10 +24,10 @@ index ecc3e6b..62f934e 100644
>   AC_CHECK_HEADERS([linux/btrfs.h], [], [])
>   AC_CHECK_HEADERS([linux/memfd.h], [], [])
>  diff --git a/src/basic/missing.h b/src/basic/missing.h
> -index f704422..a1baa95 100644
> +index 4936873..ce79404 100644
>  --- a/src/basic/missing.h
>  +++ b/src/basic/missing.h
> -@@ -34,7 +34,9 @@
> +@@ -35,7 +35,9 @@
>   #include <stdlib.h>
>   #include <sys/resource.h>
>   #include <sys/syscall.h>
> @@ -40,5 +38,5 @@ index f704422..a1baa95 100644
>
>   #ifdef HAVE_AUDIT
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0022-socket-util-don-
> t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/
> systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> similarity index 69%
> rename from meta/recipes-core/systemd/systemd/0022-socket-util-don-
> t-fail-if-libc-doesn-t-support-IDN.patch
> rename to meta/recipes-core/systemd/systemd/0019-socket-util-don-
> t-fail-if-libc-doesn-t-support-IDN.patch
> index 96fc3d8..66aa4ca 100644
> --- a/meta/recipes-core/systemd/systemd/0022-socket-util-don-
> t-fail-if-libc-doesn-t-support-IDN.patch
> +++ b/meta/recipes-core/systemd/systemd/0019-socket-util-don-
> t-fail-if-libc-doesn-t-support-IDN.patch
> @@ -1,23 +1,23 @@
> -From 71e710a6c8a3879af7d50c4cb995e0615deba5c3 Mon Sep 17 00:00:00 2001
> -From: Emil Renner Berthing <systemd@esmil.dk>
> -Date: Sat, 12 Sep 2015 19:56:52 +0000
> -Subject: [PATCH 29/38] socket-util: don't fail if libc doesn't support IDN
> +From 289554d87e4fd96cae08c0fb449bf41d5641cd24 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 9 Nov 2016 20:49:53 -0800
> +Subject: [PATCH 19/19] socket-util: don't fail if libc doesn't support IDN
> +
> +Upstream-Status: Pending
>
>  Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> -Upstream-Status: Pending
> -
>   src/basic/socket-util.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
>  diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
> -index 5851268..aefaca5 100644
> +index 4ebf106..53b9a12 100644
>  --- a/src/basic/socket-util.c
>  +++ b/src/basic/socket-util.c
> -@@ -44,6 +44,15 @@
> - #include "string-util.h"
> +@@ -47,6 +47,15 @@
>   #include "user-util.h"
> + #include "utf8.h"
>   #include "util.h"
>  +/* Don't fail if the standard library
>  + * doesn't support IDN */
> @@ -32,5 +32,5 @@ index 5851268..aefaca5 100644
>   int socket_address_parse(SocketAddress *a, const char *s) {
>           char *e, *n;
>  --
> -1.8.3.1
> +2.10.2
>
> diff --git a/meta/recipes-core/systemd/systemd/0021-include-missing.
> h-for-getting-secure_getenv-definiti.patch b/meta/recipes-core/systemd/
> systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
> deleted file mode 100644
> index 5797a29..0000000
> --- a/meta/recipes-core/systemd/systemd/0021-include-missing.
> h-for-getting-secure_getenv-definiti.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 6cedbaee7964f6a6c61b9f2c8f0b87cef9370424 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 15 Dec 2015 22:51:55 +0000
> -Subject: [PATCH 26/38] include missing.h for getting secure_getenv
> definition
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/basic/user-util.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/basic/user-util.c b/src/basic/user-util.c
> -index 55672b3..22c4a23 100644
> ---- a/src/basic/user-util.c
> -+++ b/src/basic/user-util.c
> -@@ -38,6 +38,7 @@
> - #include "path-util.h"
> - #include "string-util.h"
> - #include "user-util.h"
> -+#include "missing.h"
> -
> - bool uid_is_valid(uid_t uid) {
> -
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
> b/meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
> deleted file mode 100644
> index 5ecb9c3..0000000
> --- a/meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Subject: Fix CVE-2016-7795
> -
> -This undoes 531ac2b. I acked that patch without looking at the code
> -carefully enough. There are two problems:
> -- we want to process the fds anyway
> -- in principle empty notification messages are valid, and we should
> -  process them as usual, including logging using log_unit_debug().
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-7795
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/core/manager.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/core/manager.c b/src/core/manager.c
> -index 7838f56..f165d08e 100644
> ---- a/src/core/manager.c
> -+++ b/src/core/manager.c
> -@@ -1589,13 +1589,12 @@ static int manager_dispatch_cgroups_agent_fd(sd_event_source
> *source, int fd, ui
> -         return 0;
> - }
> -
> --static void manager_invoke_notify_message(Manager *m, Unit *u, pid_t
> pid, const char *buf, size_t n, FDSet *fds) {
> -+static void manager_invoke_notify_message(Manager *m, Unit *u, pid_t
> pid, const char *buf, FDSet *fds) {
> -         _cleanup_strv_free_ char **tags = NULL;
> -
> -         assert(m);
> -         assert(u);
> -         assert(buf);
> --        assert(n > 0);
> -
> -         tags = strv_split(buf, "\n\r");
> -         if (!tags) {
> -@@ -1688,25 +1687,27 @@ static int manager_dispatch_notify_fd(sd_event_source
> *source, int fd, uint32_t
> -                 return 0;
> -         }
> -
> -+        /* The message should be a string. Here we make sure it's
> NUL-terminated,
> -+         * but only the part until first NUL will be used anyway. */
> -         buf[n] = 0;
> -
> -         /* Notify every unit that might be interested, but try
> -          * to avoid notifying the same one multiple times. */
> -         u1 = manager_get_unit_by_pid_cgroup(m, ucred->pid);
> -         if (u1) {
> --                manager_invoke_notify_message(m, u1, ucred->pid, buf,
> n, fds);
> -+                manager_invoke_notify_message(m, u1, ucred->pid, buf,
> fds);
> -                 found = true;
> -         }
> -
> -         u2 = hashmap_get(m->watch_pids1, PID_TO_PTR(ucred->pid));
> -         if (u2 && u2 != u1) {
> --                manager_invoke_notify_message(m, u2, ucred->pid, buf,
> n, fds);
> -+                manager_invoke_notify_message(m, u2, ucred->pid, buf,
> fds);
> -                 found = true;
> -         }
> -
> -         u3 = hashmap_get(m->watch_pids2, PID_TO_PTR(ucred->pid));
> -         if (u3 && u3 != u2 && u3 != u1) {
> --                manager_invoke_notify_message(m, u3, ucred->pid, buf,
> n, fds);
> -+                manager_invoke_notify_message(m, u3, ucred->pid, buf,
> fds);
> -                 found = true;
> -         }
> -
> ---
> -2.8.3
> -
> diff --git a/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
> b/meta/recipes-core/systemd/systemd/udev-re-enable-mount-
> propagation-for-udevd.patch
> deleted file mode 100644
> index 23e22d4..0000000
> --- a/meta/recipes-core/systemd/systemd/udev-re-enable-mount-
> propagation-for-udevd.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From: Michael Biebl <biebl@debian.org>
> -Date: Sat, 27 Sep 2014 04:19:24 +0200
> -Subject: udev: re-enable mount propagation for udevd
> -
> -Upstream-Status: Backport [http://http.debian.net/
> debian/pool/main/s/systemd/systemd_215-17+deb8u4.debian.tar.xz]
> -
> -laptop-mode-tools remounts file systems from within a udev rule to apply
> -certain mount options. With MountFlags=slave, those mounts then become
> private
> -to the systemd-udevd namespace and are no longer accessible from outside
> the
> -namespace.
> -While the root cause is the broken behaviour of laptop-mode-tools, with
> mount
> -propagation turned off, this can result in a read-only root file system.
> -Therefore revert the relevant parts from commit
> -c2c13f2df42e0691aecabe3979ea81cd7faa35c7 to re-enable mount propagation
> for
> -udevd.
> -
> -Once affected packages have been fixed, this patch should be dropped
> -again.
> -
> -Closes: #762018
> -diff --git a/units/systemd-udevd.service.in b/units/
> systemd-udevd.service.in
> -index e7216d6..1e9a600 100644
> ---- a/units/systemd-udevd.service.in
> -+++ b/units/systemd-udevd.service.in
> -@@ -21,6 +21,5 @@ Sockets=systemd-udevd-control.socket
> systemd-udevd-kernel.socket
> - Restart=always
> - RestartSec=0
> - ExecStart=@rootlibexecdir@/systemd-udevd
> --MountFlags=slave
> - KillMode=mixed
> - WatchdogSec=1min
> diff --git a/meta/recipes-core/systemd/systemd_230.bb
> b/meta/recipes-core/systemd/systemd_232.bb
> similarity index 96%
> rename from meta/recipes-core/systemd/systemd_230.bb
> rename to meta/recipes-core/systemd/systemd_232.bb
> index f60dd60..def6e05 100644
> --- a/meta/recipes-core/systemd/systemd_230.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -25,18 +25,13 @@ SRC_URI += " \
>             file://0010-implment-systemd-sysv-install-for-OE.patch \
>             file://0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
> \
>             file://0012-rules-whitelist-hd-devices.patch \
> -           file://0013-sysv-generator-add-support-for-executing-scripts-und.patch
> \
> -           file://0014-Make-root-s-home-directory-configurable.patch \
> -           file://0015-systemd-user-avoid-using-system-auth.patch \
> -           file://0016-Revert-rules-remove-firmware-loading-rules.patch \
> -           file://0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
> \
> -           file://0018-make-test-dir-configurable.patch \
> -           file://0019-remove-duplicate-include-uchar.h.patch \
> -           file://0020-check-for-uchar.h-in-configure.patch \
> -           file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch
> \
> -           file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> \
> -           file://udev-re-enable-mount-propagation-for-udevd.patch \
> -           file://CVE-2016-7795.patch \
> +           file://0013-Make-root-s-home-directory-configurable.patch \
> +           file://0014-Revert-rules-remove-firmware-loading-rules.patch \
> +           file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
> \
> +           file://0016-make-test-dir-configurable.patch \
> +           file://0017-remove-duplicate-include-uchar.h.patch \
> +           file://0018-check-for-uchar.h-in-configure.patch \
> +           file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
> \
>  "
>  SRC_URI_append_libc-uclibc = "\
>             file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
> \
> @@ -61,7 +56,6 @@ PACKAGECONFIG ??= "xz \
>                     timedated \
>                     timesyncd \
>                     localed \
> -                   kdbus \
>                     ima \
>                     smack \
>                     logind \
> @@ -96,7 +90,6 @@ PACKAGECONFIG[timedated] = "--enable-timedated,--disable-
> timedated"
>  PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
>  PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
>  PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
> -PACKAGECONFIG[kdbus] = "--enable-kdbus,--disable-kdbus"
>  PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
>  PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
>  # libseccomp is found in meta-security
> @@ -282,7 +275,7 @@ python populate_packages_prepend (){
>      systemdlibdir = d.getVar("rootlibdir", True)
>      do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s',
> 'Systemd %s library', extra_depends='', allow_links=True)
>  }
> -PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
> +PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
>
>  PACKAGES =+ "\
>      ${PN}-gui \
> @@ -491,6 +484,7 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> 'serial-getty-genera
>                        os-release \
>  "
>
> +INSANE_SKIP_${PN} += "dev-so"
>  INSANE_SKIP_${PN}-doc += " libdir"
>
>  PACKAGES =+ "udev udev-hwdb"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141058e1fa823054259b66d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This still breaks systemd-boot.<br><br>NOTE: Applying patc=
h &#39;0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch&#39;=
 (../meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-lo=
oking-for-relative-opti.patch)<br>ERROR: Command Error: &#39;quilt --quiltr=
c TOPDIR/tmp/sysroots/x86_64-linux/etc/quiltrc push&#39; exited with 0 =C2=
=A0Output:<br>Applying patch 0001-use-lnr-wrapper-instead-of-looking-for-re=
lative-opti.patch<br>patching file Makefile.am<br>Hunk #1 FAILED at 247.<br=
>Hunk #2 succeeded at 320 (offset -1 lines).<br>Hunk #3 FAILED at 2906.<br>=
2 out of 3 hunks FAILED -- rejects in file Makefile.am<br>patching file <a =
href=3D"http://configure.ac">configure.ac</a><br>Patch 0001-use-lnr-wrapper=
-instead-of-looking-for-relative-opti.patch does not apply (enforce with -f=
)<br><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 23 November 2016 at 09:28, Khem Raj <span dir=3D=
"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* Drop s=
upport for rcS.d SysV init scripts.<br>
=C2=A0 These are prone to cause dependency loops, and almost all packages w=
ith<br>
=C2=A0 rcS scripts now ship a native systemd service.<br>
<br>
* Drop mount propagation patch, it only happens with libseccomp, OE doesnt<=
br>
=C2=A0 enable it<br>
<br>
* kdbus option has disappeared from configure<br>
<br>
* Ignore dev-so for PN now since systemd introduced private .so see<br>
=C2=A0 <a href=3D"https://github.com/systemd/systemd/issues/3810" rel=3D"no=
referrer" target=3D"_blank">https://github.com/systemd/<wbr>systemd/issues/=
3810</a><br>
<br>
* Add libnss* to PACKAGES_DYNAMIC for libnss-resolve to work correctly<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<wbr>systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0....c-Change-the-default-<wbr>device-timeout-to-2.patch |=C2=A0 =C2=
=A08 +-<br>
=C2=A0...r-getty-to-agetty-in-<wbr>console-setup-system.patch |=C2=A0 10 +-=
<br>
=C2=A0.../systemd/0003-define-exp10-<wbr>if-missing.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +-<br>
=C2=A0...nv-when-secure-versions-<wbr>are-not-available.patch |=C2=A0 21 ++=
--<br>
=C2=A0...t-install-dependency-links-<wbr>at-install-tim.patch |=C2=A0 10 +-=
<br>
=C2=A0...heck-for-additional-<wbr>features-that-uclibc-.patch |=C2=A0 10 +-=
<br>
=C2=A0...pper-instead-of-looking-<wbr>for-relative-opti.patch |=C2=A0 38 ++=
----<br>
=C2=A0...wn-Use-execvpe-only-when-<wbr>libc-supports-it.patch |=C2=A0 16 +-=
-<br>
=C2=A0...-unimplemented-_SC_PHYS_<wbr>PAGES-system-conf.patch |=C2=A0 27 ++=
+--<br>
=C2=A0...0010-implment-systemd-sysv-<wbr>install-for-OE.patch |=C2=A0 =C2=
=A06 +-<br>
=C2=A0...nes-Build-conditionally-<wbr>when-HAVE_MYHOSTN.patch |=C2=A0 12 +-=
<br>
=C2=A0.../systemd/0012-rules-<wbr>whitelist-hd-devices.patch=C2=A0 |=C2=A0 =
21 ++--<br>
=C2=A0...-Make-root-s-home-<wbr>directory-configurable.patch} |=C2=A0 90 ++=
+++---------<br>
=C2=A0...tor-add-support-for-<wbr>executing-scripts-und.patch | 133 -------=
--------------<br>
=C2=A0...vert-rules-remove-firmware-<wbr>loading-rules.patch} |=C2=A0 =C2=
=A06 +-<br>
=C2=A0...remove-userspace-firmware-<wbr>loading-suppor.patch} |=C2=A0 58 ++=
+++----<br>
=C2=A0...0015-systemd-user-avoid-<wbr>using-system-auth.patch |=C2=A0 35 --=
----<br>
=C2=A0...patch =3D&gt; 0016-make-test-dir-<wbr>configurable.patch} |=C2=A0 =
21 ++--<br>
=C2=A0...=3D&gt; 0017-remove-duplicate-include-<wbr>uchar.h.patch} |=C2=A0 =
10 +-<br>
=C2=A0...h =3D&gt; 0018-check-for-uchar.h-in-<wbr>configure.patch} |=C2=A0 =
16 ++-<br>
=C2=A0...l-don-t-fail-if-libc-doesn-<wbr>t-support-IDN.patch} |=C2=A0 20 ++=
--<br>
=C2=A0...sing.h-for-getting-secure_<wbr>getenv-definiti.patch |=C2=A0 27 --=
---<br>
=C2=A0.../systemd/systemd/CVE-2016-<wbr>7795.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 69 -----------<br>
=C2=A0...dev-re-enable-mount-<wbr>propagation-for-udevd.patch |=C2=A0 31 --=
---<br>
=C2=A0.../systemd/{<a href=3D"http://systemd_230.bb" rel=3D"noreferrer" tar=
get=3D"_blank">systemd_230.bb</a> =3D&gt; <a href=3D"http://systemd_232.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_232.bb</a>}=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 24 ++--<br>
=C2=A026 files changed, 196 insertions(+), 539 deletions(-)<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0014-Make-root-s-<wbr>=
home-directory-configurable.<wbr>patch =3D&gt; 0013-Make-root-s-home-<wbr>d=
irectory-configurable.patch} (66%)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0013-sysv-g=
enerator-<wbr>add-support-for-executing-<wbr>scripts-und.patch<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0016-Revert-rules-<wbr=
>remove-firmware-loading-rules.<wbr>patch =3D&gt; 0014-Revert-rules-remove-=
<wbr>firmware-loading-rules.patch} (84%)<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0017-Revert-udev-<wbr>=
remove-userspace-firmware-<wbr>loading-suppor.patch =3D&gt; 0015-Revert-ude=
v-remove-<wbr>userspace-firmware-loading-<wbr>suppor.patch} (89%)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0015-system=
d-user-<wbr>avoid-using-system-auth.patch<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0018-make-test-dir-<wb=
r>configurable.patch =3D&gt; 0016-make-test-dir-<wbr>configurable.patch} (7=
7%)<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0019-remove-<wbr>dupli=
cate-include-uchar.h.<wbr>patch =3D&gt; 0017-remove-duplicate-include-<wbr>=
uchar.h.patch} (81%)<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0020-check-for-uchar.<=
wbr>h-in-configure.patch =3D&gt; 0018-check-for-uchar.h-in-<wbr>configure.p=
atch} (76%)<br>
=C2=A0rename meta/recipes-core/systemd/<wbr>systemd/{0022-socket-util-don-<=
wbr>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch =3D&gt; 0019-socket-util-=
don-t-fail-<wbr>if-libc-doesn-t-support-IDN.<wbr>patch} (69%)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/0021-includ=
e-missing.<wbr>h-for-getting-secure_getenv-<wbr>definiti.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/CVE-2016-77=
95.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<wbr>systemd/udev-re-ena=
ble-mount-<wbr>propagation-for-udevd.patch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_230.bb" r=
el=3D"noreferrer" target=3D"_blank">sys<wbr>temd_230.bb</a> =3D&gt; <a href=
=3D"http://systemd_232.bb" rel=3D"noreferrer" target=3D"_blank">systemd_232=
.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd.inc b/meta/recipes-core=
/systemd/<wbr>systemd.inc<br>
index f800f42..29e0be6 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd.inc<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd.inc<br>
@@ -14,12 +14,10 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D<wbr>751419260aa=
954499f7abaabaa882b<wbr>be \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D<wbr>4fbd65380cdd255951079008b36451<wbr>6c&=
quot;<br>
<br>
-SRCREV =3D &quot;<wbr>3a74d4fc90cb322a4784a3515bef71<wbr>18c8f8c5ba&quot;<=
br>
+SRCREV =3D &quot;<wbr>a1e2ef7ec912902d8142e7cb5830cb<wbr>fb47dba86c&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd.=
git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/systemd=
/<wbr>systemd.git;protocol=3Dgit</a>&quot;<br>
<br>
-PV =3D &quot;230+git${SRCPV}&quot;<br>
-<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0LDFLAGS_append_libc-uclibc =3D &quot; -lrt -lssp_nonshared -lssp &quo=
t;<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-core-device.c-<wbr=
>Change-the-default-device-<wbr>timeout-to-2.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0001-core-device.c-<wbr>Change-the-default-device-<wbr>tim=
eout-to-2.patch<br>
index f7ef7a3..ee2cd6c 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0001-core-device.c-<wbr>Change=
-the-default-device-<wbr>timeout-to-2.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0001-core-device.c-<wbr>Change=
-the-default-device-<wbr>timeout-to-2.patch<br>
@@ -1,7 +1,7 @@<br>
-From 3bc4552117879f57522b5972b72472<wbr>9ca993f1ea Mon Sep 17 00:00:00 200=
1<br>
+From a544d6d15f5c418084f322349aafe3<wbr>41128d5fca Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 14 Dec 2015 04:09:19 +0000<br>
-Subject: [PATCH 01/36] core/device.c: Change the default device timeout to=
 240<br>
+Subject: [PATCH 01/19] core/device.c: Change the default device timeout to=
 240<br>
=C2=A0 sec.<br>
=C2=A0MIME-Version: 1.0<br>
=C2=A0Content-Type: text/plain; charset=3DUTF-8<br>
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/core/device.c b/src/core/device.c<br>
-index d201dc5..340d62a 100644<br>
+index c572a67..f90774e 100644<br>
=C2=A0--- a/src/core/device.c<br>
=C2=A0+++ b/src/core/device.c<br>
=C2=A0@@ -112,7 +112,7 @@ static void device_init(Unit *u) {<br>
@@ -29,5 +29,5 @@ index d201dc5..340d62a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u-&gt;ignore_on_isolate =3D true;<br>
=C2=A0 }<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0002-units-Prefer-<wbr>=
getty-to-agetty-in-console-<wbr>setup-system.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0002-units-Prefer-<wbr>getty-to-agetty-in-console-<wbr>set=
up-system.patch<br>
index 28939eb..951a28d 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0002-units-Prefer-<wbr>getty-t=
o-agetty-in-console-<wbr>setup-system.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0002-units-Prefer-<wbr>getty-t=
o-agetty-in-console-<wbr>setup-system.patch<br>
@@ -1,7 +1,7 @@<br>
-From e5f405aba347d216e7f2b73d7dd681<wbr>b13be442e3 Mon Sep 17 00:00:00 200=
1<br>
+From 8736d9b9bb492f60e8f3a1a7fb5a05<wbr>ba3201d86b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Fri, 20 Feb 2015 05:29:15 +0000<br>
-Subject: [PATCH 02/36] units: Prefer getty to agetty in console setup syst=
emd<br>
+Subject: [PATCH 02/19] units: Prefer getty to agetty in console setup syst=
emd<br>
=C2=A0 units<br>
<br>
=C2=A0Upstream-Status: Inappropriate [configuration specific]<br>
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/units/getty@.service.m4 b/units/getty@.service.m4<br>
-index 46164ab..bdf6ec8 100644<br>
+index 5b82c13..e729469 100644<br>
=C2=A0--- a/units/getty@.service.m4<br>
=C2=A0+++ b/units/getty@.service.m4<br>
-@@ -27,7 +27,7 @@ ConditionPathExists=3D/dev/tty0<br>
+@@ -33,7 +33,7 @@ ConditionPathExists=3D/dev/tty0<br>
<br>
=C2=A0 [Service]<br>
=C2=A0 # the VT is cleared by TTYVTDisallocate<br>
@@ -40,5 +40,5 @@ index 4522d0d..e6d499d 100644<br>
=C2=A0 Restart=3Dalways<br>
=C2=A0 UtmpIdentifier=3D%I<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0003-define-exp10-if-<w=
br>missing.patch b/meta/recipes-core/systemd/<wbr>systemd/0003-define-exp10=
-if-<wbr>missing.patch<br>
index e62d580..37c6ac5 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0003-define-exp10-if-<wbr>miss=
ing.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0003-define-exp10-if-<wbr>miss=
ing.patch<br>
@@ -1,4 +1,7 @@<br>
-Subject: [PATCH 03/36] define exp10 if missing<br>
+From b383c286f58184575216b2bf6f185b<wbr>a2ad648956 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 19:25:45 -0800<br>
+Subject: [PATCH 03/19] define exp10 if missing<br>
<br>
=C2=A0Inspired by: <a href=3D"http://peter.korsgaard.com/patches/alsa-utils=
/alsamixer-fix-build-on-uClibc-exp10.patch" rel=3D"noreferrer" target=3D"_b=
lank">http://peter.korsgaard.com/<wbr>patches/alsa-utils/alsamixer-<wbr>fix=
-build-on-uClibc-exp10.<wbr>patch</a><br>
<br>
@@ -8,16 +11,15 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Samuel Martin &lt;<a href=3D"mailto:s.martin49@gmail.c=
om">s.martin49@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 src/basic/missing.h | 5 +++++<br>
=C2=A0 1 file changed, 5 insertions(+)<br>
<br>
=C2=A0diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
-index 651e414..fafa233 100644<br>
+index 4c013be..4a3fd9c 100644<br>
=C2=A0--- a/src/basic/missing.h<br>
=C2=A0+++ b/src/basic/missing.h<br>
-@@ -1013,4 +1013,9 @@ typedef int32_t key_serial_t;<br>
+@@ -1078,4 +1078,9 @@ typedef int32_t key_serial_t;<br>
<br>
=C2=A0 #endif<br>
<br>
@@ -28,5 +30,5 @@ index 651e414..fafa233 100644<br>
=C2=A0+<br>
=C2=A0 #include &quot;missing_syscall.h&quot;<br>
=C2=A0--<br>
-2.8.3<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0004-Use-getenv-when-<w=
br>secure-versions-are-not-<wbr>available.patch b/meta/recipes-core/systemd=
/<wbr>systemd/0004-Use-getenv-when-<wbr>secure-versions-are-not-<wbr>availa=
ble.patch<br>
index 989a1fa..ab2cbe0 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0004-Use-getenv-when-<wbr>secu=
re-versions-are-not-<wbr>available.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0004-Use-getenv-when-<wbr>secu=
re-versions-are-not-<wbr>available.patch<br>
@@ -1,7 +1,7 @@<br>
-From bb8d8148b16572ae17d3c308552cf7<wbr>3915386b05 Mon Sep 17 00:00:00 200=
1<br>
+From 5765cda4f7243e240b1e8723dc536f<wbr>b20503d544 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
-Date: Sat, 12 Sep 2015 19:10:04 +0000<br>
-Subject: [PATCH 04/36] Use getenv when secure versions are not available<b=
r>
+Date: Wed, 9 Nov 2016 19:28:32 -0800<br>
+Subject: [PATCH 04/19] Use getenv when secure versions are not available<b=
r>
<br>
=C2=A0musl doesnt implement secure version, so we default<br>
=C2=A0to it if configure does not detect a secure imeplementation<br>
@@ -9,19 +9,14 @@ to it if configure does not detect a secure imeplementati=
on<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
=C2=A0Upstream-Status: Denied<br>
=C2=A0---<br>
- src/basic/missing.h | 3 +--<br>
- 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+ src/basic/missing.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
-index ee7e7ea..3170429 100644<br>
+index 4a3fd9c..4936873 100644<br>
=C2=A0--- a/src/basic/missing.h<br>
=C2=A0+++ b/src/basic/missing.h<br>
-@@ -585,12 +585,11 @@ static inline int name_to_handle_at(int fd, const ch=
ar *name, struct file_handle<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return syscall(__NR_name_to_handle_<wbr>=
at, fd, name, handle, mnt_id, flags);<br>
- }<br>
- #endif<br>
--<br>
- #ifndef HAVE_SECURE_GETENV<br>
+@@ -529,7 +529,7 @@ struct btrfs_ioctl_quota_ctl_args {<br>
=C2=A0 #=C2=A0 ifdef HAVE___SECURE_GETENV<br>
=C2=A0 #=C2=A0 =C2=A0 define secure_getenv __secure_getenv<br>
=C2=A0 #=C2=A0 else<br>
@@ -31,5 +26,5 @@ index ee7e7ea..3170429 100644<br>
=C2=A0 #endif<br>
<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>=
install-dependency-links-at-<wbr>install-tim.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install-dependency-links-at-<wbr>in=
stall-tim.patch<br>
index f69e26e..7016e98 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install=
-dependency-links-at-<wbr>install-tim.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0005-binfmt-Don-t-<wbr>install=
-dependency-links-at-<wbr>install-tim.patch<br>
@@ -1,7 +1,7 @@<br>
-From 3436b12d40bf4f4ab7e3e16600e5f6<wbr>c35a470da4 Mon Sep 17 00:00:00 200=
1<br>
+From 74450f0dbad2f8478c26eeaa46d4e4<wbr>a987858f45 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Fri, 20 Feb 2015 05:03:44 +0000<br>
-Subject: [PATCH 05/36] binfmt: Don&#39;t install dependency links at insta=
ll time<br>
+Subject: [PATCH 05/19] binfmt: Don&#39;t install dependency links at insta=
ll time<br>
=C2=A0 for the binfmt services<br>
<br>
=C2=A0use [Install] blocks so that they get created when the service is ena=
bled<br>
@@ -24,10 +24,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 3 files changed, 8 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.am b/Makefile.am<br>
-index 03341fc..629740f 100644<br>
+index 50da458..29ed1dd 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -4387,10 +4387,6 @@ INSTALL_DIRS +=3D \<br>
+@@ -4635,10 +4635,6 @@ INSTALL_DIRS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(prefix)/lib/binfmt.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(sysconfdir)/binfmt.d<br>
<br>
@@ -70,5 +70,5 @@ index d53073e..8c57ee0 100644<br>
=C2=A0+[Install]<br>
=C2=A0+WantedBy=3Dsysinit.target<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0006-configure-Check-<w=
br>for-additional-features-that-<wbr>uclibc-.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0006-configure-Check-<wbr>for-additional-features-that-<wb=
r>uclibc-.patch<br>
index 0d63755..43a0d3f 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0006-configure-Check-<wbr>for-=
additional-features-that-<wbr>uclibc-.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0006-configure-Check-<wbr>for-=
additional-features-that-<wbr>uclibc-.patch<br>
@@ -1,7 +1,7 @@<br>
-From bb6f1d8a000b337280541afde7cccd<wbr>cfe03cdeb1 Mon Sep 17 00:00:00 200=
1<br>
+From 82d837b76618a773485b96e38b7b91<wbr>083a7437e8 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Fri, 20 Feb 2015 05:05:45 +0000<br>
-Subject: [PATCH 06/36] configure: Check for additional features that uclib=
c<br>
+Subject: [PATCH 06/19] configure: Check for additional features that uclib=
c<br>
=C2=A0 doesnt support<br>
<br>
=C2=A0This helps in supporting uclibc which does not have all features that=
<br>
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 18 insertions(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index f51533c..0239fd0 100644<br>
+index 7f6b3b9..7c4b5a2 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -112,6 +112,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umoun=
t], [$PATH:/usr/sbin:/sbin]<br>
+@@ -110,6 +110,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umoun=
t], [$PATH:/usr/sbin:/sbin]<br>
<br>
=C2=A0 AS_IF([! ln --relative --help &gt; /dev/null 2&gt;&amp;1], [AC_MSG_E=
RROR([*** ln doesn&#39;t support --relative ***])])<br>
<br>
@@ -44,5 +44,5 @@ index f51533c..0239fd0 100644<br>
<br>
=C2=A0 AC_CHECK_TOOL(OBJCOPY, objcopy)<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<w=
br>instead-of-looking-for-<wbr>relative-opti.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>instead-of-looking-for-<wbr>rela=
tive-opti.patch<br>
index 12f6ace..fad69a5 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>inst=
ead-of-looking-for-<wbr>relative-opti.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0007-use-lnr-wrapper-<wbr>inst=
ead-of-looking-for-<wbr>relative-opti.patch<br>
@@ -1,31 +1,22 @@<br>
-From fa5e137fbd2fb081ae897575377d71<wbr>8ee8cb6349 Mon Sep 17 00:00:00 200=
1<br>
+From a3482c91642cf568b3ac27fa6c0cb3<wbr>c6b30669b7 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
-Date: Sun, 20 Dec 2015 04:20:28 +0000<br>
-Subject: [PATCH 07/36] use lnr wrapper instead of looking for --relative<b=
r>
+Date: Wed, 9 Nov 2016 19:32:14 -0800<br>
+Subject: [PATCH 07/19] use lnr wrapper instead of looking for --relative<b=
r>
=C2=A0 option for ln<br>
<br>
=C2=A0Upstream-Status: Inappropriate [OE-Specific]<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
- Makefile.am=C2=A0 | 6 +++---<br>
+ Makefile.am=C2=A0 | 2 +-<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 --<br>
- 2 files changed, 3 insertions(+), 5 deletions(-)<br>
+ 2 files changed, 1 insertion(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.am b/Makefile.am<br>
-index 629740f..82b6553 100644<br>
+index 29ed1dd..02f4017 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -243,7 +243,7 @@ define move-to-rootlibdir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MKDIR_P) $(DESTDI=
R)$(rootlibdir) &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so_img_name=3D$$(re=
adlink $(DESTDIR)$(libdir)/$$libname) &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(DESTDIR)$(l=
ibdir)/$$libname &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LN_S) --relative -f $(=
DESTDIR)$(rootlibdir)/$$so_<wbr>img_name $(DESTDIR)$(libdir)/$$libname &amp=
;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lnr $(DESTDIR)$(rootlibd=
ir)/$$so_<wbr>img_name $(DESTDIR)$(libdir)/$$libname &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv $(DESTDIR)$(libd=
ir)/$$libname.<wbr>* $(DESTDIR)$(rootlibdir); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
- endef<br>
-@@ -317,7 +317,7 @@ define install-relative-aliases<br>
+@@ -320,7 +320,7 @@ define install-relative-aliases<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while [ -n &quot;$$1&quot; ]; do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MKDIR_P) `dirname=
 $(DESTDIR)$$dir/$$2` &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $(DESTDIR)$$d=
ir/$$2 &amp;&amp; \<br>
@@ -34,20 +25,11 @@ index 629740f..82b6553 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift 2 || exit $$?=
; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 endef<br>
-@@ -2781,7 +2781,7 @@ systemd_dbus1_generator_LDADD =3D \<br>
- dbus1-generator-install-hook:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratord=
ir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/<=
wbr>systemd-dbus1-generator<br>
--=C2=A0 =C2=A0 =C2=A0 $(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(<wbr>sys=
temgeneratordir)/systemd-<wbr>dbus1-generator $(DESTDIR)$(usergeneratordir)=
/<wbr>systemd-dbus1-generator<br>
-+=C2=A0 =C2=A0 =C2=A0 $(AM_V_LN)lnr $(DESTDIR)$(<wbr>systemgeneratordir)/s=
ystemd-<wbr>dbus1-generator $(DESTDIR)$(usergeneratordir)/<wbr>systemd-dbus=
1-generator<br>
-<br>
- dbus1-generator-uninstall-<wbr>hook:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(DESTDIR)$(usergeneratordir)/<wbr>system=
d-dbus1-generator<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 0239fd0..c5ab9d0 100644<br>
+index 7c4b5a2..b10c952 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin]=
, [$PATH:/usr/sbin:/sbin])<br>
+@@ -108,8 +108,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin]=
, [$PATH:/usr/sbin:/sbin])<br>
=C2=A0 AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sb=
in:/sbin])<br>
=C2=A0 AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr=
/sbin:/sbin])<br>
<br>
@@ -57,5 +39,5 @@ index 0239fd0..c5ab9d0 100644<br>
<br>
=C2=A0 AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0008-nspawn-Use-<wbr>ex=
ecvpe-only-when-libc-<wbr>supports-it.patch b/meta/recipes-core/systemd/<wb=
r>systemd/0008-nspawn-Use-<wbr>execvpe-only-when-libc-<wbr>supports-it.patc=
h<br>
index 6e6f199..586b5aa 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0008-nspawn-Use-<wbr>execvpe-o=
nly-when-libc-<wbr>supports-it.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0008-nspawn-Use-<wbr>execvpe-o=
nly-when-libc-<wbr>supports-it.patch<br>
@@ -1,7 +1,7 @@<br>
-From ae999ff50efb9cc82537adef7696c6<wbr>f732afcfc8 Mon Sep 17 00:00:00 200=
1<br>
+From 96026a3763264eb41a2c3e374f232f<wbr>6e543284a8 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
-Date: Fri, 20 Feb 2015 05:10:37 +0000<br>
-Subject: [PATCH 08/36] nspawn: Use execvpe only when libc supports it<br>
+Date: Wed, 9 Nov 2016 19:33:49 -0800<br>
+Subject: [PATCH 08/19] nspawn: Use execvpe only when libc supports it<br>
<br>
=C2=A0Upstream-Status: Denied [no desire for uclibc support]<br>
<br>
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 7 insertions(+)<br>
<br>
=C2=A0diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c<br>
-index 5a68fec..65e65ec 100644<br>
+index 9b9ae90..19b47cd 100644<br>
=C2=A0--- a/src/nspawn/nspawn.c<br>
=C2=A0+++ b/src/nspawn/nspawn.c<br>
-@@ -111,6 +111,8 @@ typedef enum LinkJournal {<br>
+@@ -123,6 +123,8 @@ typedef enum LinkJournal {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LINK_GUEST<br>
=C2=A0 } LinkJournal;<br>
<br>
@@ -23,7 +23,7 @@ index 5a68fec..65e65ec 100644<br>
=C2=A0 static char *arg_directory =3D NULL;<br>
=C2=A0 static char *arg_template =3D NULL;<br>
=C2=A0 static char *arg_chdir =3D NULL;<br>
-@@ -2637,7 +2639,12 @@ static int inner_child(<br>
+@@ -2871,7 +2873,12 @@ static int inner_child(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a[0] =3D (ch=
ar*) &quot;/sbin/init&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execve(a[0],=
 a, env_use);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!strv_isempty(arg_parameters)=
<wbr>)<br>
@@ -35,7 +35,7 @@ index 5a68fec..65e65ec 100644<br>
=C2=A0+#endif /* HAVE_EXECVPE */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!arg_chd=
ir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0chdir(home ?: &quot;/root&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* If we cannot change the directory, we&#39;ll end up in =
/, that is expected. */<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0009-util-bypass-<wbr>u=
nimplemented-_SC_PHYS_PAGES-<wbr>system-conf.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0009-util-bypass-<wbr>unimplemented-_SC_PHYS_PAGES-<wbr>sy=
stem-conf.patch<br>
index 116f3d4..f150bb0 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0009-util-bypass-<wbr>unimplem=
ented-_SC_PHYS_PAGES-<wbr>system-conf.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0009-util-bypass-<wbr>unimplem=
ented-_SC_PHYS_PAGES-<wbr>system-conf.patch<br>
@@ -1,7 +1,7 @@<br>
-From 3498f488b27f90398d7c8d1d06aac5<wbr>ab684370e8 Mon Sep 17 00:00:00 200=
1<br>
+From 085c8b6f253726ad547e7be84ff3f2<wbr>b99701488b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
-Date: Mon, 14 Dec 2015 00:47:53 +0000<br>
-Subject: [PATCH 09/36] util: bypass unimplemented _SC_PHYS_PAGES system<br=
>
+Date: Wed, 9 Nov 2016 19:38:07 -0800<br>
+Subject: [PATCH 09/19] util: bypass unimplemented _SC_PHYS_PAGES system<br=
>
=C2=A0 configuration API on uclibc<br>
<br>
=C2=A0Upstream-Status: Inappropriate [uclibc-specific]<br>
@@ -12,12 +12,12 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 15 insertions(+)<br>
<br>
=C2=A0diff --git a/src/basic/util.c b/src/basic/util.c<br>
-index ea1bed7..fdaf340 100644<br>
+index c1b5ca1..4c62d43 100644<br>
=C2=A0--- a/src/basic/util.c<br>
=C2=A0+++ b/src/basic/util.c<br>
-@@ -767,10 +767,25 @@ uint64_t physical_memory(void) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We return this as uint64_t in case we=
 are running as 32bit<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * process on a 64bit kernel with huge a=
mounts of memory */<br>
+@@ -742,6 +742,20 @@ uint64_t physical_memory(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * In order to support containers nicely=
 that have a configured memory limit we&#39;ll take the minimum of the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * physically reported amount of memory =
and the limit configured for the root cgroup, if there is any. */<br>
<br>
=C2=A0+#ifdef __UCLIBC__<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char line[128];<br>
@@ -33,14 +33,17 @@ index ea1bed7..fdaf340 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(f);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint64_t) mem;<br>
=C2=A0+#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem =3D sysconf(_SC_PHYS_PAGES);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(mem &gt; 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc =3D sysconf(_SC_PHYS_PAGES);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(sc &gt; 0);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (uint64_t) mem * (uint64_t) page_=
size();<br>
+@@ -762,6 +776,7 @@ uint64_t physical_memory(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lim *=3D ps;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MIN(mem, lim);<br>
=C2=A0+#endif<br>
=C2=A0 }<br>
<br>
- int update_reboot_param_file(const char *param) {<br>
+ uint64_t physical_memory_scale(uint64_t v, uint64_t max) {<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0010-implment-systemd-<=
wbr>sysv-install-for-OE.patch b/meta/recipes-core/systemd/<wbr>systemd/0010=
-implment-systemd-<wbr>sysv-install-for-OE.patch<br>
index 75fa3a5..8828d6e 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0010-implment-systemd-<wbr>sys=
v-install-for-OE.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0010-implment-systemd-<wbr>sys=
v-install-for-OE.patch<br>
@@ -1,7 +1,7 @@<br>
-From 5f94f5ad46c1ded54c3797979d384e<wbr>4c1eb77bb0 Mon Sep 17 00:00:00 200=
1<br>
+From 52726be92e2b841f744a96c378cc87<wbr>2ae0033a2b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Sat, 5 Sep 2015 06:31:47 +0000<br>
-Subject: [PATCH 10/36] implment systemd-sysv-install for OE<br>
+Subject: [PATCH 10/19] implment systemd-sysv-install for OE<br>
<br>
=C2=A0Use update-rc.d for enabling/disabling and status command<br>
=C2=A0to check the status of the sysv service<br>
@@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755<br>
=C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage ;;<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wb=
r>Build-conditionally-when-HAVE_<wbr>MYHOSTN.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0011-nss-mymachines-<wbr>Build-conditionally-when-HAVE_<wb=
r>MYHOSTN.patch<br>
index 34ae645..b01ae97 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wbr>Build=
-conditionally-when-HAVE_<wbr>MYHOSTN.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0011-nss-mymachines-<wbr>Build=
-conditionally-when-HAVE_<wbr>MYHOSTN.patch<br>
@@ -1,7 +1,7 @@<br>
-From 2b2450f6b7197bff4637c0283e8784<wbr>500471d083 Mon Sep 17 00:00:00 200=
1<br>
+From 3f6f45578b828e414f50c682237507<wbr>3e7174236a Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 14 Dec 2015 00:50:01 +0000<br>
-Subject: [PATCH 11/36] nss-mymachines: Build conditionally when<br>
+Subject: [PATCH 11/19] nss-mymachines: Build conditionally when<br>
=C2=A0 HAVE_MYHOSTNAME is set<br>
<br>
=C2=A0Fixes build failures when building with --disable-myhostname<br>
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/Makefile.am b/Makefile.am<br>
-index 82b6553..b3f3343 100644<br>
+index 02f4017..420e0e0 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -4876,6 +4876,7 @@ SYSTEM_UNIT_ALIASES +=3D \<br>
+@@ -5146,6 +5146,7 @@ SYSTEM_UNIT_ALIASES +=3D \<br>
=C2=A0 BUSNAMES_TARGET_WANTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 org.freedesktop.machine1.<wbr>busname<br>
<br>
@@ -25,7 +25,7 @@ index 82b6553..b3f3343 100644<br>
=C2=A0 libnss_mymachines_la_SOURCES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/nss-mymachines/nss-<wbr>mymachines.sym \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/nss-mymachines/nss-<wbr>mymachines.c<br>
-@@ -4896,6 +4897,7 @@ lib_LTLIBRARIES +=3D \<br>
+@@ -5167,6 +5168,7 @@ rootlib_LTLIBRARIES +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://libnss_mymachines.la" rel=3D"=
noreferrer" target=3D"_blank">libnss_mymachines.la</a><br>
<br>
=C2=A0 endif<br>
@@ -34,5 +34,5 @@ index 82b6553..b3f3343 100644<br>
=C2=A0 polkitpolicy_in_files +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/machine/<a href=3D"http://org.freedesktop.m=
achine1.policy.in" rel=3D"noreferrer" target=3D"_blank">org.freedesktop.<wb=
r>machine1.policy.in</a><br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0012-rules-whitelist-<w=
br>hd-devices.patch b/meta/recipes-core/systemd/<wbr>systemd/0012-rules-whi=
telist-<wbr>hd-devices.patch<br>
index 6143088..8666bdc 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0012-rules-whitelist-<wbr>hd-d=
evices.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0012-rules-whitelist-<wbr>hd-d=
evices.patch<br>
@@ -1,7 +1,7 @@<br>
-From 5ebc0d87565a73710dea602c00b158<wbr>6d5a1364e5 Mon Sep 17 00:00:00 200=
1<br>
-From: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">patrick.o=
hly@intel.com</a>&gt;<br>
-Date: Wed, 16 Sep 2015 13:55:58 +0200<br>
-Subject: [PATCH 12/36] rules: whitelist hd* devices<br>
+From 8cc1ae11f54dcc38ee2168b0f99703<wbr>b835dd3942 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 19:41:13 -0800<br>
+Subject: [PATCH 12/19] rules: whitelist hd* devices<br>
<br>
=C2=A0qemu by default emulates IDE and the linux-yocto kernel(s) use<br>
=C2=A0CONFIG_IDE instead of the more modern libsata, so disks appear as<br>
@@ -10,23 +10,24 @@ CONFIG_IDE instead of the more modern libsata, so disks=
 appear as<br>
=C2=A0Upstream-Status: Denied [<a href=3D"https://github.com/systemd/system=
d/pull/1276" rel=3D"noreferrer" target=3D"_blank">https://github.com/system=
d/<wbr>systemd/pull/1276</a>]<br>
<br>
=C2=A0Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.=
com">patrick.ohly@intel.com</a>&gt;<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 rules/60-persistent-storage.<wbr>rules | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/rules/60-persistent-storage.<wbr>rules b/rules/60-persis=
tent-storage.<wbr>rules<br>
-index 0b14bb4..1c4d97a 100644<br>
+index c13d05c..b14fbed 100644<br>
=C2=A0--- a/rules/60-persistent-storage.<wbr>rules<br>
=C2=A0+++ b/rules/60-persistent-storage.<wbr>rules<br>
-@@ -6,7 +6,7 @@<br>
- ACTION=3D=3D&quot;remove&quot;, GOTO=3D&quot;persistent_storage_end&quot;=
<br>
+@@ -7,7 +7,7 @@ ACTION=3D=3D&quot;remove&quot;, GOTO=3D&quot;persistent_st=
orage_end&quot;<br>
+ ENV{UDEV_DISABLE_PERSISTENT_<wbr>STORAGE_RULES_FLAG}=3D=3D&quot;1&quot;, =
GOTO=3D&quot;persistent_storage_end&quot;<br>
<br>
=C2=A0 SUBSYSTEM!=3D&quot;block&quot;, GOTO=3D&quot;persistent_storage_end&=
quot;<br>
--KERNEL!=3D&quot;loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wb=
r>|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*&quot;, GOTO=3D&quot;pers=
istent_storage_end&quot;<br>
-+KERNEL!=3D&quot;loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wb=
r>|hd*|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*&quot;, GOTO=3D&quot;=
persistent_storage_end&quot;<br>
+-KERNEL!=3D&quot;loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wb=
r>|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*|scm*|pmem*&quot;, GOTO=
=3D&quot;persistent_storage_end&quot;<br>
++KERNEL!=3D&quot;loop*|mmcblk*[0-9]|<wbr>msblk*[0-9]|mspblk*[0-9]|nvme*<wb=
r>|hd*|sd*|sr*|vd*|xvd*|bcache*|<wbr>cciss*|dasd*|ubd*|scm*|pmem*&quot;, GO=
TO=3D&quot;persistent_storage_end&quot;<br>
<br>
=C2=A0 # ignore partitions that span the entire disk<br>
=C2=A0 TEST=3D=3D&quot;whole_disk&quot;, GOTO=3D&quot;persistent_storage_en=
d&quot;<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0014-Make-root-s-home-<=
wbr>directory-configurable.patch b/meta/recipes-core/systemd/<wbr>systemd/0=
013-Make-root-s-home-<wbr>directory-configurable.patch<br>
similarity index 66%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0014-Make-root-s-home-<w=
br>directory-configurable.patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0013-Make-root-s-home-<wbr=
>directory-configurable.patch<br>
index 2eea0ff..2b33337 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0014-Make-root-s-home-<wbr>dir=
ectory-configurable.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0013-Make-root-s-home-<wbr>dir=
ectory-configurable.patch<br>
@@ -1,4 +1,7 @@<br>
-Subject: [PATCH 14/36] Make root&#39;s home directory configurable<br>
+From 79e64a07840e0d97d66e46111f1c08<wbr>6bf83981b7 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 20:35:30 -0800<br>
+Subject: [PATCH 13/19] Make root&#39;s home directory configurable<br>
<br>
=C2=A0OpenEmbedded has a configurable home directory for root. Allow<br>
=C2=A0systemd to be built using its idea of what root&#39;s home directory<=
br>
@@ -11,23 +14,20 @@ <a href=3D"https://github.com/systemd/systemd/issues/54=
1" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/<wbr>sys=
temd/issues/541</a><br>
<br>
=C2=A0Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.=
ca">dan.mcgregor@usask.ca</a>&gt;<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
- Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 7 +++++++<br>
- src/basic/user-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 =
++--<br>
- src/core/namespace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 =
+-<br>
- src/nspawn/nspawn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++--<br>
- units/<a href=3D"http://console-shell.service.m4.in" rel=3D"noreferrer" t=
arget=3D"_blank">console-shell.service.<wbr>m4.in</a> | 4 ++--<br>
- units/<a href=3D"http://emergency.service.in" rel=3D"noreferrer" target=
=3D"_blank">emergency.service.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br=
>
- units/<a href=3D"http://rescue.service.in" rel=3D"noreferrer" target=3D"_=
blank">rescue.service.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++=
--<br>
- 8 files changed, 20 insertions(+), 11 deletions(-)<br>
+ Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++=
<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 ++++=
+++<br>
+ src/basic/user-util.c=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
+ src/nspawn/nspawn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
+ units/<a href=3D"http://emergency.service.in" rel=3D"noreferrer" target=
=3D"_blank">emergency.service.in</a> | 4 ++--<br>
+ units/<a href=3D"http://rescue.service.in" rel=3D"noreferrer" target=3D"_=
blank">rescue.service.in</a>=C2=A0 =C2=A0 | 4 ++--<br>
+ 6 files changed, 17 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.am b/Makefile.am<br>
-index 305099a..88c1250 100644<br>
+index 420e0e0..3010b01 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -206,6 +206,7 @@ AM_CPPFLAGS =3D \<br>
+@@ -213,6 +213,7 @@ AM_CPPFLAGS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLIBDIR=3D\&quot;$(libdir)\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DROOTLIBDIR=3D\&quot;$(rootlibdir)\&quot; \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DROOTLIBEXECDIR=3D\&quot;$(<wbr>rootlibexecdir=
)\&quot; \<br>
@@ -35,8 +35,8 @@ index 305099a..88c1250 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DTEST_DIR=3D\&quot;$(abs_top_srcdir)<wbr>/test=
\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I $(top_srcdir)/src \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I $(top_builddir)/src/basic \<br>
-@@ -5863,6 +5864,7 @@ EXTRA_DIST +=3D \<br>
- substitutions =3D \<br>
+@@ -6057,6 +6058,7 @@ substitutions =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;|rootlibdir=3D$(rootlibdir)|&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;|rootlibexecdir=3D$(<wbr>rootlibexec=
dir)|&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;|rootbindir=3D$(rootbindir)|&#39; \<=
br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;|roothomedir=3D$(roothomedir)|&#39; =
\<br>
@@ -44,10 +44,10 @@ index 305099a..88c1250 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;|SYSTEMCTL=3D$(rootbindir)/<wbr>syst=
emctl|&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;|SYSTEMD_NOTIFY=3D$(rootbindir)<wbr>=
/systemd-notify|&#39; \<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 329861a..01764f5 100644<br>
+index b10c952..dfc0bd3 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -1478,6 +1478,11 @@ AC_ARG_WITH([rootlibdir],<br>
+@@ -1513,6 +1513,11 @@ AC_ARG_WITH([rootlibdir],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [with_rootlibdir=3D${libdir}])<br>
=C2=A0 AX_NORMALIZE_PATH([with_<wbr>rootlibdir])<br>
<br>
@@ -59,7 +59,7 @@ index 329861a..01764f5 100644<br>
=C2=A0 AC_ARG_WITH([pamlibdir],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_HELP_STRING([--with-<wbr>pamlibdir=3D=
DIR], [Directory for PAM modules]),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],<br>
-@@ -1562,6 +1567,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])<br>
+@@ -1598,6 +1603,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])<br>
=C2=A0 AC_SUBST([pamconfdir], [$with_pamconfdir])<br>
=C2=A0 AC_SUBST([rootprefix], [$with_rootprefix])<br>
=C2=A0 AC_SUBST([rootlibdir], [$with_rootlibdir])<br>
@@ -67,7 +67,7 @@ index 329861a..01764f5 100644<br>
<br>
=C2=A0 AC_CONFIG_FILES([<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile<br>
-@@ -1653,6 +1659,7 @@ AC_MSG_RESULT([<br>
+@@ -1688,6 +1694,7 @@ AC_MSG_RESULT([<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 includedir:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lib dir:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootlib dir:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${with_rootlibdir}<b=
r>
@@ -76,10 +76,10 @@ index 329861a..01764f5 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SysV rc?.d directories:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${SYSTEM_SYSVRCND_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Build Python:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON}<br>
=C2=A0diff --git a/src/basic/user-util.c b/src/basic/user-util.c<br>
-index f65ca3e..da1101a 100644<br>
+index 938533d..3f9fdc4 100644<br>
=C2=A0--- a/src/basic/user-util.c<br>
=C2=A0+++ b/src/basic/user-util.c<br>
-@@ -123,7 +123,7 @@ int get_user_creds(<br>
+@@ -127,7 +127,7 @@ int get_user_creds(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *gid =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (home)<br=
>
@@ -88,7 +88,7 @@ index f65ca3e..da1101a 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shell)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *shell =3D &quot;/bin/sh&quot;;<br>
-@@ -354,7 +354,7 @@ int get_home_dir(char **_h) {<br>
+@@ -387,7 +387,7 @@ int get_home_dir(char **_h) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Hardcode home directory for root to a=
void NSS */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u =3D getuid();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (u =3D=3D 0) {<br>
@@ -97,24 +97,11 @@ index f65ca3e..da1101a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!h)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
-diff --git a/src/core/namespace.c b/src/core/namespace.c<br>
-index 203d122..45c0d11 100644<br>
---- a/src/core/namespace.c<br>
-+++ b/src/core/namespace.c<br>
-@@ -415,7 +415,7 @@ int setup_namespace(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0home_dir =3D strjoina(&quot;-&quot;, home_dir);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0run_user_dir =3D prefix_roota(root_directory, &quot;/run/u=
ser&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0run_user_dir =3D strjoina(&quot;-&quot;, run_user_dir);<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 root_dir =3D prefix_roota(root_directory, &quot;/root&quot;);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 root_dir =3D prefix_roota(root_directory, ROOTHOMEDIR);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0root_dir =3D strjoina(&quot;-&quot;, root_dir);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r =3D append_mounts(&amp;m, STRV_MAKE(home_dir, run_user_d=
ir, root_dir),<br>
=C2=A0diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c<br>
-index 8ec0584..51df00b 100644<br>
+index 19b47cd..e42bf19 100644<br>
=C2=A0--- a/src/nspawn/nspawn.c<br>
=C2=A0+++ b/src/nspawn/nspawn.c<br>
-@@ -2739,7 +2739,7 @@ static int inner_child(<br>
+@@ -2798,7 +2798,7 @@ static int inner_child(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (envp[n_env])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_env++;<br>
<br>
@@ -123,7 +110,7 @@ index 8ec0584..51df00b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (asprintf((char**)(envp + =
n_env++), &quot;USER=3D%s&quot;, arg_user ? arg_user : &quot;root&quot;) &l=
t; 0) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (asprintf((char**)(envp + =
n_env++), &quot;LOGNAME=3D%s&quot;, arg_user ? arg_user : &quot;root&quot;)=
 &lt; 0))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_o=
om();<br>
-@@ -2816,7 +2816,7 @@ static int inner_child(<br>
+@@ -2882,7 +2882,7 @@ static int inner_child(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!arg_chd=
ir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* If we cannot change the directory, we&#39;ll end up in=
 /, that is expected. */<br>
@@ -132,23 +119,8 @@ index 8ec0584..51df00b 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execle(&quot=
;/bin/bash&quot;, &quot;-bash&quot;, NULL, env_use);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execle(&quot=
;/bin/sh&quot;, &quot;-sh&quot;, NULL, env_use);<br>
-diff --git a/units/<a href=3D"http://console-shell.service.m4.in" rel=3D"n=
oreferrer" target=3D"_blank">console-shell.service.<wbr>m4.in</a> b/units/<=
a href=3D"http://console-shell.service.m4.in" rel=3D"noreferrer" target=3D"=
_blank">console-shell.service.<wbr>m4.in</a><br>
-index a345ec2..3caae7d 100644<br>
---- a/units/<a href=3D"http://console-shell.service.m4.in" rel=3D"noreferr=
er" target=3D"_blank">console-shell.service.<wbr>m4.in</a><br>
-+++ b/units/<a href=3D"http://console-shell.service.m4.in" rel=3D"noreferr=
er" target=3D"_blank">console-shell.service.<wbr>m4.in</a><br>
-@@ -15,8 +15,8 @@ After=3Drc-local.service<br>
- Before=3Dgetty.target<br>
-<br>
- [Service]<br>
--Environment=3DHOME=3D/root<br>
--WorkingDirectory=3D-/root<br>
-+Environment=3DHOME=3D@<wbr>roothomedir@<br>
-+WorkingDirectory=3D-@<wbr>roothomedir@<br>
- ExecStart=3D-@SULOGIN@<br>
- ExecStopPost=3D-@SYSTEMCTL@ poweroff<br>
- Type=3Didle<br>
=C2=A0diff --git a/units/<a href=3D"http://emergency.service.in" rel=3D"nor=
eferrer" target=3D"_blank">emergency.service.in</a> b/units/<a href=3D"http=
://emergency.service.in" rel=3D"noreferrer" target=3D"_blank">emergency.ser=
vice.in</a><br>
-index 0de16f2..4826062 100644<br>
+index da68eb8..e25f879 100644<br>
=C2=A0--- a/units/<a href=3D"http://emergency.service.in" rel=3D"noreferrer=
" target=3D"_blank">emergency.service.in</a><br>
=C2=A0+++ b/units/<a href=3D"http://emergency.service.in" rel=3D"noreferrer=
" target=3D"_blank">emergency.service.in</a><br>
=C2=A0@@ -15,8 +15,8 @@ Conflicts=3Dsyslog.socket<br>
@@ -160,10 +132,10 @@ index 0de16f2..4826062 100644<br>
=C2=A0+Environment=3DHOME=3D@<wbr>roothomedir@<br>
=C2=A0+WorkingDirectory=3D-@<wbr>roothomedir@<br>
=C2=A0 ExecStartPre=3D-/bin/plymouth --wait quit<br>
- ExecStartPre=3D-/bin/echo -e &#39;Welcome to emergency mode! After loggin=
g in, type &quot;journalctl -xb&quot; to view\\nsystem logs, &quot;systemct=
l reboot&quot; to reboot, &quot;systemctl default&quot; or ^D to\\ntry agai=
n to boot into default mode.&#39;<br>
+ ExecStartPre=3D-/bin/echo -e &#39;You are in emergency mode. After loggin=
g in, type &quot;journalctl -xb&quot; to view\\nsystem logs, &quot;systemct=
l reboot&quot; to reboot, &quot;systemctl default&quot; or ^D to\\ntry agai=
n to boot into default mode.&#39;<br>
=C2=A0 ExecStart=3D-/bin/sh -c &quot;@SULOGIN@; @SYSTEMCTL@ --job-mode=3Dfa=
il --no-block default&quot;<br>
=C2=A0diff --git a/units/<a href=3D"http://rescue.service.in" rel=3D"norefe=
rrer" target=3D"_blank">rescue.service.in</a> b/units/<a href=3D"http://res=
cue.service.in" rel=3D"noreferrer" target=3D"_blank">rescue.service.in</a><=
br>
-index 92553f6..590ae17 100644<br>
+index 5feff69..a83439e 100644<br>
=C2=A0--- a/units/<a href=3D"http://rescue.service.in" rel=3D"noreferrer" t=
arget=3D"_blank">rescue.service.in</a><br>
=C2=A0+++ b/units/<a href=3D"http://rescue.service.in" rel=3D"noreferrer" t=
arget=3D"_blank">rescue.service.in</a><br>
=C2=A0@@ -14,8 +14,8 @@ After=3Dsysinit.target plymouth-start.service<br>
@@ -174,9 +146,9 @@ index 92553f6..590ae17 100644<br>
=C2=A0-WorkingDirectory=3D-/root<br>
=C2=A0+Environment=3DHOME=3D@<wbr>roothomedir@<br>
=C2=A0+WorkingDirectory=3D-@<wbr>roothomedir@<br>
- ExecStartPre=3D-/bin/plymouth quit<br>
- ExecStartPre=3D-/bin/echo -e &#39;Welcome to rescue mode! After logging i=
n, type &quot;journalctl -xb&quot; to view\\nsystem logs, &quot;systemctl r=
eboot&quot; to reboot, &quot;systemctl default&quot; or ^D to\\nboot into d=
efault mode.&#39;<br>
+ ExecStartPre=3D-/bin/plymouth --wait quit<br>
+ ExecStartPre=3D-/bin/echo -e &#39;You are in rescue mode. After logging i=
n, type &quot;journalctl -xb&quot; to view\\nsystem logs, &quot;systemctl r=
eboot&quot; to reboot, &quot;systemctl default&quot; or ^D to\\nboot into d=
efault mode.&#39;<br>
=C2=A0 ExecStart=3D-/bin/sh -c &quot;@SULOGIN@; @SYSTEMCTL@ --job-mode=3Dfa=
il --no-block default&quot;<br>
=C2=A0--<br>
-2.8.3<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0013-sysv-generator-<wb=
r>add-support-for-executing-<wbr>scripts-und.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0013-sysv-generator-<wbr>add-support-for-executing-<wbr>sc=
ripts-und.patch<br>
deleted file mode 100644<br>
index ac67f65..0000000<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0013-sysv-generator-<wbr>add-s=
upport-for-executing-<wbr>scripts-und.patch<br>
+++ /dev/null<br>
@@ -1,133 +0,0 @@<br>
-From 6736de4a3caf9a0b3c888c6cc05103<wbr>ab1b86907d Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Mon, 14 Dec 2015 05:09:53 +0000<br>
-Subject: [PATCH 13/36] sysv-generator: add support for executing scripts u=
nder<br>
- /etc/rcS.d/<br>
-<br>
-To be compatible, all services translated from scripts under /etc/rcS.d wo=
uld<br>
-run before services translated from scripts under /etc/rcN.d.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- src/sysv-generator/sysv-<wbr>generator.c | 47 +++++++++++++++++++++++++++=
+--<wbr>-------<br>
- 1 file changed, 36 insertions(+), 11 deletions(-)<br>
-<br>
-diff --git a/src/sysv-generator/sysv-<wbr>generator.c b/src/sysv-generator=
/sysv-<wbr>generator.c<br>
-index b5925a4..ea06d6a 100644<br>
---- a/src/sysv-generator/sysv-<wbr>generator.c<br>
-+++ b/src/sysv-generator/sysv-<wbr>generator.c<br>
-@@ -44,7 +44,8 @@<br>
-<br>
- typedef enum RunlevelType {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RUNLEVEL_UP,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNLEVEL_DOWN<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNLEVEL_DOWN,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNLEVEL_SYSINIT<br>
- } RunlevelType;<br>
-<br>
- static const struct {<br>
-@@ -59,6 +60,9 @@ static const struct {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rc4.d&quot;,=C2=A0 SPECIAL_MULTI=
_USER_TARGET, RUNLEVEL_UP },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rc5.d&quot;,=C2=A0 SPECIAL_GRAPH=
ICAL_TARGET,=C2=A0 RUNLEVEL_UP },<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Debian style rcS.d, also adopted by OE */<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;rcS.d&quot;,=C2=A0 SPECIAL_SYSINIT_TA=
RGET,=C2=A0 =C2=A0RUNLEVEL_SYSINIT},<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Standard SysV runlevels for shutdown =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rc0.d&quot;,=C2=A0 SPECIAL_POWER=
OFF_TARGET,=C2=A0 RUNLEVEL_DOWN },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rc6.d&quot;,=C2=A0 SPECIAL_REBOO=
T_TARGET,=C2=A0 =C2=A0 RUNLEVEL_DOWN }<br>
-@@ -67,7 +71,7 @@ static const struct {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 directories in this order, and w=
e want to make sure that<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysv_start_priority is known whe=
n we first load the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unit. And that value we only kno=
w from S links. Hence<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UP must be read before DOWN */<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UP/SYSINIT must be read before D=
OWN */<br>
- };<br>
-<br>
- static const char *arg_dest =3D &quot;/tmp&quot;;<br>
-@@ -86,6 +90,8 @@ typedef struct SysvStub {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_lsb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool reload;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool loaded;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool default_dependencies;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool from_rcsd;<br>
- } SysvStub;<br>
-<br>
- static void free_sysvstub(SysvStub *s) {<br>
-@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_servi=
ces) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;ha=
s_lsb &amp;&amp; other-&gt;has_lsb)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (other-&gt;sys=
v_start_priority &lt; s-&gt;sysv_start_priority) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D strv_extend(&amp;s-&gt;after, other-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All scripts un=
der /etc/rcS.d should execute before scripts under<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* /etc/rcN.=
d */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!other-&gt;fr=
om_rcsd &amp;&amp; s-&gt;from_rcsd) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D strv_extend(&amp;s-&gt;before, other-&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_oom();<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (other-=
&gt;sysv_start_priority &gt; s-&gt;sysv_start_priority) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D strv_extend(&amp;s-&gt;before, other-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (other-=
&gt;from_rcsd &amp;&amp; !s-&gt;from_rcsd) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D strv_extend(&amp;s-&gt;after, other-&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_oom();<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (other-&gt;sysv_start_priority &lt; s-&gt;sysv_start_priority=
) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D strv_extend(&amp;s-&gt;after, =
other-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return l=
og_oom();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else if (other-&gt;sysv_start_priority &gt; s-&gt;sysv_start_pri=
ority) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D strv_extend(&amp;s-&gt;before,=
 other-&gt;name);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return l=
og_oom();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: Ma=
ybe we should compare the name here lexicographically? */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashm=
ap *all_services) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_oom();<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0service-&gt;sysv_start_priority =3D -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 service-&gt;default_dependencies =3D true;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 service-&gt;from_rcsd =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0service-&gt;name =3D name;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0service-&gt;path =3D fpath;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0name =3D fpath =3D NULL;<br>
-@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(<wbr>const Look=
upPaths *lp, Hashmap *all_servic<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (de-&gt;d_name[0] =3D=3D &#=
39;S&#39;)=C2=A0 {<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rcnd=
_table[i].type =3D=3D RUNLEVEL_UP)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rcnd=
_table[i].type =3D=3D RUNLEVEL_UP || rcnd_table[i].type =3D=3D RUNLEVEL_SYS=
INIT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0service-&gt;sysv_start_priority =3D MAX(a*10 + b=
, service-&gt;sysv_start_priority);<br>
--<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 service-&gt;default_dependencies =3D (rcnd_table[i].ty=
pe =3D=3D RUNLEVEL_SYSINIT)?false:true;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 service-&gt;from_rcsd =3D (rcnd_table[i].type =3D=3D R=
UNLEVEL_SYSINIT)?true:false;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =
=3D set_ensure_allocated(&amp;<wbr>runlevel_services[i], NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (r &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0log_oom();<br>
-@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(<wbr>const Looku=
pPaths *lp, Hashmap *all_servic<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (de-&gt;d_name[0] =
=3D=3D &#39;K&#39; &amp;&amp;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(rcnd_table[i].type =3D=3D RUNLEVEL_DOWN)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(rcnd_table[i].type =3D=3D RUNLEVEL_DOWN ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rcnd_table[i].type =3D=3D RUNLEVEL_SYSINIT)) {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =
=3D set_ensure_allocated(&amp;<wbr>shutdown_services, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (r &lt; 0) {<br>
---<br>
-1.8.3.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0016-Revert-rules-<wbr>=
remove-firmware-loading-rules.<wbr>patch b/meta/recipes-core/systemd/<wbr>s=
ystemd/0014-Revert-rules-<wbr>remove-firmware-loading-rules.<wbr>patch<br>
similarity index 84%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0016-Revert-rules-<wbr>r=
emove-firmware-loading-rules.<wbr>patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0014-Revert-rules-<wbr>rem=
ove-firmware-loading-rules.<wbr>patch<br>
index 66905b5..ed7c68f 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0016-Revert-rules-<wbr>remove-=
firmware-loading-rules.<wbr>patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0014-Revert-rules-<wbr>remove-=
firmware-loading-rules.<wbr>patch<br>
@@ -1,7 +1,7 @@<br>
-From 7311ecc745c17d6ed9fd9cf4303964<wbr>8483a87605 Mon Sep 17 00:00:00 200=
1<br>
+From 0f47cfcb16e8e40a90a9221f9995f8<wbr>cd8a915c22 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@gma=
il.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Mar 2015 15:01:29 +1100<br>
-Subject: [PATCH 16/36] Revert &quot;rules: remove firmware loading rules&q=
uot;<br>
+Subject: [PATCH 14/19] Revert &quot;rules: remove firmware loading rules&q=
uot;<br>
<br>
=C2=A0This reverts commit 70e7d754ddb356fb1a2942b262f8ce<wbr>e9650e2a19.<br=
>
=C2=A0Userspace firmware loading support is needed for Linux &lt; 3.7.<br>
@@ -24,5 +24,5 @@ index 0000000..f0ae684<br>
=C2=A0+<br>
=C2=A0+SUBSYSTEM=3D=3D&quot;firmware&quot;, ACTION=3D=3D&quot;add&quot;, RU=
N{builtin}=3D&quot;firmware&quot;<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0017-Revert-udev-<wbr>r=
emove-userspace-firmware-<wbr>loading-suppor.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0015-Revert-udev-<wbr>remove-userspace-firmware-<wbr>loadi=
ng-suppor.patch<br>
similarity index 89%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0017-Revert-udev-<wbr>re=
move-userspace-firmware-<wbr>loading-suppor.patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0015-Revert-udev-<wbr>remo=
ve-userspace-firmware-<wbr>loading-suppor.patch<br>
index 642625f..f31d211 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0017-Revert-udev-<wbr>remove-u=
serspace-firmware-<wbr>loading-suppor.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0015-Revert-udev-<wbr>remove-u=
serspace-firmware-<wbr>loading-suppor.patch<br>
@@ -1,4 +1,7 @@<br>
-Subject: [PATCH 17/36] Revert &quot;udev: remove userspace firmware loadin=
g<br>
+From 4d28d9a7d8d69fb429955d770e53e7<wbr>a81640da24 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 20:45:23 -0800<br>
+Subject: [PATCH 15/19] Revert &quot;udev: remove userspace firmware loadin=
g<br>
=C2=A0 support&quot;<br>
<br>
=C2=A0This reverts commit be2ea723b1d023b3d385d3b791ee46<wbr>07cbfb20ca.<br=
>
@@ -10,21 +13,21 @@ Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net14=
7@gmail.com">net147@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +++<br>
- README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
+ README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0 TODO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 22 ++++++<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 18 +++++<br>
=C2=A0 src/udev/udev-builtin-<wbr>firmware.c | 154 ++++++++++++++++++++++++=
++++++<wbr>+++++++++<br>
=C2=A0 src/udev/udev-builtin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
=C2=A0 src/udev/udev.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 ++<br>
=C2=A0 src/udev/udevd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 13 ++++<br>
- 8 files changed, 213 insertions(+), 2 deletions(-)<br>
+ 8 files changed, 210 insertions(+), 3 deletions(-)<br>
=C2=A0 create mode 100644 src/udev/udev-builtin-<wbr>firmware.c<br>
<br>
=C2=A0diff --git a/Makefile.am b/Makefile.am<br>
-index 305099a..e774976 100644<br>
+index 3010b01..229492a 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -3706,6 +3706,18 @@ libudev_core_la_LIBADD =3D \<br>
+@@ -3791,6 +3791,18 @@ libudev_core_la_LIBADD =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(BLKID_LIBS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(KMOD_LIBS)<br>
<br>
@@ -44,10 +47,17 @@ index 305099a..e774976 100644<br>
=C2=A0 libudev_core_la_SOURCES +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/udev/udev-builtin-kmod.c<br>
=C2=A0diff --git a/README b/README<br>
-index ca8993c..87f3297 100644<br>
+index 9f5bc93..f60ae11 100644<br>
=C2=A0--- a/README<br>
=C2=A0+++ b/README<br>
-@@ -56,8 +56,8 @@ REQUIREMENTS:<br>
+@@ -50,14 +50,14 @@ REQUIREMENTS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_PROC_FS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_FHANDLE (libudev, mount an=
d bind mount handling)<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 udev will fail to work with the legacy sysfs =
layout:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Udev will fail to work with the legacy sysfs =
layout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_SYSFS_DEPRECATED=3Dn<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Legacy hotplug slows down the system and=
 confuses udev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIG_UEVENT_HELPER_PATH=3D&quot=
;&quot;<br>
<br>
@@ -59,10 +69,10 @@ index ca8993c..87f3297 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some udev rules and virtualization detec=
tion relies on it:<br>
=C2=A0diff --git a/TODO b/TODO<br>
-index fac9ccf..2645582 100644<br>
+index baaac94..1ab1691 100644<br>
=C2=A0--- a/TODO<br>
=C2=A0+++ b/TODO<br>
-@@ -642,6 +642,7 @@ Features:<br>
+@@ -658,6 +658,7 @@ Features:<br>
=C2=A0 * initialize the hostname from the fs label of /, if /etc/hostname d=
oes not exist?<br>
<br>
=C2=A0 * udev:<br>
@@ -71,13 +81,13 @@ index fac9ccf..2645582 100644<br>
=C2=A0 =C2=A0 - kill scsi_id<br>
=C2=A0 =C2=A0 - add trigger --subsystem-match=3Dusb/usb_<wbr>device device<=
br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 329861a..af85405 100644<br>
+index dfc0bd3..1de0066 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -1361,6 +1361,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-<wbr=
>hwdb], [disable hardware database<br>
+@@ -1394,6 +1394,23 @@ AM_CONDITIONAL(HAVE_<wbr>MYHOSTNAME, [test &quot;$h=
ave_myhostname&quot; =3D &quot;yes&quot;])<br>
+ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-<wbr>hwdb], [disable hardw=
are database support])],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_hwdb=3D$enableval, enable_hwdb=3Dyes)<b=
r>
=C2=A0 AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb =3D xyes])<br>
-<br>
- # ------------------------------<wbr>------------------------------<wbr>-=
-----------------<br>
=C2=A0+AC_ARG_WITH(firmware-path,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_STRING([--with-<wbr>firmware-path=
=3DDIR[[[:DIR[...]]<wbr>]]],<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Firmware search path (default=3D=
&quot;&quot;)]),<br>
@@ -93,19 +103,15 @@ index 329861a..af85405 100644<br>
=C2=A0+done<br>
=C2=A0+IFS=3D$OLD_IFS<br>
=C2=A0+AC_SUBST(FIRMWARE_PATH)<br>
-+AS_IF([test &quot;x${FIRMWARE_PATH}&quot; !=3D &quot;x&quot;], [ AC_DEFIN=
E(HAVE_FIRMWARE, 1, [Define if FIRMWARE is availabe]) ])<br>
++AS_IF([test &quot;x${FIRMWARE_PATH}&quot; !=3D &quot;x&quot;], [ AC_DEFIN=
E(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])<br>
=C2=A0+AM_CONDITIONAL(ENABLE_<wbr>FIRMWARE, [test &quot;x${FIRMWARE_PATH}&q=
uot; !=3D &quot;x&quot;])<br>
-+<br>
-+# ------------------------------<wbr>------------------------------<wbr>-=
-----------------<br>
+<br>
+ # ------------------------------<wbr>------------------------------<wbr>-=
-----------------<br>
=C2=A0 have_manpages=3Dno<br>
- AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-<wbr>manpages], [disabl=
e manpages]))<br>
- AC_PATH_PROG([XSLTPROC], [xsltproc])<br>
-@@ -1656,6 +1675,9 @@ AC_MSG_RESULT([<br>
+@@ -1698,6 +1715,7 @@ AC_MSG_RESULT([<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SysV init scripts:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${SYSTEM_SYSVINIT_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SysV rc?.d directories:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${SYSTEM_SYSVRCND_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Build Python:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Installation Python:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_BINARY}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sphinx binary:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${SPHINX_BUILD}<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 firmware path:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${FIRMWARE_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAM modules dir:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${with_pamlibdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAM configuration dir:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${with_pamconfdir}<br>
@@ -309,7 +315,7 @@ index 8433e8d..d32366d 100644<br>
=C2=A0 extern const struct udev_builtin udev_builtin_input_id;<br>
=C2=A0 extern const struct udev_builtin udev_builtin_keyboard;<br>
=C2=A0diff --git a/src/udev/udevd.c b/src/udev/udevd.c<br>
-index e9dd2f4..0abc28e 100644<br>
+index d336ee0..81e5dc5 100644<br>
=C2=A0--- a/src/udev/udevd.c<br>
=C2=A0+++ b/src/udev/udevd.c<br>
=C2=A0@@ -125,6 +125,9 @@ struct event {<br>
@@ -322,7 +328,7 @@ index e9dd2f4..0abc28e 100644<br>
=C2=A0 };<br>
<br>
=C2=A0 static inline struct event *node_to_event(struct udev_list_node *nod=
e) {<br>
-@@ -614,6 +617,10 @@ static int event_queue_insert(Manager *manager, struc=
t udev_device *dev) {<br>
+@@ -613,6 +616,10 @@ static int event_queue_insert(Manager *manager, struc=
t udev_device *dev) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;devnum =3D udev_device_get_dev=
num(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;is_block =3D streq(&quot;block=
&quot;, udev_device_get_subsystem(dev)<wbr>);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;ifindex =3D udev_device_get_if=
index(dev);<br>
@@ -333,7 +339,7 @@ index e9dd2f4..0abc28e 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;seq %llu queued, &#39;%s=
&#39; &#39;%s&#39;&quot;, udev_device_get_seqnum(dev),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udev_device_get_acti=
on(dev), udev_device_get_subsystem(dev)<wbr>);<br>
-@@ -699,6 +706,12 @@ static bool is_devpath_busy(Manager *manager, struct =
event *event) {<br>
+@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager *manager, struct =
event *event) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -347,5 +353,5 @@ index e9dd2f4..0abc28e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event-&g=
t;devpath[common] =3D=3D &#39;/&#39;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 event-&gt;delaying_seqnum =3D loop_event-&gt;seqnum;<br>
=C2=A0--<br>
-2.8.3<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0015-systemd-user-<wbr>=
avoid-using-system-auth.patch b/meta/recipes-core/systemd/<wbr>systemd/0015=
-systemd-user-<wbr>avoid-using-system-auth.patch<br>
deleted file mode 100644<br>
index 6e6f344..0000000<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0015-systemd-user-<wbr>avoid-u=
sing-system-auth.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-Subject: [PATCH 15/36] systemd-user: avoid using system-auth<br>
-<br>
-In OE, we don&#39;t provide system-auth, instead, we use common-* files.<b=
r>
-So modify systemd-user file to use common-* files.<br>
-<br>
-Upstream-Status: Inappropriate [oe specific]<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
----<br>
- src/login/systemd-user.m4 | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/login/systemd-user.m4 b/src/login/systemd-user.m4<br>
-index f188a8e..862d8d7 100644<br>
---- a/src/login/systemd-user.m4<br>
-+++ b/src/login/systemd-user.m4<br>
-@@ -2,11 +2,11 @@<br>
- #<br>
- # Used by systemd --user instances.<br>
-<br>
--account=C2=A0 include system-auth<br>
-+account=C2=A0 include common-account<br>
-<br>
- m4_ifdef(`HAVE_SELINUX&#39;,<br>
- session=C2=A0 required pam_selinux.so close<br>
- session=C2=A0 required pam_selinux.so nottys open<br>
- )m4_dnl<br>
- session=C2=A0 required pam_loginuid.so<br>
--session=C2=A0 include system-auth<br>
-+session=C2=A0 include common-session<br>
---<br>
-2.8.3<br>
-<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0018-make-test-dir-<wbr=
>configurable.patch b/meta/recipes-core/systemd/<wbr>systemd/0016-make-test=
-dir-<wbr>configurable.patch<br>
similarity index 77%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0018-make-test-dir-<wbr>=
configurable.patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0016-make-test-dir-<wbr>co=
nfigurable.patch<br>
index 5d13e4a..10d1df5 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0018-make-test-dir-<wbr>config=
urable.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0016-make-test-dir-<wbr>config=
urable.patch<br>
@@ -1,4 +1,7 @@<br>
-Subject: [PATCH 18/36] make test dir configurable<br>
+From 218bbc555a37f9373fbb7f03c744eb<wbr>65109d3470 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 20:47:37 -0800<br>
+Subject: [PATCH 16/19] make test dir configurable<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
@@ -6,17 +9,17 @@ test maybe be run on target in cross-compile environment,=
 and test dir<br>
=C2=A0is not the compilation dir, so make it configurable<br>
<br>
=C2=A0Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com=
">rongqing.li@windriver.com</a>&gt;<br>
-<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 Makefile.am=C2=A0 | 2 +-<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 7 +++++++<br>
=C2=A0 2 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/Makefile.am b/Makefile.am<br>
-index a94636a..dbd3386 100644<br>
+index 229492a..e997d82 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -207,7 +207,7 @@ AM_CPPFLAGS =3D \<br>
+@@ -214,7 +214,7 @@ AM_CPPFLAGS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DROOTLIBDIR=3D\&quot;$(rootlibdir)\&quot; \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DROOTLIBEXECDIR=3D\&quot;$(<wbr>rootlibexecdir=
)\&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DROOTHOMEDIR=3D\&quot;$(roothomedir)<wbr>\&quo=
t; \<br>
@@ -26,10 +29,10 @@ index a94636a..dbd3386 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I $(top_builddir)/src/basic \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I $(top_srcdir)/src/basic \<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 45aae8a..c53fae2 100644<br>
+index 1de0066..b12e320 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -1518,6 +1518,11 @@ AC_ARG_WITH([roothomedir],<br>
+@@ -1535,6 +1535,11 @@ AC_ARG_WITH([roothomedir],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [with_roothomedir=3D/root])<br>
<br>
@@ -41,7 +44,7 @@ index 45aae8a..c53fae2 100644<br>
=C2=A0 AC_ARG_WITH([pamlibdir],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_HELP_STRING([--with-<wbr>pamlibdir=3D=
DIR], [Directory for PAM modules]),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],<br>
-@@ -1603,6 +1608,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])<br>
+@@ -1621,6 +1626,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])<br>
=C2=A0 AC_SUBST([rootprefix], [$with_rootprefix])<br>
=C2=A0 AC_SUBST([rootlibdir], [$with_rootlibdir])<br>
=C2=A0 AC_SUBST([roothomedir], [$with_roothomedir])<br>
@@ -49,7 +52,7 @@ index 45aae8a..c53fae2 100644<br>
<br>
=C2=A0 AC_CONFIG_FILES([<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile<br>
-@@ -1695,6 +1701,7 @@ AC_MSG_RESULT([<br>
+@@ -1712,6 +1718,7 @@ AC_MSG_RESULT([<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lib dir:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootlib dir:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${with_rootlibdir}<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root home dir:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${with_roothomedir}<br>
@@ -58,5 +61,5 @@ index 45aae8a..c53fae2 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SysV rc?.d directories:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ${SYSTEM_SYSVRCND_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Build Python:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON}<br>
=C2=A0--<br>
-2.8.3<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0019-remove-duplicate-<=
wbr>include-uchar.h.patch b/meta/recipes-core/systemd/<wbr>systemd/0017-rem=
ove-duplicate-<wbr>include-uchar.h.patch<br>
similarity index 81%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0019-remove-duplicate-<w=
br>include-uchar.h.patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0017-remove-duplicate-<wbr=
>include-uchar.h.patch<br>
index 17592f8..77dbd6e 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0019-remove-duplicate-<wbr>inc=
lude-uchar.h.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0017-remove-duplicate-<wbr>inc=
lude-uchar.h.patch<br>
@@ -1,14 +1,12 @@<br>
-From 3ca534935460647fed66e31aaa90b3<wbr>64e29eab5c Mon Sep 17 00:00:00 200=
1<br>
+From e78af874fc9f3d3af49498b8207109<wbr>993d93a596 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 22 Feb 2016 05:59:01 +0000<br>
-Subject: [PATCH 1/2] remove duplicate include uchar.h<br>
+Subject: [PATCH 17/19] remove duplicate include uchar.h<br>
<br>
=C2=A0missing.h already includes it<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
-Upstream-Status: Pending<br>
-<br>
=C2=A0 src/basic/escape.h | 1 -<br>
=C2=A0 src/basic/utf8.h=C2=A0 =C2=A0| 1 -<br>
=C2=A0 2 files changed, 2 deletions(-)<br>
@@ -26,7 +24,7 @@ index deaa4de..36d437c 100644<br>
=C2=A0 #include &quot;string-util.h&quot;<br>
=C2=A0 #include &quot;missing.h&quot;<br>
=C2=A0diff --git a/src/basic/utf8.h b/src/basic/utf8.h<br>
-index 12c272d..bea93a6 100644<br>
+index f9b9c94..6ac9a3c 100644<br>
=C2=A0--- a/src/basic/utf8.h<br>
=C2=A0+++ b/src/basic/utf8.h<br>
=C2=A0@@ -22,7 +22,6 @@<br>
@@ -38,5 +36,5 @@ index 12c272d..bea93a6 100644<br>
=C2=A0 #include &quot;macro.h&quot;<br>
=C2=A0 #include &quot;missing.h&quot;<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0020-check-for-uchar.<w=
br>h-in-configure.patch b/meta/recipes-core/systemd/<wbr>systemd/0018-check=
-for-uchar.<wbr>h-in-configure.patch<br>
similarity index 76%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0020-check-for-uchar.<wb=
r>h-in-configure.patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0018-check-for-uchar.<wbr>=
h-in-configure.patch<br>
index a027fad..5824033 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0020-check-for-uchar.<wbr>h-in=
-configure.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0018-check-for-uchar.<wbr>h-in=
-configure.patch<br>
@@ -1,23 +1,21 @@<br>
-From e06eec89a22719c38e257fe07afff1<wbr>8e359114cb Mon Sep 17 00:00:00 200=
1<br>
+From 7cc0b19d244023c7b3e557765b03b7<wbr>971e047f29 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 22 Feb 2016 06:02:38 +0000<br>
-Subject: [PATCH 2/2] check for uchar.h in configure<br>
+Subject: [PATCH 18/19] check for uchar.h in configure<br>
<br>
=C2=A0Use ifdef to include uchar.h<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
-Upstream-Status: Pending<br>
-<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0 src/basic/missing.h | 2 ++<br>
=C2=A0 2 files changed, 3 insertions(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index ecc3e6b..62f934e 100644<br>
+index b12e320..4e6dfdf 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -297,6 +297,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test &quot;x$have_pytho=
n&quot; =3D &quot;xyes&quot;])<br>
+@@ -298,6 +298,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test &quot;x$have_pytho=
n&quot; =3D &quot;xyes&quot;])<br>
<br>
=C2=A0 # ------------------------------<wbr>------------------------------<=
wbr>------------------<br>
<br>
@@ -26,10 +24,10 @@ index ecc3e6b..62f934e 100644<br>
=C2=A0 AC_CHECK_HEADERS([linux/btrfs.<wbr>h], [], [])<br>
=C2=A0 AC_CHECK_HEADERS([linux/memfd.<wbr>h], [], [])<br>
=C2=A0diff --git a/src/basic/missing.h b/src/basic/missing.h<br>
-index f704422..a1baa95 100644<br>
+index 4936873..ce79404 100644<br>
=C2=A0--- a/src/basic/missing.h<br>
=C2=A0+++ b/src/basic/missing.h<br>
-@@ -34,7 +34,9 @@<br>
+@@ -35,7 +35,9 @@<br>
=C2=A0 #include &lt;stdlib.h&gt;<br>
=C2=A0 #include &lt;sys/resource.h&gt;<br>
=C2=A0 #include &lt;sys/syscall.h&gt;<br>
@@ -40,5 +38,5 @@ index f704422..a1baa95 100644<br>
<br>
=C2=A0 #ifdef HAVE_AUDIT<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0022-socket-util-don-<w=
br>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch b/meta/recipes-core/system=
d/<wbr>systemd/0019-socket-util-don-<wbr>t-fail-if-libc-doesn-t-<wbr>suppor=
t-IDN.patch<br>
similarity index 69%<br>
rename from meta/recipes-core/systemd/<wbr>systemd/0022-socket-util-don-<wb=
r>t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
rename to meta/recipes-core/systemd/<wbr>systemd/0019-socket-util-don-<wbr>=
t-fail-if-libc-doesn-t-<wbr>support-IDN.patch<br>
index 96fc3d8..66aa4ca 100644<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0022-socket-util-don-<wbr>t-fa=
il-if-libc-doesn-t-<wbr>support-IDN.patch<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0019-socket-util-don-<wbr>t-fa=
il-if-libc-doesn-t-<wbr>support-IDN.patch<br>
@@ -1,23 +1,23 @@<br>
-From 71e710a6c8a3879af7d50c4cb995e0<wbr>615deba5c3 Mon Sep 17 00:00:00 200=
1<br>
-From: Emil Renner Berthing &lt;<a href=3D"mailto:systemd@esmil.dk">systemd=
@esmil.dk</a>&gt;<br>
-Date: Sat, 12 Sep 2015 19:56:52 +0000<br>
-Subject: [PATCH 29/38] socket-util: don&#39;t fail if libc doesn&#39;t sup=
port IDN<br>
+From 289554d87e4fd96cae08c0fb449bf4<wbr>1d5641cd24 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 9 Nov 2016 20:49:53 -0800<br>
+Subject: [PATCH 19/19] socket-util: don&#39;t fail if libc doesn&#39;t sup=
port IDN<br>
+<br>
+Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Emil Renner Berthing &lt;<a href=3D"mailto:systemd@esm=
il.dk">systemd@esmil.dk</a>&gt;<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
-Upstream-Status: Pending<br>
-<br>
=C2=A0 src/basic/socket-util.c | 9 +++++++++<br>
=C2=A0 1 file changed, 9 insertions(+)<br>
<br>
=C2=A0diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c<br>
-index 5851268..aefaca5 100644<br>
+index 4ebf106..53b9a12 100644<br>
=C2=A0--- a/src/basic/socket-util.c<br>
=C2=A0+++ b/src/basic/socket-util.c<br>
-@@ -44,6 +44,15 @@<br>
- #include &quot;string-util.h&quot;<br>
+@@ -47,6 +47,15 @@<br>
=C2=A0 #include &quot;user-util.h&quot;<br>
+ #include &quot;utf8.h&quot;<br>
=C2=A0 #include &quot;util.h&quot;<br>
=C2=A0+/* Don&#39;t fail if the standard library<br>
=C2=A0+ * doesn&#39;t support IDN */<br>
@@ -32,5 +32,5 @@ index 5851268..aefaca5 100644<br>
=C2=A0 int socket_address_parse(<wbr>SocketAddress *a, const char *s) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *e, *n;<br>
=C2=A0--<br>
-1.8.3.1<br>
+2.10.2<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0021-include-missing.<w=
br>h-for-getting-secure_getenv-<wbr>definiti.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0021-include-missing.<wbr>h-for-getting-secure_getenv-<wbr=
>definiti.patch<br>
deleted file mode 100644<br>
index 5797a29..0000000<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/0021-include-missing.<wbr>h-fo=
r-getting-secure_getenv-<wbr>definiti.patch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-From 6cedbaee7964f6a6c61b9f2c8f0b87<wbr>cef9370424 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Tue, 15 Dec 2015 22:51:55 +0000<br>
-Subject: [PATCH 26/38] include missing.h for getting secure_getenv definit=
ion<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/basic/user-util.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/src/basic/user-util.c b/src/basic/user-util.c<br>
-index 55672b3..22c4a23 100644<br>
---- a/src/basic/user-util.c<br>
-+++ b/src/basic/user-util.c<br>
-@@ -38,6 +38,7 @@<br>
- #include &quot;path-util.h&quot;<br>
- #include &quot;string-util.h&quot;<br>
- #include &quot;user-util.h&quot;<br>
-+#include &quot;missing.h&quot;<br>
-<br>
- bool uid_is_valid(uid_t uid) {<br>
-<br>
---<br>
-1.8.3.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/CVE-2016-7795.patch b/m=
eta/recipes-core/systemd/<wbr>systemd/CVE-2016-7795.patch<br>
deleted file mode 100644<br>
index 5ecb9c3..0000000<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/CVE-2016-7795.patch<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-Subject: Fix CVE-2016-7795<br>
-<br>
-This undoes 531ac2b. I acked that patch without looking at the code<br>
-carefully enough. There are two problems:<br>
-- we want to process the fds anyway<br>
-- in principle empty notification messages are valid, and we should<br>
-=C2=A0 process them as usual, including logging using log_unit_debug().<br=
>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2016-7795<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
----<br>
- src/core/manager.c | 11 ++++++-----<br>
- 1 file changed, 6 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/src/core/manager.c b/src/core/manager.c<br>
-index 7838f56..f165d08e 100644<br>
---- a/src/core/manager.c<br>
-+++ b/src/core/manager.c<br>
-@@ -1589,13 +1589,12 @@ static int manager_dispatch_cgroups_<wbr>agent_fd(=
sd_event_source *source, int fd, ui<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
-<br>
--static void manager_invoke_notify_message(<wbr>Manager *m, Unit *u, pid_t=
 pid, const char *buf, size_t n, FDSet *fds) {<br>
-+static void manager_invoke_notify_message(<wbr>Manager *m, Unit *u, pid_t=
 pid, const char *buf, FDSet *fds) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_strv_free_ char **tags =3D NULL=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(m);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(u);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(buf);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(n &gt; 0);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tags =3D strv_split(buf, &quot;\n\r&quot=
;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tags) {<br>
-@@ -1688,25 +1687,27 @@ static int manager_dispatch_notify_fd(sd_<wbr>even=
t_source *source, int fd, uint32_t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The message should be a string. Here we ma=
ke sure it&#39;s NUL-terminated,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* but only the part until first NUL wil=
l be used anyway. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[n] =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Notify every unit that might be inter=
ested, but try<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to avoid notifying the same one multi=
ple times. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u1 =3D manager_get_unit_by_pid_<wbr>cgro=
up(m, ucred-&gt;pid);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (u1) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_invoke_no=
tify_message(<wbr>m, u1, ucred-&gt;pid, buf, n, fds);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_invoke_no=
tify_message(<wbr>m, u1, ucred-&gt;pid, buf, fds);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D tr=
ue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u2 =3D hashmap_get(m-&gt;watch_pids1, PI=
D_TO_PTR(ucred-&gt;pid));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (u2 &amp;&amp; u2 !=3D u1) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_invoke_no=
tify_message(<wbr>m, u2, ucred-&gt;pid, buf, n, fds);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_invoke_no=
tify_message(<wbr>m, u2, ucred-&gt;pid, buf, fds);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D tr=
ue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u3 =3D hashmap_get(m-&gt;watch_pids2, PI=
D_TO_PTR(ucred-&gt;pid));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (u3 &amp;&amp; u3 !=3D u2 &amp;&amp; =
u3 !=3D u1) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_invoke_no=
tify_message(<wbr>m, u3, ucred-&gt;pid, buf, n, fds);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_invoke_no=
tify_message(<wbr>m, u3, ucred-&gt;pid, buf, fds);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D tr=
ue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-2.8.3<br>
-<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/udev-re-enable-mount-<w=
br>propagation-for-udevd.patch b/meta/recipes-core/systemd/<wbr>systemd/ude=
v-re-enable-mount-<wbr>propagation-for-udevd.patch<br>
deleted file mode 100644<br>
index 23e22d4..0000000<br>
--- a/meta/recipes-core/systemd/<wbr>systemd/udev-re-enable-mount-<wbr>prop=
agation-for-udevd.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From: Michael Biebl &lt;<a href=3D"mailto:biebl@debian.org">biebl@debian.o=
rg</a>&gt;<br>
-Date: Sat, 27 Sep 2014 04:19:24 +0200<br>
-Subject: udev: re-enable mount propagation for udevd<br>
-<br>
-Upstream-Status: Backport [<a href=3D"http://http.debian.net/debian/pool/m=
ain/s/systemd/systemd_215-17+deb8u4.debian.tar.xz" rel=3D"noreferrer" targe=
t=3D"_blank">http://http.debian.net/<wbr>debian/pool/main/s/systemd/<wbr>sy=
stemd_215-17+deb8u4.debian.<wbr>tar.xz</a>]<br>
-<br>
-laptop-mode-tools remounts file systems from within a udev rule to apply<b=
r>
-certain mount options. With MountFlags=3Dslave, those mounts then become p=
rivate<br>
-to the systemd-udevd namespace and are no longer accessible from outside t=
he<br>
-namespace.<br>
-While the root cause is the broken behaviour of laptop-mode-tools, with mo=
unt<br>
-propagation turned off, this can result in a read-only root file system.<b=
r>
-Therefore revert the relevant parts from commit<br>
-<wbr>c2c13f2df42e0691aecabe3979ea81<wbr>cd7faa35c7 to re-enable mount prop=
agation for<br>
-udevd.<br>
-<br>
-Once affected packages have been fixed, this patch should be dropped<br>
-again.<br>
-<br>
-Closes: #762018<br>
-diff --git a/units/<a href=3D"http://systemd-udevd.service.in" rel=3D"nore=
ferrer" target=3D"_blank">systemd-udevd.service.<wbr>in</a> b/units/<a href=
=3D"http://systemd-udevd.service.in" rel=3D"noreferrer" target=3D"_blank">s=
ystemd-udevd.service.<wbr>in</a><br>
-index e7216d6..1e9a600 100644<br>
---- a/units/<a href=3D"http://systemd-udevd.service.in" rel=3D"noreferrer"=
 target=3D"_blank">systemd-udevd.service.<wbr>in</a><br>
-+++ b/units/<a href=3D"http://systemd-udevd.service.in" rel=3D"noreferrer"=
 target=3D"_blank">systemd-udevd.service.<wbr>in</a><br>
-@@ -21,6 +21,5 @@ Sockets=3Dsystemd-udevd-control.<wbr>socket systemd-udev=
d-kernel.socket<br>
- Restart=3Dalways<br>
- RestartSec=3D0<br>
- ExecStart=3D@rootlibexecdir@/<wbr>systemd-udevd<br>
--MountFlags=3Dslave<br>
- KillMode=3Dmixed<br>
- WatchdogSec=3D1min<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_230.bb" re=
l=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_230.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_232.bb" rel=3D"noreferrer" target=3D"=
_blank">sy<wbr>stemd_232.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_230.bb" rel=
=3D"noreferrer" target=3D"_blank">syst<wbr>emd_230.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_232.bb" rel=
=3D"noreferrer" target=3D"_blank">syst<wbr>emd_232.bb</a><br>
index f60dd60..def6e05 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_230.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_230.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_232.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_232.bb</a><br>
@@ -25,18 +25,13 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0010-implment-systemd-<wbr=
>sysv-install-for-OE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-nss-mymachines-<wbr>B=
uild-conditionally-when-HAVE_<wbr>MYHOSTN.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-rules-whitelist-<wbr>=
hd-devices.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-sysv-generator-<wbr>a=
dd-support-for-executing-<wbr>scripts-und.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-Make-root-s-home-<wbr=
>directory-configurable.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-systemd-user-<wbr>avo=
id-using-system-auth.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-Revert-rules-<wbr>rem=
ove-firmware-loading-rules.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0017-Revert-udev-<wbr>remo=
ve-userspace-firmware-<wbr>loading-suppor.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-make-test-dir-<wbr>co=
nfigurable.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-remove-duplicate-<wbr=
>include-uchar.h.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0020-check-for-uchar.h-<wb=
r>in-configure.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0021-include-missing.h-<wb=
r>for-getting-secure_getenv-<wbr>definiti.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0022-socket-util-don-t-<wb=
r>fail-if-libc-doesn-t-support-<wbr>IDN.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://udev-re-enable-mount-<wbr>=
propagation-for-udevd.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-7795.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-Make-root-s-home-<wbr=
>directory-configurable.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-Revert-rules-<wbr>rem=
ove-firmware-loading-rules.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-Revert-udev-<wbr>remo=
ve-userspace-firmware-<wbr>loading-suppor.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-make-test-dir-<wbr>co=
nfigurable.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0017-remove-duplicate-<wbr=
>include-uchar.h.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-check-for-uchar.h-<wb=
r>in-configure.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-socket-util-don-t-<wb=
r>fail-if-libc-doesn-t-support-<wbr>IDN.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-uclibc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-units-Prefer-<wbr>get=
ty-to-agetty-in-console-<wbr>setup-system.patch \<br>
@@ -61,7 +56,6 @@ PACKAGECONFIG ??=3D &quot;xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timed=
ated \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 times=
yncd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local=
ed \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kdbus=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ima \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smack=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 login=
d \<br>
@@ -96,7 +90,6 @@ PACKAGECONFIG[timedated] =3D &quot;--enable-timedated,--d=
isable-<wbr>timedated&quot;<br>
=C2=A0PACKAGECONFIG[timesyncd] =3D &quot;--enable-timesyncd,--disable-<wbr>=
timesyncd&quot;<br>
=C2=A0PACKAGECONFIG[localed] =3D &quot;--enable-localed,--disable-<wbr>loca=
led&quot;<br>
=C2=A0PACKAGECONFIG[efi] =3D &quot;--enable-efi,--disable-efi&quot;<br>
-PACKAGECONFIG[kdbus] =3D &quot;--enable-kdbus,--disable-<wbr>kdbus&quot;<b=
r>
=C2=A0PACKAGECONFIG[ima] =3D &quot;--enable-ima,--disable-ima&quot;<br>
=C2=A0PACKAGECONFIG[smack] =3D &quot;--enable-smack,--disable-<wbr>smack&qu=
ot;<br>
=C2=A0# libseccomp is found in meta-security<br>
@@ -282,7 +275,7 @@ python populate_packages_prepend (){<br>
=C2=A0 =C2=A0 =C2=A0systemdlibdir =3D d.getVar(&quot;rootlibdir&quot;, True=
)<br>
=C2=A0 =C2=A0 =C2=A0do_split_packages(d, systemdlibdir, &#39;^lib(.*)\.so\.=
*&#39;, &#39;lib%s&#39;, &#39;Systemd %s library&#39;, extra_depends=3D&#39=
;&#39;, allow_links=3DTrue)<br>
=C2=A0}<br>
-PACKAGES_DYNAMIC +=3D &quot;^lib(udev|systemd).*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^lib(udev|systemd|nss).*&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-gui \<br>
@@ -491,6 +484,7 @@ RRECOMMENDS_${PN} +=3D &quot;${@bb.utils.contains(&#39;=
<wbr>PACKAGECONFIG&#39;, &#39;serial-getty-genera<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0os-release \<br>
=C2=A0&quot;<br>
<br>
+INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
=C2=A0INSANE_SKIP_${PN}-doc +=3D &quot; libdir&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;udev udev-hwdb&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141058e1fa823054259b66d--
