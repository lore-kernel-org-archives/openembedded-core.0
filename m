Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFj1-0002Rm-A3
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 10:54:33 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 92122D20D2;
	Wed, 20 Mar 2013 10:37:40 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:37:20 +0100
Message-Id: <1363772243-370-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/6] busybox: disable MOUNT_NFS option - not needed on 2.6.23+ kernels
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
X-List-Received-Date: Wed, 20 Mar 2013 09:54:40 -0000
X-List-Received-Date: Wed, 20 Mar 2013 09:54:40 -0000

Without this option we do not need RPC support from glibc.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/busybox/busybox-1.20.2/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/defconfig b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
index bdfdadf..cfcbcae 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
@@ -583,7 +583,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
 # CONFIG_FEATURE_MOUNT_LABEL is not set
-CONFIG_FEATURE_MOUNT_NFS=y
+# CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
-- 
1.8.1.2



