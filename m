Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E61873E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 01:42:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99826609"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Aug 2015 09:45:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7K1gD1W019450
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:42:14 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 20 Aug 2015 09:42:17 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Aug 2015 09:42:09 +0800
Message-ID: <1440034929-1709-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH] gmp.inc: Delete "LICENSE = "GPLv3 LGPLv3""
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
X-List-Received-Date: Thu, 20 Aug 2015 01:42:25 -0000
Content-Type: text/plain

LICENSE are exist both in gmp.inc and gmp_6.0.0.bb,
And the LICENSE in gmp.inc is not right,so delete it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-support/gmp/gmp.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 65cde21..7477714 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -2,7 +2,6 @@ SECTION = "devel"
 SUMMARY = "GNU multiprecision arithmetic library"
 DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers"
 HOMEPAGE = "http://gmplib.org/"
-LICENSE = "GPLv3 LGPLv3"
 
 REVISION ?= ""
 
-- 
1.8.4.2


