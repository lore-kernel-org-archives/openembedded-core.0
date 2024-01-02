Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE94C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:32:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.24499.1704180752305977136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145317180"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145317180"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:32:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D553AD2A08
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:32:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B6021D88CE
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:32:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4526E20093268
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:32:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0D021A0072;
	Tue,  2 Jan 2024 15:32:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.4.3 -> 7.4.4
Date: Tue,  2 Jan 2024 15:31:59 +0800
Message-Id: <1704180719-8816-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--1.641400-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu+IQ+aeLlhn4oF
	oourcxMDosHudN5ENEL/5L/JAuaoEAYEvIdMMvRDyDQYdu+qcevYUDvAr2Y/1/yCYVUPfstdY+/
	Syel0vDCQ8jX9l2qhLUJFxS+roEcTaaGs6XTeoZ8gFhzkd+/gE1QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaLshae+2j71nancG1vVsfbQMVVFhl7NwvNgDeovr2terganR
	UYx3SG4WyXEB937q1d5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFM3bIEeXaI6mCGoc
	oCtx5hTAh0VX2hvwQzOQUEZuXkVz6OzAvXhiuHsGIetgefarn+eXluNd9pHIHevV7N0xjPRIb1W
	ExZM/5ux9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193217

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix non-string constants at the top of file being detected as docstring
s on Python>=3.8.
-Handle an edge case where sys.stderr and sys.__stderr__ might already be
 closed when Fault Handler is tearing down.
-Fixed tracebacks from collection errors not getting pruned.
-Removed unhelpful error message from assertion rewrite mechanism when exceptions
 are raised in __iter__ methods. Now they are treated un-iterable instead.
-Updated documentation to refer to hyphenated options: replaced --junitxml with
 --junit-xml and --collectonly with --collect-only.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.4.3.bb => python3-pytest_7.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.3.bb => python3-pytest_7.4.4.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.3.bb b/meta/recipes-devtools/python/python3-pytest_7.4.4.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.3.bb
rename to meta/recipes-devtools/python/python3-pytest_7.4.4.bb
index 6fa0febd88..18062c8fb8 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.4.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "d989d136982de4e3b29dabcc838ad581c64e8ed52c11fbe86ddebd9da0818cd5"
+SRC_URI[sha256sum] = "2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


