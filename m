Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prathap@bangubntigfx>) id 1RSjQC-0005ds-5B
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 07:01:32 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAM5rZh0022942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 23:53:37 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAM5rX3m002512
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 11:23:35 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 22 Nov 2011 11:23:33 +0530
Received: from bangubntigfx (bangubntigfx.india.ti.com [172.24.132.46])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAM5rWHE025334;
	Tue, 22 Nov 2011 11:23:33 +0530 (IST)
Received: from prathap by bangubntigfx with local (Exim 4.72)	(envelope-from
	<prathap@bangubntigfx>)	id 1RSjIS-00018m-7E;
	Tue, 22 Nov 2011 11:23:32 +0530
From: Prathap M S <msprathap@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2011 11:23:30 +0530
Message-ID: <1321941210-4344-1-git-send-email-msprathap@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH v2 1/1] kernel.bbclass: stage additional directories
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
X-List-Received-Date: Tue, 22 Nov 2011 06:01:34 -0000
Content-Type: text/plain

* The graphics SDK requires additional directories to be staged
  for compilation.

Signed-off-by: Prathap M S <msprathap@ti.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 12e0b83..b00461b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -243,7 +243,7 @@ FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 # misc is a package to contain files we need in staging
-FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel/drivers/media"
+FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel/drivers/media /kernel/drivers/video /kernel/drivers/gpu /kernel/drivers/base"
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
-- 
1.7.1



