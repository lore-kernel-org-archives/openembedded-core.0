Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 506CC7E28B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:47:52 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id a24so6686756pgj.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z2hjGrWTAzsA5FRXIhC+OVRRmaM2bqRsqCJ7Hha/K9E=;
	b=pRW8B/WvIbmYq9nSzCvNjsX7l6aIj4lY7ShfMJq/UTlQXgpgNd0j1D0gC92E9b2g7m
	b5b/8+v8k5kcQC39x45APWjgVyL/2AXtA4RU/uTp4NpBZKzdFh0uL/yWZUc7RxhOY95X
	nAOxSG4WCB4aiQNxsJgF3AOnM71thdoRDTY2Bs3qtGWX6lSDi49qKb0hCWWuI0Le/IXY
	lsfMO3Jkhku8HpsnBj0CViHQnfvj3hVvrCFN9DEQpnZJtDyR+lleqxm6jlNSVvhgNjsn
	nHqJYfRG/BslnjF1Hysbeai/ph7XoLVKL/k2zh0uFS6EBsfCNGJOuPCCvnW9ayXvVmDd
	78Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z2hjGrWTAzsA5FRXIhC+OVRRmaM2bqRsqCJ7Hha/K9E=;
	b=KdoxjuwnetfnZ5RYRNazmQitPwY4CnxveJ7nIkflmvJAvEscgfpMmM1JsqLG1aYdmE
	/76U/+YtPzvJMpTXzHGUXhXoICoe55B//yWXOxMWHb/WdC4fy+u2T6liDekGsgvyzo9D
	QfkstXUDrLj8HRrtaDQQ21NMjsjPBJjiZc8B9Vw5znbETU3ecKLmXiy9KHIxlzOwkU89
	jzRgi8dVQYQkiszT2CQgfOXPcluz6xmN+gKioccreq7ctoYmBlrU3JeKFRkgLTGQH9OS
	uPd3AhZA61e0vV9E6VXoIhRns2kfPHipgRKmj1Ij9yOGSxHYNFff7kDItsAgDmVUjRlJ
	lsrA==
X-Gm-Message-State: APjAAAVehyx0JPUZJeapnGBqKsrgWAkoi/npGX/7WtGYJhsFdq0TdV8P
	LG6DJWGf9Z6sCrNaed4zZt1whE+ji+M=
X-Google-Smtp-Source: APXvYqybWwAgHD/Xqt398fqycUGTw11Zr+Vy9/T3mMgaZzfJzQeYy+Mc53n8uF1TYnPunDoavsp74g==
X-Received: by 2002:a17:90a:e57:: with SMTP id
	p23mr23893365pja.126.1569818872796; 
	Sun, 29 Sep 2019 21:47:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.47.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:47:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:46:55 -0700
Message-Id: <cover.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior-next 00/54] warrior-next pull request
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
X-List-Received-Date: Mon, 30 Sep 2019 04:47:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series passes the AB. 

Added to get AB to build:
useradd: Ensure do_populate_sysroot has dependency on useradd variables
useradd: Fix build architecture corruption of sstate artefacts

Picked up a few more backport requests.


The following changes since commit 952bfcc3f4b9ee5ba584da0f991f95e80654355a:

  curl: fix CVE-2019-5435 CVE-2019-5436 (2019-07-29 10:25:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-next

Adrian Bunk (1):
  libxcrypt: Fix the build with -Os

Anuj Mittal (14):
  binutils: fix CVE-2019-12972 CVE-2019-9071
  binutils: CVE-2019-9070 is same as CVE-2019-9071
  python: fix CVE-2019-9740
  libxslt: fix CVE-2019-13117 CVE-2019-13118
  glibc: CVE-2018-20796 is same as CVE-2019-9169
  libsdl: CVE fixes
  gstreamer1.0-vaapi: backport jpeg encode/decode fixes
  patch: fix CVE-2019-13636
  python3: fix CVE-2019-9740
  rsync: fix CVEs for included zlib
  patch: backport fixes
  binutils: fix CVE-2019-14250 CVE-2019-14444
  pango: fix CVE-2019-1010238
  glib-2.0: fix CVE-2019-13012

Armin Kuster (4):
  qemu: fix CVE-2018-20815
  gcc-8.3: Security fix for CVE-2019-14250
  Curl: Security fix for CVE-2019-5482
  gcc: Security fix for CVE-2019-15847

Bartosz Golaszewski (1):
  qemu: add a patch fixing the native build on newer kernels

Bedel, Alban (3):
  rng-tools: fix very long shutdown delay with systemd
  boost: Fix build and enable context and coroutines on aarch64
  kernel-uboot: compress arm64 kernels

Bruce Ashfield (3):
  linux-yocto/4.19: update to 4.19.57 and -rt22
  linux-yocto/4.19: update to v4.19.61
  kernel-devsrc: tweak for v5.3+

Fabio Berton (1):
  mesa: Update 19.0.1 -> 19.0.8

Jason Wessel (5):
  psmisc: Fix dependency for USE_NLS=no
  glibc: Fix multilibs + usrmerge builds
  glibc-locale: Fix build error with PACKAGE_NO_GCONV = "1"
  glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and
    multilibs
  glibc / glibc-locale: Fix stash_locale determinism problems

Joël Esponde (1):
  package.bbclass: fix directories setuid and setgid bits

Jun Nie (1):
  kernel-fitimage: uboot-sign: fix missing signature

Martin Jansa (3):
  icecc.bbclass: catch subprocess.CalledProcessError
  meson: backport fix for builds with -Werror=return-type
  powertop: import a fix from buildroot

Nathan Rossi (1):
  binutils: Fix mips patch which changes default emulation

Naveen Saini (1):
  ghostscript: fix CVE-2019-3839

Ricardo Ribalda Delgado (1):
  dpkg: Use less as pager

Richard Purdie (3):
  package: Improve determinism
  useradd: Fix build architecture corruption of sstate artefacts
  useradd: Ensure do_populate_sysroot has dependency on useradd
    variables

Robert Yang (1):
  multilib.bbclass: Reduce ALTERNATIVE_PRIORITY for extended recipes

Ross Burton (5):
  libid3tag: handle unknown encodings (CVE-2017-11550)
  libid3tag: CVE-2017-11551 is the same as CVE-2004-2779
  tiff: fix CVE-2019-6128
  tiff: fix CVE-2019-7663
  cve-check: backport rewrite from master

Sean Nyekjaer (1):
  libgpg-error: Fix build with gawk 5.x

Trevor Gamblin (1):
  patch: fix CVE-2019-13638

Will Page (1):
  uboot: fixes to uboot-extlinux-config attribute values

Zhixiong Chi (2):
  gcc: reduce the variables in symtab
  gcc: CVE-2018-12886

 meta/classes/cve-check.bbclass                     | 142 ++--
 meta/classes/icecc.bbclass                         |   6 +-
 meta/classes/kernel-uboot.bbclass                  |   4 -
 meta/classes/multilib.bbclass                      |  47 ++
 meta/classes/package.bbclass                       |   5 +-
 meta/classes/staging.bbclass                       |   2 +-
 meta/classes/uboot-extlinux-config.bbclass         |  13 +-
 meta/classes/uboot-sign.bbclass                    |   4 +-
 meta/classes/useradd.bbclass                       |   7 +-
 meta/conf/distro/include/maintainers.inc           |   1 +
 meta/lib/oe/package.py                             |   2 +-
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         |  40 +
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb      |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   6 +
 meta/recipes-core/glibc/glibc-mtrace.inc           |   3 +
 meta/recipes-core/glibc/glibc-package.inc          |  61 +-
 meta/recipes-core/glibc/glibc-scripts.inc          |   3 +
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch  |   1 +
 meta/recipes-core/glibc/glibc_2.29.bb              |   1 -
 meta/recipes-core/libxcrypt/libxcrypt.bb           |   4 +-
 meta/recipes-core/meta/cve-update-db-native.bb     | 195 +++++
 meta/recipes-devtools/binutils/binutils-2.32.inc   |   4 +
 ...Change-default-emulation-for-mips64-linux.patch |   9 +-
 .../binutils/binutils/CVE-2019-12972.patch         |  51 ++
 .../binutils/binutils/CVE-2019-14250.patch         |  33 +
 .../binutils/binutils/CVE-2019-14444.patch         |  28 +
 .../binutils/binutils/CVE-2019-9071.patch          | 165 +++++
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  62 --
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch |  50 --
 ...ow-overriding-default-CA-certificate-file.patch | 215 ------
 ...ogress-in-percent-when-downloading-CVE-db.patch | 135 ----
 ...are-computed-vs-expected-sha256-digit-str.patch |  52 --
 .../check-for-malloc_trim-before-using-it.patch    |  51 --
 meta/recipes-devtools/dpkg/dpkg/pager.patch        |  21 +
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb          |   1 +
 meta/recipes-devtools/gcc/gcc-8.3.inc              |   6 +
 .../gcc/gcc-8.3/0042-PR-debug-86964.patch          |  94 +++
 ...vent-spilling-of-stack-protector-guard-s-.patch | 813 +++++++++++++++++++++
 .../gcc/gcc-8.3/CVE-2019-14250.patch               |  44 ++
 .../gcc/gcc-8.3/CVE-2019-15847_p1.patch            | 521 +++++++++++++
 .../gcc/gcc-8.3/CVE-2019-15847_p2.patch            |  77 ++
 .../gcc/gcc-8.3/CVE-2019-15847_p3.patch            |  45 ++
 meta/recipes-devtools/meson/meson.inc              |   1 +
 ...-return-statements-that-are-seen-with-Wer.patch |  84 +++
 ...k-temporary-file-on-failed-ed-style-patch.patch |  93 +++
 ...ak-temporary-file-on-failed-multi-file-ed.patch |  80 ++
 ...ke-ed-directly-instead-of-using-the-shell.patch |  44 ++
 .../patch/patch/CVE-2019-13636.patch               | 113 +++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |   4 +
 .../python/python/CVE-2019-9740.patch              | 215 ++++++
 .../python/python3/CVE-2019-9740.patch             | 151 ++++
 meta/recipes-devtools/python/python3_3.7.2.bb      |   1 +
 meta/recipes-devtools/python/python_2.7.16.bb      |   1 +
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 ...fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 339 +++++++++
 .../qemu/qemu/CVE-2018-20815.patch                 |  38 +
 .../rsync/files/CVE-2016-9840.patch                |  75 ++
 .../rsync/files/CVE-2016-9841.patch                | 228 ++++++
 .../rsync/files/CVE-2016-9842.patch                |  33 +
 .../rsync/files/CVE-2016-9843.patch                |  53 ++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb         |   4 +
 .../ghostscript/CVE-2019-3839-0008.patch           | 440 +++++++++++
 .../ghostscript/ghostscript_9.26.bb                |   1 +
 meta/recipes-extended/psmisc/psmisc.inc            |   2 +-
 .../libsdl/libsdl-1.2.15/CVE-2019-7572.patch       | 114 +++
 .../libsdl/libsdl-1.2.15/CVE-2019-7574.patch       |  68 ++
 .../libsdl/libsdl-1.2.15/CVE-2019-7575.patch       |  81 ++
 .../libsdl/libsdl-1.2.15/CVE-2019-7576.patch       |  80 ++
 .../libsdl/libsdl-1.2.15/CVE-2019-7577.patch       | 123 ++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7578.patch       |  64 ++
 .../libsdl/libsdl-1.2.15/CVE-2019-7635.patch       |  63 ++
 .../libsdl/libsdl-1.2.15/CVE-2019-7637.patch       | 192 +++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7638.patch       |  38 +
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   9 +
 .../mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb}  |   0
 .../mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb}        |   4 +-
 .../pango/pango/CVE-2019-1010238.patch             |  38 +
 meta/recipes-graphics/pango/pango_1.42.4.bb        |   4 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb         |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |  20 +-
 .../0001-wakeup_xxx.h-include-limits.h.patch       |  55 ++
 meta/recipes-kernel/powertop/powertop_2.10.bb      |   1 +
 ...der-release-VA-buffers-after-vaEndPicture.patch |  45 ++
 ...ibs-encoder-jpeg-set-component-id-and-Tqi.patch |  65 ++
 .../gstreamer/gstreamer1.0-vaapi_1.14.4.bb         |   2 +
 .../libid3tag/libid3tag/10_utf16.patch             |   1 +
 .../libid3tag/libid3tag/unknown-encoding.patch     |  39 +
 .../libid3tag/libid3tag_0.15.1b.bb                 |   1 +
 .../libtiff/tiff/CVE-2019-6128.patch               |  52 ++
 .../libtiff/tiff/CVE-2019-7663.patch               |  77 ++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |   3 +-
 meta/recipes-support/boost/boost.inc               |   2 +
 meta/recipes-support/curl/curl/CVE-2019-5482.patch |  65 ++
 meta/recipes-support/curl/curl_7.64.1.bb           |   1 +
 .../libgpg-error-1.35-gawk5-support.patch          | 161 ++++
 .../libgpg-error/libgpg-error_1.35.bb              |   1 +
 .../libxslt/files/CVE-2019-13117.patch             |  33 +
 .../libxslt/files/CVE-2019-13118.patch             |  76 ++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   2 +
 .../rng-tools/rng-tools/rngd.service               |   3 +-
 102 files changed, 5934 insertions(+), 694 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0043-PR85434-Prevent-spilling-of-stack-protector-guard-s-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p1.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p3.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2019-9740.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9843.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0008.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb} (85%)
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-decoder-release-VA-buffers-after-vaEndPicture.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-encoder-jpeg-set-component-id-and-Tqi.patch
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13117.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13118.patch

-- 
2.7.4


