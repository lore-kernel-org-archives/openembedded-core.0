Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 030A271C0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 18:51:54 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cTCNn-0006RC-Nx from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2017 10:51:55 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 16 Jan 2017 10:51:53 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2017 12:51:42 -0600
Message-ID: <1484592706-28177-2-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484592706-28177-1-git-send-email-nathan_lynch@mentor.com>
References: <1484592706-28177-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH v2 1/5] lttng-ust: don't exclude manual pages from build
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
X-List-Received-Date: Mon, 16 Jan 2017 18:51:56 -0000
Content-Type: text/plain

Adding "manpages" to PACKAGECONFIG results in a lttng-ust-doc package
with no manpages.  Fix the patch we carry to only exclude the examples
directory, which seems to have been its original intent anyway.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
index caf0b8bcf782..0f18c5d9f1b3 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
@@ -12,7 +12,7 @@ Index: doc/Makefile.am
 +++ b/doc/Makefile.am
 @@ -1,4 +1,4 @@
 -SUBDIRS = . man examples
-+SUBDIRS = .
++SUBDIRS = . man
  
  dist_man_MANS = man/lttng-gen-tp.1 \
  	man/lttng-ust.3 \
-- 
2.7.4


