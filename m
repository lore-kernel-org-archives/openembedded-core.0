Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6970A6BCA4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 09:24:43 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f6so5553204pgs.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=OW9AheAAR5ArtVrAXBzzFt5RK5O84mUM7HUmZJNiTp4=;
	b=X16woul1TADIPDkd/vax1dfqEjA2nn1Xo6dVIOWrQOth6q5X1Vay8p+k2dhp4m2Nbh
	iOxCtllCBc/6eE6xmCWLBc+etCVP7UOwPhC+NKz5JcidtEs2k6nsKtX0JsHY/6SYvhRV
	aun/2J2bRW2sZIBkwUwg8hnSx24ER95DcJzxBdS225rEm2tiZh0zXP8diHgsqjiMLOx2
	Jj+G+Kbnqv0Ey4SgAPmUKKLP2RRbeksx3WamLeZd32Yjq34wSTKyALgfDecOzN8kDgze
	VEUbXVU5sgS9hYLFnxmvD+9v/Ncv6AZgoZe08389WKgaqEsZ4ws8p0Mo+B5wqBQ+DrSt
	STsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OW9AheAAR5ArtVrAXBzzFt5RK5O84mUM7HUmZJNiTp4=;
	b=mr0IvRGB1KsjzsztBY1YR+qJL8pUffS/qNYt3qOOSghmh0zq+lEYlI1IkTM0OxrwxE
	dY01bAkEGWw4mHCLQp/b+U/GubAmsOCs2VyazKSicRHwj8K470vx28iHVW8+WzVObfqz
	r0j7qLrYyaVritPZaELvgedvygwWoTYFJjrhBwNPh/SP7s5AXdXEDqFxB5VXdXOFPYLI
	dwOLGXGc1H22vGbOulyY5Jn9jSbW269i+9P7NWjlxqHdop5+I8BIvNh1d/d8R9P700qU
	ULs5ZUZb9jTV7OEhnbgD8QjXCgRRie8C0Eb8FIVBn2Fyi94SHkRl+2RN6adIaHudccD5
	U95g==
X-Gm-Message-State: APjAAAUj30cs4azyKz3lzArM/P7qxl9hB6qfno/pmFb1WCzxyoE9wv7I
	mGuRpAeruENuGMAkwkatVmy9r7s12yI=
X-Google-Smtp-Source: APXvYqyydvmOKb9JkuG/C4LpEvxNbljdr/x/FEj1JwQB71emRCsNfaPHlqJsoNnvVuS/+/LNOol54g==
X-Received: by 2002:a63:54b:: with SMTP id 72mr21243347pgf.323.1554629084033; 
	Sun, 07 Apr 2019 02:24:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([116.212.180.67])
	by smtp.gmail.com with ESMTPSA id l4sm4617098pgh.17.2019.04.07.02.24.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Apr 2019 02:24:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 14:54:20 +0530
Message-Id: <cover.1554628807.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/16] thud-next patch review
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
X-List-Received-Date: Sun, 07 Apr 2019 09:24:43 -0000

There are the commit I intend on sending a pull request for in two days. Tuesday my timezone (IST)

Please provide feedback by then if there are any issues. This is mostly OEQA changes. They have been througt the AB a-full and passed.

The following changes since commit 45032e30be70503faeee468159b216031b729309:

  build-appliance-image: Update to thud head revision (2019-03-27 23:22:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-nmut
  http://cgit.openembedded.org//log/?h=stable/thud-nmut

Armin Kuster (1):
  Revert "boost: update to 1.69.0"

Chen Qi (1):
  pkgdata.py: avoid target-sdk-dummy-provides to mess things up

Mazliana (1):
  oeqa/manual/bsp-hw.json: add non-IA tests

Richard Purdie (2):
  resulttool: Allow store to work on single files
  resulttool: Allow extraction of ptest data

Sudhir Sharma (1):
  oeqa/manual: Add manual runtime 'compliance' testcases to json

Yeoh Ee Peng (6):
  oeqa/manual/toaster: transfer manual toaster test cases to oeqa
  oeqa/manual/toaster: updated test id naming
  resulttool/manualexecution: Standardize input check
  resulttool/manualexecution: Enable display full steps without press
    enter
  resulttool/manualexecution: Fixed step sorted by integer
  resulttool/manualexecution: Refactor and simplify codebase

sangeeta jain (4):
  oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
  oeqa/manual/bsp-hw.json: test id updated and obsolete test cases
    removed
  oeqa/manual/compliance-test.json: test id updated and missing test
    cases added
  oeqa/manual/kernel-dev.json: test id updated

 meta/lib/oeqa/manual/bsp-hw.json                   |  264 +-
 meta/lib/oeqa/manual/compliance-test.json          |  194 ++
 meta/lib/oeqa/manual/kernel-dev.json               |   36 +-
 meta/lib/oeqa/manual/sdk.json                      |   14 +-
 meta/lib/oeqa/manual/toaster-managed-mode.json     | 2572 ++++++++++++++++++++
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json   | 1170 +++++++++
 meta/lib/oeqa/selftest/cases/pkgdata.py            |    1 +
 ...bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} |    0
 .../boost/{boost-1.69.0.inc => boost-1.68.0.inc}   |    4 +-
 meta/recipes-support/boost/boost.inc               |    1 +
 ...-arch-instruction-set-flags-we-do-that-o.patch} |   23 +-
 ...ucibility-add-file-directive-to-assembler.patch |  243 ++
 .../boost/{boost_1.69.0.bb => boost_1.68.0.bb}     |    6 +-
 scripts/lib/resulttool/manualexecution.py          |   61 +-
 scripts/lib/resulttool/resultutils.py              |   39 +-
 scripts/lib/resulttool/store.py                    |   23 +-
 16 files changed, 4467 insertions(+), 184 deletions(-)
 create mode 100644 meta/lib/oeqa/manual/compliance-test.json
 create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.json
 create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mode.json
 rename meta/recipes-support/boost/{bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.69.0.inc => boost-1.68.0.inc} (85%)
 rename meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch => 0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (93%)
 create mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
 rename meta/recipes-support/boost/{boost_1.69.0.bb => boost_1.68.0.bb} (56%)

-- 
2.7.4


