Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8D64A71C72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:02 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 71CBDB87370; Thu,  8 Dec 2016 22:47:57 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:28 +0100
Message-Id: <1481233677-27298-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 04/33] apt-native: Use option --force-script-chrootless for rootfs
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:05 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/files/apt.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index 0335135..9ad61cc 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -39,4 +39,4 @@ APT
   };
 };
 
-DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
+DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig";"--force-script-chrootless"};
-- 
2.7.4


