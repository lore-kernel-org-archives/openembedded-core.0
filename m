Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 99BB577794
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:54:13 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym03.jp.fujitsu.com with smtp
	id 1b7d_c0f7_41155c4d_f441_4c55_ad0b_3b21e4ac08da;
	Fri, 02 Jun 2017 15:54:07 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6758FAC00D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:54:07 +0900 (JST)
Received: from G01JPEXCHKW16.g01.fujitsu.local
	(G01JPEXCHKW16.g01.fujitsu.local [10.0.194.55])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	55BC3BD67B2 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:54:06 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW16.g01.fujitsu.local (10.0.194.55) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 2 Jun 2017 15:54:04 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Jun 2017 15:55:24 +0900
Message-ID: <1496386524-20602-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] cups: Upgrade 2.2.2 -> 2.2.3
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
X-List-Received-Date: Fri, 02 Jun 2017 06:54:15 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/cups/{cups_2.2.2.bb => cups_2.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.2.bb => cups_2.2.3.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.2.bb b/meta/recipes-extended/cups/cups_2.2.3.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.2.bb
rename to meta/recipes-extended/cups/cups_2.2.3.bb
index 5174c30..204d14d 100644
--- a/meta/recipes-extended/cups/cups_2.2.2.bb
+++ b/meta/recipes-extended/cups/cups_2.2.3.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "036f6bda6202ae3e280ac00c710b5ca4"
-SRC_URI[sha256sum] = "f589bb7d5d1dc3aa0915d7cf2b808571ef2e1530cd1a6ebe76ae8f9f4994e4f6"
+SRC_URI[md5sum] = "006a8156680a516e43c59034e31df8bf"
+SRC_URI[sha256sum] = "66701fe15838f2c892052c913bde1ba106bbee2e0a953c955a62ecacce76885f"
-- 
1.9.1


