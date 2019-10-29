Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id C59A17FAA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id o28so12858503wro.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t3LRG+juoqz2zsvK+O8eIDrNvBQd/EdCBMaHnmGtKyM=;
	b=XGhW+s71PtG0BMwFAXgiu22gzS7IzfNQvgVvMLOf7DmLDjBbJ8J2VxSTbOrTpRi6Uo
	oH31qSwYVo1zrbyk+8/DefZw+1F1R5kMD1ieoc7HA98eKRsJ0qyw/LDFMlgbMP7pGSYz
	zf/5qCUKJbdkpCLq+ERc7ckC4kYrYBZqfJ8VL/xu+c3+cNn+kmAjumrqK+05GhiROj9J
	JrcKMePoiQ2Lcg4yxU5+vlc2s4wqfJ74kOvtmBo3GoHlCjDVD5tGsd5D86W8842G9Wsu
	rJt+7mmZLvh/ZNH5KhQqVHSksF4SVPJvhFthfnKY75aJ4dDc8rA5zKhNNCDD4Isd9Gb9
	tgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t3LRG+juoqz2zsvK+O8eIDrNvBQd/EdCBMaHnmGtKyM=;
	b=EIw80nsl/wMqiDwyUQVD6jezksY2dKiI/clyJ2sj3hRnLoNIe/mwrhXGeU2MGgh/tR
	go+GS6MWneBf2188KpbZk5gghvsln+KoALZgnCdV2nGRZ1rBGtlYJpGMSzNfY5P6Ygb4
	Ves9TmlURRG9UlZ7Zv8fFID2nsCfvnUs1lELhZ2T276mZOmG4mPJ5iQSdlK595v/dGTu
	QrYWg0uuJqdDG2x//KPeaA3ocWsDvHuBvxjVJBLpc4iS7QtqIpERu7U6zlNsll/VjDyo
	Nlo+hUitTh24wDuIh1MqF9dEAubOeYAM6Tzs76K2Tb+8lt5qeDIP2TVPZ/v13RpDIrwR
	kz2g==
X-Gm-Message-State: APjAAAWnAGc4tP3cTygk1IBQ2Wu4hSWXoBnxYAAkpgrSSEHP/nuq8HY1
	V6Z9AJWD7qsdVgWaF0mifOyUozw1fng=
X-Google-Smtp-Source: APXvYqxylx+Isbvh2HskSMsJV9H96Clm2IU/VtromWGKTG+3DFHZz50S2t2QccmWwMSe82kcD5T6/A==
X-Received: by 2002:adf:e806:: with SMTP id o6mr17269703wrm.139.1572342462925; 
	Tue, 29 Oct 2019 02:47:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:13 +0100
Message-Id: <cover.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior 00/19] Pull request
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This set passed A-full AB.
Most fo these have already been on the mailing list.

This is last set needed for the next dot release. 

The following changes since commit b6e17afc06d7a44dc9774ee98de7f186580ddf0d:

  uninative: Update to 2.7 release (2019-10-08 07:54:37 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org//log/?h=stable/warrior-next

Alexander Kanavin (1):
  linux-yocto: add drm-bochs support

Anuj Mittal (1):
  python: include CVE patches for python-native as well

Armin Kuster (1):
  qemu: update to 3.1.1.1

Bruce Ashfield (6):
  linux-yocto/5.0: bsp: add basic xilinx zynqmp support
  linux-yocto/5.0: make scsi-debug include scsi core configs
  linux-yocto: bsp/beaglebone: support qemu -machine virt
  linux-yocto: arch/x86/boot: use prefix map to avoid embedded paths
  kernel-yocto: import security fragments from meta-security
  linux-yocto/4.19: make drm-bochs feature available

Changqing Li (2):
  python: Fix CVE-2019-10160
  sudo: fix CVE-2019-14287

Chen Qi (2):
  python: CVE-2019-16056
  go: fix CVE-2019-16276

Dmitry Eremin-Solenikov (1):
  kernel.bbclass: fix installation of modules signing certificates

George McCollister (1):
  openssl: make OPENSSL_ENGINES match install path

Muminul Islam (1):
  libcroco: Fix two CVEs

Yi Zhao (2):
  python: add tk-lib as runtime dependency for python-tkinter
  libgcrypt: fix CVE-2019-12904

Zang Ruochen (1):
  gnutls:upgrade 3.6.7 -> 3.6.8

 meta/classes/kernel.bbclass                        |   2 +-
 .../recipes-connectivity/openssl/openssl_1.1.1b.bb |   2 +-
 meta/recipes-devtools/go/go-1.12.inc               |   1 +
 ...nch.go1.12-security-net-textproto-don-t-n.patch | 163 ++++++++++
 meta/recipes-devtools/python/python.inc            |   5 +
 ...55-Dont-parse-domains-containing-GH-13079.patch |  90 ++++++
 .../python/python/bpo-36742-cve-2019-10160.patch   |  81 +++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |   2 +-
 meta/recipes-devtools/python/python_2.7.16.bb      |   9 +-
 ...qemu-native_3.1.0.bb => qemu-native_3.1.1.1.bb} |   0
 ...tive_3.1.0.bb => qemu-system-native_3.1.1.1.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc                |  14 +-
 .../0001-egl-headless-add-egl_create_context.patch |  50 ----
 .../qemu/qemu/0014-fix-CVE-2018-16872.patch        |  85 ------
 .../qemu/qemu/0015-fix-CVE-2018-20124.patch        |  60 ----
 .../qemu/qemu/0016-fix-CVE-2018-20125.patch        |  54 ----
 .../qemu/qemu/0017-fix-CVE-2018-20126.patch        | 113 -------
 .../qemu/qemu/0018-fix-CVE-2018-20191.patch        |  47 ---
 .../qemu/qemu/0019-fix-CVE-2018-20216.patch        |  85 ------
 .../qemu/qemu/CVE-2018-20815.patch                 |  38 ---
 .../recipes-devtools/qemu/qemu/CVE-2019-3812.patch |  39 ---
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 -------------
 .../qemu/{qemu_3.1.0.bb => qemu_3.1.1.1.bb}        |   0
 .../sudo/sudo/CVE-2019-14287-1.patch               | 178 +++++++++++
 .../sudo/sudo/CVE-2019-14287-2.patch               | 112 +++++++
 meta/recipes-extended/sudo/sudo_1.8.27.bb          |   2 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |   4 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       |  21 +-
 .../gnutls/{gnutls_3.6.7.bb => gnutls_3.6.8.bb}    |   4 +-
 .../libcroco/libcroco/CVE-2017-8834_71.patch       |  38 +++
 meta/recipes-support/libcroco/libcroco_0.6.12.bb   |   1 +
 .../files/0001-Prefetch-GCM-look-up-tables.patch   |  90 ++++++
 ...ok-up-tables-to-.data-section-and-unshare.patch | 332 +++++++++++++++++++++
 ...ok-up-table-to-.data-section-and-unshare-.patch | 178 +++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb  |   3 +
 40 files changed, 1307 insertions(+), 831 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
 rename meta/recipes-devtools/qemu/{qemu-native_3.1.0.bb => qemu-native_3.1.1.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_3.1.0.bb => qemu-system-native_3.1.1.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-egl-headless-add-egl_create_context.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0014-fix-CVE-2018-16872.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0016-fix-CVE-2018-20125.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0017-fix-CVE-2018-20126.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0018-fix-CVE-2018-20191.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0019-fix-CVE-2018-20216.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
 rename meta/recipes-devtools/qemu/{qemu_3.1.0.bb => qemu_3.1.1.1.bb} (100%)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.7.bb => gnutls_3.6.8.bb} (93%)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-8834_71.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-Prefetch-GCM-look-up-tables.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-AES-move-look-up-tables-to-.data-section-and-unshare.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch

-- 
2.7.4


