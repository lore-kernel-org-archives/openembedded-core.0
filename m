Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53212606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:38:29 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so3991027pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BE0aAwMFOyzIs5KhEVeV6Yz+yNt6I32BAWjOIgWXQb0=;
	b=0N04x9I4Wq9WjVfTQ48sWpyigxJlNxWggPW58b3GjZMt2rYCoLBzJTCUJY6CUJXwTT
	O5aDpQ9ii+cmxHoZD/y2FCldTkxPBEe4jQf1uW+GfvM5QvL/lR2TNrWo6FtBnHtEQd4L
	sf0YmPtW0ltGHS5wMmpQhmGEunV3ATG/w5Wqjn6KBsfND0kuKiRps6brJUGrRLT40ufC
	C4xOsA5yEMYnF59e8dWJkwiwVWs12OtBHll7DDfmONbCwWvgI61ejdtwT7auhygB/zNg
	LMU2NNpH4EeN2Pw97M7q1kg4r995PLvUX5MugvaZpWaQRWAhe0ADnKvnc2Sjc1NAHzYi
	jmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BE0aAwMFOyzIs5KhEVeV6Yz+yNt6I32BAWjOIgWXQb0=;
	b=YS0K7pjAjWX7AeVTAgQ+LV+hb9DOr2Caal61Yff7x5njGd2mc3YzyijAgx3omyOQAP
	2HaxbdEn7qrGWXL475SEfTJU5Wn1JFyXBLEZBIAX34b7qPVpmmUK4qRh3Zn4OqnweTRg
	tcT7lidL9gii+B3v8l8I3KfCITES2Vr5tlsRCiV9mlr75JPkH+8ExfrgxI/qtsCWm8kt
	YR1iD6SdvM8wxDzB75al9Xi7bhHYMfE+4l7CjnWAG5NEscriTiI/4HnvxGyzUfu3Yw4P
	QJrfG890eNVdB3XGALajliQQF5d8suMgH3dmzr9uzBniW44zXooNsPtctJ+OctQP0f56
	hPyA==
X-Gm-Message-State: ALyK8tLvP298AGbMD6ycnoQIvnQvQ8LLHoekfoyFRT0Vy5sMGn8YWyAUx4WXahfaDA3YGQ==
X-Received: by 10.98.111.133 with SMTP id k127mr84736pfc.90.1469043510807;
	Wed, 20 Jul 2016 12:38:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e10sm6465694pay.39.2016.07.20.12.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 12:38:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 12:38:23 -0700
Message-Id: <2c386c7b01a0ac2764c4a6d7334d79487f9371ba.1469043317.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469043317.git.raj.khem@gmail.com>
References: <cover.1469043317.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] glibc: Update to 2.24 after hard-freeze
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
X-List-Received-Date: Wed, 20 Jul 2016 19:38:30 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.24.bb           |  2 +-
 meta/recipes-core/glibc/glibc/elf-meta.patch       | 32 ----------------------
 meta/recipes-core/glibc/glibc_2.24.bb              |  3 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/elf-meta.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index 104e38b..650c6c3 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "d461c9682d4954076f9ee9e07be903c2eef8e73b"
+SRCREV_glibc ?= "d957c4d3fa48d685ff2726c605c988127ef99395"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc/elf-meta.patch b/meta/recipes-core/glibc/glibc/elf-meta.patch
deleted file mode 100644
index fab66d7..0000000
--- a/meta/recipes-core/glibc/glibc/elf-meta.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From a495656665cd4a4f97744741a4741eafa621d65b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 11 Jul 2016 16:57:38 +0100
-Subject: [PATCH] elf.h: add relocations for Imagination META
-
-Adding EM_METAG but not the relocations means the kernel doesn't compile as it
-guards its own declarations on the presence of EM_METAG.
----
- elf/elf.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/elf/elf.h b/elf/elf.h
-index b6112d9..69e85a7 100644
---- a/elf/elf.h
-+++ b/elf/elf.h
-@@ -3677,6 +3677,10 @@ enum
- 
- #define R_TILEGX_NUM		130
- 
-+/* Imagination META relocs */
-+#define R_METAG_ADDR32		2
-+#define R_METAG_NONE		3
-+
- /* BPF specific declarations.  */
- 
- #define R_BPF_NONE		0	/* No reloc */
--- 
-2.8.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 4bc6443..f023272 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "d461c9682d4954076f9ee9e07be903c2eef8e73b"
+SRCREV ?= "d957c4d3fa48d685ff2726c605c988127ef99395"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
@@ -37,7 +37,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://elf-meta.patch \
 "
 
 SRC_URI += "\
-- 
2.9.0


