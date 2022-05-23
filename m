Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0319C433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 02:20:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.23143.1653272436943032120
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Owwd0hcg;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.20, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653272437; x=1684808437;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fk9ujFuxv/o7u8hI0PyGwNl2ZPNMIcNHHln1FNInmV4=;
  b=Owwd0hcgx5k6evmpq0KjOjktmija8Osak3odSD6ltpuERkVJp7sX9xXy
   x2xHI2bGnquCciTVpE9BhaaP3KAAvkCxzx0388pjkDGbpSiAoeWebZrpQ
   QGh2agn1rFSPzzr1++/lv4Qt2xiG9HitlmjkgoFap220PVjY40HJTf58S
   QUxPVHr1aFEsksXkyzRDop/M6Y1+cMMAQC6goDda0wJBFOLoJ1wM592+g
   V0zlr60KX9TCv9Hig1tha6bsuAlc9zB8xuW6y/J/I2DacN2nSDJTBNLzk
   LRlmiIVpshCQBvapC5qlbj+TtwwjZdvaJsg05F3bkYEt+JLY2KwmuXFw8
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="260680209"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="260680209"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="600397352"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:31 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH v2 0/4] systemd: Update patches
Date: Mon, 23 May 2022 10:20:10 +0800
Message-Id: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 02:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165988

This patchset updates the existing systemd patches, these patches are
upstreamed, no longer needed or fix needed. Update these patches before
bumping to v251.

Jiaqing Zhao (4):
  systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
  systemd: Remove __compare_fn_t type in musl-specific patch
  systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
  systemd: Correct path returned in sd_path_lookup()

v2: Update description fot the sd_path_lookup patch.

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


