Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E287B6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 08:09:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6689LHk018718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 01:09:21 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jul 2016 01:09:20 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 16:09:06 +0800
Message-ID: <6125589935ee01e7b5dec39659932f3ef3f47374.1467792379.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1467792379.git.yi.zhao@windriver.com>
References: <cover.1467792379.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: yue.tao@windriver.com
Subject: [PATCH 1/1] randrproto: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 06 Jul 2016 08:09:22 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

When adding package randrproto to an image with
IMAGE_INSTALL_append = " randrproto", an error occurs:

$ bitbake core-image-sato
[snip]
ERROR: randrproto not found in the base feeds (qemux86 i586 x86 noarch any all).
[snip]

Set ALLOW_EMPTY to avoid this issue.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
index b59e525..22c7f81 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
@@ -17,3 +17,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "a46765c8dcacb7114c821baf0df1e797"
 SRC_URI[sha256sum] = "4c675533e79cd730997d232c8894b6692174dce58d3e207021b8f860be498468"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


