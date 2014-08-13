Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 34B6770BCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 2B2FA2E42E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0c1jW9P2pMC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 438102E434
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2D7711463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 206351467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1DBF03E048
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHd8qB029933
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHd8CW029932
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:39:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:39:04 +0200
Message-Id: <a56064e4cc9ebed54d600ffd3f8e18a8cb9174d6.1407951483.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951483.git.pkj@axis.com>
References: <cover.1407951483.git.pkj@axis.com>
In-Reply-To: <cover.1407951483.git.pkj@axis.com>
References: <cover.1407951483.git.pkj@axis.com>
Subject: [PATCH 3/3] glib-networking: Inherit gettext
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:12 -0000

Build fails otherwise if USE_NLS is set to "no".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.38.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
index a9c1a41..b9ba2d6 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
 
 EXTRA_OECONF = "--without-gnome-proxy"
 
-inherit gnomebase
+inherit gnomebase gettext
 
 FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
-- 
1.9.0


