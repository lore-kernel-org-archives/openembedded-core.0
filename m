Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SzU90-0002IQ-LH
	for openembedded-core@linuxtogo.org; Thu, 09 Aug 2012 16:55:26 +0200
Received: by ghbf1 with SMTP id f1so599018ghb.37
	for <openembedded-core@linuxtogo.org>;
	Thu, 09 Aug 2012 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7CXpb1wDmbh91HQUvWX02tMXGab/8PFYcFBOXIcuLCQ=;
	b=GWAnvCmC7YrFku3BXa08wT1Bv5nxmHnSCkKymBFNNNJgopI4qoMMN6BqUVRqsSPOS6
	8IPlUerZMgrKy/iIRcFpQLIZkJjH2VeLt6F5sRzwlZT9Ft6DaxGgeP01s64oeASdeNEt
	jeUecmjltYj7XFY8KO9FzStvNcaXmCYx3iwEJrPNcGNKf65gcD2D+JxaLzIeKxf7qMVn
	I7kjSBzlFps4aYx6apyAjNrP1uRFrEQVTwEeEkG0tIMdGIXFFJoBgnMRPU8veVeoFVAv
	wNkZ+z5ZcQHcwl7mtg7RL67LM0Ft87GWPZBE9RGl/745ANL1ogPIyuhJl5ofGlq/vH8u
	1W5Q==
Received: by 10.66.75.195 with SMTP id e3mr8207108paw.32.1344523417255;
	Thu, 09 Aug 2012 07:43:37 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tq4sm1274963pbc.11.2012.08.09.07.43.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 07:43:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@linuxtogo.org
Date: Thu,  9 Aug 2012 07:43:20 -0700
Message-Id: <1344523400-12877-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Thu, 09 Aug 2012 14:55:26 -0000

svn tar balls are 96M as compared to 1.3G git tars
its unnessary to suck in that much of data.

Fixes [YOCTO #2908]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 4ad4819..c6ba0b2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r9"
+PR = "r10"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -11,7 +11,7 @@ PR = "r9"
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
 	   file://disablesdt.patch \
 	  "
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
 B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
-- 
1.7.9.5



