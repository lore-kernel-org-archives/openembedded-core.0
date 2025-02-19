Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE2BC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 19:12:45 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.31196.1739992358983978731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 11:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EyE8+K9H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250219191235a3a701959beeb67677-qvkcur@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250219191235a3a701959beeb67677
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 20:12:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FWE6hBWK030sXRvbcUTKcAO7ShXrGcJMJG82rkRo35c=;
 b=EyE8+K9H756EjbIgu62Z7vjlfxyQr10o+O/pKyHDeZ4Y+JNpWySZjr1JQoPQAhtjip+pe6
 muV1sZDi1jFPVpnGNWpxU/fmtn1TO8qGZ+oM1IPDv2VOHqzGM4sm/SDP0Y/cL4L8lfOCklDi
 pWYF+Mg2Unud6NRPLLZa3i4A24m8gBg0+8md9Z6ejFfqOM/0ZkKQE74cwP0sZ7ylT1T2tk/R
 2n/f4oYF+DZKNY/rTkIS0euRFrG33wivNUdKsaVeZuFzxzeRLHlfHiLH2++i+Nwt0lB95A0S
 j89pe23aqOrWlcBIihQe4yl8GEK4c5nGGUiogt6GLFobQXjfozmPwn+Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libxml2: upgrade 2.12.9 -> 2.12.10
Date: Wed, 19 Feb 2025 20:11:47 +0100
Message-Id: <20250219191147.1305545-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 19:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211728

From: Peter Marko <peter.marko@siemens.com>

https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.10

Security
* [CVE-2025-24928] Fix stack-buffer-overflow in xmlSnprintfElements
* [CVE-2024-56171] Fix use-after-free after xmlSchemaItemListAdd
* pattern: Fix compilation of explicit child axis
Regressions
* parser: Fix detection of duplicate attributes
Bug fixes
* xpath: Fix parsing of non-ASCII names
Portability
* python: Declare init func with PyMODINIT_FUNC
* tests: Fix sanitizer version check on old Apple clang
Build
* autotools: Set AC_CONFIG_AUX_DIR
* cmake: Always build Python module as shared library
* cmake: Fix compatibility in package version file

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libxml/{libxml2_2.12.9.bb => libxml2_2.12.10.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.9.bb => libxml2_2.12.10.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.9.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.9.bb
rename to meta/recipes-core/libxml/libxml2_2.12.10.bb
index 7777c9f181..c4f76c281d 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590"
+SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780

