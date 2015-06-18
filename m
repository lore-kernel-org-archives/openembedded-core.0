Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A128A73306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 07:33:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97252734"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 15:37:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I7Vut5013187
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:31:56 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Jun 2015 15:33:46 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 15:24:45 +0800
Message-ID: <1434612286-52367-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/2] libmpc: move 'LICENSE' into version specified recipe
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
X-List-Received-Date: Thu, 18 Jun 2015 07:33:46 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/recipes-support/libmpc/libmpc.inc      | 1 -
 meta/recipes-support/libmpc/libmpc_1.0.2.bb | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-support/libmpc/libmpc.inc
index b374254..d521954 100644
--- a/meta/recipes-support/libmpc/libmpc.inc
+++ b/meta/recipes-support/libmpc/libmpc.inc
@@ -1,7 +1,6 @@
 SUMMARY = "C library for complex number arithmetic with arbitrary precision and correct rounding"
 DESCRIPTION = "Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result. It is built upon and follows the same principles as Mpfr"
 HOMEPAGE = "http://www.multiprecision.org/"
-LICENSE = "LGPLv3"
 SECTION = "libs"
 
 inherit autotools texinfo
diff --git a/meta/recipes-support/libmpc/libmpc_1.0.2.bb b/meta/recipes-support/libmpc/libmpc_1.0.2.bb
index 41177eb..9728315 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.2.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.2.bb
@@ -1,5 +1,6 @@
 require libmpc.inc
 
+LICENSE = "LGPLv3"
 DEPENDS = "gmp mpfr"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
-- 
1.9.1


