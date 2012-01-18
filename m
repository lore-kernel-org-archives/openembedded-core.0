Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RnduD-00022X-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 23:22:57 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp206.alice.it (8.6.023.02)
	id 4ECA607908246A14; Wed, 18 Jan 2012 23:15:18 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jan 2012 23:15:11 +0100
Message-Id: <1326924911-3127-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
References: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
Subject: [PATCH v2] xinput: add utility for configuring and testing XInput devices.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 22:22:57 -0000

* from meta-openembedded with minor editings
* (fields reordering like other recipes in xorg-app)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
new file mode 100644
index 0000000..8f17e9a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
@@ -0,0 +1,14 @@
+require xorg-app-common.inc
+
+SUMMARY = "Runtime configuration and test of XInput devices"
+
+DESCRIPTION = "Xinput is an utility for configuring and testing XInput devices"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
+
+DEPENDS += " libxi"
+
+PR = "r7"
+
+SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
+SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
-- 
1.7.3.4



