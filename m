Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 962FD65E28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 09:38:24 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so2871166wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FkTYk+//DWULCOgtg4bUreACNJFUqyOii7SImgqyt0I=;
	b=Mi8B0PdKW+Y6CdV5yl0vWg37UQSYVJnzFUo3fBRFjzc0K5dhno4mNisiR5Pkh2tPzE
	L2YHs7DO1gTpU972RkeFepAPxjxxKq2eh12l2spBktd4yWottnIAtWxIdRnu9Be5lhwi
	cvqkH1hm26R7WH6SaOQRnIunQaVTZqlmXRfMeMGqPankXDopAf1p+6VeifrbpQ53hs4q
	AAQ5eXXiL5Ab2XcaNSrcZl7zXKqE6gB0UGzFdyYR0ULqYlOrjOCTuW75AHVOD9FDIYQ7
	DS/IAyHkX4Q/L2HaI+g4LyI6jKN2ODb4MFcCsHloXZK/xgMfC9ARsGVmaXjGnfIZQFtX
	8kQw==
X-Received: by 10.180.106.99 with SMTP id gt3mr11631990wib.1.1407663505029;
	Sun, 10 Aug 2014 02:38:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fe5sm30812932wjc.12.2014.08.10.02.38.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 02:38:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 11:38:55 +0200
Message-Id: <1407663535-6484-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407663535-6484-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407663535-6484-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 2/2] perf: fix indentation
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
X-List-Received-Date: Sun, 10 Aug 2014 09:38:26 -0000

* multiline variables should use spaces not tabs for indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 54 ++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9776943..71e2b28 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -22,13 +22,13 @@ TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
 SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
 
 DEPENDS = "virtual/kernel \
-           virtual/${MLPREFIX}libc \
-           ${MLPREFIX}elfutils \
-           ${MLPREFIX}binutils \
-           ${TUI_DEPENDS} \
-           ${SCRIPTING_DEPENDS} \
-           bison flex \
-          "
+    virtual/${MLPREFIX}libc \
+    ${MLPREFIX}elfutils \
+    ${MLPREFIX}binutils \
+    ${TUI_DEPENDS} \
+    ${SCRIPTING_DEPENDS} \
+    bison flex \
+"
 
 PROVIDES = "virtual/perf"
 
@@ -68,28 +68,28 @@ TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 # supported kernel.
 LDFLAGS="-ldl -lutil"
 
-EXTRA_OEMAKE = \
-		'-C ${S}/tools/perf \
-		O=${B} \
-		CROSS_COMPILE=${TARGET_PREFIX} \
-		ARCH=${ARCH} \
-		CC="${CC}" \
-		AR="${AR}" \
-		perfexecdir=${libexecdir} \
-		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
-		'
+EXTRA_OEMAKE = '\
+    -C ${S}/tools/perf \
+    O=${B} \
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+    perfexecdir=${libexecdir} \
+    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
+'
 
 EXTRA_OEMAKE += "\
-	'prefix=${prefix}' \
-	'bindir=${bindir}' \
-	'sharedir=${datadir}' \
-	'sysconfdir=${sysconfdir}' \
-	'perfexecdir=${libexecdir}/perf-core' \
-	\
-	'ETC_PERFCONFIG=${@os.path.relpath(sysconfdir, prefix)}' \
-	'sharedir=${@os.path.relpath(datadir, prefix)}' \
-	'mandir=${@os.path.relpath(mandir, prefix)}' \
-	'infodir=${@os.path.relpath(infodir, prefix)}' \
+    'prefix=${prefix}' \
+    'bindir=${bindir}' \
+    'sharedir=${datadir}' \
+    'sysconfdir=${sysconfdir}' \
+    'perfexecdir=${libexecdir}/perf-core' \
+    \
+    'ETC_PERFCONFIG=${@os.path.relpath(sysconfdir, prefix)}' \
+    'sharedir=${@os.path.relpath(datadir, prefix)}' \
+    'mandir=${@os.path.relpath(mandir, prefix)}' \
+    'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
 # PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
-- 
2.0.4


