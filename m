Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7F660424
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 11:19:22 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so814598wes.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UcopPCwftqixM/liChc1lDEcGurKM8FFseBE36ZyoXE=;
	b=UO+zFCg0YM0CYVKjJgFy2sJnRJbM9S9tNIBR8RtxyKJBxLx3vGv1Td7UvjEeyPDBj3
	QYpuOONFDN3VUryewEq+bkdJhuXolH0ulHmCQHsfP3jXTgojabnK0vyd65hAItzFe2R3
	kmQ2E0H6C2njfpseOTexU1nO+21o9reHjHRtIUjEMEgXwbcckpDvjyML7RbJxwN06Foi
	MlrMI6ZyraVpZRrU7g9X1MTbfVJd8aHHoHti+haY6K3BUKv38KQyLtpK5gIq1fkIvnH1
	WnxNa5+YbxFkvT1Z6Xv9Slw8APgIzhK1EkYvZGo+c6LgEvzga64PFLhWiq8BaB536XYt
	QA5Q==
X-Received: by 10.194.59.42 with SMTP id w10mr4808462wjq.15.1407237559274;
	Tue, 05 Aug 2014 04:19:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm6797326wib.12.2014.08.05.04.19.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Aug 2014 04:19:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 13:19:40 +0200
Message-Id: <1407237580-701-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407237580-701-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407237580-701-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] perf: fix indentation
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
X-List-Received-Date: Tue, 05 Aug 2014 11:19:25 -0000

* multiline variables should use spaces not tabs for indentation
* do_configure is also using wrong indentation, but I'm not fixing
  this one (still hoping that we'll eventually fix styleguide to
  use 4 spaces everywhere)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 54 ++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ea8599a..bfd210c 100644
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
 
 PARALLEL_MAKE = ""
-- 
2.0.4


