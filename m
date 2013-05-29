Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E0C2F6A62F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:03:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TF3sWY014336
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:03:54 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 08:03:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 10:09:49 -0500
Message-ID: <1369840203-21898-8-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/21] dbus-glib: use BPN instead of PN
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
X-List-Received-Date: Wed, 29 May 2013 15:03:52 -0000
Content-Type: text/plain

From: Jesse Zhang <sen.zhang@windriver.com>

Fix warnings in multilib build:

  WARNING: For recipe lib32-dbus-glib, the following files/directories were installed but not shipped in any package:
  WARNING:   /usr/share/dbus-glib
  WARNING:   /usr/share/dbus-glib/tests

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dbus/dbus-glib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 973c995..6c60d9e 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -36,9 +36,9 @@ FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
 RDEPENDS_${PN}-tests += "dbus-x11"
-FILES_${PN}-tests = "${datadir}/${PN}/tests"
-FILES_${PN}-tests-dbg = "${datadir}/${PN}/tests/.debug/* \
-                         ${datadir}/${PN}/tests/core/.debug/* \
-                         ${datadir}/${PN}/tests/interfaces/.debug/*"
+FILES_${PN}-tests = "${datadir}/${BPN}/tests"
+FILES_${PN}-tests-dbg = "${datadir}/${BPN}/tests/.debug/* \
+                         ${datadir}/${BPN}/tests/core/.debug/* \
+                         ${datadir}/${BPN}/tests/interfaces/.debug/*"
 
 BBCLASSEXTEND = "native"
-- 
1.8.1.2.545.g2f19ada


