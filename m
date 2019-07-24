Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 965A07DE4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 02:39:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6O2ceTv010381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 19:38:56 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 23 Jul 2019 19:38:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2019 10:38:33 +0800
Message-ID: <20190724023833.13718-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 02:39:05 -0000
Content-Type: text/plain

Add a small busybox based container image.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/recipes-core/images/container-image-busybox.bb

diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
new file mode 100644
index 0000000000..a4d63b0eea
--- /dev/null
+++ b/meta/recipes-core/images/container-image-busybox.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A small busybox based container image."
+LICENSE = "MIT"
+
+IMAGE_INSTALL = "busybox"
+IMAGE_LINGUAS = ""
+IMAGE_FSTYPES = "container"
+
+inherit core-image
-- 
2.17.1


