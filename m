Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7C29260602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 19:59:46 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l20so26872232qta.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=+FdCE2W04y0wJPM2Q6Phc0oFfR/BfmPEwewnBNf3k2g=;
	b=txawF5sDgbmCeezvvKcwjHe0L5idx5F6Tzr8D8optHmC86s6g/eJCsP83XdWJlwEIH
	KQppcIGN/eM2FKNLxLksKqIiYny783rZIVhLKnkwrWvhHfQ0RhoXnMa/oWLDi+W3thkT
	cX7vRFqEaQE3Zr/hZsOMHTdyBfCM3fF3vcwsFSYI9iy2lGFhF6SJf7DZreTkw6QDIaGH
	ArDNcQ6eyxq2cFpcmYa9G/inTfehSgVaBSaM1swphywP48hanSFqOI3dj7k6S1+gSFCh
	wFM2zSXcL9Gc3OwciGsrJZejRd0Ar3d+KBSZHR0pZKcqfipHv8Fbyz8rAimd+Q8E0VN1
	coTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=+FdCE2W04y0wJPM2Q6Phc0oFfR/BfmPEwewnBNf3k2g=;
	b=Gxv0eAyenLOvXGaXPF80qcGZOnQmK3gIweXHbP4bYugt6Pb643jmVL36gzB+dKkPH4
	qRxeEFkzh7ULfx7urN0bNTYx6LUpRcaQUHVlkJy8QGvC4Dcx8/048E0Qzp94ZyT77x4r
	8uxSP7dAHsp3Tv5HJPb+ho2yAL+9YZdvnQsDWJFNYYDvsCtPieirqu2/+0o3HQcWWrd5
	N/GWE4x36MVm5pR1T3lueu55MO3lECc7OdCPlJQHxpzj+Qui2f7muOD1w6XTJRKbdrnA
	SADGWU4NhY4eYfBYcEOkF6c09JzcjdbYYbg0tbNb7RK9QJxdE1BdLjitKVrUCNeNa22X
	DBGw==
X-Gm-Message-State: AKaTC0125ah8SXFqAQveVtMZA1Xw/9tdtEIVBWqnjJ9Sp9yITMWXURYfhWGTesT25u4xgw==
X-Received: by 10.200.36.125 with SMTP id d58mr8929155qtd.126.1479758387618;
	Mon, 21 Nov 2016 11:59:47 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	i190sm12037668qke.9.2016.11.21.11.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Nov 2016 11:59:46 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:58:52 -0200
Message-Id: <1479758332-4977-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] pigz: Update to version 2.3.4
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
X-List-Received-Date: Mon, 21 Nov 2016 19:59:50 -0000

  - Change SRC_URI to fetch sources from Github archives. Pigz official
    site maintains only the latest tarball version and Github have all
    versions avaiable to download.

  - Remove patch link-order.patch. The following commit fix this issue:
    https://github.com/madler/pigz/commit/c3f91d1a12a6f

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-extended/pigz/pigz/link-order.patch | 38 ------------------------
 meta/recipes-extended/pigz/pigz_2.3.3.bb         | 14 ---------
 meta/recipes-extended/pigz/pigz_2.3.4.bb         | 12 ++++++++
 3 files changed, 12 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-extended/pigz/pigz/link-order.patch
 delete mode 100644 meta/recipes-extended/pigz/pigz_2.3.3.bb
 create mode 100644 meta/recipes-extended/pigz/pigz_2.3.4.bb

diff --git a/meta/recipes-extended/pigz/pigz/link-order.patch b/meta/recipes-extended/pigz/pigz/link-order.patch
deleted file mode 100644
index 4becc0e..0000000
--- a/meta/recipes-extended/pigz/pigz/link-order.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-This patch avoids underlinking issues since we pass -lz via LDFLAGS but it appears
-before pigz.o which needs symbols from libz however due to order linker happily discards libz
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: pigz-2.3.3/Makefile
-===================================================================
---- pigz-2.3.3.orig/Makefile	2015-01-19 20:12:31.000000000 -0800
-+++ pigz-2.3.3/Makefile	2015-01-28 09:11:50.266669184 -0800
-@@ -5,7 +5,7 @@
- # use gcc and gmake on Solaris
- 
- pigz: pigz.o yarn.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
--	$(CC) $(LDFLAGS) -o pigz $^ -lpthread -lm
-+	$(CC) -o pigz $^ $(LDFLAGS) -lz -lpthread -lm
- 	ln -f pigz unpigz
- 
- pigz.o: pigz.c yarn.h try.h ${ZOPFLI}deflate.h ${ZOPFLI}util.h
-@@ -35,7 +35,7 @@
- dev: pigz pigzt pigzn
- 
- pigzt: pigzt.o yarnt.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
--	$(CC) $(LDFLAGS) -o pigzt $^ -lpthread -lm
-+	$(CC) -o pigzt $^ $(LDFLAGS) -lz -lpthread -lm
- 
- pigzt.o: pigz.c yarn.h try.h
- 	$(CC) $(CFLAGS) -DDEBUG -g -c -o pigzt.o pigz.c
-@@ -44,7 +44,7 @@
- 	$(CC) $(CFLAGS) -DDEBUG -g -c -o yarnt.o yarn.c
- 
- pigzn: pigzn.o tryn.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
--	$(CC) $(LDFLAGS) -o pigzn $^ -lm
-+	$(CC) -o pigzn $^ $(LDFLAGS) -lz -lm
- 
- pigzn.o: pigz.c try.h
- 	$(CC) $(CFLAGS) -DDEBUG -DNOTHREAD -g -c -o pigzn.o pigz.c
diff --git a/meta/recipes-extended/pigz/pigz_2.3.3.bb b/meta/recipes-extended/pigz/pigz_2.3.3.bb
deleted file mode 100644
index b4fe831..0000000
--- a/meta/recipes-extended/pigz/pigz_2.3.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require pigz.inc
-LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
-
-UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"
-SRC_URI += "file://link-order.patch"
-
-SRC_URI[md5sum] = "01d7a16cce77929cc1a78aa1bdfb68cb"
-SRC_URI[sha256sum] = "4e8b67b432ce7907575a549f3e1cac4709781ba0f6b48afea9f59369846b509c"
-
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.3.4.bb
new file mode 100644
index 0000000..49d9d78
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz_2.3.4.bb
@@ -0,0 +1,12 @@
+require pigz.inc
+LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
+
+UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
+SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
+SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.1.4


