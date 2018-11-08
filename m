Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84E4279EE9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 06:10:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA869DXT024451
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 22:09:38 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 22:09:35 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Nov 2018 14:08:15 +0800
Message-ID: <1541657297-30997-6-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] fontconfig: extend to nativesdk
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
X-List-Received-Date: Thu, 08 Nov 2018 06:10:19 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After enable tk via PACKAGECONFIG for python3,
there comes below error:
Missing or unbuildable dependency chain was: ['nativesdk-packagegroup-sdk-host', 'nativesdk-opkg', 'nativesdk-libsolv', 'nativesdk-rpm', 'nativesdk-python3', 'nativesdk-tk', 'nativesdk-xft', 'nativesdk-fontconfig']

Extend fontconfig to nativesdk to fix this issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
index cec5247..6128d5e 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
@@ -61,4 +61,4 @@ FONTCONFIG_FONT_DIRS ?= "no"
 
 EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR} --with-add-fonts=${FONTCONFIG_FONT_DIRS}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


