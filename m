Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.9827.1620227962541994159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s9eesEK0;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n2so3453519ejy.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZdfKexVnV10+iq+v+gQ29lBL6kaXL5//GErxMn8xvc=;
        b=s9eesEK0RtxizW6kQwbLeeBGG8/VY2V+rQssK86ogodZvZbJYp560MbjLR1Z9sUh3E
         /ubxdeXF2Y/qL5jkAGyFTGZE0IPzBX05RY5XyYVMZhnvptcppCwBK3gtI89z01TYB+o1
         79Oklgsi7TDhy/g6At1gie2dIkw3pq3kAIlfZFzLxnFdSp1yh8nJeA9sjACgHS2iNfTb
         JFYbjN3OWgFQtOubIjPDSR12MgUq4ZGYOjqu9t4AQqPu8RWLwaWiJUaqLDNRXTsPnD2W
         JX012lHDnoT0DDKWz2gDctyZFMKRl7CwGzTSVkEZgZXnAcrdtOlMJnnsZuCHlrCNLM+X
         wpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZdfKexVnV10+iq+v+gQ29lBL6kaXL5//GErxMn8xvc=;
        b=do9D3ASmsayObasQDLtfISoa2oBHOHwn9c2EgWr47an9SU6Za00Hi6fwg1HmpQaKCo
         BjIzaImWJ9m1NL7jRE9gPxuoF3I6EvU8tbnBtuIzrMbixaqXq5a51TlF+9Wosl9+hKcR
         ZDEMALRnRHGdbFmJewAxOK1QCzJagSHYvhjj14fn7RDcSTHWqNeSDyaikH0SUbl0Mzyr
         LAsbRWfHsETFtVUtiP1mBLu2P8o5vF1YcUP8wUyO2KNge0G+Kj+Vcinp1YkA4wdyh+PQ
         sSIrQMxIXDGuDjwmnfwZ0ZLoNYTfRhrtwCWl9QAyvtlQ/s2M3I+LVCx42hyuKAvQw2jF
         dvjw==
X-Gm-Message-State: AOAM5319hQpsNkZbquaZvu3v3CladvsHjiMsVZw3Mq0BOTaCr8S2XWay
	uymHKVXkr5xjtihjG6qIlxSN3SjeUMDqgQ==
X-Google-Smtp-Source: ABdhPJwiwWou9+e44gfcaj5PaGCQjxCQ9+wPTrqy98D0y60mA5tHllAU6Kj5GuRYN1fbL0rGvjFDRQ==
X-Received: by 2002:a17:906:e086:: with SMTP id gh6mr4250551ejb.201.1620227961094;
        Wed, 05 May 2021 08:19:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/61] e2fsprogs: upgrade 1.46.1 -> 1.46.2
Date: Wed,  5 May 2021 17:18:20 +0200
Message-Id: <20210505151850.660512-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-ext2fs-unix_io.c-do-unlock-on-error.patch | 24 ++++++++++
 ...io.c-revert-parts-of-libext2fs-fix-p.patch | 48 +++++++++++++++++++
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  6 +--
 ...2fsprogs_1.46.1.bb => e2fsprogs_1.46.2.bb} |  4 +-
 5 files changed, 79 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.1.bb => e2fsprogs_1.46.2.bb} (96%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
new file mode 100644
index 0000000000..26f972b313
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch
@@ -0,0 +1,24 @@
+From 42ba67f9a51ef959e7fd8dac29b5398c121c6976 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Apr 2021 23:45:56 +0200
+Subject: [PATCH] lib/ext2fs/unix_io.c: do unlock on error
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/68]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/ext2fs/unix_io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ext2fs/unix_io.c b/lib/ext2fs/unix_io.c
+index 64eee342..528c2fbc 100644
+--- a/lib/ext2fs/unix_io.c
++++ b/lib/ext2fs/unix_io.c
+@@ -398,7 +398,7 @@ static errcode_t raw_write_blk(io_channel channel,
+ 		mutex_lock(data, BOUNCE_MTX);
+ 		if (ext2fs_llseek(data->dev, location, SEEK_SET) < 0) {
+ 			retval = errno ? errno : EXT2_ET_LLSEEK_FAILED;
+-			goto error_out;
++			goto error_unlock;
+ 		}
+ 		actual = write(data->dev, buf, size);
+ 		mutex_unlock(data, BOUNCE_MTX);
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
new file mode 100644
index 0000000000..2452f7e08e
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch
@@ -0,0 +1,48 @@
+From 3593063f735f453d43f461292e26913436c11ca3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sat, 1 May 2021 13:06:12 +0200
+Subject: [PATCH] lib/ext2fs/unix_io.c: revert parts of "libext2fs: fix
+ potential races in unix_io"
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/68]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/ext2fs/unix_io.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ext2fs/unix_io.c b/lib/ext2fs/unix_io.c
+index 528c2fbc..f4916b21 100644
+--- a/lib/ext2fs/unix_io.c
++++ b/lib/ext2fs/unix_io.c
+@@ -311,10 +311,10 @@ bounce_read:
+ 			size += really_read;
+ 			goto short_read;
+ 		}
+-		actual = size;
+-		if (actual > align_size)
+-			actual = align_size;
+-		actual -= offset;
++		if ((actual + offset) > align_size)
++			actual = align_size - offset;
++		if (actual > size)
++			actual = size;
+ 		memcpy(buf, data->bounce + offset, actual);
+ 
+ 		really_read += actual;
+@@ -455,9 +455,10 @@ bounce_write:
+ 			}
+ 		}
+ 		actual = size;
+-		if (actual > align_size)
+-			actual = align_size;
+-		actual -= offset;
++		if ((actual + offset) > align_size)
++			actual = align_size - offset;
++		if (actual > size)
++			actual = size;
+ 		memcpy(((char *)data->bounce) + offset, buf, actual);
+ 		if (ext2fs_llseek(data->dev, aligned_blk * align_size, SEEK_SET) < 0) {
+ 			retval = errno ? errno : EXT2_ET_LLSEEK_FAILED;
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index d7c07c3b0f..e8b2aafbf3 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 9263b8764702f2b26ddaaf80808ebab31a1dba3b Mon Sep 17 00:00:00 2001
+From 8957443bcbea43685c76eb3cbc5009f7fd529283 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 88d0ae77c9..96eb7f20df 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 6e4c1644a3a8cacf7c1f5953cc378589bb046d5a Mon Sep 17 00:00:00 2001
+From 3b75308cc75adc249db6ca36e42fe93309b9a018 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 132c5f9d..98063727 100644
+index b67a88bc..76dd5556 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2510,7 +2510,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2518,7 +2518,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
similarity index 96%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
index be8b67c35d..fc022f37de 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
@@ -4,6 +4,8 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-lib-ext2fs-unix_io.c-do-unlock-on-error.patch \
+           file://0001-lib-ext2fs-unix_io.c-revert-parts-of-libext2fs-fix-p.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
@@ -11,7 +13,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
 "
 
 
-SRCREV = "3114c623f56b0d61f5f34b85f7b23d28f6c848c0"
+SRCREV = "1eea0e2bd9a6760ebad834d5d2cf700fffe5ebe2"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.31.1

