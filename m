Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1F3C3ABD8
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.45923.1747040647751165566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GpdABhz5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040647; x=1778576647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PoRQz4tnbSV60ylph1+sAyYVfrgsrXBEixtF9ksy410=;
  b=GpdABhz59INdzKP00XQb+jGVFv4YFdThj/jnuMYwVnLHjVYX3xWJDxJd
   w6IXakSZyV+XHS5VTfe7wxzQe9FD0XsoZnWYfoCwonVn/tjeohIMC3KW3
   N9dXd66jmLsXTHXYYrPql50DIgpaKkkq7yAf8apakPoB6Gx27NNmPc0RE
   OLT3ff35/cSI7IQA9uDssXKatGNWCbMVSPFJUrVDuRNZPbQUhbGwI7jAz
   Oe5orn2/UcnGotzKKrtfR09DgfZQJMh2AIsFCMCPAv4tTJrrmXZUlbUhM
   vhzA3Saj/AYF8OShWltGq7TrHb+dBJ+C4YYFps9rroCkPbyePNwWairyN
   A==;
X-CSE-ConnectionGUID: QO84Yhg6SBaZ/V/1lr0Mgw==
X-CSE-MsgGUID: KMUL2Nd2RsS2Db3LjKFSkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187121903"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187121903"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 963EED500E
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52159CFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10A501A009B;
	Mon, 12 May 2025 17:04:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 47/56] python3-poetry-core: upgrade 2.1.2 -> 2.1.3
Date: Mon, 12 May 2025 17:03:30 +0800
Message-Id: <1747040619-7566-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216343

From: Wang Mingyu <wangmy@fujitsu.com>

Changed
----------
- Update list of supported licenses

Fixed
--------
- Fix an issue where the union of specific inverse or partially inverse markers
  was not simplified
- Fix an issue where optional dependencies defined in the project section were
  treated as non-optional when a source was defined for them in the tool.poetry
  section
- Fix an issue where markers with === were not parsed correctly
- Fix an issue where local versions with upper case letters caused an error
- Fix an issue where extra markers with a value starting with "in" were not
  validated correctly
- Fix an issue where inheriting from WheelBuilder was unnecessarily difficult

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_2.1.2.bb => python3-poetry-core_2.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.2.bb => python3-poetry-core_2.1.3.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb b/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
index 728b09cd7e..12c4751de8 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.2.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "f9dbbbd0ebf9755476a1d57f04b30e9aecf71ca9dc2fcd4b17aba92c0002aa04"
+SRC_URI[sha256sum] = "0522a015477ed622c89aad56a477a57813cace0c8e7ff2a2906b7ef4a2e296a4"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


