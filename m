Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B561C782BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:16 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id w12so6675436pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ocDid71Nq+4zpum/UaK0+tzEN/4DYwi6bgR8y801YdM=;
	b=dEbnvdd/uZ8WKYQUFLl9m5Sd8/v444Bxi8FkHvOR6MMn30bpGXyloz2Wo+UVh2gefm
	KToRnNo3txVdWZ+McYLS/Wa/u6M1P+IO1S5z+TAmXVGudzVYJ8f0cuLfnaj570Ia4MEH
	XjvoNt52tGPaUJlAjHrvSqBXqGbTjaAdSxkSf1wg7T5V5baUHhItnspP4aQBo2wqtfke
	macR4lU03bIfJ+1ovcwqaLCUChEHx2w8/avrUqHdZMtPru/f07f5GKuQrPmCpR0PZhW3
	6osjgjcQCzg/R1yvuCIgNhfxgkJfqdapphHwqoFBMVJeM0k6oES5JiGrFFRGtn4k+5Gg
	gKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ocDid71Nq+4zpum/UaK0+tzEN/4DYwi6bgR8y801YdM=;
	b=VD/iyFPD725jxm1iILtfJ4YGBqHOTQ9sfQLZIlPALjYsOrmKfT4GbQWP+RDZQjBpKY
	lWiV4feR+W22azgvzj+4UXMmURksrr7xP+AnLflDtePnczov4JEZNR9AOEaqniEPerIF
	MzK1+vrefxIsntyebEi94v8cEN0Gp92FgECX1w71C4qvZGRPDg4w/45cOqd+tv3PO7Ks
	UwnDOev9WrylYXJMRU73ahg+ZIIfTsLACo1ZFzV1ey3KdQMk+01NUfRoZLER3USzZs0G
	Bhy8xUHEzJqKrED3TG7JCnGo9NYWJO2L1C3Egfg68uuF7+ntxLzzfoihdpxSD2Xj3yho
	YYXg==
X-Gm-Message-State: AODbwcBsRFIMgpRf2Xn1N8YbJ1tTo+bhJoq4P7V9+w1tNVhPQwc6xany
	MptVqFPAgufcpuPu
X-Received: by 10.84.225.2 with SMTP id t2mr57018470plj.108.1497279557889;
	Mon, 12 Jun 2017 07:59:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:02 -0700
Message-Id: <4ea1e150cfe603bcb845a05a681063e17b840ba1.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] binutils-2.28: Update to latest on release branch
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
X-List-Received-Date: Mon, 12 Jun 2017 14:59:17 -0000

Drop patches to ChangeLog, they are in patch
header anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc     |  2 +-
 .../binutils/binutils/CVE-2017-6965.patch            | 15 ---------------
 .../binutils/binutils/CVE-2017-6966.patch            | 20 --------------------
 .../binutils/binutils/CVE-2017-6969.patch            | 14 --------------
 .../binutils/binutils/CVE-2017-6969_2.patch          | 18 ------------------
 .../binutils/binutils/CVE-2017-7209.patch            | 14 --------------
 .../binutils/binutils/CVE-2017-7210.patch            | 15 ---------------
 7 files changed, 1 insertion(+), 97 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 40b518bf7a..b37bb0e03a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "354199c7692c1bed53a2a15f0e4d531457e95f17"
+SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0003-gprof-add-uclibc-support-to-configure.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
index 1334c9444d..6697d4bc95 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
@@ -19,21 +19,6 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  binutils/readelf.c | 30 +++++++++++++++++++++++++-----
  2 files changed, 32 insertions(+), 5 deletions(-)
 
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index f21867f98c..e789a3b99b 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,3 +1,10 @@
-+2017-02-13  Nick Clifton  <nickc@redhat.com>
-+
-+	PR binutils/21137
-+	* readelf.c (target_specific_reloc_handling): Add end parameter.
-+	Check for buffer overflow before writing relocated values.
-+	(apply_relocations): Pass end to target_specific_reloc_handling.
-+
- 2017-03-02  Tristan Gingold  <gingold@adacore.com>
- 
- 	* configure: Regenerate.
 diff --git a/binutils/readelf.c b/binutils/readelf.c
 index b5f577f5a1..8cdaae3b8c 100644
 --- a/binutils/readelf.c
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
index dd58df5fbf..206e493b6e 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
@@ -22,26 +22,6 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  binutils/readelf.c | 109 +++++++++++++++++++++++++++++++++++++++++------------
  2 files changed, 94 insertions(+), 25 deletions(-)
 
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index e789a3b99b..bd63c8a0d8 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,5 +1,15 @@
- 2017-02-13  Nick Clifton  <nickc@redhat.com>
- 
-+	PR binutils/21139
-+	* readelf.c (target_specific_reloc_handling): Add num_syms
-+	parameter.  Check for symbol table overflow before accessing
-+	symbol value.  If reloc pointer is NULL, discard all saved state.
-+	(apply_relocations): Pass num_syms to target_specific_reloc_handling.
-+	Call target_specific_reloc_handling with a NULL reloc pointer
-+	after processing all of the relocs.
-+
-+2017-02-13  Nick Clifton  <nickc@redhat.com>
-+
- 	PR binutils/21137
- 	* readelf.c (target_specific_reloc_handling): Add end parameter.
- 	Check for buffer overflow before writing relocated values.
 diff --git a/binutils/readelf.c b/binutils/readelf.c
 index 8cdaae3b8c..7c158c6342 100644
 --- a/binutils/readelf.c
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
index ed5403430c..7dfa3d87c3 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
@@ -17,20 +17,6 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  binutils/readelf.c | 10 ++++++++--
  2 files changed, 14 insertions(+), 2 deletions(-)
 
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index bd63c8a0d8..1d840b42f9 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,3 +1,9 @@
-+2017-02-17  Nick Clifton  <nickc@redhat.com>
-+
-+	PR binutils/21156
-+	* readelf.c (find_section_in_set): Test for invalid section
-+	indicies.
-+
- 2017-02-13  Nick Clifton  <nickc@redhat.com>
- 
- 	PR binutils/21139
 diff --git a/binutils/readelf.c b/binutils/readelf.c
 index 7c158c6342..4960491c5c 100644
 --- a/binutils/readelf.c
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
index 59a5dec675..5409511a7c 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
@@ -21,24 +21,6 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  binutils/dwarf.c   | 34 ++++++++++++++++++++--------------
  2 files changed, 30 insertions(+), 14 deletions(-)
 
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index 1d840b42f9..53352c1801 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,3 +1,13 @@
-+2017-02-20  Nick Clifton  <nickc@redhat.com>
-+
-+	PR binutils/21156
-+	* dwarf.c (cu_tu_indexes_read): Move into...
-+	(load_cu_tu_indexes): ... here.  Change the variable into
-+	tri-state.  Change the function into boolean, returning
-+	false if the indicies could not be loaded.
-+	(find_cu_tu_set): Return NULL if the indicies could not be
-+	loaded.
-+
- 2017-02-17  Nick Clifton  <nickc@redhat.com>
- 
- 	PR binutils/21156
 diff --git a/binutils/dwarf.c b/binutils/dwarf.c
 index 0184a7ab2e..6d879c9b61 100644
 --- a/binutils/dwarf.c
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
index 2357a12836..b14441b4e3 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
@@ -16,20 +16,6 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  binutils/readelf.c | 16 ++++++++++++----
  2 files changed, 18 insertions(+), 4 deletions(-)
 
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index 53352c1801..cf92744c12 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,3 +1,9 @@
-+2017-02-13  Nick Clifton  <nickc@redhat.com>
-+
-+	PR binutils/21135
-+	* readelf.c (dump_section_as_bytes): Handle the case where
-+	uncompress_section_contents returns false.
-+
- 2017-02-20  Nick Clifton  <nickc@redhat.com>
- 
- 	PR binutils/21156
 diff --git a/binutils/readelf.c b/binutils/readelf.c
 index 4960491c5c..f0e7b080e8 100644
 --- a/binutils/readelf.c
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
index 8791792c7c..f8ad32f4f8 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
@@ -17,21 +17,6 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
  binutils/stabs.c   | 14 +++++++++++++-
  2 files changed, 20 insertions(+), 1 deletion(-)
 
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index cf92744c12..0045fbaaa6 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,3 +1,10 @@
-+2017-02-14  Nick Clifton  <nickc@redhat.com>
-+
-+	PR binutils/21157
-+	* stabs.c (parse_stab_enum_type): Check for corrupt NAME:VALUE
-+	pairs.
-+	(parse_number): Exit early if passed an empty string.
-+
- 2017-02-13  Nick Clifton  <nickc@redhat.com>
- 
- 	PR binutils/21135
 diff --git a/binutils/stabs.c b/binutils/stabs.c
 index f5c5d2d8e0..5d013cc361 100644
 --- a/binutils/stabs.c
-- 
2.13.1


