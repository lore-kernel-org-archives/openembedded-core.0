Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9U1Z-00069Q-JD
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 06:49:05 +0200
Received: by iebc11 with SMTP id c11so2406212ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 21:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Y55NL10Egh/LnUV6YtYMs8GdT+KuzWGBccB1ZKnjoD4=;
	b=zqojhuKFw81vQ/dcVNlT8cWCe2XAFcw4d86b370z8Cj1Yby7cf57LZLdxIVibrv6iz
	VbXrh2NvhHpXsNf2Rcj1LCiVfadmYmi8QT0TkQoF156B4CyetdyV8V13nAlarKY9veBv
	kbH19u5sE9zCXHRy8I7Khe+eP4WgUHe+ZG3UnhGllRPsjdcgI5U4syKYMvKZIBLmn8DU
	6A1EZuqh89eA66SRwPI272xpnsJFroQ5jhyzXRJ/YHwrlX7FrjqjGCp4rNPBKWsqgFQX
	UXrkhtoJiliAgHMJbLiI6i+nBYvL9mYbDDRUAd/MvNdRnmtGPdJiaCuL4XQtwHKIEY0V
	4DAQ==
Received: by 10.50.220.169 with SMTP id px9mr777211igc.8.1346906201259;
	Wed, 05 Sep 2012 21:36:41 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id xm2sm2662687igb.3.2012.09.05.21.36.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 21:36:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 21:35:44 -0700
Message-Id: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346905978.git.raj.khem@gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Thu, 06 Sep 2012 04:49:05 -0000

svn tar balls are 96M as compared to 1.3G git tars
its unnessary to suck in that much of data.

Fixes [YOCTO #2908]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 84c230c..affbd54 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -11,7 +11,7 @@ PR = "r11"
 # using 4.7.1.0 for upgrade path when we move past 4.7.2 release
 # then we should drop the last 0 as well.
 
-PV = "4.7.1.0+git${SRCPV}"
+PV = "4.7.1.0+svn${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -21,7 +21,7 @@ PV = "4.7.1.0+git${SRCPV}"
 
 BINV = "4.7.2"
 
-SRCREV = "d07e24f4ab59f264d68d21838795349faab5dede"
+SRCREV = "190218"
 BRANCH = "gcc-4_7-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
@@ -36,7 +36,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -77,7 +77,7 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
 	   file://libtool.patch \
 	  "
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
 B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
-- 
1.7.9.5



