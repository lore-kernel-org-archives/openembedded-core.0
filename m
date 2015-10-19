Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2A97701C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 22:03:20 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so2169609wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6xFGUVqUB9ncUcr5q/z7wcUvSp04KZoXqXP8nrSRlJE=;
	b=XuJlGSwy7FnjuiZl/rbOdq/MHT8VzBqK06zg7ixwp6t/DVxGNaHOu8/rlX8rG61Bbd
	EGn4MvoFnjl7CbnS95l/LNGsX63IMg2e+In7nYP4VC3upCUSf3PgmQby4MWfFxw4wiEA
	uHRNc9I8V86deT3s1Labh//aI6Sp4N1KR57mn1Dj3dBA7C4DUlxm7awimgvC3ffgfuqx
	/JKisu2s05/I/CSYrB3ZsfvqjvsM9HhWrd4XQZY3Gq5VOSqQuOiFt8ezlkyKz6pJm6vU
	/MEJs3IUrEs0A1EDLjCEotQuj+GFRRAtBRjY5uV/wybkXP8Yxj0V3QdVcB9S8YOqJv17
	WhNg==
X-Gm-Message-State: ALoCoQnKVDQsdYkUMe3PY6n00CtrcxxSxnSqykvgJrx2V5vhsTDEcA1wxwLCPsc3GNIEPc0NPCxp
X-Received: by 10.180.188.235 with SMTP id gd11mr298075wic.84.1445292200890;
	Mon, 19 Oct 2015 15:03:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jd7sm42607072wjb.19.2015.10.19.15.03.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 15:03:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:55:42 +0100
Message-Id: <1445291743-6618-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
References: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 4/5] rpm: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Mon, 19 Oct 2015 22:03:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_4.11.2.bb  | 1 +
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb | 1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index bc36f99..f4a2110 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -23,6 +23,7 @@ LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM ??= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
 DEPENDS = "db libxml2 xz findutils file popt nss bzip2 elfutils attr zlib acl gzip python"
+DEPENDS_append_class-native = " file-replacement-native"
 
 SRC_URI += "http://rpm.org/releases/rpm-4.11.x/${BP}.tar.bz2 \
             file://use-pkgconfig-for-python.patch \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 8903f3b..951b251 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -43,6 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native"
+DEPENDS_append_class-native = " file-replacement-native"
 
 S = "${WORKDIR}/rpm"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index b450c6f..73b3734 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -41,6 +41,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file byacc-native"
+DEPENDS_append_class-native = " file-replacement-native"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-- 
2.1.4


