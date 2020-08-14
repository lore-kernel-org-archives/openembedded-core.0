Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.11289.1597376758124362929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 20:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07E3jvOm011464
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 20:45:57 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 20:45:45 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] fribidi: extend CVE_PRODUCT to include fribidi
Date: Fri, 14 Aug 2020 11:45:44 +0800
Message-ID: <20200814034544.5722-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

For example, CVE-2019-18397 uses fribidi instead gnu_fribidi.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/fribidi/fribidi_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.10.bb b/meta/recipes-support/fribidi/fribidi_1.0.10.bb
index ba9e6f06d6..53d78b4270 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.10.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.10.bb
@@ -12,6 +12,6 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
 inherit meson lib_package pkgconfig
 
-CVE_PRODUCT = "gnu_fribidi"
+CVE_PRODUCT = "gnu_fribidi fribidi"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

