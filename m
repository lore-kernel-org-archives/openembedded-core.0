Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29CCC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:35:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.5699.1644575734190107324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 02:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21BAZXeP026674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 02:35:33 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 11 Feb 2022 02:35:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Feb 2022 02:35:32 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 11 Feb 2022 02:35:31 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: 2.34.4 -> 2.34.5
Date: Fri, 11 Feb 2022 18:35:28 +0800
Message-ID: <20220211103528.24935-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 10:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161640

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.34.4 to 2.34.5. It fixes CVE-2022-22589,
CVE-2022-22590 and CVE-2022-22592 in 2.34.5 according to

https://webkitgtk.org/security/WSA-2022-0002.html

And fix indentation as well.

CVE: CVE-2022-22589
CVE: CVE-2022-22590
CVE: CVE-2022-22592

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/{webkitgtk_2.34.4.bb => webkitgtk_2.34.5.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.4.bb => webkitgtk_2.34.5.bb} (95%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
similarity index 95%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
index cfae4eafef..227ac2bf72 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
@@ -5,9 +5,9 @@ BUGTRACKER = "https://bugs.webkit.org/"
 LICENSE = "BSD-2-Clause & LGPLv2+"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
                     file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
-		    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
-		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
-		   "
+                    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
+                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
+                    "
 
 SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
@@ -21,7 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "975f5019199ba7699191835cf75e01a18b94e3bcd0107da7389d4ddcb1aba406"
+SRC_URI[sha256sum] = "68930643af7a47a3af05f46d66e784422433753dab335d3282f319a85a5629b4"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


