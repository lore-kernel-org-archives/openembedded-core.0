Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E264477D0A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 16:07:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p17so5649860wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IHoSGwev2ZrnCM4KPZLeQvosrhFYDumxIrbP5anplbw=;
	b=Jct0CcTqi2fgzN7u+gMcUD05O96ByjPDVun91ber4u5yqD98dm6KuVpvofESM/c2R8
	SNMA1tnCpNi7aaCPjmeCjgNKtZcvEf9K9aCgqZHxGpG27CV23llZ5lrHOXsk0zLVhDEv
	HnKV/U648w5gk5o3GCwnKDXSmnMBt0/4mmVSInTW4ppAa1Y+NTYItSGaAe73gPt4t3Kv
	QpWce7S0rL9WTx/9SH8x+Sbr9u792rpuohm3Wfp22Zagh1HUQ7mTdCA+uzzV+HLWRrdO
	nVh54UbkpuuM6xQL+g5F2AdSnpOLQTE370dpqR1RIpIKOdgkvhNnSg+0S0ontvdOwU5s
	lcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IHoSGwev2ZrnCM4KPZLeQvosrhFYDumxIrbP5anplbw=;
	b=pfzei2/TG8M8VgWbf+NqTiTtwu6F4jBfk0qzzaXOgLt8h0cCV/04/giZF0jP/ycnrQ
	HOBSPGZbrY1GM/WPO8srr+IGXuOlYKJSs7nTLMPch1DOtbuCLezDWE8cJ8hZuZd21izw
	CvGxXmkYKaR8XJkJVtLE7PkzeX1eAOD5rBd8u5aPCfabYg1NIzQ25cQKAtefSuXckoiI
	XeV7DhPH4BxREd5TkkwUssE88VgZ86bDFUjVzKNEjgTBPkN+ZsDuqzxWwbxuJbft6G2q
	H+scbkHIJhSkOfMyXWhBhwkdThXKdBZ2dnxShUNBTyuFfa5g9HTeo4R68WPwyDv8I+HQ
	F4uw==
X-Gm-Message-State: AHPjjUjgTPXlqeHaIonfnlyi9YTnoHuTfWqRK/yH9GMKNJH4HhsJuD3v
	3AOP/f71cysGS9U7
X-Google-Smtp-Source: ADKCNb5Z9TASNxeM8FayH8a0CtMB9H6j7CnsBdyd114iTT4AvCKpRC49NJr4E25dZ40X+BlggWGoEw==
X-Received: by 10.28.55.203 with SMTP id e194mr182178wma.142.1504714027246;
	Wed, 06 Sep 2017 09:07:07 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id w82sm3163833wme.5.2017.09.06.09.07.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 09:07:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 18:09:07 +0200
Message-Id: <2a340682c73a95658fda5e5e0b781dffdabb4f07.1504713837.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1504713837.git.Martin.Jansa@gmail.com>
References: <cover.1504713837.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 3/3] nspr: Fix build error due to missing stdint.h> include
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
X-List-Received-Date: Wed, 06 Sep 2017 16:07:07 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch | 30 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.13.1.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch

diff --git a/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch b/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
new file mode 100644
index 0000000000..b3bdd8e08d
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
@@ -0,0 +1,30 @@
+From f7551ec58e2f0a892295e0c2a650083101e12c54 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 May 2017 13:24:26 -0700
+Subject: [PATCH] include stdint.h for SSIZE_MAX and SIZE_MAX definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ pr/tests/prfz.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/pr/tests/prfz.c b/pr/tests/prfz.c
+index 0c5a432..9c17590 100644
+--- a/pr/tests/prfz.c
++++ b/pr/tests/prfz.c
+@@ -10,7 +10,9 @@
+ #include <sys/types.h>
+ #include <limits.h>
+ #include <string.h>
+-
++#ifdef XP_UNIX
++#include <stdint.h>
++#endif
+ int
+ main(int argc, char **argv)
+ {
+-- 
+2.13.0
+
diff --git a/meta/recipes-support/nspr/nspr_4.13.1.bb b/meta/recipes-support/nspr/nspr_4.13.1.bb
index 27c22379f6..63ebecf729 100644
--- a/meta/recipes-support/nspr/nspr_4.13.1.bb
+++ b/meta/recipes-support/nspr/nspr_4.13.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://fix-build-on-x86_64.patch \
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
+           file://0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch \
            file://nspr.pc.in \
 "
 
-- 
2.14.1


