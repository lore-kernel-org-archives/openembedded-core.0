Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1909D72F01
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z129-v6so747396pgz.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/QfBBneGn71npxKpBC8dFk7/MldPV31lAoDx1mt9gxQ=;
	b=gKOfIMd+csQC+fACdAO7eqvbOzVpAg73GIOuGyEOfjLolj4kqUrbSe0eBwGBx7Of1B
	Wo94dNuCVMZA92IMiQXqt+a73zDXxUdE2vdvTrMr1sdmRi0Dwiu/WVM0mj+Om2F0S4jA
	z+cmNEoPmItoR9NmUmhGp9/RRYAoMFj9lENksZR12PH3SB/zFbdaBFJegDoVAcInfigG
	M6HCDf37CXGRXQu5AW8NKPqcKfrERflQ1KtkH5aYheEqmQQw4y+Pv/qP6oEmp60/3KRz
	qfGImLUDvvFrt/EoPWX3ueSzNy3uFkv40oDnNSfvWdw8rZxuQRmB/vxMQ1FxCkvawCAT
	/aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/QfBBneGn71npxKpBC8dFk7/MldPV31lAoDx1mt9gxQ=;
	b=HcmDiT2f4XMl6P0rn3V8MdRT3nlWU65Sh59+kTGDjg44getd2XYaT2RX7QhrvrbXxM
	yH4qhfgJfvYTE6gYtu9wF77RYyZhcYTJM4xRumtBKplKJWfIKgDQ87sgjXCpJxb5M1Tc
	93JI2sEO7ZAdTYzySx08vt2FTVuGPswQ9oftiyNx9RRvhLjcGyfBmlkHg3fr9vTelxsi
	i8GGlZ0p+T7PxuTigE5G5QilrpryJivJq5lbaeLW90s1X3721aLLrRN6KjP8PHdRSKpk
	/ZyAZzsHvWyvWy0kuvNAfB2jEYk5YiFtsiLZqsXYAk5iE0XW8PT5DIrKdviguJU1Aqzc
	f9RQ==
X-Gm-Message-State: ALQs6tA/IRIp3UQBZtYjaQAVNP5P4mC31OFIdOBeQ7DaA583HWhJTyPq
	AM77tJgnchIARz+o7f9d0Xgljw==
X-Google-Smtp-Source: AB8JxZogaP9Csn9izS4l23oOrn8HfL6P0XteQomW+O33a/sqDwxBWuL0829+FC92Ov/3Fek2AYbnKQ==
X-Received: by 2002:a17:902:5402:: with SMTP id
	d2-v6mr10033412pli.386.1525030585039; 
	Sun, 29 Apr 2018 12:36:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:54 -0700
Message-Id: <8910043065dc4a3e7e40c5c287c33dbe3a95f169.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 07/24] pbzip2: Fix C++11 warnings found with clang
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...valid-suffix-on-literal-C-11-warning.patch | 73 +++++++++++++++++++
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch

diff --git a/meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch b/meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch
new file mode 100644
index 0000000000..8fc377c31b
--- /dev/null
+++ b/meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch
@@ -0,0 +1,73 @@
+From de4a948d356c9befb88c796168e97eb05b9a3385 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Apr 2018 22:54:42 -0700
+Subject: [PATCH] pbzip2: Fix invalid suffix on literal C++11 warning
+
+Fixes -Wreserved-user-defined-literal] errors.
+Also reported in launchpad here https://bugs.launchpad.net/pbzip2/+bug/1746369
+
+Upstream-Status: Submitted [https://launchpadlibrarian.net/355230152/pbzip2.patch]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pbzip2.cpp | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/pbzip2.cpp b/pbzip2.cpp
+index 66ca978..4287ea7 100644
+--- a/pbzip2.cpp
++++ b/pbzip2.cpp
+@@ -1220,7 +1220,7 @@ int producer_decompress(int hInfile, OFF_T fileSize, queue *fifo)
+ 			// give warning to user if block is larger than 250 million bytes
+ 			if (fileData->bufSize > 250000000)
+ 			{
+-				fprintf(stderr, "pbzip2:  *WARNING: Compressed block size is large [%"PRIuMAX" bytes].\n",
++				fprintf(stderr, "pbzip2:  *WARNING: Compressed block size is large [%" PRIuMAX " bytes].\n",
+ 						(uintmax_t) fileData->bufSize);
+ 				fprintf(stderr, "          If program aborts, use regular BZIP2 to decompress.\n");
+ 			}
+@@ -1829,7 +1829,7 @@ void *fileWriter(void *outname)
+ 	
+ 	if (QuietMode != 1)
+ 	{
+-		fprintf(stderr, "    Output Size: %"PRIuMAX" bytes\n", (uintmax_t)CompressedSize);
++		fprintf(stderr, "    Output Size: %" PRIuMAX " bytes\n", (uintmax_t)CompressedSize);
+ 	}
+ 
+ 	#ifdef PBZIP_DEBUG
+@@ -2072,7 +2072,7 @@ int directcompress(int hInfile, OFF_T fileSize, int blockSize, const char *OutFi
+ 		close(hOutfile);
+ 	if (QuietMode != 1)
+ 	{
+-		fprintf(stderr, "    Output Size: %"PRIuMAX" bytes\n", (uintmax_t)CompressedSize);
++		fprintf(stderr, "    Output Size: %" PRIuMAX " bytes\n", (uintmax_t)CompressedSize);
+ 	}
+ 
+ 	syncSetProducerDone(1); // Not really needed for direct version
+@@ -2794,7 +2794,7 @@ void outputBufferInit(size_t size)
+ 	// unlikely to get here since more likely exception will be thrown
+ 	if (OutputBuffer.size() != size)
+ 	{
+-		fprintf(stderr, "pbzip2: *ERROR: Could not initialize (OutputBuffer); size=%"PRIuMAX"!  Aborting...\n", (uintmax_t)size);
++		fprintf(stderr, "pbzip2: *ERROR: Could not initialize (OutputBuffer); size=%" PRIuMAX "!  Aborting...\n", (uintmax_t)size);
+ 		safe_mutex_unlock(OutMutex);
+ 		exit(1);
+ 	}
+@@ -4102,7 +4102,7 @@ int main(int argc, char* argv[])
+ 			if (decompress == 1)
+ 				fprintf(stderr, " BWT Block Size: %c00k\n", BWTblockSizeChar);
+ 			if (hasInFile)
+-				fprintf(stderr, "     Input Size: %"PRIuMAX" bytes\n", (uintmax_t)InFileSize);
++				fprintf(stderr, "     Input Size: %" PRIuMAX " bytes\n", (uintmax_t)InFileSize);
+ 		}
+ 
+ 		if (decompress == 1)
+@@ -4224,7 +4224,7 @@ int main(int argc, char* argv[])
+ 			{
+ 				NumBufferedBlocksMax = numCPU;
+ 				if (QuietMode != 1)
+-					fprintf(stderr, "*Warning* Max memory limit increased to %"PRIuMAX" MB to support %d CPUs\n", (uintmax_t)((NumBufferedBlocksMax + (numCPU * 2)) * blockSize)/1000000, numCPU);
++					fprintf(stderr, "*Warning* Max memory limit increased to %" PRIuMAX " MB to support %d CPUs\n", (uintmax_t)((NumBufferedBlocksMax + (numCPU * 2)) * blockSize)/1000000, numCPU);
+ 			}
+ 			else
+ 			{
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 06d37adc36..4e96de2ed3 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 DEPENDS = "bzip2"
 DEPENDS_append_class-native = " bzip2-replacement-native"
 
-SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
+SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz \
+           file://0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch \
+           "
 
 SRC_URI[md5sum] = "4cb87da2dba05540afce162f34b3a9a6"
 SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b7bdbe6"
-- 
2.17.0


