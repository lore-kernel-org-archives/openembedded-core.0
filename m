Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RgB1C-0000Eh-BJ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 09:07:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBT71gD3008356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 23:01:42 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 28 Dec 2011 23:01:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <mark.hatle@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Dec 2011 15:00:13 +0800
Message-ID: <b77e4e9e630e0ae691e6f524c356745e0c42ffb2.1325141432.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1325141432.git.liezhi.yang@windriver.com>
References: <cover.1325141432.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Incremental image generation(Add config sample)
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
X-List-Received-Date: Thu, 29 Dec 2011 08:07:18 -0000
Content-Type: text/plain

Add the config sample for incremental image generation to
meta-yocto/conf/local.conf.sample

[YOCTO #1651]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-yocto/conf/local.conf.sample |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index ca8636c..e33ffd9 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -222,3 +222,10 @@ PATCHRESOLVE = "noop"
 # track the version of this file when it was generated. This can safely be ignored if
 # this doesn't mean anything to you.
 CONF_VERSION = "1"
+
+# Incremental image generation(only for rpm based rootfs currently), the rootfs
+# would be totally removed and re-created in the second generation by default,
+# but with INC_IMAGE_GEN = "1", the rootfs would be kept, and will do
+# update(remove/add some pkgs) on it.
+# NOTE: This is not suggested when you want to create a productive rootfs
+#INC_IMAGE_GEN = "1"
-- 
1.7.4.1



