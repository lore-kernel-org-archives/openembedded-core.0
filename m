Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EC6E77193
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.10451.1734945086279928918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tK0o1+Bi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945086; x=1766481086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OEJNq5Fno5MlnAuk/Q8cyaTTdXOs0LJCFqHZoYVkJoE=;
  b=tK0o1+Bi1ZPiDBbDyEaPM1cDsayjrkwsoySxUlXTc9pSppdZjDyI3ndv
   E0iKikwuNcHwGkUpXIDgaxt82fn8YcOtFt6xlYZ3TNHRDQhauhzHavMu0
   lafqdWoRfL5SE3mkSer+eq81esWSx9m3UvuX7mVQvGf3Cdw+fqM3d6c5I
   IXsWeA6Suj+eC4ZClUE1btEUAj1sjhPEsV4I3nmZcG218lAQLmg/S9TFM
   5zgv5i4hh/yoqHpO/4n69DTMPvXLEnfc42IpbVV4sdaZsSW6c3e5xBLZd
   g+gbjA1ihYkSP2Asq607WKed1rR30mpWEMbsJGUcvDVaRHY+rktX+Gv2v
   g==;
X-CSE-ConnectionGUID: gFqjK5VVTNuYq1idP2+FKQ==
X-CSE-MsgGUID: CeBw7ODPQLaTtLD4BOlqgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184623671"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184623671"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A0C4DBB8F
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD9FFD73BE
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E70E20076D2C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07A031A0073;
	Mon, 23 Dec 2024 17:11:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/22] python3-six: upgrade 1.16.0 -> 1.17.0
Date: Mon, 23 Dec 2024 17:11:01 +0800
Message-Id: <1734945065-4373-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--3.371000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhAUK
	j2UAO6v56oHv+vDBrw3il1lBwnymRKcUQ7z3S96i8t4fUUGeErQJlr1xKkE5uaShvRjfn4cUjdx
	5FdhImgMi+t+0AiFaYvL3NxFKQpq1YWo9dIuk10DTfU1/F+PbMwC0f97LzNGnUJ52LFhfM6vT0P
	pHDbMisw83HPYS+lIgpRLQyclUfPIfE8yM4pjsDwtuKBGekqUpnH7sbImOEBTG03nwmzQBlB2aU
	SXrXzFZ7SzdEPJbCzxRe4aqFp5ZREMQOkvP0BInzMDyj5ypiyQWUoPKJXUoy8mbqtM1/TV5rbUY
	1kShodvsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209032

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
===========
- Pull request #388: Remove 'URLopener' and 'FancyURLopener' classes from
  'urllib.request' when running on Python 3.14 or greater.

- Pull request #365, issue #283: 'six.moves.UserDict' now points to
  'UserDict.IterableUserDict' instead of 'UserDict.UserDict' on Python 2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-six.inc        | 2 +-
 meta/recipes-devtools/python/python3-six_1.16.0.bb | 4 ----
 meta/recipes-devtools/python/python3-six_1.17.0.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-six_1.16.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-six_1.17.0.bb

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index 6b1b4ba481..f7a62b6068 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -2,7 +2,7 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://pypi.org/project/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e50fab7e9501f3dfc920eafeb24b46ea"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-six_1.16.0.bb b/meta/recipes-devtools/python/python3-six_1.16.0.bb
deleted file mode 100644
index 1ba48d4f47..0000000000
--- a/meta/recipes-devtools/python/python3-six_1.16.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-six.inc
-
-SRC_URI[sha256sum] = "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
diff --git a/meta/recipes-devtools/python/python3-six_1.17.0.bb b/meta/recipes-devtools/python/python3-six_1.17.0.bb
new file mode 100644
index 0000000000..693f1818d3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six_1.17.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-six.inc
+
+SRC_URI[sha256sum] = "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
-- 
2.43.0


