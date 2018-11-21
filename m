Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DFBF6C4BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 05:34:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAL5YQCY007825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 21:34:36 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 20 Nov 2018 21:34:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2018 13:41:02 +0800
Message-ID: <b65717da65efcd35fadf29c203a389f907e56d0e.1542778410.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542778410.git.Qi.Chen@windriver.com>
References: <cover.1542778410.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] busybox: enable bzip2 by default
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
X-List-Received-Date: Wed, 21 Nov 2018 05:34:45 -0000
Content-Type: text/plain

bunzip2 is enabled by default, but bzip2 is not. This is kind of
strange, and it also causes busybox's ptest failure regarding
bunzip2, as bunzip2's test case needs bzip2 command.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 32213c0..0c40990 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -150,7 +150,7 @@ CONFIG_LZCAT=y
 # CONFIG_UNXZ is not set
 CONFIG_XZCAT=y
 # CONFIG_XZ is not set
-# CONFIG_BZIP2 is not set
+CONFIG_BZIP2=y
 CONFIG_FEATURE_BZIP2_DECOMPRESS=y
 CONFIG_CPIO=y
 # CONFIG_FEATURE_CPIO_O is not set
-- 
1.9.1


