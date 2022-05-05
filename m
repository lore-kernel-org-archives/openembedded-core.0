Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BC3C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 07:27:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.8096.1651735661488849051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 00:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=C0kdjIbo;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.120, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651735661; x=1683271661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DsRw1IgpOZx8T2feeSRjwW2NSDBa4eJjuRoNmJ0eX9M=;
  b=C0kdjIboUaogqi978fZdCqVnpsB7MhEFKC/9rsf098D6GCm62ekCXWE7
   WosSitzNgen7Yctzv5PAHqpWNGyTOWZqbNTXPrGPRPefe1SsM6PLyQhZJ
   lTkHtt+ujppmri/XhQkuCYz2ldDX7jrvfhnQnr1vNvaKy6mACbQsE8lIW
   ENbSoxxT+okRTnEeynZRs2Ucgtwey9KFMjN297HVjCZYh/t5DenQVm422
   AZyHIbC+705QTLLyr/c5XoTUAfUiZjhVSKl9RrF9nASQonE7AjX6iZrE0
   DyWq7iaZBLE2FcjvYgFh2SCVkSwgQIusM+YOV3Ln5n5U9aFKej1zouluY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="266871441"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600";
   d="scan'208";a="266871441"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 00:27:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600";
   d="scan'208";a="585187453"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 00:27:39 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH] libxml2: Upgrade 2.9.13 -> 2.9.14
Date: Thu,  5 May 2022 15:27:20 +0800
Message-Id: <20220505072720.410277-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 07:27:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165291

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 21 ++++++++++++-------
 .../{libxml2_2.9.13.bb => libxml2_2.9.14.bb}  |  5 +----
 2 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.9.13.bb => libxml2_2.9.14.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index d211f65da3..cc9da88a29 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From f57da62218cf72c1342da82abafdac6b0a2e4997 Mon Sep 17 00:00:00 2001
+From 7196bce35954c4b46391cb0139aeb15ed628fa54 Mon Sep 17 00:00:00 2001
 From: Tony Tascioglu <tony.tascioglu@windriver.com>
 Date: Fri, 14 May 2021 11:50:35 -0400
 Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
@@ -16,16 +16,18 @@ Rebase to 2.9.9
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Updated to apply cleanly to v2.9.12
-
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+Rebase to 2.9.14
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
- libxml.m4 | 190 ++----------------------------------------------------
- 1 file changed, 5 insertions(+), 185 deletions(-)
+ libxml.m4 | 189 ++----------------------------------------------------
+ 1 file changed, 5 insertions(+), 184 deletions(-)
 
-Index: libxml2-2.9.13/libxml.m4
-===================================================================
---- libxml2-2.9.13.orig/libxml.m4
-+++ libxml2-2.9.13/libxml.m4
+diff --git a/libxml.m4 b/libxml.m4
+index fc7790c..1c53585 100644
+--- a/libxml.m4
++++ b/libxml.m4
 @@ -1,191 +1,12 @@
 -# Configure paths for LIBXML2
 -# Simon Josefsson 2020-02-12
@@ -223,3 +225,6 @@ Index: libxml2-2.9.13/libxml.m4
 -  AC_SUBST(XML_LIBS)
 -  rm -f conf.xmltest
  ])
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.13.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.9.13.bb
rename to meta/recipes-core/libxml/libxml2_2.9.14.bb
index e361b53bfd..3081ebf92f 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.13.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -23,11 +23,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://remove-fuzz-from-ptests.patch \
            file://libxml-m4-use-pkgconfig.patch \
            "
-# will be in v2.9.14
-#
-SRC_URI += "file://CVE-2022-23308-fix-regression.patch"
 
-SRC_URI[archive.sha256sum] = "276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e"
+SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.34.1


