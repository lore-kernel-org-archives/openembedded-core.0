Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD46C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HenEewHS;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118392; x=1674654392;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iyB9sGcGwFuqkLiGTDQJ5lZsJD3wog0EZoQPosFHG4k=;
  b=HenEewHSK+PkpJZEwQDthGVfJ/49ZZscRcMUElWi9Azvk9ZWgXiNoYyZ
   ZFPdjYpvnfY3LuIqJUVh3Z0JuZAxNpBtMRp/QHuCSw8zcNLwriVIfGRcm
   V4UuBySZgFKEqOhaL4exytglSrsElc60e8nZX5g7cG95cpI2ltu3Y0Hbw
   KhftfTINCWfsmBoao5PNQNHoGCJF6b9VKKXVj3lfbbXu9eH66nCF54v6d
   Oq/nyq6WWI9GIFvs3R6UGx//q2ykL/clEpP6WbiZ3kOIJ2EggLoIN+RMa
   8qkhai84Aqb64GeZjRvkXpo0W/l7NhIKF1RsYomfNAwnrzbaIBxsf6stq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016427"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016427"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494292"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/13] Patch review
Date: Tue, 25 Jan 2022 21:45:54 +0800
Message-Id: <cover.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160921

Next set of changes for honister. Please review. Tested on autobuilder
and all tests passed with the exception of a stap failure on qemuarm.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3153

Thanks,

Anuj

The following changes since commit 5a904f0fd02613664aa8c03d6d4935a68c01bf35:

  go: upgrade 1.16.10 -> 1.16.13 (2022-01-14 16:05:51 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Bruce Ashfield (2):
  linux-yocto/5.10: amdgpu: updates for CVE-2021-42327
  linux-yocto/5.10: update to v5.10.91

Changqing Li (1):
  pigz: fix one failure of command "unpigz -l"

Kai Kang (1):
  speex: fix CVE-2020-23903

Marek Vasut (1):
  bootchart2: Add missing python3-math dependency

Mingli Yu (1):
  socat: update SRC_URI

Richard Purdie (1):
  expat: Upgrade 2.4.2 -> 2.4.3

Ross Burton (3):
  vim: upgrade to 8.2 patch 3752
  vim: update to include latest CVE fixes
  lighttpd: backport a fix for CVE-2022-22707

Sundeep KOKKONDA (2):
  glibc : Fix CVE-2022-23218
  glibc : Fix CVE-2022-23219

wangmy (1):
  expat: upgrade 2.4.1 -> 2.4.2

 .../socat/socat_1.7.4.1.bb                    |   2 +-
 .../expat/{expat_2.4.1.bb => expat_2.4.3.bb}  |   2 +-
 .../glibc/glibc/0001-CVE-2022-23218.patch     | 178 +++++++++++++++
 .../glibc/glibc/0001-CVE-2022-23219.patch     |  55 +++++
 .../glibc/glibc/0002-CVE-2022-23218.patch     | 126 +++++++++++
 .../glibc/glibc/0002-CVE-2022-23219.patch     |  89 ++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |   4 +
 .../bootchart2/bootchart2_0.14.9.bb           |   2 +-
 ...ix-out-of-bounds-OOB-write-fixes-313.patch |  97 ++++++++
 .../lighttpd/lighttpd_1.4.59.bb               |   1 +
 ...0001-Fix-bug-when-combining-l-with-d.patch |  50 +++++
 meta/recipes-extended/pigz/pigz_2.6.bb        |   3 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../speex/speex/CVE-2020-23903.patch          |  30 +++
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |   4 +-
 ...1-reading-character-past-end-of-line.patch |  62 ------
 ...src-Makefile-improve-reproducibility.patch |  13 +-
 ...28-using-freed-memory-when-replacing.patch |  83 -------
 ...eading-uninitialized-memory-when-giv.patch |  63 ------
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 --------
 ...llegal-memory-access-if-buffer-name-.patch |  86 --------
 ...ml_get-error-after-search-with-range.patch |  72 ------
 ...nvalid-memory-access-when-scrolling-.patch |  97 --------
 .../vim/files/CVE-2021-3778.patch             |  61 ------
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------------------
 .../vim/files/disable_acl_header_check.patch  |  15 +-
 .../vim/files/no-path-adjust.patch            |   8 +-
 meta/recipes-support/vim/files/racefix.patch  |   6 +-
 ...m-add-knob-whether-elf.h-are-checked.patch |  13 +-
 meta/recipes-support/vim/vim.inc              |  18 +-
 32 files changed, 685 insertions(+), 892 deletions(-)
 rename meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.3.bb} (91%)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
 create mode 100644 meta/recipes-extended/pigz/files/0001-Fix-bug-when-combining-l-with-d.patch
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
 delete mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past-end-of-line.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
 delete mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
 delete mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
 delete mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.34.1


