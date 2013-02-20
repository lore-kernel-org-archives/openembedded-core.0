Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1U8BLq-0005uB-0r
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 16:12:54 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 20 Feb 2013 15:56:43 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 233DF2831B8;
	Wed, 20 Feb 2013 15:56:43 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 15:56:32 +0100
Message-ID: <1361372192-12170-1-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX08.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH] linux-dtc: Make KERNEL_DEVICETREE_FLAGS configurable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 15:12:54 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>


Signed-off-by: Anders Roxell <anders.roxell@enea.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index d39f49d..ec6c375 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,6 +1,6 @@
 # Support for device tree generation
 FILES_kernel-devicetree = "/boot/devicetree*"
-KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x3000"
+KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 
 python __anonymous () {
     devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
-- 
1.7.5.4



