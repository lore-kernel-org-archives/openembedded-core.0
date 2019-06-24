Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 144137CF9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:21 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id p10so6368581pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PVl7uzjADr43qFqhj1mMzJhLWsRtX8jAE2nUtRqzDns=;
	b=j6gg9PrdKnOGRRHlf1mEIu+j5+NjzJVf+ZDeoFGDbN0AfnNIHeQtPoZiDqZfP6y0B/
	aFRIh7G5lRGuP0E5uIWru3693MlgRhps/fUpDhjIlIW/VFdYBBOqM5ClU0CiglViJNNq
	PSPsiLXVqot3eW/P67D46Ak8fQsrH4q8MSIKL6c3s7WekW9fDeK7970JxvL1qp0vHtUo
	7Du+Os5uRN6+0OUPpfC6gfzsJP+rGpz/OjofFQhMhIT3mZBtDnIgvna6C5DUIlJ38Ce7
	s4Z+/yjx6MUv7HmrZoPay/WgE0zWrcNWbNeyZhJc62C84oSVzSfaWuJYZ+D+V2xctLNd
	xycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PVl7uzjADr43qFqhj1mMzJhLWsRtX8jAE2nUtRqzDns=;
	b=Ce4KRX89sNIfGZCZj456xsYuLsOtz48cwFitrgaMMBNPGu7EievC6jt5GQPIHWj6er
	QvU2D67g8BVc0BqmkUavXvmbY/NaB3a6KvXNh14VXxU/8reMRfTxrmUxFO6tiYD1pZGE
	hr9abVDYsZyoOGXoCxiKOOb8g+rSCk8nE+peeG8142kzHBfzPds0MDTQ2u2vOWuYY6il
	b+Z6jB8tNaQwkuWp4MJXKWgAUW7MV0GOJeA0J+qAGPEVBl8CBgvepCvQrXhMqZjyqD4b
	qVpQLsI7eyx5535yCCRHYPseIFQYgGm6+9mzSmYPzoxBkF4K6KPLZzpkfbbKxJAvqyIa
	uZ6w==
X-Gm-Message-State: APjAAAUx5cVJ1gdTiHay/p0sQi3xtIsUHKOgb+56GBMGDQLQ3s+Srels
	wtpL42zoIWgvTLF2nF/9Q6wpH7sf7WM=
X-Google-Smtp-Source: APXvYqxAvH8rIJfSxCwZHLYUNiBlTBvQI+4DIdI4O6bgVoMZTP27NpIuFMQdqIqkb3B5SBx3c8u5SQ==
X-Received: by 2002:a63:d60c:: with SMTP id q12mr30359836pgg.176.1561348462822;
	Sun, 23 Jun 2019 20:54:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:53:59 -0700
Message-Id: <cover.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Warrior][ 00/19] patch review
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review by Wednesday

The following changes since commit 712c78984c891e6357e1b1dc414431fb6c226c49:

  gnutls: Use ca-certificates as default trust store file (2019-06-14 07:05:34 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-nmut

Adrian Bunk (2):
  libxslt: Fix CVE-2019-11068
  wpa-supplicant: Fix CVE-2019-9494 CVE-2019-9495 CVE-2019-9496
    CVE-2019-9497 CVE-2019-9498 CVE-2019-9499 CVE-2019-11555

Chen Qi (2):
  context.py: fix skipping function
  manifest.py: fix test_SDK_manifest_entries

Hongxu Jia (1):
  diffutils/run-ptest: support to run at arbitrary path

Jaewon Lee (1):
  devicetree.bbclass: Combine stderr into stdout to see actual dtc error

Kai Kang (1):
  openssl: fix failure of ptest test_shlibload

Mariano López (2):
  util-linux: Stop udevd to run ptests
  linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES

Oleksandr Kravchuk (1):
  selftest/devtool: fix URI to MarkupSafe package

Peter Kjellerstedt (3):
  texinfo-dummy-native: A little clean up of template.py
  texinfo-dummy-native: Rewrite template.py to use argparse
  package.bbclass: Clean up writing of runtime pkgdata files

Randy MacLeod (1):
  ptest-runner: enable child procs as session leader

Ricardo Ribalda Delgado (1):
  rootfs: Fix dependency for every dpkg run

Richard Purdie (2):
  uninative: Update to 2.6 release
  gpg_sign/selftest: Fix secmem parameter handling

Ross Burton (1):
  oeqa/logparser: ignore test failure commentary

Sakib Sajal (1):
  ptest-runner: update SRCREV to latest HEAD on ptest-runner2 repo

 meta/classes/devicetree.bbclass                    |   2 +-
 meta/classes/package.bbclass                       |  56 ++--
 meta/conf/distro/include/yocto-uninative.inc       |   8 +-
 meta/lib/oe/gpg_sign.py                            |  39 +--
 meta/lib/oe/rootfs.py                              |   1 +
 meta/lib/oeqa/core/context.py                      |   7 +-
 meta/lib/oeqa/selftest/cases/devtool.py            |   2 +-
 meta/lib/oeqa/selftest/cases/manifest.py           |   7 +-
 meta/lib/oeqa/selftest/cases/signing.py            |   3 +-
 meta/lib/oeqa/utils/logparser.py                   |   4 +-
 .../recipes-connectivity/openssl/openssl_1.1.1b.bb |   4 +-
 ...pwd-server-Fix-reassembly-buffer-handling.patch |  48 +++
 ...-constant-time-operations-for-private-big.patch |  97 ++++++
 ...er-functions-for-constant-time-operations.patch | 222 ++++++++++++++
 ...P-pwd-peer-Fix-reassembly-buffer-handling.patch |  48 +++
 ...-constant-time-selection-for-crypto_bignu.patch |  64 ++++
 ...-constant-time-and-memory-access-for-find.patch | 327 ++++++++++++++++++++
 ...mize-timing-differences-in-PWE-derivation.patch | 244 +++++++++++++++
 ...id-branches-in-is_quadratic_residue_blind.patch | 147 +++++++++
 ...7-SAE-Mask-timing-of-MODP-groups-22-23-24.patch | 121 ++++++++
 ...E-Use-const_time-selection-for-PWE-in-FFC.patch | 108 +++++++
 ...stant-time-operations-in-sae_test_pwd_see.patch | 139 +++++++++
 ...confirm-message-validation-in-error-cases.patch |  60 ++++
 ...server-Verify-received-scalar-and-element.patch |  61 ++++
 ...-EAP-pwd-server-Detect-reflection-attacks.patch |  48 +++
 ...client-Verify-received-scalar-and-element.patch |  61 ++++
 ...-Check-element-x-y-coordinates-explicitly.patch | 335 +++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.7.bb           |  16 +
 meta/recipes-core/util-linux/util-linux.inc        |   4 +
 meta/recipes-core/util-linux/util-linux/run-ptest  |  14 +
 .../recipes-extended/diffutils/diffutils/run-ptest |   3 +-
 .../texinfo-dummy-native/texinfo-dummy/template.py |  86 ++----
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   1 +
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    |   1 +
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |   1 +
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       |   1 +
 .../files/0001-Fix-security-framework-bypass.patch | 124 ++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   4 +-
 ...-utils-ensure-child-can-be-session-leader.patch | 212 +++++++++++++
 .../ptest-runner/ptest-runner_2.3.1.bb             |   6 +-
 40 files changed, 2606 insertions(+), 130 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-server-Fix-reassembly-buffer-handling.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-OpenSSL-Use-constant-time-operations-for-private-big.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Add-helper-functions-for-constant-time-operations.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-reassembly-buffer-handling.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-OpenSSL-Use-constant-time-selection-for-crypto_bignu.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-Use-constant-time-and-memory-access-for-find.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-SAE-Minimize-timing-differences-in-PWE-derivation.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0006-SAE-Avoid-branches-in-is_quadratic_residue_blind.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0007-SAE-Mask-timing-of-MODP-groups-22-23-24.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0008-SAE-Use-const_time-selection-for-PWE-in-FFC.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0009-SAE-Use-constant-time-operations-in-sae_test_pwd_see.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0010-SAE-Fix-confirm-message-validation-in-error-cases.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0011-EAP-pwd-server-Verify-received-scalar-and-element.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0012-EAP-pwd-server-Detect-reflection-attacks.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0013-EAP-pwd-client-Verify-received-scalar-and-element.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch
 create mode 100644 meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch

-- 
2.7.4


