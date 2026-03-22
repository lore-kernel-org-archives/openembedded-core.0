Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F93FC72C4
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 13:22:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30381.1774185729045346920
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 06:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZJO9p/G+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026032213220549c4919a530002079f-6f67qr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026032213220549c4919a530002079f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 14:22:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VQec3EpaOqgRPj0IoxiBQihop1ey8oK7xa1T/Z6blfA=;
 b=ZJO9p/G+lugHRjnWz9L3BjFK0gmF7ZiTyK+IUajR8lLkfqfaJmzxYANNU90JEqiS9GM28Y
 Rmh2CMHCZuyAb8ez/JvfNfA9zgpyOUUBfcG0mRRuz1A/h+uVQPlPnGb2jbQcI4sk6VmF6yqq
 SSu6Dcqtte6GH71hGopnshTEmCvjfB016EV3/KieUuobVRRsrc3f6N9DmVaXt1ryZ6yrwnPF
 4h/BsCcvwTFX5h8N4eoa8GdHIp1i2jr2SfJl3C8HyH9SmAMLd5CwA9gD4CIeX6BuidT58GhR
 bDmd1KFx3O7ycfY2JyavBAqSRlCu9S17KI+qXkmKuMXpSAhey88IJVvA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] expat: upgrade 2.7.4 -> 2.7.5
Date: Sun, 22 Mar 2026 14:22:19 +0100
Message-Id: <20260322132219.11230-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 13:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233672

From: Peter Marko <peter.marko@siemens.com>

Release information [1]

Release 2.7.5 Tue March 17 2026
        Security fixes:
           #1158  CVE-2026-32776 -- Fix NULL function pointer dereference for
                    empty external parameter entities; it takes use of both
                    functions XML_ExternalEntityParserCreate and
                    XML_SetParamEntityParsing for an application to be
                    vulnerable.
     #1161 #1162  CVE-2026-32777 -- Protect from XML_TOK_INSTANCE_START
                    infinite loop in function entityValueProcessor; it takes
                    use of both functions XML_ExternalEntityParserCreate and
                    XML_SetParamEntityParsing for an application to be
                    vulnerable.
           #1163  CVE-2026-32778 -- Fix NULL dereference in function setContext
                    on retry after an earlier ouf-of-memory condition; it takes
                    use of function XML_ParserCreateNS or XML_ParserCreate_MM
                    for an application to be vulnerable.
           #1160  Three more unfixed vulnerabilities left

        Other changes:
     #1146 #1147  Autotools: Fix condition for symbol versioning check, in
                    particular when compiling with slibtool (not libtool)
           #1156  Address Cppcheck >=2.20.0 warnings
           #1153  tests: Make test_buffer_can_grow_to_max work for MinGW on
                    Ubuntu 24.04
     #1157 #1159  Version info bumped from 12:2:11 (libexpat*.so.1.11.2)
                    to 12:3:11 (libexpat*.so.1.11.3); see https://verbump.de/
                    for what these numbers do

[1] https://github.com/libexpat/libexpat/blob/R_2_7_5/expat/Changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.7.4.bb => expat_2.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.4.bb => expat_2.7.5.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.5.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.4.bb
rename to meta/recipes-core/expat/expat_2.7.5.bb
index 95a1ed52c4..4f2578292d 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
+SRC_URI[sha256sum] = "386a423d40580f1e392e8b512b7635cac5083fe0631961e74e036b0a7a830d77"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

