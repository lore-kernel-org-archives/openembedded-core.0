Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5D38960DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 11:42:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2013 03:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="452572671"
Received: from williams-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.12])
	by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2013 03:41:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 11:41:18 +0000
Message-Id: <1387453278-20568-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH] libsoup-2.4: add intltool-native to DEPENDS
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
X-List-Received-Date: Thu, 19 Dec 2013 11:42:03 -0000

The configure script looks for this; most of the time dependency chains
ensure this is present but we need to be explicit or failures can
occur.

Reported by Nicolas Dechesne <nicolas.dechesne@linaro.org>

(From OE-Core master rev: 22e45ed7d74ceb4a719e7b5889400c20ed4a0783)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
index 53807af..aa4bbce 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
@@ -9,7 +9,7 @@ PR = "r1"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy"
+DEPENDS = "glib-2.0 gnutls libxml2 libproxy intltool-native"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)}"
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,libgnome-keyring sqlite3"
-- 
1.8.1.2


