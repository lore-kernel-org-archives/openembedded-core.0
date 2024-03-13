Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC4AC54E77
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.10798.1710313763632665713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OKhgjCyx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313763; x=1741849763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JWyOK+9eC1FxY6CpMwb4Ai8TkSq8o+bfBC2Ye6HX+Xc=;
  b=OKhgjCyxiVb4y87KCH7a5jRNsHNIYx9/tuD/TKZ2bAtIMKwY7MlsLIHd
   OsjFDSRrVvYqANm4aCzBWVDHazfd+wvLccBXdaiqBZeJkVLp8olqWK7d1
   +e/uSWO7wUvyW7kgx+VgJWRhTvAwkafQaOSPNUvlbrtwQc1XyPEyQvj/T
   gUyoDfQALWdVeLjOINn6UKBPcWLlUpEOTLSCQJLCOOaR2392DCUGF5Dxi
   zJngUlx2om5SXO8kR3edsbyq9HrQLdhS5Jd2VW7bY98yXfUIyypB+mxrF
   Kf4wdNbza+3RuAP7lW+U9reygtXrYR+37ybcVPqqt0pCugJY+g7ujaZDR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140577449"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140577449"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FCC5D4807
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E6C8C1D69
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BC942C666B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE8021A006B;
	Wed, 13 Mar 2024 15:09:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/36] mkfontscale: upgrade 1.2.2 -> 1.2.3
Date: Wed, 13 Mar 2024 15:08:14 +0800
Message-Id: <1710313714-12541-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.364000-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/ybIxZweUR0NfQRlUSJjs8Z/9wRnyxuPjhHw6
	H06bMgivk6JkVkFEfVD2u6TsRIbT1n68IdFZXlcc0e7jfBjhB8diMNd0z/HZU58euMsD0OFm0A4
	5IAXRxM22Osuxx2pr9dfRBbT0qYoUVGs/GsqOCuYTF1LtYW9la32/mTu5B5RI+auSQfom9kHQA6
	zc/ntbC1nFD7c9fL3OyvDAzrttxFWwQEC6hpSorzXMAjGwgPGo1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNVbrT+ifGfdtNNZlf+4L3rnHOkD6+AHNiw5c/q09KNuana0gcen1fhCSlEw
	Lf5eMUWXxWJjtAWojr0DPJABkSS+r9DMxGuYzug3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197019

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: "All rights reserved." removed from copyright.

Changelog:
=============
-Fix -Wimplicit-float-conversion warnings from clang
-Resolve some -Wsign-conversion warnings from clang
-Variable scope reductions as recommended by cppcheck
-ident.c: clear -Wdeclaration-after-statement warning
-mkfontscale.c: handle -Wshadow warnings from gcc
-doDirectory: add missing check for malloc() returning NULL
-Convert to X.Org standard code style
-Remove "All rights reserved" from Oracle copyright notices
-gitlab CI: stop requiring Signed-off-by in commits
-configure: Use AC_SYS_LARGEFILE to enable large file support
-Address s UBSan warning about int left shift overflow
-configure: Move check for zlib into its own section
-configure: Use pkg-config to find zlib

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{mkfontscale_1.2.2.bb => mkfontscale_1.2.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.2.bb => mkfontscale_1.2.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
index cd658ab219..aa79902a34 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
@@ -15,7 +15,7 @@ RPROVIDES:${PN} += "mkfontdir"
 
 BBCLASSEXTEND = "native"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5a60c596d1b5f3dee9f005b703b3180d"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
+SRC_URI[sha256sum] = "2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e"
-- 
2.34.1


