Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE06C7EE37
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.26241.1685610238393525359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119084614"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119084614"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69871CA1E8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:58 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 907CCD88BF
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE81388857;
	Thu,  1 Jun 2023 18:03:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.8 -> 4.8.1
Date: Thu,  1 Jun 2023 17:03:19 +0800
Message-Id: <1685610221-29015-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--3.519900-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/ySAWHOR37+ATjbv3ERJ0uO2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLcAtH/ey8zRp8SiwizsgluQ1vZ
	7s3YIVDI6NmtdFz2VVHzoX6MtOvdEK6km+od/UDw6N/cDgNNi4SBr3Ab7SNDaAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w6i2ewKHTJAnb0QL
	sTz3fVNpI2QwNynUCoZD6NAm1s47Ip3Hr5s2WUNBaI+CwpmPMsegHb0s6WZIC/bse56gCDpQx4l
	egAKa5SCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182068

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 cpp-httplib updated to v0.12.3
 Copyright year updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.8.bb => ccache_4.8.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.8.bb => ccache_4.8.1.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.8.bb b/meta/recipes-devtools/ccache/ccache_4.8.1.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.8.bb
rename to meta/recipes-devtools/ccache/ccache_4.8.1.bb
index 6cad0dd7c6..b0ae7fb25c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.8.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.8.1.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=43a02b74c9eb73a0b978ae5082f5f1b6"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=1601d62d6828fbe19b6f6c2d01fdff4c"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "ac4b01748fd59cfe07e070c34432b91bdd0fd8640e1e653a80b01d6a523186b0"
+SRC_URI[sha256sum] = "869903c1891beb8bee87f1ec94d8a0dad18c2add4072c456acbc85cdfc23ca63"
 
 inherit cmake github-releases
 
-- 
2.34.1


