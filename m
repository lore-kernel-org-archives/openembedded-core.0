Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 06D22660E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 11:37:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,879,1392159600"; d="scan'208";a="51552492"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 13:37:52 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Wed, 21 May 2014 13:37:52 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 13:37:51 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 13:37:56 +0200
Message-ID: <1400672277-7181-3-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libav (0.8.11): cosmetics, move LIC_FILES_CHKSUM before SRC_URI
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
X-List-Received-Date: Wed, 21 May 2014 11:37:53 -0000
Content-Type: text/plain

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav_0.8.11.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb b/meta/recipes-multimedia/libav/libav_0.8.11.bb
index 662d205..dfef680 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.11.bb
@@ -1,16 +1,16 @@
 require libav.inc
 
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
 SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
            file://0001-configure-enable-pic-for-AArch64.patch"
 
 SRC_URI[md5sum] = "cdc9b53c56a375baf73ea38cf7ade4f9"
 SRC_URI[sha256sum] = "5934e4f0dbf6e0fc4987de86cdd079f1d11a1410ae275e9f46472af17f05155a"
 
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
 PROVIDES += "libpostproc"
 
 EXTRA_OECONF += " \
-- 
1.8.1.2


