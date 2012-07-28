Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvDfy-0003w9-3a
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 22:31:50 +0200
Received: by wibhm2 with SMTP id hm2so1472979wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 13:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=V+cFRarfGyLwSUX0gue0367tfrpXksZnxUcSeUzxYc4=;
	b=t1yr22BJ7dZK+kbT9E7iVRg3O7hR8g7czBD7HO/AuEvinCJukEIV/ypKEkTEryONXn
	Fcy2gwVO0+X6xuo1ZXlUcndCCGQSbHMHzEbEL7SyWExGobVyu8vYzKL0yrKa1R2+0E5O
	D74zEqmBE/y/R0zjYSp+3kYtttDMHIgY8x6WE9aAbN3qkF/9HChhEoyeBfulvOPCinWc
	s1+nFLn9k+tV8pSWeIr0rKVHbVas1IpR3AnTR6x+0cbsnzstE3sDkrmnUhOZLyLyqlj4
	DS90mbFhL+etucTzoTZv7phf+Zirqqi9Gi7VSb6BT9IXTsDrO26icqfG1e5y385iyp1y
	Mbow==
Received: by 10.180.94.164 with SMTP id dd4mr31284517wib.1.1343506816486;
	Sat, 28 Jul 2012 13:20:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm6400912wib.6.2012.07.28.13.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 13:20:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2012 22:20:07 +0200
Message-Id: <1343506807-24935-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <5014425C.3090506@communistcode.co.uk>
References: <5014425C.3090506@communistcode.co.uk>
Subject: [PATCH] bison: move remove-gets.patch to BASE_SRC_URI, it's needed for bison-native too if host has (e)glibc-2.16
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
X-List-Received-Date: Sat, 28 Jul 2012 20:31:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/bison/bison_2.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index 687f06a..5028300 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -9,15 +9,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
-PR = "r2"
+PR = "r3"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch \
+           file://remove-gets.patch \
 	  "
 
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
-           file://remove-gets.patch \
           "
 
 SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
-- 
1.7.8.6



