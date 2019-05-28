Return-Path: <oliver.staebler@bytesatwork.ch>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 May 2019 08:40:18 UTC
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id B981D7DFC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 08:40:18 +0000 (UTC)
Received: from stanley.bytesatwork.ch (162.40.150.83.ftth.as8758.net
	[83.150.40.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: oliver)
	by bytesatwork.ch (Postfix) with ESMTPSA id D5D8E101C032D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 10:35:12 +0200 (CEST)
From: =?UTF-8?q?Oliver=20St=C3=A4bler?= <oliver.staebler@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 10:36:30 +0200
Message-Id: <20190528083630.22641-1-oliver.staebler@bytesatwork.ch>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-full-cmdline: Make nfs-utils/rpcbind optional
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
X-List-Received-Date: Tue, 28 May 2019 08:40:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consider DISTRO_FEATURES for nfs-utils and rpcbind.
This is to prevent the following warning while booting:
NFS daemon support not enabled in kernel

Signed-off-by: Oliver Stäbler <oliver.staebler@bytesatwork.ch>
---
 .../packagegroups/packagegroup-core-full-cmdline.bb            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index ec67f8d123..d38f545e06 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -135,6 +135,5 @@ RDEPENDS_packagegroup-core-full-cmdline-sys-services = "\
     at \
     cronie \
     logrotate \
-    nfs-utils \
-    rpcbind \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'nfs', 'nfs-utils rpcbind', '', d)} \
     "
-- 
2.21.0


