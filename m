Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C45C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.18206.1741079373430215607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X/ArFPdA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079374; x=1772615374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X8Yh6FDnX0i2pbrr5Axc/tVFHC0NKv6uarWckKxg1xo=;
  b=X/ArFPdAfn2Rt6lcKFCohFmNEhV/h68CEt2akBVnOTo/SaHd1TtVdJJ6
   2NrC7m65bPBmR0n1mo/mfiBNHvF28EVt70zVPHMHzixW7hkb1X+TpKzsO
   29yGSLS+EUl82x+dpeT+37q9MNJDxjoYWeCpWHKRyaLM7KD839Kt3fn56
   5lwhiKgo7s4JLYqpV/30xikFr5uQ4rQDt+0kxleZrGTFy1+h6+bQ+gkXh
   q9NXklwoWzF2KyffftOB9dkzAQPgxtvp7hfmKqk5YCKl+dmW7uX6iFA79
   wo4Hnmvg+R3c3enSRf9cB063NDDB06cscKO8AKtPc2VJDTv7zxmUJoxa9
   Q==;
X-CSE-ConnectionGUID: ocWNHiXMRSK1ZDwiKVBMgQ==
X-CSE-MsgGUID: DTxyp82TQKC7RqJ+AB9wMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="194539729"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="194539729"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1804ADBB80
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA8DFD8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A9391A0071;
	Tue,  4 Mar 2025 17:09:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/31] python3-pytest: upgrade 8.3.4 -> 8.3.5
Date: Tue,  4 Mar 2025 17:09:07 +0800
Message-Id: <1741079356-13445-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212251

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.3.4.bb => python3-pytest_8.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.4.bb => python3-pytest_8.3.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.4.bb b/meta/recipes-devtools/python/python3-pytest_8.3.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.4.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.5.bb
index 3b1770e14b..4d4e8b8511 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.4.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.5.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "965370d062bce11e73868e0335abac31b4d3de0e82f4007408d242b4f8610761"
+SRC_URI[sha256sum] = "f4efe70cc14e511565ac476b57c279e12a855b11f48f212af1080ef2263d3845"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


