Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B757079EFB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 06:09:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA869e3o020808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 22:09:40 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 22:09:39 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Nov 2018 14:08:16 +0800
Message-ID: <1541657297-30997-7-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] libsm: extend to nativesdk
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
X-List-Received-Date: Thu, 08 Nov 2018 06:09:40 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After enable tk via PACKAGECONFIG for python3,
there comes below error:
Missing or unbuildable dependency chain was: ['buildtools-tarball', 'nativesdk-python3-testtools', 'nativesdk-python3-pbr', 'nativesdk-python3', 'nativesdk-tk', 'nativesdk-libxt', 'nativesdk-libsm']

Extend libsm to nativesdk to fix this issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
index fdc693b..4b76302 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
@@ -22,7 +22,7 @@ PE = "1"
 
 XORG_PN = "libSM"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "499a7773c65aba513609fe651853c5f3"
 SRC_URI[sha256sum] = "0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd"
-- 
2.7.4


