Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC8257D117
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:29 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u9so11378823lfe.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FNrzLkYuSsdAX0nQ/HzBN2irh4Uaa8PB7+BTOGqBvfM=;
	b=U/ajpnoZmXrA+edwDCpMGCV+02t3DYsRch32zAHmK6KWwEXE54+FcoizlGQ+XE/vrO
	pxW0GWVMHpLvc6smh9q7beFIQ+HPPxIs3Yh18XcEadb3/1n80LykZT79Hs7rwae/1DVR
	HHuAR4MbGhxdiudLF/2PWUUmyMN2DiL4N8E8oOZAhwSNhvSCDq9qBEHDV8I0G5vzhkmn
	UTG11KQ3nOFs1bzh9SYsfAmoGd1fRccaB2m92CbKxhUXOpZd0HHqaHnwGm3rm3L3H7OW
	a11eKwdUIVPx8gHqqdaI2F2JgSanglgJiSLRnEDqbe1b7Y0A/RAP9bDil0FCrLIawisN
	70og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FNrzLkYuSsdAX0nQ/HzBN2irh4Uaa8PB7+BTOGqBvfM=;
	b=U1hwP0RMAQYAyge4Kznz2gxlP2K4u//yGk/JKy3EyQFRdfBAnAYVhq+8tp4onwJ9/F
	j0a5cO0ZHEgXiJPzRWXzUqvb+CiUTUSNpyuGrGsaBybM1xe/wsXQ7jfUaEw4HOP693+K
	xV67zX/oit9qbndGnCPDuSo6e8CDOp9GzxyQ9Sr5pYRdGkLUx7oXY1BQHuQBXGND7gWv
	kzFP4ccTEhPmvUZvJGuKzDo/15wv/N3KCTaxQzSBi6umYVxM7t2uT8Osro/6Ap3B/0v1
	X+gPIPkgK4bbkBwhC8hPudTRbOwCqFXKKmnWqRa/wmfh2rtZ/CsBXLmbJQzs0/qb7OOP
	Xjvg==
X-Gm-Message-State: APjAAAUAiNU0KV9Hu5Y805LQHXzKe+U1udojCHrW+7kMyGThQEgF0JZI
	PY2xsO++1I2E8DPwn8ak6xZVsbzn
X-Google-Smtp-Source: APXvYqzW/yoDNRnCSRve1hPr1dz8wGuRQxWr5T/p4QmfQ/ocD1k1GgBVxtCtkGfgjzE5eQP1748LqA==
X-Received: by 2002:ac2:5966:: with SMTP id h6mr7143996lfp.86.1553695770193;
	Wed, 27 Mar 2019 07:09:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:17 +0100
Message-Id: <20190327140922.109867-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/8] blktool: update to 4-7.1
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:30 -0000

This update adds a patch from Debian to match the latest version there.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../blktool/0004-fix-ftbfs-glibc-2.28.patch   | 19 +++++++++++++++++++
 .../{blktool_4-7.bb => blktool_4-7.1.bb}      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
 rename meta/recipes-extended/blktool/{blktool_4-7.bb => blktool_4-7.1.bb} (96%)

diff --git a/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch b/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
new file mode 100644
index 00000000000..65bca651000
--- /dev/null
+++ b/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
@@ -0,0 +1,19 @@
+Description: Fix FTBFS with glibc 2.28
+Author: Adrian Bunk <bunk@debian.org>
+Bug-Debian: https://bugs.debian.org/917055
+
+This patch is taken from
+http://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.1.debian.tar.xz
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+--- blktool-4.orig/blktool.c
++++ blktool-4/blktool.c
+@@ -18,6 +18,7 @@
+ #include <unistd.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <getopt.h>
diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.1.bb
similarity index 96%
rename from meta/recipes-extended/blktool/blktool_4-7.bb
rename to meta/recipes-extended/blktool/blktool_4-7.1.bb
index 0e6f7ee6df1..cc24d3cdb24 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/
            file://0001-fix-typos-in-manpage.patch \
            file://0002-fix-string-error.patch \
            file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
+           file://0004-fix-ftbfs-glibc-2.28.patch \
            file://blktool-gnulib-makedev.patch \
           "
 
-- 
2.17.1


