Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id F08476080F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:56:13 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 128so2684956pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=7V/UizpGctju6fhDdBWF1hI3/S3K2kpI6FwklxIRVoE=;
	b=k5vxi0oNVfQBCKoiUTmaDx0F1+tKnMobPaOnMgFoKPEgMGKQtRlPDPHB5Nnyvu++yW
	IOt56fx9tUNXAu/YXgJNe68ULSUMfmJACjs/AwWP/7MKo+KeBzZqpb8dM//QP52knnMR
	5qPeK8Pa51BUXXAT+Ub3C9OuqOuAxNG6TPqIy+n/LzO8hAJDtBRYueryHnpgdZt97C8v
	sKCNK1olJeAspkRAGs+Nlh5lUqPke5+/Dd0uFyFKvjQAHY1LHbI89VhYJEXxu1yL6AsL
	8iBjuQwJibZfnXK3xdDxCTX+gARTGy3UsaUzARa/GwtdqoIiZyK+heHujCL3Qa9NuUtb
	XA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7V/UizpGctju6fhDdBWF1hI3/S3K2kpI6FwklxIRVoE=;
	b=bL1eq18qLLbS5vNfen3QJfxCASSGDXd3ZMCPc7EVgwbzE7uUwiZlfaEvADqb4eZxpJ
	r5zK447pUQwrgOQ3uCC0cF9KBW6u7IKpDWZlSIjrfpKlgsrgcLn8TBpss8Kl4CBshp1A
	2upu5hU4I7D7omHHa0zJZagclzleFZcW987gFetW8FdAnbAKqtAltCBW082Kn+jvzUUO
	Jjrc1nIVB+AslO+Bw/Em18amxbWsesWhEzLKddz6qaVgL7/+VDEBVD571DTmhr72AUyl
	fmilFUeliSaCY5Bvb5MfquWiOO8j68OrT0FrZWWww9OtfRWa+XgHBeT2k3sseDct01TA
	3dRw==
X-Gm-Message-State: AE9vXwOEBtIN6V5e79IVwYkW9ULyBW2XNaq+b3A7ngr6YJimefEuA9rZukpJbOZWE4TpPA==
X-Received: by 10.98.200.81 with SMTP id z78mr676055pff.2.1473350174360;
	Thu, 08 Sep 2016 08:56:14 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id 9sm57264687pfo.74.2016.09.08.08.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Sep 2016 08:56:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 08:55:44 -0700
Message-Id: <cover.1473349917.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/26] Krogoth-next: stagged changes
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
X-List-Received-Date: Thu, 08 Sep 2016 15:56:15 -0000

The following changes are being considered for krogoth-next.
If I am missing something, please let me know.

The following changes since commit aad7166704021d82ad3a5ec468552f8f10360d41:

  curl: security fix for CVE-2016-5421 (2016-09-02 08:48:29 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Alejandro Hernandez (1):
  initramfs-live-boot: Make sure we kill udev before switching root when
    live booting

Armin Kuster (2):
  tiff: Security fix CVE-2015-8781
  tiff: Security fix CVE-2015-8784

Henry Bruce (1):
  npm: npm.bbclass now adds nodejs to RDEPENDS

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

Khem Raj (3):
  python{3}-numpy: Predefine of sizeof off_t on mips/mipsel/ppc
  systemd: Create missing sysusers offline
  gdb: Cache gnu gettext config vars for musl builds

Markus Lehtonen (1):
  base.bbclass wipe ${S} before unpacking source

Pascal Bach (1):
  gcc, qemuppc: Explicitly disable forcing SPE flags for 4.9

Reinette Chatre (1):
  binutils: advance SRCREV to obtain versioned symbols

Richard Purdie (2):
  busybox: Backport makefile fix from upstream
  busybox: Add parallel make fix

Ross Burton (1):
  cml1: fix tasks after default [dirs] changed

Sona Sarmadi (2):
  sudo: CVE-2015-8239
  curl: security fix for CVE-2016-7141

Stefan Agner (1):
  busybox: Fix busybox-init on non-tty consoles

Stephano Cetola (1):
  systemd: allow add users as a rootfs postprocess cmd

Tanu Kaskinen (1):
  pulseaudio: fix crash when disconnecting bluetooth devices

Yi Zhao (3):
  tiff: Security fix CVE-2016-3186
  tiff: Security fix CVE-2016-5321
  tiff: Security fix CVE-2016-5323

 meta/classes/base.bbclass                          |  18 +-
 meta/classes/cml1.bbclass                          |   2 +
 meta/classes/grub-efi.bbclass                      |   2 +-
 meta/classes/gummiboot.bbclass                     |   4 +-
 meta/classes/multilib_global.bbclass               |   3 +-
 meta/classes/npm.bbclass                           |   1 +
 meta/classes/rootfs-postcommands.bbclass           |  43 +-
 meta/classes/syslinux.bbclass                      |   2 +-
 meta/classes/toolchain-scripts.bbclass             |   3 +
 meta/conf/bitbake.conf                             |   9 +-
 meta/recipes-core/busybox/busybox.inc              |   4 +-
 .../busybox/busybox/makefile-fix-backport.patch    |  40 ++
 .../busybox/busybox/parallel-make-fix.patch        |  65 ++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   2 +
 meta/recipes-core/initrdscripts/files/init-live.sh |   4 +-
 meta/recipes-core/systemd/systemd_229.bb           |   8 +-
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   2 +-
 ...s-fix-missing-check-for-permission-denied.patch |  32 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |   3 +
 ...AltiVec-generation-on-powepc-linux-target.patch |  11 +
 meta/recipes-devtools/gdb/gdb_7.10.1.bb            |   5 +
 .../python/python-numpy/arm/numpyconfig.h          |   1 +
 .../python/python-numpy/mips/_numpyconfig.h        |   1 +
 .../python/python-numpy/powerpc/_numpyconfig.h     |   1 +
 .../sudo/sudo/CVE-2015-8239-1.patch                | 699 +++++++++++++++++++++
 .../sudo/sudo/CVE-2015-8239-2.patch                |  45 ++
 meta/recipes-extended/sudo/sudo_1.8.15.bb          |   2 +
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
 37 files changed, 1813 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
 create mode 100644 meta/recipes-core/busybox/busybox/parallel-make-fix.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2015-8239-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2015-8239-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-bluetooth-don-t-create-the-HSP-HFP-profile-twice.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-7141.patch

-- 
2.7.4


