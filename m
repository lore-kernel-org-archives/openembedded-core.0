Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94691D32D7D
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.82747.1731403556554476026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RsjCMOTy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403558; x=1762939558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yYrCWNcbc0mFI80tXgYYvBRcvfBvghRRRZ3pzp/uzAw=;
  b=RsjCMOTyg3ZY3qjiFoHEXxbRKxRVJr+sC8lTzPODKCB1+tT4Fz2qwIrt
   jMUVaKW4D3zmNpHQidyLyB19bkuNDwD4aKEiwnv8HntqTv8KpHhFrp1p3
   ksvsWEzZF61mdmfp++NXen7Z+xWlAsc1M4MfU1kmA8DRxvA/c0WHtL+xT
   8Ig3Wr/inlJjZYIny/8wc6HeHheYr8nk/0z2qz6tV9EuXxnLkC9duWQCa
   ss5QrTzIcDcEz78QTBpyCE2WL+8GmvTk+yiAvx93lBIVG7d6TEaGw1SuU
   cCxagJXf5tU7UwZ/SiGnHhP3ouj/eyLqXPoTWpuj7YvSPGoaSUbgFoQXY
   g==;
X-CSE-ConnectionGUID: QKMu2101RsyaGqfbJltKgQ==
X-CSE-MsgGUID: BVhsNtQ4SUe+wi8Jv4nvjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180266538"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180266538"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 653EFD6473
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1874D5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91EAD20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 411E21A000A;
	Tue, 12 Nov 2024 17:25:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/47] repo: upgrade 2.48 -> 2.49.3
Date: Tue, 12 Nov 2024 17:24:36 +0800
Message-Id: <1731403483-21399-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--3.194100-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mriK5qg1cmsr94YeSlHZYFov3F
	20dGzUU9/edeJzdiBF5HPmHy6OeVI1K4l8RZlJB8ag//jiWuh4MEa8g1x8eqF0yqa9s+GJg+ntU
	3Lv5Rb/05CFbKx+RnQQusNKy02z5sAjYpwtGfdBEZca7SN08UZLYxxljjfMnjsrDwfHQQaK2CDx
	bm2wVcgKE7LBRkh+1t5p98cjyQCaIdj9vNGYhpkbnHu4BcYSmtmJAMgmwOyledAuliTV06Ynsyd
	zL9f2FL4vM1YF6AJbbCCfuIMF6xLSdET58jp62SyScPD/f9ROLUDoqp0HTeo3SntfhxGWlvE3V0
	+Ct5ge8sGTYS6huLVFrQYDpwrAXSSXYfYDy1ETfgZmGX/qs+A6SkUdh+cx/hS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- sync: fix connection error on macOS
- upload: Return correct tuple values in _ProcessResults
- worktree: Do not try to fix relative paths
- forall: Fix returning results early
- Use full name of the revision when checking dest-branch
- Add REPO_SKIP_SELF_UPDATE check in sync
- manifest: add optional base check on remove and extend
- [event_log] Stop leaking semaphore resources
- progress: always show done message
- subcmds: reduce multiprocessing serialization overhead
- sync: reduce multiprocessing serialization overhead
- Fix incremental syncs for prjs with submodules

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.48.bb => repo_2.49.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.48.bb => repo_2.49.3.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.48.bb b/meta/recipes-devtools/repo/repo_2.49.3.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.48.bb
rename to meta/recipes-devtools/repo/repo_2.49.3.bb
index 8b72a9e71b..5cb10b6096 100644
--- a/meta/recipes-devtools/repo/repo_2.48.bb
+++ b/meta/recipes-devtools/repo/repo_2.49.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "454fdaf1191c87e5c770ab865a911e10e600e178"
+SRCREV = "ab2d3211043e2cb42a55f56e5abf69d23103c105"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


