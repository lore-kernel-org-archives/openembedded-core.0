Return-Path: <mail@timomueller.eu>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7FF6E623
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:21:38 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w55so39182692wes.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 04:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bfQYz/tchT01yLL/0qD6BKiC46up24zh2TaoZDOczXw=;
	b=N5u4cGyN529yiK1K1MEF9YD+CuoqO6UCUlHSZOfhqWlCXMEQUvCtojwRXM9BbgSAeW
	Ot6kgUeuxrkg++7H5yQTo/v6k3/YUJJuZ8R6Ze3fHlIzSnu1r9+JmzfQBRsOTABMJBZb
	53GzMbEoAl1uw/dFkUxJPCvMK9fXyN3raGbtLMvO95cqN2KOJxAE7yiQuXtvF6GYPM9y
	518wLM2yigOVpkG3kkE/p0I2tSe/ZCis3H1dPDPQcPZoJzFF3RijxTV0Lhu0l7Jp63Ob
	gQZythwid4divohzKwjkrvGdtZBYSybNcyK8xhkC4bFdplgAEdkB7CYIlzJYl7SbmGCm
	qUVA==
X-Gm-Message-State: ALoCoQkJQjfx0A1484EXty5rETtaq3DpNg7cQsYlShUezYzmhZDPHfUIZ+AyQjVFTPDonUwCmHbj
X-Received: by 10.180.11.235 with SMTP id t11mr9339099wib.33.1422966099150;
	Tue, 03 Feb 2015 04:21:39 -0800 (PST)
Received: from localhost (mail.bmw-carit.de. [62.245.222.98])
	by mx.google.com with ESMTPSA id
	tc2sm24331728wic.21.2015.02.03.04.21.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Feb 2015 04:21:38 -0800 (PST)
From: Timo Mueller <mail@timomueller.eu>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 13:21:28 +0100
Message-Id: <38ebd9c07097eae41afb9a8cd35c2c1e708fd970.1422954274.git.timo.mueller@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <101216fcee28372a0091d98b73f74f08e6d36b8d.1422954274.git.timo.mueller@bmw-carit.de>
References: <101216fcee28372a0091d98b73f74f08e6d36b8d.1422954274.git.timo.mueller@bmw-carit.de>
In-Reply-To: <101216fcee28372a0091d98b73f74f08e6d36b8d.1422954274.git.timo.mueller@bmw-carit.de>
References: <101216fcee28372a0091d98b73f74f08e6d36b8d.1422954274.git.timo.mueller@bmw-carit.de>
Cc: Timo Mueller <timo.mueller@bmw-carit.de>
Subject: [PATCHv2 2/2] apr-util: Allow use in SDK
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
X-List-Received-Date: Tue, 03 Feb 2015 12:21:44 -0000

From: Timo Mueller <timo.mueller@bmw-carit.de>

This adds 'nativesdk' in the BBCLASSEXTEND.

Building apr-util for the SDK requires that some paths in the rules.mk
file are fixed to point to the actual enviroment. These include pointing
the apr configuration variables to the actual apr builddir and
correcting the name of the libtool.

Signed-off-by: Timo Mueller <timo.mueller@bmw-carit.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index ac01b63..6a14d14 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "apr expat gdbm"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
@@ -49,6 +49,17 @@ do_configure_append_class-native() {
 	sed -i "s#LIBTOOL=\$(apr_builddir)#LIBTOOL=${STAGING_BINDIR_NATIVE}#" ${B}/build/rules.mk
 }
 
+do_configure_prepend_class-nativesdk() {
+	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+}
+
+do_configure_append_class-nativesdk() {
+	sed -i "s#\(apr_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
+	sed -i "s#\(apr_builders\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
+	sed -i "s#\(top_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
+	sed -i "s#\(LIBTOOL=\$(apr_builddir)\).*#\1/libtool#" ${S}/build/rules.mk
+}
+
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
 FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
-- 
2.1.0


