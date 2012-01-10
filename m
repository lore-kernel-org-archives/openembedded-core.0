Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RkZEx-0003X7-SL
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:47:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0AAe9HS011786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 02:40:10 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jan 2012 02:40:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 18:38:26 +0800
Message-ID: <dec466d28fe1bacd3b1ddbaaef72b0b3d6eea382.1326191431.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1326191431.git.liezhi.yang@windriver.com>
References: <cover.1326191431.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 ] V3 Incremental rpm image generation(Add config sample)
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
X-List-Received-Date: Tue, 10 Jan 2012 10:47:40 -0000
Content-Type: text/plain

Add the config sample for incremental image generation to
meta-yocto/conf/local.conf.sample.extended

[YOCTO #1651]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-yocto/conf/local.conf.sample.extended |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index 7c26572..b901c5b 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -123,3 +123,10 @@
 # The following is a list of classes to import to use in the generation of images
 # currently an example class is image_types_uboot
 # IMAGE_CLASSES = " image_types_uboot"
+
+# Incremental rpm image generation, the rootfs would be totally removed
+# and re-created in the second generation by default, but with
+# INC_RPM_IMAGE_GEN = "1", the rpm based rootfs would be kept, and will
+# do update(remove/add some pkgs) on it.  NOTE: This is not suggested
+# when you want to create a productive rootfs
+#INC_RPM_IMAGE_GEN = "1"
-- 
1.7.4.1



