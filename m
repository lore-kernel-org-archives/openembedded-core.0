Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA3186FFDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Dec 2015 04:51:43 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym03.jp.fujitsu.com with smtp
	id 68e1_b934_3ed78a68_e30a_4996_a2b3_ed36dcbb6389;
	Fri, 25 Dec 2015 13:51:39 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 113D7AC026B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Dec 2015 13:51:38 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	59E446D65AD for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Dec 2015 13:51:37 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt38.g01.fujitsu.local (10.128.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 25 Dec 2015 13:51:37 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Dec 2015 13:52:50 +0900
Message-ID: <1451019170-6949-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] tiff: upgrade 4.0.4 -> 4.0.6
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
X-List-Received-Date: Fri, 25 Dec 2015 04:51:45 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-multimedia/libtiff/{tiff_4.0.4.bb => tiff_4.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.4.bb => tiff_4.0.6.bb} (92%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
similarity index 92%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 74f0a72..e2e24e0 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -7,8 +7,8 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
           "
 
-SRC_URI[md5sum] = "9aee7107408a128c0c7b24286c0db900"
-SRC_URI[sha256sum] = "8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890"
+SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
+SRC_URI[sha256sum] = "4d57a50907b510e3049a4bba0d7888930fdfc16ce49f1bf693e5b6247370d68c"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
1.8.4.2


