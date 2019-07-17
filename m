Return-Path: <adrian.ratiu@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0E679C7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 07:48:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id 2AB1728B2B1
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 10:48:36 +0300
Message-Id: <20190717074836.27002-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] cogl-1.0.inc: set RDEPENDS_${PN}-dev = ""
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
X-List-Received-Date: Wed, 17 Jul 2019 07:48:27 -0000
Content-Transfer-Encoding: 8bit

${PN}-dev by default depends on ${PN} but in this case ${PN} is empty
by design (FILES_${PN} = "") and is not created, leading to
installation dependency errors like the following:

Collected errors:
 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - nothing provides cogl-1.0 = 1.22.2-r0 needed by cogl-1.0-dev-1.22.2-r0.armv7at2hf-neon-imx
 *
 * Solution 1:
 *   - do not ask to install a package providing cogl-1.0-dev

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 3e392fa5ec..a388023a03 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -75,4 +75,6 @@ RPROVIDES_libcogl = "cogl-1.0"
 RCONFLICTS_libcogl = "cogl-1.0"
 RREPLACES_libcogl = "cogl-1.0"
 
+RDEPENDS_${PN}-dev = ""
+
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.22.0


