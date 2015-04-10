Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40FE973D20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UCKo028445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:30:03 -0700
Message-ID: <d3e8ce54e6616f860b6e918f323360eb74d7ad44.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/15] libxmu: remove libxmuu-dev from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:11 -0000
Content-Type: text/plain

There should be only one dev and dbg package

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
index 3922b52..003baec 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb
@@ -22,10 +22,9 @@ XORG_PN = "libXmu"
 
 LEAD_SONAME = "libXmu"
 
-PACKAGES =+ "libxmuu libxmuu-dev"
+PACKAGES =+ "libxmuu"
 
 FILES_libxmuu = "${libdir}/libXmuu.so.*"
-FILES_libxmuu-dev = "${libdir}/libXmuu.so"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.9.5


