Return-Path: <ueba.takuma@jp.fujitsu.com>
X-Greylist: delayed 661 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Jul 2018 09:56:42 UTC
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id A56B8771A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 09:56:42 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym01.jp.fujitsu.com with smtp
	id 5723_6556_7743e977_7209_4b85_a3c8_deace938165e;
	Wed, 11 Jul 2018 18:45:35 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5E41AC016A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:45:34 +0900 (JST)
Received: from ueba-FMVA09006.utsfd.cs.fujitsu.co.jp
	(ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id C7A46204;
	Wed, 11 Jul 2018 18:45:34 +0900 (JST)
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 18:45:32 +0900
Message-Id: <20180711094532.8141-1-ueba.takuma@jp.fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-MML: disable
Subject: [PATCH] zip: fix the license description
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
X-List-Received-Date: Wed, 11 Jul 2018 09:56:43 -0000

Exactly speaking, BSD-3-Clause differ from Info-ZIP license.
Consequently, we fixed license description.

Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index de779e94aa..7851a2a506 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Compressor/archiver for creating and modifying .zip files"
 HOMEPAGE = "http://www.info-zip.org"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
 PR = "r2"
-- 
2.17.1



