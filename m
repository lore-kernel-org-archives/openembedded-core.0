Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id F046A77009
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 14:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id E6A613C88699
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 15:58:22 +0100
Message-Id: <078951da0993bd675e4f6d92dfeecd45dacee8d7.1441291646.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 7/9] pcmciautils: handle udev dir being 2 levels below /
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
X-List-Received-Date: Thu, 03 Sep 2015 14:58:51 -0000

When building with a merged /usr dir the udev directory
lives at /usr/lib/udev - update the FILES pattern to also
pick up udev files installed two levels below the / to
ensure a merged /usr works.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 24ceed8..857bd07 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -9,5 +9,5 @@ SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0
 
 PR = "r1"
 
-FILES_${PN}-dbg += "*/udev/.debug"
-FILES_${PN} += "*/udev"
+FILES_${PN}-dbg += "*/udev/.debug */*/udev/.debug"
+FILES_${PN} += "*/udev */*/udev"
-- 
2.1.4


