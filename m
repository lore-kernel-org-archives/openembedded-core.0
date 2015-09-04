Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id F0F6D77051
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 8A6533C886A5
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:59:43 +0100
Message-Id: <c4c17008bd661909a3edf88ba52a61b93f7b42ff.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 6/9] bluez: handle udev dir being 2 levels below /
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
X-List-Received-Date: Fri, 04 Sep 2015 15:00:09 -0000

When building with a merged /usr dir the udev directory
lives at /usr/lib/udev - update the FILES pattern to also
pick up udev files installed two levels below the / to
ensure a merged /usr works.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 0fe5be5..039c443 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -95,6 +95,7 @@ FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
   */udev/.debug \
+  */*/udev/.debug \
   "
 
 RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
-- 
2.1.4


