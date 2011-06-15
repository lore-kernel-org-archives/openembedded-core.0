Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QWhRJ-0004BT-Fx
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 06:10:49 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5F47H10011907;
	Tue, 14 Jun 2011 21:07:19 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Jun 2011 00:05:34 -0400
Message-Id: <3adfb2c1f7dff112cbd24e30b7d90aea619ca455.1308110508.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308110508.git.bruce.ashfield@windriver.com>
References: <cover.1308110508.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1308110508.git.bruce.ashfield@windriver.com>
References: <cover.1308110508.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update meta branch SRCREV
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
X-List-Received-Date: Wed, 15 Jun 2011 04:10:49 -0000

Updating the meta SRCREV to fix a bad commit which resulted in the
tree being dirty after checkpoint, and hence a failure during the
patch phase. The meta commits never modify code outside the 'meta'
directory tree, a rule that was broken with this bad commit.

Without this fix, you may see an error like:

| [INFO] doing kernel configme
| [INFO] Finding user(s) of branch "yocto/standard/fsl-mpc8315e-rdb"
| [INFO] Branch meta-temp used by fsl-mpc8315e-rdb-standard.scc
| [INFO] collecting configs in ./meta/meta-series
| [INFO] checking out yocto/standard/fsl-mpc8315e-rdb
| error: Your local changes to the following files would be overwritten by checkout:
| 	arch/powerpc/boot/dts/mpc8315erdb.dts
| Please, commit your changes or stash them before you can switch branches.
| Aborting
| [ERROR] Checkout of yocto/standard/fsl-mpc8315e-rdb failed
| Error running the meta series for collecting config data
| config of meta-temp (fsl-mpc8315e-rdb-standard.scc) failed

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 1d43e1e..f6abc9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -20,7 +20,7 @@ SRCREV_machine_qemuppc = "704497b3a48c0882078f6167277d65d932292535"
 SRCREV_machine_qemux86 = "c1a74a7872fdd1152265087aa7e59b96a8f2f42a"
 SRCREV_machine_qemux86-64 = "1950ea205407d8950475a37404173572d55fd27f"
 SRCREV_machine = "697d84759be192403a8a87ab269196c67a0c2c88"
-SRCREV_meta = "f1dc3722d45cdcc92c84ebfecf4ce616d2efed26"
+SRCREV_meta = "46a1be20b01e50d5d0646e5622e9dd06433238c2"
 
 PR = "r18"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



