Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D823860DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 11:46:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2013 03:42:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="454807506"
Received: from williams-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.12])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 03:46:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 11:46:35 +0000
Message-Id: <1387453595-20914-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dora][PATCH] libsoup-2.4: add intltool-native to DEPENDS
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
X-List-Received-Date: Thu, 19 Dec 2013 11:46:38 -0000

The configure script looks for this; most of the time dependency chains
ensure this is present but we need to be explicit or failures can
occur.

Reported by Nicolas Dechesne <nicolas.dechesne@linaro.org>

(From OE-Core master rev: 22e45ed7d74ceb4a719e7b5889400c20ed4a0783)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
index ef8d439..1614a3d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3"
+DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native"
 
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
 # by default but let it be easily disabled.
-- 
1.8.1.2


