Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2866B073
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j16so6844225wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=utN9Ak+fiVCpK6WBa8Jdoxc6le/6hf2ozF08+oiWXoc=;
	b=MFNKpYQbzkJzfjxsty1WeP2febKRstodquu/zPYLjRKRN6QDVeqTf5IlYjVtTeKcOn
	+QDaY05J+Z/x5OwXUnPs36ZVJsbxrnBjyDiScif0A9YVqU1jDTfmHprfT0Wp4VhVBGcA
	u4sjJIDqriMUoy1SzFRO0dH3PsEM00tLC5AktQmXZtACW01UroKVOHqnCPPxQg6zYMJo
	TbXp9raJuPITEmYj7djOdpHu5WLLpy5HlO5sMqUYLmoYrokpGBPLDRPnjedANVCAQH3e
	tSYl0xLxxA6Y5qj3rs4rruINKHSQXYhui0VAK5PTl+so2r1EK0CbUrQpIe6RViz9WGE7
	mccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=utN9Ak+fiVCpK6WBa8Jdoxc6le/6hf2ozF08+oiWXoc=;
	b=EaycRsbpl1g67RlUi6SYuf6TpunzJkBKSIlCx4QYpLhp+oCqabUqsJ5FfoOL9sdVG7
	npACQeor7k2KiRlWSZQhRXRq1EO11xfoUoNHc+DibMXz3ZExLvPtk0tRyTTooq9ZKgsQ
	AzYlwjAqG5j6LUIOT8n+mjBStDIn3c4AmXYvR6cSZqTeodBOpeZb63iHSfvrm7yLGGfq
	z/MUFJVyaMCUyS+xY8KB2mTrUrofNmljf5VJmpQ/5DaKz3tOKcK9GAb8mJ6Q0BtPgFf3
	bC2Ka/3neYgxKCavgfqDRqE5WWE+EebkkMsCcGKyhP7+I/d7iM4RmAPKiaSybeBXd3eg
	9ZfQ==
X-Gm-Message-State: APjAAAUErns41v/05R2LUKkdKRIyV6y9p4OtywT+ooy+dIVbkEPtcY7r
	TOKJTBmt/0xQ8nMA1fVRKDtpGHoM
X-Google-Smtp-Source: APXvYqzOuww7bPjjQZrexsDLragWtoLp8ioa/Zf0mAQNQPWWriqwLbFRG8iukr9HvfO7I1TPpZLB9Q==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr15333629wrn.62.1567169404846; 
	Fri, 30 Aug 2019 05:50:04 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:45 +0200
Message-Id: <cover.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 00/13] (almost) the last batch of py2 dependencies removal and a few other items
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:04 -0000

The reason to send this as a formal pull request is that one of the patches
removed a blob, and I am not sure if that can be handled via emails.

With this patchset and Bruce's kernel python2->3 work, the only two
things in oe-core that still need a python2 binary at build time are u-boot and
python 2.x itself. At runtime py2 dependencies are entirely eliminated.

The following changes since commit ba6a568512d46d49173998a7fb15cd8ee3302551:

  ca-certificates: Fix reproducibilty and multilib issue (2019-08-29 17:12:34 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (13):
  rpm: resolve a host contamination issue for mono packaging
  qemu: set default RAM to 256M for all machines
  qemu: switch to '-vga std' emulated hardware from vmware/cirrus for
    x86/mips
  mesa: disable gallium swrast driver on x86 x32
  ltp: move from python 2.x to python 3.x
  ca-certificates: use python 3 for builds
  libpsl: use python 3 during builds
  pseudo: use python 3 during builds
  llvm: use python 3 during builds
  virglrenderer: update 0.7.0 -> 0.8.0
  eglinfo: remove the recipe
  webkitgtk: use Python 3 for builds
  webkitgtk: update 2.24.3 -> 2.24.4

 meta/conf/machine/include/qemuboot-mips.inc   |   3 +-
 meta/conf/machine/include/qemuboot-x86.inc    |   2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc |   1 -
 meta/conf/machine/qemuarm.conf                |   1 -
 meta/conf/machine/qemuarm64.conf              |   1 -
 meta/conf/machine/qemux86-64.conf             |   6 +-
 meta/conf/machine/qemux86.conf                |   1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      |   4 +
 meta/recipes-devtools/llvm/llvm_git.bb        |   2 +-
 ...001-maketables-wrappers-use-Python-3.patch |  34 ++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 ...es-requires-do-not-use-monodis-from-.patch |  58 ++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 ...thon3-everywhere-to-run-python-scrip.patch | 161 +++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb     |   3 +-
 .../eglinfo/eglinfo-fb_1.0.0.bb               |   7 -
 .../eglinfo/eglinfo-wayland_1.0.0.bb          |  13 --
 .../eglinfo/eglinfo-x11_1.0.0.bb              |  13 --
 meta/recipes-graphics/eglinfo/eglinfo.inc     |  38 ----
 ...INCDIR-to-searchpath-for-egl-headers.patch |  33 ----
 ...01-Check-for-libegl-using-pkg-config.patch |  36 ----
 meta/recipes-graphics/eglinfo/files/waf       | 169 ------------------
 meta/recipes-graphics/mesa/mesa.inc           |   3 +
 ...efile.am-explicitly-link-with-libdrm.patch |  31 ----
 .../0001-vtest-add-missing-includes.patch     |  38 ----
 ...nderer_0.7.0.bb => virglrenderer_0.8.0.bb} |   4 +-
 ...tings-so-that-gtkdoc-generation-work.patch |  10 +-
 ...uild-failure-https-bugs.webkit.org-s.patch |  33 ----
 ...ebkitgtk_2.24.3.bb => webkitgtk_2.24.4.bb} |   7 +-
 .../0001-certdata2pem.py-use-python3.patch    |  37 ++++
 .../ca-certificates_20190110.bb               |   1 +
 ...-PYTHON-when-invoking-psl-make-dafsa.patch |  50 ++++++
 meta/recipes-support/libpsl/libpsl_0.21.0.bb  |   1 +
 scripts/runqemu                               |  10 +-
 34 files changed, 373 insertions(+), 440 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
 delete mode 100644 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
 delete mode 100644 meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb
 delete mode 100644 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
 delete mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc
 delete mode 100644 meta/recipes-graphics/eglinfo/files/0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch
 delete mode 100644 meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch
 delete mode 100755 meta/recipes-graphics/eglinfo/files/waf
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.7.0.bb => virglrenderer_0.8.0.bb} (76%)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Unreviewed-fix-build-failure-https-bugs.webkit.org-s.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.24.3.bb => webkitgtk_2.24.4.bb} (95%)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
 create mode 100644 meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch

-- 
2.17.1


