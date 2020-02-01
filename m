Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 00E9660BF2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 17:27:49 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id j4so5367094pgi.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KQSyER1NTabsohGLuovQUGz5lMsDdVNaB3UILzjNFkM=;
	b=eIYOq8xtPS0RIkOSAwoBSAZaDu2Xr97KM/j/QppvrfBSxsczWIdvpp5zWi78rrGqI9
	LBL3wrpWRAMl6MYFozUNNEFiYeSV6heBrt5ocmLgDS7AwxmcV+HFIKjNfJWfiQh4T1EL
	wxQvQwvUryBl3Q0t+OuqPdynofbMtl4SOwQJX2AruTq1/g5Q1mwN7x32bJbSZQgffqNp
	ZV7Vh/l22EU7/xy5oMuXbPVMc4EAQwA/hiyPg3FUab8GjC/okgN/0YisbnH+4fHg9XJO
	gMgfLybO5qt7AkBCEXTNB6UcruUAY2z+3aUgxJ+MhR5LzaKQYQKxRqmPl4hRltYG++xT
	dO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KQSyER1NTabsohGLuovQUGz5lMsDdVNaB3UILzjNFkM=;
	b=qZO44biIodaCCaXMSzj33uW9UuKZOqBa7rd2x1p1IcOoihZgZ8NakXfj6p0pZ0qdHJ
	t9+pP9PM/WJ6tfDzgJYXuM2gyNYtKARAcLlUFTXSJp2EYaTmXr2B7V3NlhKZEn7mZdU+
	pRJ6J/vKm1hIKsQFHIokDk4rlitcPgUwkXz5Aqvz65LCQ/M39lhIObAcrPBSPc/pMni+
	g+x4imKo2LXMLMPQgZOe2QGZylxcSp+LsDTum5qVmROqcYX61mxtDQMP3N83iXu/man5
	85IV/9wndorMXQ8OhTlF3aGoIUoe3pRQMDzCxrh3ApxXdixP2OFYiwhbO6XIQch1R3l4
	ufFQ==
X-Gm-Message-State: APjAAAV+oVMKxZp5fIMQ8f3gwoxbCvYwVSIvMfRW0n6q7ffNRf9ekp5h
	kkRiAfTIwQSbL6Sf8WW64FfsymTrAiE=
X-Google-Smtp-Source: APXvYqzKNNNjtL3OGVA3M4ae/2fUCV1tWGGxVGKIL+7B+0vcv0qRskA6/A1JId2E8PljE/TwY2gWuw==
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr2966404pgm.434.1580578070642; 
	Sat, 01 Feb 2020 09:27:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id p4sm2916760pgh.14.2020.02.01.09.27.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 09:27:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2020 09:27:51 -0800
Message-Id: <db1e341019043998978894db44cb5026c8080009.1580577516.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580577515.git.raj.khem@gmail.com>
References: <cover.1580577515.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glibc: Update to final 2.31 release
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
X-List-Received-Date: Sat, 01 Feb 2020 17:27:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-core/glibc/glibc-common.inc    | 2 +-
 meta/recipes-core/glibc/glibc-version.inc   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index aba2baaaba..936db5ae16 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "9.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.33%"
 GDBVERSION ?= "8.3%"
-GLIBCVERSION ?= "2.30%"
+GLIBCVERSION ?= "2.31"
 LINUXLIBCVERSION ?= "5.4%"
 QEMUVERSION ?= "4.1%"
 GOVERSION ?= "1.13%"
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 27534d999f..8d412cc857 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
-PV = "2.30.9000"
+PV = "2.31"
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c2cfb7e2f1..f489650f70 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "master"
-PV = "2.30.9000"
-SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
+SRCBRANCH ?= "release/2.31/master"
+PV = "2.31"
+SRCREV_glibc ?= "9ea3686266dca3f004ba874745a4087a89682617"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.0


