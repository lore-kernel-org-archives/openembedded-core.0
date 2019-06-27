Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEE97E8F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 14:07:43 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id m7so1365453pls.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DnbyEMs99cYvKoHhD2btSrWSykAGO/DnCNYvy1BH3Dg=;
	b=bAYNdInKKMQcY5r2GI61mX6kfGMe1eFFQiEoUluunTJ6PZ8b9B2eCiPYD5gI3c9BSF
	nymulDxhwjegbTt9krd0YLHcRm+LkhbgJ8de3e+FqSJPSVJ5SXi4WRGpaRAz/wxtceCu
	zmParqX7QjKMXIVpzFfCaYnKKjB2INmQ00mK4AwNqKhn/f0RFTJPKZrm8HusgLGkmp0U
	XFQvLB7wUUD2Im/IgI6GXteEwDKgXv88osDcgWIcCcIw7Oy28vsFxlmhn4FY71KmYM9p
	yg+LOh61pcqMOO0WVWeYkuxTeqwhvfXgTRzniZalKcn8eHsRbOW1Fd01uWdgEpJO1jk/
	dBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DnbyEMs99cYvKoHhD2btSrWSykAGO/DnCNYvy1BH3Dg=;
	b=XcjNVk8gHpRBgIU8vF6W0Kvtf6H4/OX7Gai76z7Aai1VWMQ/YZfghAayaAEF7dDxr3
	9fIZypz2AAeslg1nxcjfDMpDGQPYwiSQkfGIdnlwDaOh8+9Wl120BFCFIYcOrbWVpTJj
	SZ5NPF7RQDZxUFnkv89YxAJkaMgrc+1bjVgjGaO3VabasndtLSrKg65YWkOllqj0FaqJ
	zNTBE8c9t+iRAfYsoibuoZf232/xL0U9kHtMWtzKnBvCB+6Pmi/zwMzZwfsKMEotFicg
	sJo03aiQGBWKLKAbdbwNU4uF23DRvHFsmIcxFI2P9cl+4MQ3WVQXgk8DJuU+vcJceGK2
	xt+g==
X-Gm-Message-State: APjAAAUIP2fG1aXSX2sZ1GlNcNQcGV4em8HX7RMlSZaPiZnIvyxRCSNS
	Kq8BqBFY9Yzc/r8dpCHq9wm+yezZ/Kw=
X-Google-Smtp-Source: APXvYqzZSlM4RCf0oA2/Y4Qnru5I3GyDyaXAiXEc2XcNcWTcoOWbhqqkWmHKnEojVjtBmZfWGXv1tg==
X-Received: by 2002:a17:902:c83:: with SMTP id 3mr4936318plt.326.1561644464823;
	Thu, 27 Jun 2019 07:07:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-196-181-114-static.hfc.comcastbusiness.net. [50.196.181.114])
	by smtp.gmail.com with ESMTPSA id
	i123sm4260704pfe.147.2019.06.27.07.07.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Jun 2019 07:07:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 07:07:20 -0700
Message-Id: <cover.1561644077.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warror][ 00/18] merge request
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
X-List-Received-Date: Thu, 27 Jun 2019 14:07:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover letter only

This series passed AB-full

Dropped [Warrior][ 02/19] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
until master is fixed.

The following changes since commit 712c78984c891e6357e1b1dc414431fb6c226c49:

  gnutls: Use ca-certificates as default trust store file (2019-06-14 07:05:34 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-next

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

Mariano López (1):
  util-linux: Stop udevd to run ptests

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
 .../files/0001-Fix-security-framework-bypass.patch | 124 ++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   4 +-
 ...-utils-ensure-child-can-be-session-leader.patch | 212 +++++++++++++
 .../ptest-runner/ptest-runner_2.3.1.bb             |   6 +-
 36 files changed, 2602 insertions(+), 130 deletions(-)
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


