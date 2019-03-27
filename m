Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE52C7D13A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:04:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q1so19024241wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tZX5ONIRrzvaiDUmrem8UReObg3hTwItM31ceFhotLo=;
	b=CGIlmL4xcfR5IEnRwK1I0YWe+dEOtq7Av2l98ZHXpt3ZcXdRha8lRjYXiCyupbXSVd
	fYBc9q5y+dxjc5elR0evO/Gomg/bteuoGJLuyr9VeEdfRwEuUnwcR95lVEg0YNMp0fHQ
	Ezx5Wle8yiE3D801FBBBXJ4HFwAxP9mFVtDjHCHyLiu40HrIJwhqqPDdLUDHiTGkBzBf
	i44xB/JU9txtq6GEiQY/Yi9VUfaS5hVBJJkxIz/oXNmjTC6Pc49cvtaf/YoQfP6MNBIh
	UNAQrHeKgEWIrPtaANyQ3nXhvzGogJXwyurFuzPI/gUv34JPukAWY3KCtkbYITAx0FgL
	PSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tZX5ONIRrzvaiDUmrem8UReObg3hTwItM31ceFhotLo=;
	b=ao5JiNN1qC2/sUowWJ4NFjoUrCZz4ZSHCPKLJ/RixvaNJ2cUZWnvHFA7WE1JV3j+6e
	+/zupfvEGIlnlAexOv28cG/w88FcEeECSN6Ph+KAkxa3/IB1NBvxehGfeMRSnjvqjuyp
	quHHXS6o6vUwioC2iE8yXzNSQzjHkJqQZURalP+OJbTYcgeqjxm27lA0Du7YGcOZUQZX
	G7OtyvhrDPbz9RBNWDNecBrj4n3TvvMZBRzyUZLmDKW5LwSMrVNRb9cJbsxmSwn8VvGl
	U1cajUHZhgEqYNd7k3EveldScJ6ot0ggBxOsqe88zR+e90ArhrSyEpfXw8ryvUyHpL2p
	3+9g==
X-Gm-Message-State: APjAAAUuLsEtHpGklOy/fzjHRCE67OVX1KL7vC585d8n62J4l7tjbJmF
	sfrooagVYpfO7ZxVgAgVkrOkfXuQ
X-Google-Smtp-Source: APXvYqxOEr8I/MenP4YyjdWZnAMyUP0EUt7pQXDaP4gdmQUm3eG/FBZVMBCHNnI4N89X6o5FruADFQ==
X-Received: by 2002:adf:eb0c:: with SMTP id s12mr6277418wrn.229.1553699100386; 
	Wed, 27 Mar 2019 08:05:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h7sm118998wmb.41.2019.03.27.08.04.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 08:04:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:04:55 +0100
Message-Id: <20190327150455.46537-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] blktool: remove a duplicate patch
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
X-List-Received-Date: Wed, 27 Mar 2019 15:05:00 -0000

blktool-gnulib-makedev.patch is actually doing the same
thing as 0004-fix-ftbfs-glibc-2.28.patch, so we end up
including the same file twice.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../blktool/blktool-gnulib-makedev.patch      | 23 -------------------
 .../recipes-extended/blktool/blktool_4-7.1.bb |  1 -
 2 files changed, 24 deletions(-)
 delete mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch

diff --git a/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch b/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
deleted file mode 100644
index 6eea608b291..00000000000
--- a/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-include <sys/sysmacros.h> for major/minor defintions
-
-Fixes
-
-| ../blktool-4.orig/blktool.c: In function 'detect_dev_class':
-| ../blktool-4.orig/blktool.c:295:10: warning: implicit declaration of function 'major' [-Wimplicit-function-declaration]
-|   switch (major(st_rdev)) {
-|           ^~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: blktool-4.orig/blktool.c
-===================================================================
---- blktool-4.orig.orig/blktool.c
-+++ blktool-4.orig/blktool.c
-@@ -27,6 +27,7 @@
- #include <linux/cdrom.h>
- #include <linux/major.h>
- #include <scsi/scsi.h>
-+#include <sys/sysmacros.h>
- 
- #include "blktool.h"
- 
diff --git a/meta/recipes-extended/blktool/blktool_4-7.1.bb b/meta/recipes-extended/blktool/blktool_4-7.1.bb
index cc24d3cdb24..ff2eaa5352b 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.1.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.1.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/
            file://0002-fix-string-error.patch \
            file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
            file://0004-fix-ftbfs-glibc-2.28.patch \
-           file://blktool-gnulib-makedev.patch \
           "
 
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
-- 
2.17.1


