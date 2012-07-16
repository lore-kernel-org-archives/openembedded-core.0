Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqo0E-0004tE-O2
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:18:30 +0200
Received: by weyr6 with SMTP id r6so3614766wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bfgQZojDvqVzijPTD9brpQeKG4bg/TMtv341utwZ6eY=;
	b=CAnIphlCFWvspxa6nxBP8ICoC6DPA1iRGygtvIgal1HJ3cNFKz8wCrdGi9v+W7H6Ef
	F5xpq8fNoETw8yvCrJwHQIqSXH9XcUM9Fd/712vLXQxC1M7juQoaAK836nBoyassQlYZ
	Yed/pfaFkQ6jlQ6wElLwe9zuWuaupiQVJfT7CriZH2Z/tyaS4wS4m7mtec4ThrT56mKs
	B9yeuQdLwpyB56H4fc9wFHqIW1J0BW9gcvbgzb7ifg4+kbl5XwNZgwy3gEQ+6laUeBfL
	ODOx0+HpWXbP9Uv4gYMs3rYG/mxvhZlxO2aOrfS3/EZTbRJWFVR8deEeJ16ikAQWDhwL
	AY1w==
Received: by 10.180.87.232 with SMTP id bb8mr19369099wib.0.1342454832409;
	Mon, 16 Jul 2012 09:07:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df4sm22144321wib.4.2012.07.16.09.07.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 09:07:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 18:07:17 +0200
Message-Id: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [RFC 1/2] glib: upgrade to 2.32.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 16:18:31 -0000

* it's bugfix release, see http://ftp.gnome.org/pub/gnome/sources/glib/2.32/glib-2.32.4.news
  for list of fixed bugs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   11 +++++++----
 .../{glib-2.0_2.32.3.bb => glib-2.0_2.32.4.bb}     |    5 ++---
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.3.bb => glib-2.0_2.32.4.bb} (92%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
index 0149767..d310041 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
@@ -1,9 +1,12 @@
-From 0040842024725c0e74f84c1719ead6c79ba94aba Mon Sep 17 00:00:00 2001
+From e1252cbf65001487ff3b94bbc141acacf6e528b6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 16 May 2012 20:03:34 +0200
 Subject: [PATCH] configure: add option to disable libelf support
 
-Upstream-Status: Pending
+Upstream-Status: Backport 
+Applied in master
+http://git.gnome.org/browse/glib/commit/?id=9e1d4da14d8e69fb60da1a9733ac1d58d0dcd8b2
+can be dropped when upgrading to 2.34.* or newer
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -11,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 files changed, 4 insertions(+), 0 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aa65648..1bb49bf 100644
+index ed4c10e..210df90 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1815,6 +1815,9 @@ AC_SUBST(XATTR_LIBS)
@@ -22,7 +25,7 @@ index aa65648..1bb49bf 100644
 +              AC_HELP_STRING([--disable-libelf], [build without libelf support]))
 +if test "x$enable_libelf" != "xno"; then
  
- PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
+ PKG_CHECK_MODULES([LIBELF], [libelf >= 0.8.12], [have_libelf=yes], [have_libelf=maybe])
  
 @@ -1835,6 +1838,7 @@ fi
  if test $have_libelf = yes; then
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 08aa897..fca5f8d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,6 +1,5 @@
 require glib.inc
 
-PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -16,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://nodbus.patch \
            file://nolibelf.patch \
           "
-SRC_URI[md5sum] = "9bd3ac535c24b6c162be13b2c43c5adc"
-SRC_URI[sha256sum] = "b65ceb462807e4a2f91c95e4293ce6bbefca308cb44a1407bcfdd9e40363ff4d"
+SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
+SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
 
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.8.6



