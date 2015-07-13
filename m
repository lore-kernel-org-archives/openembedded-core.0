Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9268739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:02:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA2jnK005669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:02:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:02:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:02:42 -0700
Message-ID: <9c2716dc9b8c738424369de8c9022beaf992cac6.1436781736.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781736.git.liezhi.yang@windriver.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] dbus-ptest: set INSANE_SKIP for build-deps
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
X-List-Received-Date: Mon, 13 Jul 2015 10:02:45 -0000
Content-Type: text/plain

Skip the warning for dbus-ptest:
dbus-1.8.18: dbus-ptest rdepends on dbus-test-ptest, but it isn't a build dependency? [build-deps]

We add dbus-test to dbus' DEPENDS to fix the problem usually, but
dbus-test DEPENDS on dbus, so we can't do that, use INSANE_SKIP to fix
the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dbus/dbus.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 01066cb..3971081 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -166,3 +166,5 @@ do_install_class-nativesdk() {
 	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
+
+INSANE_SKIP_${PN}-ptest += "build-deps"
-- 
1.7.9.5


