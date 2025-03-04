Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80E7C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.18207.1741079374258471834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJFL7HUd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079374; x=1772615374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a3hw0swT+ekPtEvKUdImglOtNkEuFJMuuA83m0zoVHg=;
  b=JJFL7HUdrFzW70W64PF/F8lvdh6qaTZrcfYMs+9zMF+P/uPYsRtrQyNV
   fv3DjZUSfGvs4Y7oU0+r7jZ8LPKBWHRF6MEQ7XO8cSFWE/0h+/nzVBUPy
   d2U592PM5CLrKbzMwatZ1+d/s5IRqYtlRnSGfvF7XPEXfF9nM3/xMTvSK
   7UqPQuzNBwscwbmRebq5rmECPvqtElGj4PQ0Rph8SW7nRpr+xmO4jMuMn
   jWyUg+ET09z4QRyfSYibzImkd5SFtt9/EXNg0ASUH8l+HbLDjNNCJgVxv
   kA+7SFAmr3H7P7IAWfBnZ+INB5oqBdHnJJEugJZ32i8fn0v57glO5SFYk
   Q==;
X-CSE-ConnectionGUID: EaEqgqL7TNCDZLT1oEp8zQ==
X-CSE-MsgGUID: D01E+5oCRCKuH23Gt5soBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="179242842"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="179242842"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B0E8C2262
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F02C3D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD5691A009A;
	Tue,  4 Mar 2025 17:09:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/31] repo: upgrade 2.51 -> 2.52
Date: Tue,  4 Mar 2025 17:09:12 +0800
Message-Id: <1741079356-13445-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212253

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.51.bb => repo_2.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.51.bb => repo_2.52.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.51.bb b/meta/recipes-devtools/repo/repo_2.52.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.51.bb
rename to meta/recipes-devtools/repo/repo_2.52.bb
index b78b4867f1..2e877c1847 100644
--- a/meta/recipes-devtools/repo/repo_2.51.bb
+++ b/meta/recipes-devtools/repo/repo_2.52.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "db111d392407797e170355e1c0ec98e71d4a8278"
+SRCREV = "8d5f03261164f3cd65af0576dfa7d4edded96c67"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


