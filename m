Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E028FC433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:40:17 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.6510.1643467216034661189
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=oAh3MaN9;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643467216; x=1675003216;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=woNaWzQd2WaVktvSFS4EaTkVSTe9EUGHwDQtmU+rXcg=;
  b=oAh3MaN9MGq/LtI0ADRsUixOOWR3RIYRIMzq27JgABqjaY0k8zXpO8DR
   Z2zVJ3UgINPWk5HByUHQ1E17uUjVYdP29AtAKJUgOqcg7UFZLw4nzWuY+
   cDqA4Ev7h00sru9lgy7JDSk6qW5dsKjLUg6bcAq+XxaqEWd7MqF7OJ6Ja
   bNCTOnwVCchimFLM39/Kr3MSvE+JNjpQUe3D0g/gJ9VCocm+frEdPZ3uR
   IHSVwmpER6LjY08TlMRyOS0GK51x8bVJdWHDuxUcQaitUXf0ftJDZcEwU
   VyYsgcWWZkPRbHIEW7WAf+uJycYnL3yEr1R5iTpCQ+QdrWqdCPVDfx5DZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="308004295"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600";
   d="scan'208";a="308004295"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 06:40:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600";
   d="scan'208";a="533782847"
Received: from yewyangh-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.138.186])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 06:40:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/17] Pull request (cover letter only)
Date: Sat, 29 Jan 2022 22:40:07 +0800
Message-Id: <cover.1643467138.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 14:40:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161099

The following changes since commit 155c238d340fdc82420ba9f367cb23014c78b705:

  cve-check: add lockfile to task (2022-01-17 10:37:09 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.169
  linux-yocto/5.4: update to v5.4.170
  linux-yocto/5.4: update to v5.4.171
  linux-yocto/5.4: update to v5.4.172

Changqing Li (1):
  pigz: fix one failure of command "unpigz -l"

Jagadeesh Krishnanjanappa (1):
  tune-cortexa72: remove crypto for the default cortex-a72

Kai Kang (1):
  speex: fix CVE-2020-23903

Kevin Hao (2):
  tune-cortexa72: Enable the crc extension by default for cortexa72
  tune-cortexa72: Drop the redundant cortexa72-crc tune

Mingli Yu (1):
  socat: update SRC_URI

Pgowda (2):
  binutils: upgrade binutils-2.36 to latest version
  gcc: upgrade to gcc-10.3 version

Ross Burton (1):
  lighttpd: backport a fix for CVE-2022-22707

Steve Sakoman (3):
  expat fix CVE-2022-22822 through CVE-2022-22827
  expat: fix CVE-2021-45960
  expat: fix CVE-2021-46143

pgowda (1):
  glibc: upgrade glibc-2.33 to latest version

 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/machine/include/tune-cortexa72.inc  |  12 +-
 .../socat/socat_1.7.4.1.bb                    |   2 +-
 .../expat/expat/CVE-2021-45960.patch          |  65 ++
 .../expat/expat/CVE-2021-46143.patch          |  43 ++
 .../expat/expat/CVE-2022-22822-27.patch       | 257 +++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   3 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0031-CVE-2021-43396.patch     | 182 -----
 meta/recipes-core/glibc/glibc_2.33.bb         |   1 -
 .../binutils/binutils-2.36.inc                |   5 +-
 .../binutils/0001-CVE-2021-20197.patch        | 201 ------
 .../binutils/0001-CVE-2021-42574.patch        |   4 +-
 .../binutils/0002-CVE-2021-20197.patch        | 170 -----
 .../binutils/0003-CVE-2021-20197.patch        | 171 -----
 .../gcc/{gcc-10.2.inc => gcc-10.3.inc}        |  12 +-
 ...ian_10.2.bb => gcc-cross-canadian_10.3.bb} |   0
 .../{gcc-cross_10.2.bb => gcc-cross_10.3.bb}  |   0
 ...-crosssdk_10.2.bb => gcc-crosssdk_10.3.bb} |   0
 ...cc-runtime_10.2.bb => gcc-runtime_10.3.bb} |   0
 ...itizers_10.2.bb => gcc-sanitizers_10.3.bb} |   0
 ...{gcc-source_10.2.bb => gcc-source_10.3.bb} |   0
 .../gcc/gcc/0001-CVE-2021-35465.patch         |  22 +-
 ...-up-__aarch64_cas16_acq_rel-fallback.patch |  66 --
 ...ight-Line-Speculation-SLS-mitigation.patch | 202 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 607 ----------------
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 658 ------------------
 ...gcc-Fix-argument-list-too-long-error.patch |   5 +-
 ...Re-introduce-spe-commandline-options.patch |   2 +-
 ...ngw32-Enable-operation_not_supported.patch |   4 +-
 .../gcc/0038-arm-neoverse-n2-support.patch    |  88 ---
 .../gcc/0039-arm64-neoverse-n2-support.patch  |  60 --
 .../gcc/{gcc_10.2.bb => gcc_10.3.bb}          |   0
 ...initial_10.2.bb => libgcc-initial_10.3.bb} |   0
 .../gcc/{libgcc_10.2.bb => libgcc_10.3.bb}    |   0
 ...ibgfortran_10.2.bb => libgfortran_10.3.bb} |   0
 ...ix-out-of-bounds-OOB-write-fixes-313.patch |  97 +++
 .../lighttpd/lighttpd_1.4.59.bb               |   1 +
 ...0001-Fix-bug-when-combining-l-with-d.patch |  50 ++
 meta/recipes-extended/pigz/pigz_2.6.bb        |   3 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../speex/speex/CVE-2020-23903.patch          |  30 +
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |   4 +-
 45 files changed, 602 insertions(+), 2465 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-45960.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-46143.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-22822-27.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-20197.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0002-CVE-2021-20197.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0003-CVE-2021-20197.patch
 rename meta/recipes-devtools/gcc/{gcc-10.2.inc => gcc-10.3.inc} (90%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.2.bb => gcc-cross-canadian_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.2.bb => gcc-cross_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.2.bb => gcc-crosssdk_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.2.bb => gcc-runtime_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.2.bb => gcc-sanitizers_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.2.bb => gcc-source_10.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
 rename meta/recipes-devtools/gcc/{gcc_10.2.bb => gcc_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.2.bb => libgcc-initial_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.2.bb => libgcc_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.2.bb => libgfortran_10.3.bb} (100%)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
 create mode 100644 meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch

-- 
2.34.1


