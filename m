Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3F484710EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 18:17:33 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y0aD7-0002Jr-MG from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Dec 2014 10:17:33 -0800
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 15 Dec 2014 10:17:33 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Dec 2014 12:17:32 -0600
Message-ID: <1418667452-3430-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-tools-profile: allow lttng-modules for ARM
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
X-List-Received-Date: Mon, 15 Dec 2014 18:17:35 -0000
Content-Type: text/plain

Per commit f6587be6cd3dc864143b1c0be0bb8179a61dc835 (lttng-modules:
re-enable ARM builds) lttng-modules is fine for ARM now.  Without this
additional change, tools-profile won't bring in lttng-modules when
targeting ARM.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 41d2548b70ee..39a88134a316 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -53,7 +53,6 @@ LTTNGTOOLS_aarch64 = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_aarch64 = ""
-LTTNGMODULES_arm = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE_aarch64 = ""
-- 
1.9.3


