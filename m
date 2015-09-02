Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4881B7700E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 14:56:01 +0000 (UTC)
Received: from iapetus.enea.se (172.16.141.154) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Sep 2015
	16:55:59 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Sep 2015 16:55:59 +0200
Message-ID: <1441205759-14513-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] qemu: enable alsa only if in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 02 Sep 2015 14:56:02 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d7457f2..dc7b628 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -94,7 +94,8 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-	fdt sdl alsa \
+	fdt sdl \
+	${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen', '', d)} \
 	"
 PACKAGECONFIG_class-native ??= "fdt alsa uuid"
-- 
2.1.0


