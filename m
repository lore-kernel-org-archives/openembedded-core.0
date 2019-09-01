Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D01957F285
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:24 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id w11so5446404plp.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ihUS+oBu7VDTAy10gUw66WsSq+vQG6TR08rEcVGAJ8g=;
	b=m8Wd9MYZJ7Do3GzL6CHhLDBpDkmYwxnDIx7VM3YUPE5GMu8bJN5trrHCN6BiAnM3Kg
	vzUykvtZUSp6RhePq83L+RULMOJXvZmw3k4vEF5hr0KxQb5Y1U0X1sLxCCUuQss4tLch
	Z5L4R+g4HpOQ0OflM/DVY/ofFTSOFezqUJhCH+5TGaq+popWkxoARQ83SIsJJWLyd/+W
	2bZq1tLCmp2dUkclwXVxOc01OoYPrIyCHSIFQ0A5+pJQA3qoFNqsprKoDXvn1kHgp09A
	IJ96w0dVgUiVL9A+z9qnCHm5aj3xZM6YZwtdxU2pL7qeTPLBwFwIQ5Y1nqnfG6RnC+YS
	QtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ihUS+oBu7VDTAy10gUw66WsSq+vQG6TR08rEcVGAJ8g=;
	b=AzheHsmCx22j4bPrHpfG8ZqcuogrAUBoxwR2a6HcKDH4wMcZ7TAcJelZ5GsQZxtO/X
	NCsQ7f4xCrDyXWiCDLstq77sanTPVTOAg3q/C1Uiy74HDOHUWJpHihwv8VSvYOZAWzrP
	2Boy3jRGjrnxAkVvu8ULiXNkmXu9w0+MSXwgwV5ApDE0WaiIPGM7PEYsBJ7vDQI7J0BB
	eWaNJQJIpbgVDFbTP676Zql7eRrIqv0TO9CEAKRdPN4b6yPjw9U0azQ8XVupf0tkXdsK
	tJgZUH0XWiAcR+6h6Yzf5T5rYJbmy8Gno1hguIy7mKWfIM/SLOD+D6IyGoxlSW/n4pa1
	PlEQ==
X-Gm-Message-State: APjAAAVbSrAhiBUcCxRDU81xv2ev9zAq47eHErQAspfWKduzfIBsjchX
	8Zqc0SliKOfn0yPHTLa1InFnwMdy
X-Google-Smtp-Source: APXvYqxgFf+m9Essm03gDgfYdn+KGkxPyYqUtDGyYwbtALeYzMEKeQoUqqu/8sksb3VSB79SdIUhPg==
X-Received: by 2002:a17:902:b583:: with SMTP id
	a3mr2134028pls.52.1567348585582; 
	Sun, 01 Sep 2019 07:36:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:38 -0700
Message-Id: <cover.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior 00/43] Patch review
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have feedback by Tuesday

The following changes since commit 952bfcc3f4b9ee5ba584da0f991f95e80654355a:

  curl: fix CVE-2019-5435 CVE-2019-5436 (2019-07-29 10:25:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Alex Kiernan (1):
  systemd: Backport OpenSSL BUF_MEM fix

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

Armin Kuster (2):
  qemu: fix CVE-2018-20815
  gcc-8.3: Security fix for CVE-2019-14250

Bartosz Golaszewski (1):
  qemu: add a patch fixing the native build on newer kernels

Bedel, Alban (2):
  rng-tools: fix very long shutdown delay with systemd
  boost: Fix build and enable context and coroutines on aarch64

Bruce Ashfield (2):
  linux-yocto/4.19: update to 4.19.57 and -rt22
  linux-yocto/4.19: update to v4.19.61

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

Richard Purdie (1):
  package: Improve determinism

Ross Burton (4):
  libid3tag: handle unknown encodings (CVE-2017-11550)
  libid3tag: CVE-2017-11551 is the same as CVE-2004-2779
  tiff: fix CVE-2019-6128
  tiff: fix CVE-2019-7663

Trevor Gamblin (1):
  patch: fix CVE-2019-13638

Zhixiong Chi (2):
  gcc: reduce the variables in symtab
  gcc: CVE-2018-12886

 meta/classes/icecc.bbclass                         |   6 +-
 meta/classes/package.bbclass                       |   5 +-
 meta/lib/oe/package.py                             |   2 +-
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         |  40 +
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb      |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   3 +
 meta/recipes-core/glibc/glibc-package.inc          |  61 +-
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch  |   1 +
 meta/recipes-core/glibc/glibc_2.29.bb              |   1 -
 ...lved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch |  41 ++
 meta/recipes-core/systemd/systemd_241.bb           |   1 +
 meta/recipes-devtools/binutils/binutils-2.32.inc   |   4 +
 ...Change-default-emulation-for-mips64-linux.patch |   9 +-
 .../binutils/binutils/CVE-2019-12972.patch         |  51 ++
 .../binutils/binutils/CVE-2019-14250.patch         |  33 +
 .../binutils/binutils/CVE-2019-14444.patch         |  28 +
 .../binutils/binutils/CVE-2019-9071.patch          | 165 +++++
 meta/recipes-devtools/dpkg/dpkg/pager.patch        |  21 +
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb          |   1 +
 meta/recipes-devtools/gcc/gcc-8.3.inc              |   3 +
 .../gcc/gcc-8.3/0042-PR-debug-86964.patch          |  94 +++
 ...vent-spilling-of-stack-protector-guard-s-.patch | 813 +++++++++++++++++++++
 .../gcc/gcc-8.3/CVE-2019-14250.patch               |  44 ++
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
 .../libxslt/files/CVE-2019-13117.patch             |  33 +
 .../libxslt/files/CVE-2019-13118.patch             |  76 ++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   2 +
 .../rng-tools/rng-tools/rngd.service               |   3 +-
 78 files changed, 4742 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0043-PR85434-Prevent-spilling-of-stack-protector-guard-s-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-14250.patch
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
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13117.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13118.patch

-- 
2.7.4


