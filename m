Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 670 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Apr 2016 05:17:22 UTC
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3E860107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 05:17:22 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 7e7c_6b00_9bfaac04_d0c4_4a45_ad2e_feea424cd101;
	Thu, 21 Apr 2016 14:06:06 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 5167EAC02D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 14:06:06 +0900 (JST)
Received: from g01jpexchkw37.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	AB789692730 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 14:06:05 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw37.g01.fujitsu.local (10.0.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 21 Apr 2016 14:06:04 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 14:05:14 +0900
Message-ID: <1461215114-5062-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Thu, 21 Apr 2016 05:17:25 -0000
Content-Type: text/plain

The foomatic-filters community is inactive and foomatic-filter package is unmaintained.
(http://www.gossamer-threads.com/lists/gentoo/user/288184)

The foomatic-rips is moved from foomatic-filters to cups-filters and
maintained by cups-filters according to the cups-filter's NEWS.
(http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/annotate/head:/NEWS)

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a29c3d7..13ef710 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -144,7 +144,7 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     file \
     findutils \
     fontconfig-utils \
-    foomatic-filters \
+    cups-filters \
     gawk \
     ghostscript \
     grep \
-- 
1.8.4.2


