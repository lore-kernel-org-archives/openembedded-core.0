Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2856C182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:55:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAF1tpWq027523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 17:55:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 17:55:51 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 10:02:27 +0800
Message-ID: <6947107f1c2b7d20d72f237f8630aa469c2b08e3.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 15 Nov 2018 01:55:50 -0000
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


