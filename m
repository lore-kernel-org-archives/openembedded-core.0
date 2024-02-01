Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C395C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:06:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9022.1706763986131862080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R0iz4JJt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706763986; x=1738299986;
  h=from:to:cc:subject:date:message-id;
  bh=CAWbmSKpU8MFGzzyBeRiECy0N3641N229at1vsKYYgc=;
  b=R0iz4JJtXWioWsovkZzD19NYV8r46zRrhbzRrKQ25HkQ8DREmclgkRF2
   HGLvpm9FPwepwB2ki28Q6VMdp9U7HBJBanqJgAPSqhEHgL0+ZP0bMATuA
   k/sOYYLUxlwrQ0SZf7fCFJbPauFqzsghrOcic6KO+y52IXi1Id6LZnOaU
   RspCrU8rLigxWKhSSbBhSzZ7hk6jcJUHJJAOHhJmqUB2DdwEUHmp4R8Hv
   mzgsgeVQrwIWqXSLMYfGFHVKapKIlehWGTprEW/UgEwKiYN1vE9QSloPR
   +lwRFS87SpyFMeNERwoCJhjGZs3WjqXIn/WrhmAdrRhKfoHjpwJQU+YDg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="136444676"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="136444676"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:06:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 715B657425
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:06:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1AECD52C3
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:06:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D24B65FEA
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:06:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D03F91A006A;
	Thu,  1 Feb 2024 13:06:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dos2unix: upgrade 7.5.1 -> 7.5.2
Date: Thu,  1 Feb 2024 13:06:01 +0800
Message-Id: <1706763961-12344-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-1.854000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLeFzNNPDc6umF42zm1Zi+MJh+t
	oLLKXwRGBkESMI05d4vViZk/y7M3Drsq/7BhdGyBIcJTn2HkqsbFk511UyURnAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w4KFSCp+RDiZz7d3
	T5rk4xA0Me1QzIqvDL4yFtTFaaVWu3dicJNEK/NkpqEuNzUMDAkWxHdVLSQFGPN1dq+4eyCfRZf
	vB0UhgGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194562

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dos2unix/{dos2unix_7.5.1.bb => dos2unix_7.5.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.1.bb => dos2unix_7.5.2.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
index acf49f0483..06338dd62f 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=49ec74e0139712398b9ddb06d824929a"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "9675e7aea32653e1c10ef027eb55d89f3c48ec1f"
+SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.34.1


