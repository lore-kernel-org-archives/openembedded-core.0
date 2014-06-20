Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4A84A701F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:38:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2014 08:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="447997186"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2014 08:38:41 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 18:42:18 +0300
Message-Id: <0b24f6773948eed297daa260d831bba7ab58e06f.1403277454.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
Subject: [PATCH 3/5] init-install-testfs: fix typo
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
X-List-Received-Date: Fri, 20 Jun 2014 15:38:57 -0000

_EOF marker was not used properly
(space left before end of line).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-testfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index d2cc6ac..cf290a5 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -183,7 +183,7 @@ menuentry "Linux" {
     set root=(hd0,1)
     linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
 }
-_EOF 
+_EOF
     # Add the test label
     echo -ne "\nmenuentry 'test' {\nlinux /test-kernel root=$testfs rw $rootwait quiet\n}\n" >> $GRUBCFG
 
-- 
1.9.1


