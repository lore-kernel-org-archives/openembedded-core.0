Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5C3C19F4F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.11728.1713948190768326294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UxzAlzs+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948192; x=1745484192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pDSdNo5chGNoLLOo+7AT6j50HOWUKoC+lgeLITSqcgU=;
  b=UxzAlzs+oe5OnfJgcMRdjLWiS5+5Wa0SqgnFiLNu/Mlrs8Sk87TY56xL
   klXPxzpcIMrbzEvF1Ws0t+vteIC42oU5RVVgnUHLnQtOF9PDRv4BfJtlK
   J1gQEJ/YqypFy6R11LS/YS5DymXKxjzRArKT+jiUfmJQZr+tafsQ5aN/k
   W4qlmMeXxG6xEvExgLZZkeip1ep85VspV0zYGM6RMuCeB2ahDpxi9jd4N
   Q6vqV17m1wenFUmUCTWOL+JukJDATLaBr16ioxki4u1drRMGE3+OV6prX
   5CWoeb/yW8EosNuN93u1dMlUGMQSCg7B9By3d6EKPSDVdboucIGE2FHbZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135926044"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135926044"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DA96D9DC5
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C4B21FD828
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 594A2220024
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 020F31A000B;
	Wed, 24 Apr 2024 16:43:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/38] taglib: upgrade 2.0 -> 2.0.1
Date: Wed, 24 Apr 2024 16:42:28 +0800
Message-Id: <1713948152-13501-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-2.506100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO1Xv
	GS0HBPEX+pXq6lwbJTNvUDqCNlsvKH+zsg6kp2C3EhGH3CRdKUUbbhhV65kaY7Kw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmiHY/bzRmIaZHvVbHa5Rs8t3LhUU/qa4OGuRI/000hJfGV7V
	ueZm2O7JQWi17oTZuEE/q7Ea/a8MflRxm3A2wKuhRFJJyf5BJe3x1YNh2+qan3PDiXO/tFSY6HM
	5rqDwqtL4xVjm/HbgiwLggklaxYiOa+iibkc6Z8airWesX04dwq/EoNUdNTpy5+JwzgtKGpusqV
	25eXwMzGeOolfzg91RgHFcoHyQR2HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4RUz90EQwG2MA
	pbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198676

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix aborting when _GLIBCXX_ASSERTIONS are enabled.
* Fall back to utf8cpp header detection in the case that its CMake
  configuration is removed.
* Improve compatibility with the SWIG interface compiler.
* Build system fixes for testing without bindings, Emscripten and Illumos.
* C bindings: Fix setting UTF-8 encoded property values.
* Windows: Fix opening long paths.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/taglib/{taglib_2.0.bb => taglib_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.0.bb => taglib_2.0.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.0.bb b/meta/recipes-support/taglib/taglib_2.0.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.0.bb
rename to meta/recipes-support/taglib/taglib_2.0.1.bb
index 4bf9be15ae..14f99aabbc 100644
--- a/meta/recipes-support/taglib/taglib_2.0.bb
+++ b/meta/recipes-support/taglib/taglib_2.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e36ea877a6370810b97d84cf8f72b1e4ed205149ab3ac8232d44c850f38a2859"
+SRC_URI[sha256sum] = "08c0a27b96aa5c4e23060fe0b6f93102ee9091a9385257b9d0ddcf467de0d925"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.34.1


