Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6CA6D9B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 02:19:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 85so5690819pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2LcIvJWsAhCYPd64XhXaqhMvH/xmb7EpEIef4QEj3aU=;
	b=XY2DtPv+D533O+unsMz/SodNzR5gogma/Y2l24eDccKINMvjeKDQrefdVs/8+DuPse
	1H0Hgb1tB9z6m1sP2esxZDv0g/zLyQhVg5YIaSzHUC6QXPbfiNP1yaxuXy7+MXlXhaMR
	+VwRyX0EQsOXZYD/kiPX+HvFFW+rhY73WnLco25hOxKvn5eqJ6OfHlJNwuf+KOmc7jiI
	9DqWC379c9vzIA2++dR28RI+s/qfTrmrTf4w6idugj4hFt3W2ACfmXH0sUShCMNVZ+0W
	EYngSp5LTZzpB+gQqZwAeC692DOF2Ylcop40okd8qI5cPzsflezEVvO8hD4fesJ3Z/1A
	pNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2LcIvJWsAhCYPd64XhXaqhMvH/xmb7EpEIef4QEj3aU=;
	b=AtdKNcileQdMyu9mPXc64NdSgpMAJdR++9G0ONLXN4t4+slhjyWXOKk4lmwuQVkVuB
	x/lLUxxS9RIWjPwPCsXM/oa3Vc6PcN5G8rFgeJrTdySkNXriKSOrPlAjzWWO8cz4Ms3R
	IlpgYzBt20gjHAhI2UJJ+Rd2qcBY3wgRqN51Ezx/dWncq+MyW45Sxrd6jGz3zlE08BjV
	XGxHiNc7/rTHV9/McGeYDkHfmlTQzBkiKPTHewbW3MdzNXq1Ret6CgAYQ0Gc/i5K6sAf
	0BIDTta0zsXFJqJAcaVmNTKOC0kc+zf+mEfRKkbg2U4j4DFz8uuROeDkt5hD8vc8zaM1
	TKyQ==
X-Gm-Message-State: APjAAAWhTT2CGfs6gRLPOhNKlfBxFSYX0TRo0hrvA+IGljEsujjyIwxV
	Ct3IYfnXUt+PNy7pZYHxN1oAN86w
X-Google-Smtp-Source: APXvYqx93m7xDxQgrR3zrnmpBgdkiqqBYueHxcYimOkAfg6DDKyZqMDyKERPU64nxe5DKhCP462a+g==
X-Received: by 2002:a63:4621:: with SMTP id t33mr26437087pga.246.1557109197918;
	Sun, 05 May 2019 19:19:57 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	v82sm18012067pfa.170.2019.05.05.19.19.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 19:19:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 19:19:54 -0700
Message-Id: <20190506021955.26534-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] nss: cleanup recipe to match OE style
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
X-List-Received-Date: Mon, 06 May 2019 02:19:57 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nss/nss_3.43.bb | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/nss/nss_3.43.bb b/meta/recipes-support/nss/nss_3.43.bb
index 14a17335a2..f8cf5a46af 100644
--- a/meta/recipes-support/nss/nss_3.43.bb
+++ b/meta/recipes-support/nss/nss_3.43.bb
@@ -8,6 +8,9 @@ v3 certificates, and other security standards."
 HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
 SECTION = "libs"
 
+DEPENDS = "sqlite3 nspr zlib nss-native"
+DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
+
 LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
 
 LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
@@ -38,10 +41,6 @@ UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
 
 inherit siteinfo
 
-DEPENDS = "sqlite3 nspr zlib nss-native"
-DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
-RDEPENDS_${PN}-smime = "perl"
-
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
 
@@ -118,8 +117,8 @@ do_compile() {
         OS_TEST=${OS_TEST} \
         RPATH="${RPATH}"
 }
-do_compile[vardepsexclude] += "SITEINFO_BITS"
 
+do_compile[vardepsexclude] += "SITEINFO_BITS"
 
 do_install_prepend_class-nativesdk() {
     export LDFLAGS=""
@@ -195,6 +194,7 @@ do_install() {
         install -m 755 -t ${D}/${bindir} $binary
     done
 }
+
 do_install[vardepsexclude] += "SITEINFO_BITS"
 
 do_install_append() {
@@ -248,17 +248,20 @@ PACKAGES =+ "${PN}-smime"
 FILES_${PN}-smime = "\
     ${bindir}/smime \
 "
+
 FILES_${PN} = "\
     ${sysconfdir} \
     ${bindir} \
     ${libdir}/lib*.chk \
     ${libdir}/lib*.so \
     "
+
 FILES_${PN}-dev = "\
     ${libdir}/nss \
     ${libdir}/pkgconfig/* \
     ${includedir}/* \
     "
 
-BBCLASSEXTEND = "native nativesdk"
+RDEPENDS_${PN}-smime = "perl"
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


