Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id F1C647D3A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 13:59:19 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t9so3238465iln.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 05:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gfZ7Sjp8B+j2N9nep0RAkc1mf/MDZsCeoYWuUhfej6k=;
	b=oN9G/74xh6oPzvbrwU0AoYQfkQsO5aXrvO9oMdUK4FMEx1JG/RvWUgxte7D/B5wdAC
	vGgfyCOhIcBmlwzVYhrGV+Vy8yNtm+Ng7tGMhs2zEybABKn+g6rkISh9p5SpWu4pn+9H
	2p6+Nn+vEuXWQeK1Iz9gUtRI/4nOtG8Jzldflt6PhGoAWOHaUo3JGqSM7HrbDGghOHA8
	bY6O7tjGboLU4oFgZ8sLeEmBiv1o4G79p4fcPYPk2gPhWsxTuj/WVa2xlVWBydJMk5HQ
	srPi2nnCjj0XHUNZrw2/aHs1jkLLbkM612/QcuGOv5XSo6cFaDnwSEnBsH9SzuxQ22SE
	eLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gfZ7Sjp8B+j2N9nep0RAkc1mf/MDZsCeoYWuUhfej6k=;
	b=lfdmit0SoLw5p+Cb+6y7F/njEzlnVO2SyeqqZ/9/R3NCcWpeSXHkbYGqSZHs23+kn8
	1odX9qLm+j5/FsQI82QI0XcU3erp5nfiBqOeTg2C6JE4TWpGXSDrMwqgeBmm110SMjbf
	ZPb9Dx7ufmo2Ho+qLRwDDRm5GhDxEOn9b6wXTEebXBjfsteJeIuDvaok+LQCpgvf6yYa
	Jb2iGNGO8ZKxHBtChtkm7LwIpxGZxXfvQMOAUtGI0fdn7jCXcTx+dS6t212LVunCRkz5
	S8dYu16DhXgOWk3p9sAfpZ+JBJw09e+7HT3TQjP7cItYyGKGoE5EH3Qao9URnZewwJzG
	dy+w==
X-Gm-Message-State: APjAAAVfr2exGHQp1l21GNZ5gNGNJcCgLMyittpMgj4SeMxb0KFH7awt
	+oh62/lLiUfCTDfxDeyKyV+On2LXIGM=
X-Google-Smtp-Source: APXvYqxAW2jxVk68Arn08xdjO9dPXwZFVJEOxwES+GyoIHWIHPLK9Ga4TCXfbhFPogcL26Ywn3mO9A==
X-Received: by 2002:a92:3893:: with SMTP id g19mr4945386ilf.79.1575381560405; 
	Tue, 03 Dec 2019 05:59:20 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id l7sm698864iol.22.2019.12.03.05.59.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 05:59:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2019 07:59:15 -0600
Message-Id: <20191203135915.2432394-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] libjitterentropy: Fix man page reproducibility
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
X-List-Received-Date: Tue, 03 Dec 2019 13:59:20 -0000
Content-Transfer-Encoding: 8bit

Adds a patch to prevent the gzip'ed man pages from including the build
date

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../0001-Make-man-pages-reproducible.patch    | 30 +++++++++++++++++++
 .../libjitterentropy_2.2.0.bb                 |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch

diff --git a/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch b/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
new file mode 100644
index 00000000000..886fd26db18
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
@@ -0,0 +1,30 @@
+From ce091718716400119d6be6bd637c0e3f4f6ca315 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Thu, 21 Nov 2019 08:07:41 -0600
+Subject: [PATCH] Make man pages reproducible
+
+Instructs the man page to be gzip'ed without the file name or timestamp
+so that it builds reproducibly.
+
+Upstream-Status: Accepted [https://github.com/smuellerDD/jitterentropy-library/pull/14]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 2e78607..860b720 100644
+--- a/Makefile
++++ b/Makefile
+@@ -60,7 +60,7 @@ cppcheck:
+ install:
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
+ 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
+-	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
++	gzip -n -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
+ 	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
index db8d80e0edd..710ef0172dd 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a95aadbdfae7ed812bb2b7b86eb5981c \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
-           file://0001-Makefile-cleanup-install-for-rebuilds.patch"
+           file://0001-Makefile-cleanup-install-for-rebuilds.patch \
+           file://0001-Make-man-pages-reproducible.patch"
 SRCREV = "933a44f33ed3d6612f7cfaa7ad1207c8da4886ba"
 S = "${WORKDIR}/git"
 
-- 
2.23.0


