Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A42F37391A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 23:28:34 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so3519809wid.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UPUqkzvWT3o3ZRGKIxSRQEDesI7y/UnAe1oHZzbu7zg=;
	b=W0o94mhF2jRxBgXmk2lHByusfY1JqT7c8Av+TjH34n1IQerYTOsWqQkKf6lFNVADnA
	DVHF26j8frjnGBsK9anGlq6C1WLJKDSXJ5pgDz5OCtJSaoh0fPRlBoxZCkZHHCnHQDbp
	JvvoErUd/PNyHlW0tWnNeA7tu1NqJqpdiJxFxKu1EcnIicu4yiW6XqRg2GD7q06zSZOF
	vnTuoOg8xKagFNDl3bNQ5UGKO3IG6Fw0eDIqwM0FRmXtspwWJmcVBrvf/3B0oDMdVCiJ
	+ZdN8fDgC1khxhrgd533nJ2L2PSqEtVr6IblFOBLk5S+sjgJBHbhSA/p1lrERAcSSZtd
	C0kA==
X-Received: by 10.194.92.109 with SMTP id cl13mr19623390wjb.156.1440199714024; 
	Fri, 21 Aug 2015 16:28:34 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host167-191-dynamic.52-82-r.retail.telecomitalia.it.
	[82.52.191.167]) by smtp.gmail.com with ESMTPSA id
	bu12sm11926078wjb.44.2015.08.21.16.28.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Aug 2015 16:28:32 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 01:28:29 +0200
Message-Id: <1440199709-23502-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mtd-utils: add dependency on acl
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
X-List-Received-Date: Fri, 21 Aug 2015 23:28:36 -0000

After commit 24fde4d do_compile fails:

| mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
|  #include <sys/acl.h>

Adding acl to the list of dependencies fixes the build.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8d4892a..72ce9ed 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-DEPENDS = "zlib lzo e2fsprogs util-linux"
+DEPENDS = "zlib lzo e2fsprogs util-linux acl"
 
 PV = "1.5.1+git${SRCPV}"
 
-- 
1.9.1


