Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SlZcO-0003Ot-L5
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 07:56:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q625jF79027726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2012 22:45:15 -0700 (PDT)
Received: from yow-pgortmak-d2.corp.ad.wrs.com (128.224.146.165) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 1 Jul 2012 22:45:15 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 01:44:45 -0400
Message-ID: <1341207885-9463-4-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.7.9.6
In-Reply-To: <1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/3] u-boot: do not clobber PARALLEL_MAKE setting
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
X-List-Received-Date: Mon, 02 Jul 2012 05:56:17 -0000
Content-Type: text/plain

The u-boot tree is fully capable of parallel builds, so this
setting should not exist as a blanket setting for all of the
recipes.  Going forward, if there is a parallelism issue
in u-boot, it needs to be reported and fixed there, and not
with the "make -j1" band-aid approach.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3226bd4..3df7418 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,8 +5,6 @@ PROVIDES = "virtual/bootloader"
 
 inherit deploy
 
-PARALLEL_MAKE=""
-
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 python () {
-- 
1.7.9.6



