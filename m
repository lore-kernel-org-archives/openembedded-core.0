Return-Path: <Bruce.Ashfield@windriver.com>
X-Greylist: delayed 3490 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 15:08:25 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC0E765F28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:08:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAFNh016787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:15 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:08 -0400
Message-ID: <09e275e174b670b511ee001ea7ef91077a0781df.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399297986.git.bruce.ashfield@windriver.com>
References: <cover.1399297986.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto-custom: provide defconfig guidance
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
X-List-Received-Date: Mon, 05 May 2014 15:08:25 -0000
Content-Type: text/plain

As reported by Andrea, defconfigs created with savedefconfig should specify
their expansion mode as "--alldefconfig' for custom yocto recipes. To ensure
that this is documented, we can add a comment in the skeleton recipe.

Reported-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index c3291064bb15..b1a0784c1b7d 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -32,6 +32,16 @@
 #   patches: patches can be merged into to the source git tree itself,
 #            added via the SRC_URI, or controlled via a BSP
 #            configuration.
+#
+#   defconfig: When a defconfig is provided, the linux-yocto configuration
+#              uses the filename as a trigger to use a 'allnoconfig' baseline
+#              before merging the defconfig into the build. 
+#
+#              If the defconfig file was created with make_savedefconfig, 
+#              not all options are specified, and should be restored with their
+#              defaults, not set to 'n'. To properly expand a defconfig like
+#              this, specify: KCONFIG_MODE="--alldefconfig" in the kernel
+#              recipe.
 #   
 #   example configuration addition:
 #            SRC_URI += "file://smp.cfg"
-- 
1.8.1.2


