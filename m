Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 985B071A62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:21 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f201so80668241oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SN20lpbiujAD4aS77j4tgeoP+8IgyiNJ6AItispqjEI=;
	b=OLap8sO3ryp7trFXCZkshYdAPn8zxBfXuzazdQ4bUwQm2lVqxte6U0ZLETHp9908I/
	dRMK7sYnHrTYYT5wXl0oRSnFVWeoPZBJklaldqgkMOqm+GOiKiZmwkj9MUTZRA2lLG5L
	I/wtpULaA/u9VGaxGw2vZ5Bq46DFBhjZR0zqv2KA+rEI1Kz0wQg1SlyVQUjjB+3fc5pz
	ESWjZN0AaAzybUhUU70PJ/cARhLJ9LaeGtFHkBcw8HoJGNuKEQO5QL8sy8do63DXs5cB
	atSp3zhKeMSDOX9ITGer7E8kGgCd3tg2er7Vl6L2rmHHN7p/v3DrHRKdqnzPj9QuOc8E
	ED/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SN20lpbiujAD4aS77j4tgeoP+8IgyiNJ6AItispqjEI=;
	b=QUY3Lq+ZaGHyUQq493ntjkmYB89Wce2GXBnC/wCEH5oYXC4trtXd0wO+Ha/eE/gzbC
	5zWQPpFw0N+JAACKPSyMcBJWp/PiXHDL8vn5aSUdKS7bIZc0i4P3thRe17OXENXS1sAZ
	XkGyGTdAxs6vdNxnbf+1Dr7cYLNAKd9S12kS9MVJyNrIPneGE61LkR/k05ZNnn80EKnY
	SSgKDDrkuNduETEEatG3YtMm9dUTZE/Asaqj8N4kYPsbRqcmq/EkBNGM2vIxBGYKzNh2
	LA+AzH6qNqe3Je4JrXCgGv3+7A2xTAEJQFyNRhRLzmtGLzFSe82LV6xehJzBDG41woAe
	NRMQ==
X-Gm-Message-State: AIkVDXIdIAaS+FggBF1WmHs6me8NLU1FDm7zaxv81bt9wryorRyk/q167rc7CvEtitTWyw==
X-Received: by 10.202.80.203 with SMTP id e194mr36790193oib.188.1483645581886; 
	Thu, 05 Jan 2017 11:46:21 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f68sm36856464oih.20.2017.01.05.11.46.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:20 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:16 -0700
Message-Id: <cover.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 00/16] Various fixes for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Tested both qemux86-64 and intel-corei7-64 (plus the meta-intel fix) with:

    DEFAULTTUNE_intel-corei7-64 = "corei7-64-x32"
    DEFAULTTUNE_qemux86-64 = "core2-64-x32"

The following changes since commit af330fc0087692039d4256a6fb1e122742e8ec1a:

  packagegroup-core-lsb: add opengl to REQUIRED_DISTRO_FEATURES (2017-01-05 13:53:45 +0000)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core x32
  https://github.com/kergoth/openembedded-core/tree/x32

Christopher Larson (16):
  valgrind: skip for linux-gnux32
  packagegroup-core-tools-profile: exclude valgrind for x32
  grub-efi: ignore arch mismatch for x32
  lttng-tools: fix for x32
  gnu-efi: build 64-bit for x32
  gnu-efi: ignore arch mismatch for x32
  gummiboot: fix for x32 from systemd-boot
  ltp: fix build for x32
  boost: drop flags bits, fix for x32
  gstreamer1.0-libav: disable asm for x32
  ffmpeg: disable asm for x32
  x264: for x32, disable asm and pass -mx32
  nss: fix for x32
  libunwind: apply a patch to fix x32
  gnome-desktop3: fix for x32
  webkitgtk: patch & disable JIT for x32

 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb          |  12 ++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   5 +-
 .../gummiboot/configure-allow-setting-EFI_CC.patch |  28 ++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |   1 +
 .../packagegroup-core-tools-profile.bb             |   1 +
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +
 .../ltp/fcntl-fix-the-time-def-to-use-time_t.patch |  28 ++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |   1 +
 ...op-thumbnail-don-t-convert-time_t-to-long.patch |  72 +++++++++++
 .../gnome-desktop/gnome-desktop3_3.22.2.bb         |   2 +
 meta/recipes-kernel/lttng/lttng-tools/x32.patch    |  16 +++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |   1 +
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb     |   2 +
 .../gstreamer/gstreamer1.0-libav.inc               |   4 +
 .../x264/x264/Fix-X32-build-by-disabling-asm.patch |  53 ++++++++
 meta/recipes-multimedia/x264/x264_git.bb           |   1 +
 .../webkit/webkitgtk/x32_support.patch             |  22 ++++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |   7 +
 meta/recipes-support/boost/boost.inc               |   3 +
 ...-Apply-boost-1.62.0-no-forced-flags.patch.patch | 101 +++++++++++++++
 ...Don-t-set-up-m32-m64-we-do-that-ourselves.patch |  98 ++++++++++++++
 ...p-arch-instruction-set-flags-we-do-that-o.patch | 144 +++++++++++++++++++++
 meta/recipes-support/boost/boost_1.62.0.bb         |   3 +
 .../libunwind/libunwind/libunwind-1.1-x32.patch    |  31 +++++
 meta/recipes-support/libunwind/libunwind_git.bb    |   1 +
 .../nss/nss/Fix-compilation-for-X32.patch          |  31 +++++
 meta/recipes-support/nss/nss_3.27.1.bb             |   1 +
 27 files changed, 671 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/configure-allow-setting-EFI_CC.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
 create mode 100644 meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
 create mode 100644 meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
 create mode 100644 meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
 create mode 100644 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch

-- 
2.8.0


