Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609BCCD342E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.18513.1725352396205964088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y2t9yTph;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352397; x=1756888397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gvO2AqjCIP5ryINv4E6950JiIs6PJt+6btm0ogXwhXE=;
  b=Y2t9yTphJyjE+3Lp+1Bgv/FICQAsCDkjtcLc7R4vKJrVnWgEBx580Mja
   Ttl77BlYuKAtWtmX1OtVe1eXHIsqXebzpMiobnkJ1es90373zRVWEX1Qz
   hbg5N1Z4v8k/hu4M+sylltoQe1Hyt8aMqpvP3poH9P32RDUt5mPm4EtSc
   w6g9T4e1c84LT/VQ/bM68v5L3JZrj8kW69udMQCOl3sdT8428pN3hzZ42
   VH4SfupSnH82Z9YlWhMOEiIXnoHNmWDhp6snHfIeyoe7rb70ma3Iw7B6s
   dQr6r4wft0CcOccooHLxPAMku7tm+hrR3BLEc3sN+RGebeuZJPrapy/rU
   A==;
X-CSE-ConnectionGUID: FwU840HDT+Oxx6hysoPWsA==
X-CSE-MsgGUID: s9dsspFzRD2/OEpIYHSM9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="151981173"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="151981173"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAC6AD6482
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25DC2D4BF3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DF936C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E556F1A000D;
	Tue,  3 Sep 2024 16:33:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
Date: Tue,  3 Sep 2024 16:32:43 +0800
Message-Id: <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--6.092100-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yaoXHZz/dXlx2+EDPw+8xrfstPr197hBU64r
	mQIDoB6Sa6ybbu2l79Frhd2nMz0QNGd4JgHCU2SWoGwJKRc7e7tar+yddvGkIMj0QMA/92m2RoX
	7/kb7DqBV7WUAexHQHMj6EQVLNK1JiHIw0ZqUA7gD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpicJeU+IJBMRtsAY4JpaTGO/ZNLVgVojn/8boZEVitthgJeMOJX8c9nJFag
	wZ//x4SZe+pKSapsq6AMuqetGVetq6be/Gn3AzX3QfwsVk0Ubv+efAnnZBiL5K13zeQcKlRH+fp
	QFHmwbBhSOYdKwvnfren3WwTy/lqoOJkICDiaqZ8Jiw4d3A2/akhJMmxqTvKUh8BIo+eKt8AxBQ
	N/FRY8zisJSJluxt/gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204133

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add copyright and licensing metadata to all files

Changelog:
==========
- Improve conformance of the JSON parser
- Add conformance test suite from https://github.com/nst/JSONTestSuite
- Add JsonParser:strict to enable strict parsing
- Add '--strict' to json-glib-validate to enable strict parsing
- Deprecate the signals on JsonParser
- Port tools man pages from DocBook to reStructureText
- Add "documentation" configuration option, and deprecate "gtk_doc"
- Add JsonGenerator.take_root()
- Documentation improvements for JsonReader
- Raise parser error for malformed Unicode
- Build fixes and performance improvements
- Allow disabling installed tests
- Support parsing multiple root statements in non-strict mode
- Allow loading files >4GB with json-glib-validate

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../json-glib/{json-glib_1.8.0.bb => json-glib_1.10.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.8.0.bb => json-glib_1.10.0.bb} (87%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
similarity index 87%
rename from meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
index 2094ebe3e7..8d71524dd5 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
 
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5"
 
 DEPENDS = "glib-2.0 glib-2.0-native"
 
@@ -18,7 +18,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454"
+SRC_URI[archive.sha256sum] = "1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.34.1


