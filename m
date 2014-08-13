Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0680617B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 58AB6180EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id f4ehFRCWRqRZ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id EB777180DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D4DDF1467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id C7F511464
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id C582634049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHkbMa003152
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:46:37 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHkbAN003151
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:46:37 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:46:35 +0200
Message-Id: <3b456484fd0f8c0b6567fd8fd5a605809fd81637.1407951966.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951966.git.pkj@axis.com>
References: <cover.1407951966.git.pkj@axis.com>
In-Reply-To: <cover.1407951966.git.pkj@axis.com>
References: <cover.1407951966.git.pkj@axis.com>
Subject: [PATCH 1/2] gdb: Add a dependency on zlib
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
X-List-Received-Date: Wed, 13 Aug 2014 17:46:44 -0000

This solves the following warning:

WARNING: QA Issue: gdb rdepends on zlib, but it isn't a build
dependency? [build-deps]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index b4d4880..599b405 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE = "GPLv3+"
 SECTION = "devel"
-DEPENDS = "expat ncurses readline ${LTTNGUST}"
+DEPENDS = "expat zlib ncurses readline ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
-- 
1.9.0


