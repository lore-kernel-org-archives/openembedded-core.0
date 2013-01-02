Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqTQJ-0005er-Sv
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 19:52:20 +0100
Received: by mail-la0-f54.google.com with SMTP id fp12so6582323lab.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 10:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cdHg8vtUvTdAlskXc229rjvvDZ5pHRZ6Am5cSwEhQQ0=;
	b=raaWgSlljlQ2T60lVPP7a+c66zvhOz24qlh3l8LsX2hgaUjaH+JY50+C9JqoNJvmz4
	CIvsyoYLM6qCo4tgBGwnsnu6ieO7XOiUBophzMMWMlqWWNs8uLuFPo68KQVjvTvZ8Xbd
	g6RNd5/VIqJYiNUQ4uKJLicAAvpV0+PIUXMi4mDXo/m+9yOpUFgKHzHiOXD6Qv5+7oGW
	U12vfvenuZPz4u7AblBH1MVX1A0fLp97rCTAFFC2vNrqByA/4OuVPoOW+KUZ+f2BmGT1
	m2+12ObRd1n3gD70BdSBnl+PXYtvPYSVqI3/I0lzio3sLlHWg/UKAAqG5eJMlZOnqBMk
	gqtg==
X-Received: by 10.152.106.163 with SMTP id gv3mr44298624lab.55.1357151837287; 
	Wed, 02 Jan 2013 10:37:17 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fh4sm16305022lbb.7.2013.01.02.10.37.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 10:37:16 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqTBh-0006CK-VD; Wed, 02 Jan 2013 20:37:14 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2013 20:37:08 +0200
Message-Id: <1357151830-23755-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357151830-23755-1-git-send-email-cazfi74@gmail.com>
References: <1357151830-23755-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 1/3] mpfr: update to upstream version 3.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 18:52:22 -0000

mpfr_fix_for_automake-1.12.patch part of upstream now.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 --------------------
 .../long-long-thumb.patch                          |    0
 .../mpfr/{mpfr_3.1.0.bb => mpfr_3.1.1.bb}          |    7 ++--
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
 rename meta/recipes-support/mpfr/{mpfr-3.1.0 => mpfr-3.1.1}/long-long-thumb.patch (100%)
 rename meta/recipes-support/mpfr/{mpfr_3.1.0.bb => mpfr_3.1.1.bb} (65%)

diff --git a/meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch b/meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
deleted file mode 100644
index 5b0a24a..0000000
--- a/meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
-this patch avoids these issues with automake 1.12
-
-| configure.ac:304: error: automatic de-ANSI-fication support has been removed
-| tests/Makefile.am:12: error: automatic de-ANSI-fication support has been removed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@.intel.com>
-2012/05/02
-
-Index: mpfr-3.1.0/configure.ac
-===================================================================
---- mpfr-3.1.0.orig/configure.ac
-+++ mpfr-3.1.0/configure.ac
-@@ -301,7 +301,6 @@ if test "$test_CFLAGS" != set && test -n
- fi
- 
- AM_PROG_CC_C_O
--AM_C_PROTOTYPES
- 
- case $host in
-   *-apple-darwin*)
-Index: mpfr-3.1.0/tests/Makefile.am
-===================================================================
---- mpfr-3.1.0.orig/tests/Makefile.am
-+++ mpfr-3.1.0/tests/Makefile.am
-@@ -9,7 +9,7 @@
- # PARTICULAR PURPOSE.
- 
- 
--AUTOMAKE_OPTIONS = 1.6 gnu $(top_builddir)/ansi2knr
-+AUTOMAKE_OPTIONS = 1.6 gnu
- 
- # tversion is run
- #   * at the beginning so that the user gets a possible version error
diff --git a/meta/recipes-support/mpfr/mpfr-3.1.0/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr-3.1.1/long-long-thumb.patch
similarity index 100%
rename from meta/recipes-support/mpfr/mpfr-3.1.0/long-long-thumb.patch
rename to meta/recipes-support/mpfr/mpfr-3.1.1/long-long-thumb.patch
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.0.bb b/meta/recipes-support/mpfr/mpfr_3.1.1.bb
similarity index 65%
rename from meta/recipes-support/mpfr/mpfr_3.1.0.bb
rename to meta/recipes-support/mpfr/mpfr_3.1.1.bb
index e7e20ce..7f34e71 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.1.bb
@@ -3,15 +3,14 @@ LICENSE="GPLv3&LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
            file://long-long-thumb.patch \
-           file://mpfr_fix_for_automake-1.12.patch \
            "
 
-SRC_URI[md5sum] = "238ae4a15cc3a5049b723daef5d17938"
-SRC_URI[sha256sum] = "74a7bbbad168dd1cc414f1c9210b8fc16ccfc8e422d34b3371a8978e31eab680"
+SRC_URI[md5sum] = "e90e0075bb1b5f626c6e31aaa9c64e3b"
+SRC_URI[sha256sum] = "7b66c3f13dc8385f08264c805853f3e1a8eedab8071d582f3e661971c9acd5fd"
 S = "${WORKDIR}/mpfr-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4



