Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2716067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 17:50:45 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1bQeb0-0003qg-40 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2016 10:50:46 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 22 Jul 2016 10:50:45 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2016 12:50:43 -0500
Message-ID: <1469209843-27609-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] babeltrace: remove unnecessary SRCREV
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
X-List-Received-Date: Fri, 22 Jul 2016 17:50:48 -0000
Content-Type: text/plain

Since this recipe doesn't use a SCM the SRCREV is unneeded (and
inaccurate).

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.4.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
index 854e278defb1..0fadeb0d7938 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
@@ -10,8 +10,6 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 inherit autotools pkgconfig
 
-SRCREV = "c551f7a1ed635138b083b4e9e0c445ef63d0a562"
-
 SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 "
 
-- 
2.5.5


