Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC356D688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 01:30:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208";a="75330989"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 09:30:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 21C584CE14E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 09:29:51 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 09:30:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2019 09:29:49 +0800
Message-ID: <20190912012949.28776-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 21C584CE14E4.A7F38
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Thu, 12 Sep 2019 01:30:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ce16524..f6bab1a 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019b"
+PV = "2019c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "91e0978d947496fd6aaf46d351f9c41d"
-SRC_URI[tzcode.sha256sum] = "2e479d409337da41408629ce6c3b4d8410b10ba6d4431d862e22d2b137d7756d"
-SRC_URI[tzdata.md5sum] = "b26b5d7d844cb96c73ed2fb6d588daaf"
-SRC_URI[tzdata.sha256sum] = "05d9092c90dcf9ec4f3ccfdea80c7dcea5e882b3b105c3422da172aaa9a50c64"
+SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
+SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
+SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
+SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
-- 
2.7.4




