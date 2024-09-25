Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9027CF58C7
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.9319.1727246989107871580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rjc1B/xl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246989; x=1758782989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O76UHMOTT13WstRV77NRVYDsYghrIHYCNPevLIK3peA=;
  b=rjc1B/xl2FxE7C88yUgk/V3SvDsiS2ubtVbFi5c6gtWL9q+q7gJk4+/6
   u8Xf1CvPSByI5OpiBny38S6b4fHoLOWYcBU2bANpUyMFyTV1vA4Yzpg29
   jjwcY3F6qHM9ZIstWVYKFO0R6rRgXNt/akKwYfqp2xp7wb6A5PJJispq0
   ME8QtWvBr+XZRIhRk0J0K91Suu01M8gh4kbMo6cbQwvgXu18pBtxVPRU8
   OUMWg214KCOaKZXzE3JD+u2E5YbLVUbMdY2Vra9Fqd7jhFAOhQ3ZH/iKu
   19HEB+Gy9qfrtG459YpCwrfD7iNVgLduELpTx2DV39fkOICUM2YNGWQWn
   Q==;
X-CSE-ConnectionGUID: nfmxjjOwRO2ry6dxDaTjlg==
X-CSE-MsgGUID: cJm+B8H+TeyCoYixF9VEeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174898597"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174898597"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:46 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62DFCCC16A
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 97DE5D7489
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FCBF20086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D433C1A000A;
	Wed, 25 Sep 2024 14:49:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/47] python3-dtschema: upgrade 2024.5 -> 2024.9
Date: Wed, 25 Sep 2024 14:48:59 +0800
Message-Id: <1727246960-20665-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--2.610700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrmdrHMkUHHq9V5ftox3plLFYM
	JR3dIrh22rA0qugePoXvs5KKG3fKgcJLU14K+zeoA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYldbqAzxizwIHxPMjOKY7A8LbigRnpKlKSBuGJWwgxArHsoRE2DMTEam1A
	wbATy7b2aApNrfwJMqC2QoN9ZjCePLZFD36eFChEPo5MAbP+K3OyHoM9S5i9EPB7XtcoZGtNaAG
	6fQxY7YyEpPX5bd6LqIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204915

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Use type information for decoding DTB properties to their defined
  type. With this many of the fixups in the schema processing are
  dropped.
- Restore prior behavior of matching schemas to fallback compatible
  strings.
- Fix support for filtering with multiple patterns on dt-validate.
- Clean-ups for I2C schemas.
- Add an "assigned-clock-rates-u64" property to support frequencies
  above 4GHz
- Add a 'test,' vendor prefix to exclude from undocumented compatible
  checks. This removes the documentation requirement for test cases.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2024.5.bb => python3-dtschema_2024.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.5.bb => python3-dtschema_2024.9.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.5.bb b/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.5.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.9.bb
index 1eb24eca23..5a159297fb 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "ea259a9ba4d1e1eff44ac8d362950361e46750bdeaf30a437a7ed33159c35fd8"
+SRC_URI[sha256sum] = "1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.34.1


