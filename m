Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8264E6A8D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 22:00:02 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so5451736pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mURCdDab1Q8dD/IaAQzCJcKjrey9bUF/j7Q4UW+WcCU=;
	b=RxGeiTYbi7xgrId9yaYzzAA1nFlMpHlOQOq7lfTIiaMTml1UOvvj3+SZEih2tSjQ83
	3g262jKHNzZhjpXjxu7a+GwDX3rVPsojog8T5tWkq2BOhCzcAR+BUsYfiH5B7cSksJoj
	bPkcaQFScSEMkbHj7wS0XQ9nOxjnjwvpgqfQXRoP6Jw8dSivSHj4G2XVKmxvFZ8y2KwA
	m1s0XdwffINNLhsZP0CyZ49Do83soWMykhKdla3Y6UzO/Ym9Zn8witgY6k1bDjZO5QXf
	MuhtlcR6K2wE5OkLOvRhEMqiGNz8B8JEeRLqZlMHCadoj6h7BpdsrBI69fCvkR7mPpf/
	zl2w==
X-Received: by 10.69.3.65 with SMTP id bu1mr16679471pbd.107.1370988003856;
	Tue, 11 Jun 2013 15:00:03 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id vv6sm21755785pab.6.2013.06.11.15.00.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 15:00:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 14:57:48 -0700
Message-Id: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc: Upgrade to 4.8.1
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
X-List-Received-Date: Tue, 11 Jun 2013 22:00:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 80bd02c..6664f1c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -6,7 +6,7 @@ require gcc-common.inc
 # on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
 # to reflect that change
 
-PV = "4.8.0"
+PV = "4.8.1"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -14,7 +14,7 @@ PV = "4.8.0"
 # 4.7.1 then the value below will have 2 which will mean 4.7.2
 # which will be next minor release and so on.
 
-BINV = "4.8.0"
+BINV = "4.8.1"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.8' ], d)}"
 
@@ -68,8 +68,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://gcc-4.8-PR56797.patch \
 	   file://gcc-4.8-build-args.patch \
 	  "
-SRC_URI[md5sum] = "e6040024eb9e761c3bea348d1fa5abb0"
-SRC_URI[sha256sum] = "b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
+SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
+SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
-- 
1.7.9.5


