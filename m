Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3D39F6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:54:11 +0000 (UTC)
Received: by pdea3 with SMTP id a3so16642624pde.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Pzv4h0/NpZtvmoPwLIT+w1kFukBU1E8HfiOSr7WWtPU=;
	b=hQZmGHp134YCKVO8/uT/fW9KKxkDWr5EapLJ7f8x2nVPmnGk3IuNidAm2G8PX06iDw
	TQqkL3f6oW3ddS5sMddG1O/WOHS8Je1csZ8fTecKGRAgry/j6eTQlr2xsJA6lc234Il5
	K/DMJiG0hzvocmJv/Nn5SgyXQIY6PbiL12+7Cs9vlQWxR97EDYh6+uNBrUtLr63txFRg
	o1wfzVNMYZ14ElutQXpIQU90qyxSBit4m1QAItwaLieI/b4hFfHo3kE7zGJC4SBmK5FS
	H9+d7Chsz1aC1H+HUwDAkPzlvB3P77526nnljSNfKs3F+UreIxqyyJi5AWc6wBgceeA2
	Yrpw==
X-Received: by 10.68.94.37 with SMTP id cz5mr37363420pbb.70.1429026852920;
	Tue, 14 Apr 2015 08:54:12 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id wa4sm1482433pab.17.2015.04.14.08.54.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Apr 2015 08:54:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 08:53:59 -0700
Message-Id: <1429026839-19421-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] lz4: update package to 128 and SRC_URI
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
X-List-Received-Date: Tue, 14 Apr 2015 15:54:12 -0000

From: Armin Kuster <akuster@mvista.com>

The main reason for the update is to use github
as the project moved away from googlecode.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/{lz4_svn.bb => lz4.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4.bb} (78%)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4.bb
similarity index 78%
rename from meta/recipes-support/lz4/lz4_svn.bb
rename to meta/recipes-support/lz4/lz4.bb
index 363e439..ee5de0a 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -4,13 +4,13 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-# Upstream names releases after SVN revs
-SRCREV = "127"
-PV = "r${SRCREV}"
+SRCREV = "5780864c0ce08622238a267c46fb489d7066cad4"
 
-SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
+PV = "128+git${SRCPV}"
 
-S = "${WORKDIR}/trunk"
+SRC_URI = "git://github.com/Cyan4973/lz4.git;protocol=http"
+
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
-- 
2.3.5


