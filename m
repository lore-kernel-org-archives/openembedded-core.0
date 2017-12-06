Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE8B7867E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 14:59:31 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id q9so4213653wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=J8YmknbRsXlbmwUjlNZS6EeQjzABWdfum1aZl1sNRMM=;
	b=VC0Up4y9P+DcsXESRxDMEZvoIhbS1fhK0FeTsI6A+otBhFmMy1TNueNr50pIEPCS/p
	bZcK+YY1A/91mR5z8XGZRM2CMqiitTUUwlbuRItAO2UnPGahjFFFMcgL/GS2UgZcaD8J
	Dja/cRY9EenesOxwCoe4jQHASzO4rrkBi1AOIBr9gJIPa6YXJiDxBwdqjCA23f8OPuXv
	iCReK/8IxosCmlck68MG8IrVplFKRtYha3YC67U2NvBKDaHA7rekgDOAr5APQlqIpW8r
	vf+dfqBO99Eeq6BZs3oF695fkOgF+g0GA3r8DMJdpl0C6PE2DPUNPl8eTyHiaZzUI/jr
	yxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=J8YmknbRsXlbmwUjlNZS6EeQjzABWdfum1aZl1sNRMM=;
	b=k9UPXUKo/+c6KfKCcHCNzVDQIJn7fPVM2lTPh9MeELAfoMvU1O5FAEtBbQ2rsqwbyy
	opXANkoSZ4u19JMF3G3ZtEAjxUN55CL/0ueZeWfm8xTELNJzIjvtJiWxUpSu9UN9/1s4
	HM2y2hR/Vr/Z+Hr6wrGXLDjgBMfJb2gLjoOo5kTAj6+wpYtg8QPdilWgu23z36bhIpPT
	rkGzUgvNLkdbXcUHtWkNWdmCxredGgawoHQkfzvcFeADSCONmcIrcXCqzI375RVGaUFQ
	d3B4pJwBq5DRoTy6T8VPHv//ncW5wci/9RI0YF0RuHBwk6VCnlPaEZNXM8UK8YozNqG/
	q6WQ==
X-Gm-Message-State: AJaThX4mnq8Hpc/QOe8PXI+XWVJ+3foZ4JSLvus3u2oRtQEvY3/1hr/c
	5zjKEPs5HxkDjNMkgkQyWWJtLOU0
X-Google-Smtp-Source: AGs4zMZpVFa+oS6+b6iQVcRJcKwn7EZ5ApwKHLNRuJ7oABGVbp0BzkynRcju28347u6nr8T0xg/hsA==
X-Received: by 10.223.200.6 with SMTP id d6mr21096090wrh.118.1512572372588;
	Wed, 06 Dec 2017 06:59:32 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 187sm551043wmu.19.2017.12.06.06.59.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 06:59:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 14:59:28 +0000
Message-Id: <20171206145928.5497-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171206145928.5497-1-ross.burton@intel.com>
References: <20171206145928.5497-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libxslt: remove inappropriate patch
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
X-List-Received-Date: Wed, 06 Dec 2017 14:59:32 -0000

This was patching -lxslt directly into the pkgconfig file, but XSLT_LIBS already
contains this so the patch is redundant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libxslt/libxslt/pkgconfig_fix.patch            | 24 ----------------------
 meta/recipes-support/libxslt/libxslt_1.1.32.bb     |  5 +----
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch

diff --git a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
deleted file mode 100644
index 16a801010ca..00000000000
--- a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libxslt-1.1.27/libexslt.pc.in
-===================================================================
---- libxslt-1.1.27.orig/libexslt.pc.in
-+++ libxslt-1.1.27/libexslt.pc.in
-@@ -8,5 +8,5 @@ Name: libexslt
- Version: @LIBEXSLT_VERSION@
- Description: EXSLT Extension library
- Requires: libxml-2.0
--Libs: @EXSLT_LIBDIR@ @EXSLT_LIBS@
-+Libs: -lexslt @EXSLT_LIBDIR@ @EXSLT_LIBS@
- Cflags: @EXSLT_INCLUDEDIR@
-Index: libxslt-1.1.27/libxslt.pc.in
-===================================================================
---- libxslt-1.1.27.orig/libxslt.pc.in
-+++ libxslt-1.1.27/libxslt.pc.in
-@@ -8,5 +8,5 @@ Name: libxslt
- Version: @VERSION@
- Description: XSLT library version 2.
- Requires: libxml-2.0
--Libs: @XSLT_LIBDIR@ @XSLT_LIBS@ @EXTRA_LIBS@
-+Libs: -lxslt @XSLT_LIBDIR@ @XSLT_LIBS@ @EXTRA_LIBS@
- Cflags: @XSLT_INCLUDEDIR@
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.32.bb b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
index b8951ab3a8b..6a03f776992 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
-           file://pkgconfig_fix.patch \
-           "
-
+SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz"
 SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
 SRC_URI[sha256sum] = "526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460"
 
-- 
2.11.0


