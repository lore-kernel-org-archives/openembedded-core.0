Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id CF00277233
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:50:06 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 682781938; Tue, 02 Feb 2016 09:50:08 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQcHP-0003wp-2X; Tue, 02 Feb 2016 14:50:07 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQcHP-0002Xx-1U; Tue, 02 Feb 2016 14:50:07 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:49:46 +0000
Message-Id: <1454424587-4251-3-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/3] pciutils: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Tue, 02 Feb 2016 14:50:07 -0000

The openssl recipe currently relies on EXTRA_OEMAKE having been set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
index 794419a..33be525 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
@@ -38,7 +38,7 @@ export SBINDIR = "${sbindir}"
 export SHAREDIR = "${datadir}"
 export MANDIR = "${mandir}"
 
-EXTRA_OEMAKE += "${PCI_CONF_FLAG}"
+EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
 
 # The configure script breaks if the HOST variable is set
 HOST[unexport] = "1"
-- 
2.1.4


