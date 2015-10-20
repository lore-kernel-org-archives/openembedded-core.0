Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0256976FD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:41:09 +0000 (UTC)
Received: by wikq8 with SMTP id q8so66154363wik.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6xFGUVqUB9ncUcr5q/z7wcUvSp04KZoXqXP8nrSRlJE=;
	b=TJRTXSsbLQEZDWPRXWX3S9/O6g8vWj11EE5wXgzcJtpohDbj5zn25XdnlBQOZGIw3B
	8GlhC+rBo9Fhw1QgKyDNSwKPoFHFkoAJl6G4nwS5UEkBxqHw7Xts3pSvaObimuCDjCp0
	K8r2YZS839r8qPiHfKr9p+7nl08BIGOYfVr1MgsqSmZYZk+jIsKuYNqN6pUmsjvjHoG8
	E22wb/WZ8UNMuGVS5fe9Ju5J1i9iCLr9nak0QELODR4ivgZTEAqmQACsQFnALTT0b23Q
	9OuVeu89g+T0GH7+NO10nCSsXRUsrQi6W7d9O8yFkKNBtNv0fOtY/wnsIqRgL70mLSrQ
	OfyA==
X-Gm-Message-State: ALoCoQkB0va+jgBmwjmPXzHYQgoH1gBFEBABL48+ZKkSdbAFLhdVwSwFK4Ck2+uij+rrvxly+K/6
X-Received: by 10.194.134.98 with SMTP id pj2mr7428457wjb.30.1445377269005;
	Tue, 20 Oct 2015 14:41:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lf10sm6209805wjb.23.2015.10.20.14.41.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 14:41:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 22:33:28 +0100
Message-Id: <1445376809-25202-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
References: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V3 4/5] rpm: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Tue, 20 Oct 2015 21:41:11 -0000

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


