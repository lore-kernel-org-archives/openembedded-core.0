Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4642C79F1B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 06:09:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA869gco004814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 22:09:42 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 22:09:42 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Nov 2018 14:08:17 +0800
Message-ID: <1541657297-30997-8-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] libice: extend to nativesdk
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
X-List-Received-Date: Thu, 08 Nov 2018 06:09:43 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After enable tk via PACKAGECONFIG for python3,
there comes below error:
Missing or unbuildable dependency chain was: ['buildtools-tarball', 'nativesdk-python3-git', 'nativesdk-python3-gitdb', 'nativesdk-python3-async', 'nativesdk-python3', 'nativesdk-tk', 'nativesdk-libxt', 'nativesdk-libsm', 'nativesdk-libice']

Extend libice to nativesdk to fix this issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
index 999434e..c1b1913 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
@@ -18,7 +18,7 @@ PE = "1"
 
 XORG_PN = "libICE"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "addfb1e897ca8079531669c7c7711726"
 SRC_URI[sha256sum] = "8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202"
-- 
2.7.4


