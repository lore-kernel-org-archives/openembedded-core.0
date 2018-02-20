Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id D5BC47885D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:28:55 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id u6so16263917qtg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 05:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=REnuydyJ8FFPvgrzsuBuMU7ItQmz5+UmswIjLlxqzMU=;
	b=K7xuFOFZvpKbdtVyyiXY1wUj3pAmRmeBZRgnHMY/dSxpJkQdRXwVEIwkS5FD7hFkKY
	Z+MgeTzO3lyQfahhS5Ud8W+ijL/uS9T0/iaUlAqS/59usw5xur3E2sz9+As32TTmUXHC
	xh3nqYUzwCm5g8fIgGTimpEmwBcxu3X6dcgyqYxR3q//fOAQ0PEVrhiq7Jk0bPPNEdTx
	vT3QWzXmLL9SegtAfoftxxFd9qTKYZd79M2CIZNJFSa6ZMvuClhgD8MMjKZzsiopp+MN
	eBW3IiExuws3vWE8MIRI0PVwql0Z3roi5zna9Z9BFDElHreNdriyX4cDnatvqZHdkPu8
	mQhw==
X-Gm-Message-State: APf1xPDAvvS67MLnIYQqT9Eyll8Ee6mQimkNI86crJDX/aMmmG1DHjcu
	Y+u+eZ3SWiggPYA/D9AGcWjglg==
X-Google-Smtp-Source: AH8x227IXL7eKSNbtbFLunCPXJgkJTU3ECLJ8R0rP6PvZvPv/t9atQv6apzNTVPl5BTmjL6zjZaeRQ==
X-Received: by 10.200.47.101 with SMTP id k34mr7376199qta.151.1519133336772;
	Tue, 20 Feb 2018 05:28:56 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	i186sm12998639qke.86.2018.02.20.05.28.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Feb 2018 05:28:56 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 20 Feb 2018 10:28:51 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Feb 2018 10:28:09 -0300
Message-Id: <20180220132811.16100-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180220132811.16100-1-otavio@ossystems.com.br>
References: <20180220132811.16100-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 4/6] go-dep: Upgrade 0.3.2 -> 0.4.1
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
X-List-Received-Date: Tue, 20 Feb 2018 13:28:56 -0000

The release was announced in Jan 24th 2018 and provides a number of
features and bug fixes.

The 0.4.1 restores the `dep prune` command support, which was dropped
on 0.4.0, so existing scripts will continue to work. That said, it is
advisable to change the scripts to use the new features of `dep
ensure` as `dep prune` will be removed in future.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 ...er-constant-that-hopefully-works-the-same.patch | 33 ----------------------
 .../go/{go-dep_0.3.2.bb => go-dep_0.4.1.bb}        |  5 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
 rename meta/recipes-devtools/go/{go-dep_0.3.2.bb => go-dep_0.4.1.bb} (72%)

diff --git a/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch b/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
deleted file mode 100644
index 2a7bc43cdb0..00000000000
--- a/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 73e8dd479420bb90a46cf9d99ca62289fab3677e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Sep 2017 08:43:58 -0700
-Subject: [PATCH] use a smaller constant that hopefully works the same.
-
-This test uses a constant that is too big for 32bit systems.
-
-Backported from
-https://github.com/boltdb/bolt/issues/645
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- vendor/github.com/boltdb/bolt/db_test.go | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vendor/github.com/boltdb/bolt/db_test.go b/vendor/github.com/boltdb/bolt/db_test.go
-index 3034d4f4..035f5a5f 100644
---- a/vendor/github.com/boltdb/bolt/db_test.go
-+++ b/vendor/github.com/boltdb/bolt/db_test.go
-@@ -370,7 +370,7 @@ func TestDB_Open_InitialMmapSize(t *testing.T) {
- 	path := tempfile()
- 	defer os.Remove(path)
- 
--	initMmapSize := 1 << 31  // 2GB
-+	initMmapSize := 1 << 29  // 512MB
- 	testWriteSize := 1 << 27 // 134MB
- 
- 	db, err := bolt.Open(path, 0666, &bolt.Options{InitialMmapSize: initMmapSize})
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-dep_0.3.2.bb b/meta/recipes-devtools/go/go-dep_0.4.1.bb
similarity index 72%
rename from meta/recipes-devtools/go/go-dep_0.3.2.bb
rename to meta/recipes-devtools/go/go-dep_0.4.1.bb
index cdf6da15938..d82e6372058 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.2.bb
+++ b/meta/recipes-devtools/go/go-dep_0.4.1.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f
 
 GO_IMPORT = "github.com/golang/dep"
 SRC_URI = "git://${GO_IMPORT} \
-           file://0001-use-a-smaller-constant-that-hopefully-works-the-same.patch;patchdir=src/github.com/golang/dep \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
           "
 
-# Points to 0.3.2 tag
-SRCREV = "8ddfc8afb2d520d41997ebddd921b52152706c01"
+# Points to 0.4.1 tag
+SRCREV = "37d9ea0ac16f0e0a05afc3b60e1ac8c364b6c329"
 
 inherit go
 
-- 
2.16.2


