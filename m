Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RnZD8-0005R0-EC
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 18:22:10 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0IHERoK002582;
	Wed, 18 Jan 2012 09:14:28 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Jan 2012 12:13:22 -0500
Message-Id: <c98b47892e03284d4cd8954f7f19389aec83d377.1326906635.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326906635.git.bruce.ashfield@windriver.com>
References: <cover.1326906635.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326906635.git.bruce.ashfield@windriver.com>
References: <cover.1326906635.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: restore WORKDIR as a patch source directory
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
X-List-Received-Date: Wed, 18 Jan 2012 17:22:10 -0000

In the switch to using src_patches and using patches in their
source directory, the scanning of WORKDIR migrated items like
config fragments was dropped. Adding WORKDIR back as a patch
directory restores the old functionality.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1b73e6e..7fdefcf 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -92,6 +92,8 @@ do_patch() {
 		fi
 	done
 
+	patch_dirs="${patch_dirs} ${WORKDIR}"
+
 	# add any explicitly referenced features onto the end of the feature
 	# list that is passed to the kernel build scripts.
 	if [ -n "${KERNEL_FEATURES}" ]; then
-- 
1.7.0.4



