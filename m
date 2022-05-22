Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190B5C4332F
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 17:31:59 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.18583.1653240717495173100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lC3X0Ma1;
 spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93,
 mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653240717; x=1684776717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jbZpFvDDLBUt6edDrpmfOzAxne7enkSRLitOmLDIrPA=;
  b=lC3X0Ma16z4rnlCsuH2YtPfZEFDLkH43YAspmCrjcI5F0k9CJ6Si2Enu
   k+AYCfKFDPWg4YPLPEYu6UUvJ/pD7F64NAfRiPyeHf3/6FNhAtMuco5V1
   u/gvDFqlTSCzLuWEAw+cnS+lb4w4hwBFKzc/u+rCQqUFVoboti3zR+PfZ
   Os5shEFm0tuLbeOW0z7qJBnDh86EMfUKmdQaGxDa5JlYeV47vZi1GHpQ9
   Ae7KDNFhC8relLEndguerqFktuqbySQuABO4Epg3CuzQ0JkVSGhWtEnAZ
   hb596kRSOu0AboMUIrH6jf1luqFKX66bN2tLgjYOnrKzPLSmsBlY9RwHs
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="270597918"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600";
   d="scan'208";a="270597918"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 10:31:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600";
   d="scan'208";a="571693870"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 10:31:55 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH 0/4] systemd: Update patches
Date: Mon, 23 May 2022 01:31:41 +0800
Message-Id: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 17:31:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165982

This patchset updates the existing systemd patches, these patches are
upstreamed, no longer needed or fix needed. Update these patches before
bumping to v251.

Jiaqing Zhao (4):
  systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
  systemd: Remove __compare_fn_t type in musl-specific patch
  systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
  systemd: Fix path returned in sd_path_lookup()

 ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  73 ++++++++
 ...se-ROOTPREFIX-without-suffixed-slash.patch |  42 -----
 ...test-parse-argument-Include-signal.h.patch |  27 ---
 ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ------------------
 ...-missing_type.h-add-comparison_fn_t.patch} |  44 ++---
 ...missing.h-check-for-missing-strndupa.patch |  14 +-
 meta/recipes-core/systemd/systemd_250.5.bb    |   6 +-
 7 files changed, 96 insertions(+), 273 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
 rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (61%)

-- 
2.34.1


