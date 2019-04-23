Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 656587D28D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z24so788366wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6nY/g/DSG1XIyzQPceGNgn5dABKfzRxfeENbgQHSjb0=;
	b=V/VGNblxXzWrHN00u0IL5z9F4Lp6WA85kmuOGFuMWTZY9lgcGcESVkAQzpKQw2DrUw
	rWO0/SpWuGvHiXfSLQ0/yFA9LTePgU5XGvXIblTs5UksQ3+4XIa8ZcP/WyQj89tVap7O
	LFm3RxWvj4PUdP9bx4i6WjN0gbMQam5Chp3prtOPu4Ku+nGDBtxGznWS/PbRhB7Yr79V
	hcA0UacQA1dxlr8+E5cVXjjv/Ja6hUeM8137theNf3lv9SW+d8R+2BOesgnEgR5BcqId
	7K5xtmaRAc8XF39KpG5SMZIyYU+t+CVrTwknt9aMZa94q0IYOLpaNHIJ87JVZ56gT5jX
	P9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6nY/g/DSG1XIyzQPceGNgn5dABKfzRxfeENbgQHSjb0=;
	b=SUDrMPkRnEFfG+4ITEC8QsL9+DMLanxRUow/h9kTlR/D1xeb/qKU1sO3pP9XQ4hgX7
	W5E8Ur386O5uArgjNY4FFWw+VnQguImOehygW8CSbIIsgLtkOPyycikTgZeRmd5uPFeN
	ftT008uG+x+FvDHxymadrqPP51WcK7qq/PqwHqrCozS2dO8GgyKGQSLEqjqvMXCJcMlG
	RGCRxLDWio8L+ABRtXpw4yF5rBSjzF6YvL/9Qlma8+xC8RlJ+V0ugC8FAmF30Y+t5d0c
	RMX6hmNQ2LWHEwzEy96j0GLvrzqKPHAAe0vnxYXP8LfYEZq7aDSQA+9DUkCMGTiW6JSq
	OhJQ==
X-Gm-Message-State: APjAAAUpfJ7WV5pzAzLpYUYLBCPfp5JgASmSedjd6eJgT5CF191spiFR
	mt8SNjbY44xbJwL677XF7QOcJICX1vo=
X-Google-Smtp-Source: APXvYqxje9x3c3YGl44WZamdwgBk4YuxpW+Qwu48601q4wO+FVJa81JmoiJGXNZ6nhSDjlziPe23aA==
X-Received: by 2002:a1c:4c12:: with SMTP id z18mr2946305wmf.142.1556036365218; 
	Tue, 23 Apr 2019 09:19:25 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:09 +0200
Message-Id: <20190423161916.25572-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/9] acpica: update to 20190405
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:25 -0000

Drop manipulate-fds-instead-of-FILE.patch as upstream has fixed the issue
long time ago:

https://github.com/acpica/acpica/commit/ecb91f4c3a151cbb280ee445166e7c6f4dc441a5

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{acpica_20180508.bb => acpica_20190405.bb} |  5 +-
 .../manipulate-fds-instead-of-FILE.patch      | 71 -------------------
 2 files changed, 2 insertions(+), 74 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20180508.bb => acpica_20190405.bb} (90%)
 delete mode 100644 meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch

diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20190405.bb
similarity index 90%
rename from meta/recipes-extended/acpica/acpica_20180508.bb
rename to meta/recipes-extended/acpica/acpica_20190405.bb
index b5c89fafc59..c0ebd5a9317 100644
--- a/meta/recipes-extended/acpica/acpica_20180508.bb
+++ b/meta/recipes-extended/acpica/acpica_20190405.bb
@@ -18,10 +18,9 @@ DEPENDS = "bison flex bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
            file://rename-yy_scan_string-manually.patch \
-           file://manipulate-fds-instead-of-FILE.patch \
            "
-SRC_URI[md5sum] = "31691e2eb82b2064f78536a3423c18d6"
-SRC_URI[sha256sum] = "5d8fc9d9db9e04830d40bec9add04b21c05d466e0187d354815006fdd823cf15"
+SRC_URI[md5sum] = "9ee30c8ff3012e213bc3b21a9d632215"
+SRC_URI[sha256sum] = "7e144fd011c23a0a10be0b0d7448c527a4c0f621f1f835a271636e448bc96643"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
deleted file mode 100644
index d8b5f9aa8a1..00000000000
--- a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 540d80469e6a7dce6baf7214df90e86daffc5175 Mon Sep 17 00:00:00 2001
-From: Fan Xin <fan.xin@jp.fujitsu.com>
-Date: Mon, 5 Jun 2017 13:26:38 +0900
-Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
-
-Copying what stdout/stderr point to is not portable and fails with
-musl because FILE is an undefined struct.
-
-Instead, use lower-level Unix functions to modify the file that stderr
-writes into. This works on the platforms that Yocto targets.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
-Rebase on acpica 20170303
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
----
- source/compiler/aslfiles.c | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
-index 82865db..cc072dc 100644
---- a/source/compiler/aslfiles.c
-+++ b/source/compiler/aslfiles.c
-@@ -43,6 +43,11 @@
- 
- #include "aslcompiler.h"
- #include "acapps.h"
-+#include "dtcompiler.h"
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
-+#include <unistd.h>
- 
- #define _COMPONENT          ACPI_COMPILER
-         ACPI_MODULE_NAME    ("aslfiles")
-@@ -606,6 +611,8 @@ FlOpenMiscOutputFiles (
- 
-     if (Gbl_DebugFlag)
-     {
-+	int fd;
-+
-         Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
-         if (!Filename)
-         {
-@@ -617,10 +624,10 @@ FlOpenMiscOutputFiles (
-         /* Open the debug file as STDERR, text mode */
- 
-         Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
--        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle =
--            freopen (Filename, "w+t", stderr);
- 
--        if (!Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle)
-+        fd = open(Filename, O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH);
-+        if (fd < 0 ||
-+            dup2(fd, fileno(stderr)))
-         {
-             /*
-              * A problem with freopen is that on error, we no longer
-@@ -634,6 +641,8 @@ FlOpenMiscOutputFiles (
-             exit (1);
-         }
- 
-+        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
-+
-         AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
-         AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
-     }
-- 
2.17.1


