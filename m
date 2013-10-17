Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2F16D1FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:10 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ec20so1907365lab.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0cpRPOw4xODYeT8suf/2Ms/Z6orWetnhbFxPQiVs/vI=;
	b=Yy3Xl6Nhg8ZmyTTWdsoTIKTbiwTZskXiB8Wg5sOgtXa+GysnwS9ZiTBop2TMIaxyX6
	4Fnl/IxxG3FnMB0vUrb+caVreljvlYmradAN7plIw1QGkoV7i82EztejXC/aYLAZZPm/
	NH/KrIWKIqBc0DlH0Fpvk5berrLMv+Tq/pX3lNa9Q32O4YwKYUR8nMvkuu2Q6hmJxTpK
	Q8LUeGXiiLsjlasAD7EV0Y+nVFbuGL384bSKAmM63l4l2UY2bsfHHIEGm4//2bPzDemW
	ffKs71SF9WvGewZdMCZQw1d+BWVO1gr2FfcemEAVqqZVvRUkpnxyoBAvsgSZT7RzzmMd
	Jlmw==
X-Received: by 10.152.7.105 with SMTP id i9mr7475677laa.9.1382018411644;
	Thu, 17 Oct 2013 07:00:11 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	m13sm54986144lbo.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:09 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 264F5400FD6; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:46 +0200
Message-Id: <1382018386-25389-12-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] rpm: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 3c7e03b..0630f74 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -105,12 +105,12 @@ acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 # Specify the default rpm macros in terms of adjustable variables
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
 rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
-PACKAGECONFIG_class-native ??= "db bzip2 zlib beecrypt openssl libelf python"
 PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
@@ -224,8 +224,11 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/rpmrepo \
 		${libdir}/rpm/bin/rpmspecdump \
 		${libdir}/rpm/bin/wget \
-		/var/lib/rpm \
-		/var/cache/rpm \
+		${libdir}/rpm \
+		${localstatedir}/cache/rpm \
+		${localstatedir}/cache/wdj \
+		${localstatedir}/lib/rpm \
+		${localstatedir}/lib/wdj \
 		"
 
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
@@ -235,7 +238,7 @@ FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 FILES_${PN}-common = "${bindir}/rpm2cpio \
 		${bindir}/gendiff \
 		${sysconfdir}/rpm \
-		/var/spool/repackage \
+		${localstatedir}/spool/repackage \
 		"
 
 FILES_${PN}-libs = "${libdir}/librpm-*.so \
@@ -313,6 +316,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		"
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-build = "file"
 
 RDEPENDS_python-rpm = "${PN}"
@@ -452,7 +456,7 @@ do_install_append() {
 
 }
 
-do_install_append_class-native() {
+add_native_wrapper() {
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
 		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
@@ -481,4 +485,12 @@ do_install_append_class-native() {
 	done
 }
 
-BBCLASSEXTEND = "native"
+do_install_append_class-native() {
+	add_native_wrapper
+}
+
+do_install_append_class-nativesdk() {
+	add_native_wrapper
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


