Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8006D73189
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:39:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8I7dXL0006826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:39:34 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:39:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 00:39:25 -0700
Message-ID: <5a8b04b3204c6002eb7ea45d85391f27607434cc.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474183984.git.liezhi.yang@windriver.com>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/8] runqemu: clarify an INFO message
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
X-List-Received-Date: Sun, 18 Sep 2016 07:39:33 -0000
Content-Type: text/plain

From: Joshua Lock <joshua.g.lock@intel.com>

Make it clearer that we are looking for a file which ends with
qemuboot.conf

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c71a47c..6aaae44 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -205,7 +205,7 @@ class BaseConfig(object):
     def is_deploy_dir_image(self, p):
         if os.path.isdir(p):
             if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
-                logger.info("Can't find required qemuboot.conf in %s" % p)
+                logger.info("Can't find required *.qemuboot.conf in %s" % p)
                 return False
             if not re.search('-image-', '\n'.join(os.listdir(p))):
                 logger.info("Can't find *-image-* in %s" % p)
-- 
2.9.0


