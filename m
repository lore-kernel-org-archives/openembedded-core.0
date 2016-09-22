Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2196965C5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 16:40:19 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q2so4020003pfj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cd8kM2lvbvQPe+7Pp1p0nFKPoUYOre9Bvs48U5MOlm0=;
	b=OsPaUjDOAajP2pOysPNAlJ8NuckbtCN1yKabK03u6BD5whCbTNcBNb7ThGUcThm/5M
	tKLLz3moKKhWnRDTMmFoh397angCClCzIcroyWXUj3GNOGsMVlzvF8e5mw8CHUVZLupU
	gy6S3N915sir3P7p/HZyOttJjZLu6w4fWwQkBrmX/WcLweJAxVNVzZbtyKR6AtUb/NKA
	Bu642+Uxq7EPDp83Lv4KFmULn/qx3KdjjMlq8xWsxpLGSXRPTjPlk9FIQ2BFj3MJTYqy
	aSKVWZ4V35PQoKx5fgBx3bq5mIPuzXwpmTrqCgtqkxWr1UsLr041Vsdb+jLtmUdQE3IQ
	mYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cd8kM2lvbvQPe+7Pp1p0nFKPoUYOre9Bvs48U5MOlm0=;
	b=OHQSH3lZmv411NxJG5W8c9ElvYx2xfDWy960RBEUHw1PXtLJtBi5P6FpFyj8KbZwJc
	jo9zez+xGXQ9StKeCTMGl+Cn2+p584CCIRdo+yN/3OCOFfWnNqPzxpP9Yzi9KAkfne80
	L+XmxAr/qbmeix7D6Y8UQWGUXE602NNIgzECwyKQTgxgf9y2bC3ja7SDxKWxp6Wzi3tB
	RbR74U7ldk73eVpMJwl6i7Upqc4updtg8pfYe+DI7Vst9UdZx5z2ZmN6wd09ck9wGu7L
	E1zYKeyz0B/zx7In7vqxI86pwVxYRvK4TQFIlWk8NcV25igCkCV6jsJMlAlc3BUY4vtX
	Y8LA==
X-Gm-Message-State: AE9vXwPtNJNagiuPNppVxP6KNHmRhDnc5WNzD2KlfkgmOkvze1VaE1OgLgGYZWUe1APyEg==
X-Received: by 10.98.93.204 with SMTP id n73mr4741862pfj.87.1474562421133;
	Thu, 22 Sep 2016 09:40:21 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:c1fa:d80c:b211:8746])
	by smtp.gmail.com with ESMTPSA id gm1sm5415054pac.2.2016.09.22.09.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Sep 2016 09:40:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 09:39:16 -0700
Message-Id: <cover.1474562101.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/60] krogoth-next staged
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
X-List-Received-Date: Thu, 22 Sep 2016 16:40:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are the changes I have staged. The last 17 changes have not be run on the AB. We are working throught build issues on mips64.

The following changes since commit 8c69f7d56cbd496aa01ba0738675a170826a536b:

  bitbake: lib/bb/tests/fetch: remove URL that doesn't exist anymore (2016-09-13 16:19:46 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Alejandro Hernandez (1):
  initramfs-live-boot: Make sure we kill udev before switching root when
    live booting

Alexander Kanavin (2):
  gobject-introspection.bbclass: disable introspection for -native and
    -nativesdk recipes
  arch-mips.inc: Disable QEMU usermode usage when building with n32 ABI

Armin Kuster (13):
  tiff: Security fix CVE-2015-8781
  tiff: Security fix CVE-2015-8784
  openssh: Security fix CVE-2016-6210
  openssh: Security fix CVE-2016-5615
  openssh: Security fix CVE-2015-8325
  wget: Security fix CVE-2016-4971
  util-linux: Security fix for CVE-2016-5011
  qemu: Security Fix CVE-2016-3710
  qemu: Security Fix CVE-2016-3712
  qemu: Security fix CVE-2016-4439
  qemu: Security fix CVE-2016-6351
  qemu: Security fix for CVE-2016-4002
  qemu: Secuirty fix for CVE-2016-5403

Bill Randle (3):
  perl: set proper perl subversion number in config files
  perl: some perl tests require libssp
  perl: fix several perl test failures

Dengke Du (1):
  busybox: fix "sed n (flushes pattern space, terminates early)"
    testcase failure

He Zhe (1):
  perl: Correct perl path for ptest

Henry Bruce (1):
  npm: npm.bbclass now adds nodejs to RDEPENDS

Ioan-Adrian Ratiu (1):
  perl-native: backport libnm link fix

Jackie Huang (1):
  e2fsprogs: Fix missing check for permission denied.

Jacob Kroon (1):
  bitbake.conf/toolchain-scripts.bbclass: Remove debug prefix mappings
    in SDK

Jeremy Puhlman (2):
  Fix random python backtrace in mutlilib handling code.
  bitbake.conf: set READELF for cross compilation

Jonathan Liu (1):
  meta/classes: fix bb.build.FuncFailed typos

Juro Bystricky (1):
  busybox: Avoid race building libbb

Jérémy Rosen (1):
  rpm: manually cleanup sysck

Kai Kang (1):
  perl: fix CVE-2016-2381

Khem Raj (4):
  python{3}-numpy: Predefine of sizeof off_t on mips/mipsel/ppc
  systemd: Create missing sysusers offline
  gdb: Cache gnu gettext config vars for musl builds
  xserver-xf86-config: pre-load int10 and exa modules

Mariano Lopez (1):
  python-smartpm_git.bb: Add patch for debugging random errors

Markus Lehtonen (2):
  base.bbclass wipe ${S} before unpacking source
  python-smartpm: use md5 as the digest for rpm_sys channel

Maxin B. John (1):
  useradd_base: avoid unintended expansion for useradd parameters

Mingli Yu (2):
  perl: fix CVE-2016-6185
  perl: fix CVE-2015-8607

Pascal Bach (1):
  gcc, qemuppc: Explicitly disable forcing SPE flags for 4.9

Reinette Chatre (1):
  binutils: advance SRCREV to obtain versioned symbols

Richard Purdie (3):
  busybox: Backport makefile fix from upstream
  busybox: Add parallel make fix
  python-smartpm: Avoid locale issue with bitbake python3

Robert Yang (1):
  rpm: make --nosignature work

Ross Burton (1):
  cml1: fix tasks after default [dirs] changed

Sona Sarmadi (3):
  sudo: CVE-2015-8239
  curl: security fix for CVE-2016-7141
  dropbear: upgrade to 2016.72

Stefan Agner (1):
  busybox: Fix busybox-init on non-tty consoles

Stephano Cetola (1):
  systemd: allow add users as a rootfs postprocess cmd

Tanu Kaskinen (1):
  pulseaudio: fix crash when disconnecting bluetooth devices

Thomas Witt (1):
  cmake.bbclass: call cmake with a relative path

Yi Zhao (3):
  tiff: Security fix CVE-2016-3186
  tiff: Security fix CVE-2016-5321
  tiff: Security fix CVE-2016-5323

Zhixiong Chi (1):
  rpm: ensure rpm2cpio call rpm relocation code

mingli.yu@windriver.com (1):
  python-smartpm: add support to check signatures

 meta/classes/base.bbclass                          |  18 +-
 meta/classes/cmake.bbclass                         |  14 +-
 meta/classes/cml1.bbclass                          |   2 +
 meta/classes/gobject-introspection.bbclass         |  14 +-
 meta/classes/grub-efi.bbclass                      |   2 +-
 meta/classes/gummiboot.bbclass                     |   4 +-
 meta/classes/multilib_global.bbclass               |   3 +-
 meta/classes/npm.bbclass                           |   1 +
 meta/classes/rootfs-postcommands.bbclass           |  43 +-
 meta/classes/syslinux.bbclass                      |   2 +-
 meta/classes/toolchain-scripts.bbclass             |   3 +
 meta/classes/useradd_base.bbclass                  |   2 -
 meta/conf/bitbake.conf                             |   9 +-
 meta/conf/machine/include/mips/arch-mips.inc       |   3 +
 meta/conf/machine/qemux86-64.conf                  |   5 +-
 meta/conf/machine/qemux86.conf                     |   5 +-
 .../openssh/openssh/CVE-2015-8325.patch            |  33 +
 .../openssh/openssh/CVE-2016-6210.patch            | 114 ++++
 .../openssh/openssh/CVE-2016-6210_p2.patch         | 110 ++++
 .../openssh/openssh/CVE-2016-6210_p3.patch         |  62 ++
 .../openssh/openssh/CVE-2016-6515.patch            |  54 ++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   5 +
 meta/recipes-core/busybox/busybox.inc              |   4 +-
 ...-n-flushes-pattern-space-terminates-early.patch |  72 +++
 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 ++
 .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ++
 .../busybox/busybox/makefile-fix-backport.patch    |  40 ++
 .../busybox/busybox/makefile-libbb-race.patch      |  34 +
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   5 +
 meta/recipes-core/dropbear/dropbear_2015.71.bb     |   5 -
 meta/recipes-core/dropbear/dropbear_2016.72.bb     |   4 +
 meta/recipes-core/initrdscripts/files/init-live.sh |   4 +-
 meta/recipes-core/systemd/systemd_229.bb           |   8 +-
 .../util-linux/util-linux/CVE-2016-5011.patch      |  59 ++
 .../util-linux/util-linux/CVE-2016-5011_p2.patch   |  91 +++
 meta/recipes-core/util-linux/util-linux_2.27.1.bb  |   2 +
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   2 +-
 ...s-fix-missing-check-for-permission-denied.patch |  32 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |   3 +
 ...AltiVec-generation-on-powepc-linux-target.patch |  11 +
 meta/recipes-devtools/gdb/gdb_7.10.1.bb            |   5 +
 meta/recipes-devtools/perl/perl-native_5.22.1.bb   |   1 +
 meta/recipes-devtools/perl/perl-ptest.inc          |   3 +-
 meta/recipes-devtools/perl/perl/config.sh          |  10 +-
 meta/recipes-devtools/perl/perl/perl-configure.sh  |   2 +-
 .../perl/perl/perl-fix-CVE-2015-8607.patch         |  74 +++
 .../perl/perl/perl-fix-CVE-2016-2381.patch         | 113 ++++
 .../perl/perl/perl-fix-CVE-2016-6185.patch         | 128 ++++
 ...erl-fix-conflict-between-skip_all-and-END.patch | 181 ++++++
 .../perl/perl/perl-remove-nm-from-libswanted.patch |  30 +
 .../perl/perl/perl-test-customized.patch           |  61 ++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   5 +
 .../python/python-numpy/arm/numpyconfig.h          |   1 +
 .../python/python-numpy/mips/_numpyconfig.h        |   1 +
 .../python/python-numpy/powerpc/_numpyconfig.h     |   1 +
 ...m_sys-use-md5sum-instead-of-mtime-as-the-.patch |  38 ++
 ...art-add-deugging-when-targetpath-is-empty.patch |  47 ++
 .../python/python-smartpm/smart-locale.patch       |  27 +
 ...=> smartpm-rpm5-support-check-signatures.patch} |  67 +-
 meta/recipes-devtools/python/python-smartpm_git.bb |   5 +-
 .../recipes-devtools/qemu/qemu/CVE-2016-3710.patch | 112 ++++
 .../qemu/qemu/CVE-2016-3712_p1.patch               |  73 +++
 .../qemu/qemu/CVE-2016-3712_p2.patch               | 132 ++++
 .../qemu/qemu/CVE-2016-3712_p3.patch               |  34 +
 .../qemu/qemu/CVE-2016-3712_p4.patch               |  80 +++
 .../recipes-devtools/qemu/qemu/CVE-2016-4002.patch |  39 ++
 .../recipes-devtools/qemu/qemu/CVE-2016-4439.patch |  46 ++
 .../recipes-devtools/qemu/qemu/CVE-2016-5403.patch |  67 ++
 .../qemu/qemu/CVE-2016-6351_p1.patch               |  75 +++
 .../qemu/qemu/CVE-2016-6351_p2.patch               |  60 ++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  10 +
 ...0001-system.h-query.c-support-nosignature.patch |  64 ++
 ...-ensure-rpm2cpio-call-rpm-relocation-code.patch |  25 +
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   4 +-
 .../sudo/sudo/CVE-2015-8239-1.patch                | 699 +++++++++++++++++++++
 .../sudo/sudo/CVE-2015-8239-2.patch                |  45 ++
 meta/recipes-extended/sudo/sudo_1.8.15.bb          |   2 +
 .../recipes-extended/wget/wget/CVE-2016-4971.patch | 295 +++++++++
 meta/recipes-extended/wget/wget_1.17.1.bb          |   1 +
 .../xserver-xf86-config/10-preload-modules.conf    |   2 +-
 .../libtiff/files/CVE-2015-8781.patch              | 195 ++++++
 .../libtiff/files/CVE-2015-8784.patch              |  73 +++
 .../libtiff/files/CVE-2016-3186.patch              |  24 +
 .../libtiff/files/CVE-2016-5321.patch              |  49 ++
 .../libtiff/files/CVE-2016-5323.patch              | 107 ++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   5 +
 ...th-don-t-create-the-HSP-HFP-profile-twice.patch | 343 ++++++++++
 .../pulseaudio/pulseaudio_8.0.bb                   |   1 +
 meta/recipes-support/curl/curl/CVE-2016-7141.patch |  50 ++
 meta/recipes-support/curl/curl_7.47.1.bb           |   1 +
 90 files changed, 4429 insertions(+), 82 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210_p3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6515.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 create mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 create mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
 create mode 100644 meta/recipes-core/busybox/busybox/makefile-libbb-race.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2016.72.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2016-5011.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2016-5011_p2.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-6185.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-test-customized.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-add-deugging-when-targetpath-is-empty.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-locale.patch
 rename meta/recipes-devtools/python/python-smartpm/{smartpm-rpm5-nodig.patch => smartpm-rpm5-support-check-signatures.patch} (48%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4439.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-5403.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-6351_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-6351_p2.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2015-8239-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2015-8239-2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2016-4971.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-7141.patch

-- 
2.7.4


