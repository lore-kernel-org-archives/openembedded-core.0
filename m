Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 16C5779ACE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 14:29:36 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9AETb88027198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 16:29:37 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.5.162])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9AETbQp002582;
	Wed, 10 Oct 2018 16:29:37 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id C92E7102771B;
	Wed, 10 Oct 2018 16:29:36 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 16:28:38 +0200
Message-Id: <20181010142838.18869-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libproxy: disable python2 and python3 support
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
X-List-Received-Date: Wed, 10 Oct 2018 14:29:37 -0000

The option WITH_PYTHON got replaced by
WITH_PYTHON2 and WITH_PYTHON3.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 991c9d8320..4633ca5781 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -26,7 +26,8 @@ EXTRA_OECMAKE += " \
     -DWITH_MOZJS=no \
     -DWITH_NM=no \
     -DWITH_PERL=no \
-    -DWITH_PYTHON=no \
+    -DWITH_PYTHON2=no \
+    -DWITH_PYTHON3=no \
     -DWITH_WEBKIT=no \
     -DLIB_INSTALL_DIR=${libdir} \
     -DLIBEXEC_INSTALL_DIR=${libexecdir} \
-- 
2.11.0


