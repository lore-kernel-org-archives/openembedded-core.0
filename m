Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23FEC25B4F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11726.1713948187326415360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PAh947FF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948191; x=1745484191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hkIqAGCHb52jHn6G29POvyIsQbJxu3Cpp2DQodXwI9M=;
  b=PAh947FFByC9IhBnBahxU7oI0XYNrlxvxvnncSe1G2chACzxgwK6CjJM
   KjyIQsY+KJZawImWJPksA50+U501yunv2AUOrmIk6YUwK2QeudBVkNNY3
   R0DRmb1JGVaxIculNiw3Jo1v4DtRXNsNafAUH4lQNf4MCm80d+CjXvJY6
   5eRuRlsNApGlstN3ydhyADplEl2DT7CcOyDnIbwJ/WEPsuFOGgtiSnbyx
   dDnUKEbvzQR7uiVE7flqfg9+no6XdQlX0O5ue6QT26sYzmSlUPiw3wPB8
   k5Vle0JFdrmxT1PRiTHJn1xTexAI7ZWpFytNovTbFCMVT9TIg6+dy3iQ4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156537579"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156537579"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:10 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E8A9D6F61
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CED26D7B8F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6932F202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 160121A000A;
	Wed, 24 Apr 2024 16:43:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/38] python3-trove-classifiers: upgrade 2024.3.3 -> 2024.4.10
Date: Wed, 24 Apr 2024 16:42:25 +0800
Message-Id: <1713948152-13501-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--1.146300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mregIHHX2L4YwZFeXguNpWv0mY
	fhvEN/pW+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KjgooTGm3966ZII3aRK3SK+ENi5frm0E3sj+s2TIE0Nwrd/55Qgz+6+eEzT9ZwtELQS6b
	1y5MCiBWGvZMfNqvbRVUqGECKP25fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198674

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add Natural Languages
- Add OpenTelemetry related classifiers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2024.3.3.bb => python3-trove-classifiers_2024.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.3.3.bb => python3-trove-classifiers_2024.4.10.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.4.10.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.4.10.bb
index b912efcf55..357b428983 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.4.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "df7edff9c67ff86b733628998330b180e81d125b1e096536d83ac0fd79673fdc"
+SRC_URI[sha256sum] = "49f40bb6a746b72a1cba4f8d55ee8252169cda0f70802e3fd24f04b7fb25a492"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


