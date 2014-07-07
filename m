Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 785B76FF24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:34:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s679Y1PH021725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 02:34:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 02:34:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Jul 2014 02:34:00 -0700
Message-ID: <cbdb4fe250719b1b0f3eaa676b4e5e06923f0a78.1404725000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404725000.git.liezhi.yang@windriver.com>
References: <cover.1404725000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] local.conf.sample.extended: add KERNEL_IMAGE_MAXSIZE and IMAGE_ROOTFS_MAXSIZE
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
X-List-Received-Date: Mon, 07 Jul 2014 09:34:00 -0000
Content-Type: text/plain

[YOCTO #2610]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/local.conf.sample.extended |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index b156319..4bd33a2 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -331,3 +331,11 @@
 # feed layout is used where package files are placed in <outdir>/<arch>/.
 #
 #IPK_HIERARCHICAL_FEED = "1"
+
+# Checks the kernel image size against KERNEL_IMAGE_MAXSIZE (The unit is
+# Kbytes)
+#KERNEL_IMAGE_MAXSIZE = "8192"
+#
+# Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (The unit is
+# Kbytes)
+#IMAGE_ROOTFS_MAXSIZE = "65536"
-- 
1.7.9.5


