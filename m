Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9B70F6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:58 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so106312557pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=smD3ZR2sILcCOV/5vmpzH8y8eZ0ryeFoYs/2MrGh35E=;
	b=dvXFX0v89YJwuvnjXaX3l1c48dKalRrqwPdCv+tocM+bmUphVAcu30tROKIDMe9njK
	8qnLpmHi0fD+Xx4u8F1vOIrGnFtNrFgdOkTa0BUpeW7nyKJny5fdAwNQiAs21HC7Y9ZO
	SYvrap1MLFCeufow5NzP1OoYoVhUufbfOME8fWCl4sQlSAvg02Olq9y6ofw3JpBNkf4o
	gfisOEiWOjCSLYpq00SuONPgyxe9WudBdIWEduSmpc7G1GDqEdRFZmgvuz7o94BZ/+3X
	OCvcww+9eUeSQ0BB3v2mtjdi9K0JW0f3ctXRTHeiDkJAATXDrIhnQECbEGMqkKGcjmyl
	XB/g==
X-Received: by 10.66.251.193 with SMTP id zm1mr30936893pac.154.1449344159364; 
	Sat, 05 Dec 2015 11:35:59 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:29 -0800
Message-Id: <1449344129-32738-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 15/15] libxml2: multiple security fixes.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Dec 2015 19:35:58 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7941-1
CVE-2015-7941-2
CVE-2015-8317
CVE-2015-7942
CVE-2015-7942-2
CVE-2015-8035
CVE-2015-7498
CVE-2015-7497
CVE-2015-5312
CVE-2015-7499-1
CVE-2015-7499-2
CVE-2015-7500
CVE-2015-8242

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 1c3c37d..0a85aaa 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -20,7 +20,21 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
            file://configure.ac-fix-cross-compiling-warning.patch \
+           file://CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch \
+           file://CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
+           file://CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch \
+           file://CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch \
+           file://CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch \
+           file://0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch \
+           file://CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch \
+           file://0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch \
+           file://0001-CVE-2015-5312-Another-entity-expansion-issue.patch \
+           file://CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch \
+           file://CVE-2015-7499-2-Detect-incoherency-on-GROW.patch \
+           file://0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch \
+           file://0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch \
+           file://0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.3.5


