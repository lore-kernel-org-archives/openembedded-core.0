Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id EA28178253
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 01:38:05 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 6210_288c_cd8e46d3_84ae_49c4_9964_d2176c2bc9fc;
	Fri, 09 Jun 2017 10:38:00 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AEACAC00C9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 10:38:00 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	16FB446E4BC for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 10:37:59 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt38.g01.fujitsu.local (10.128.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 9 Jun 2017 10:37:59 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Jun 2017 10:39:19 +0900
Message-ID: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] flex: Upgrade to 2.6.4
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
X-List-Received-Date: Fri, 09 Jun 2017 01:38:06 -0000
Content-Type: text/plain

1. Upgrade flex from 2.6.0 to 2.6.4

2. Change the SRC_URI
   Change SRC_URI from sourceforge to github due to the flex on sourceforge has not been updated more than one year.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (90%)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
similarity index 90%
rename from meta/recipes-devtools/flex/flex_2.6.0.bb
rename to meta/recipes-devtools/flex/flex_2.6.4.bb
index ab35b09..038aa37 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -10,7 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/westes/flex/files/981163/${PN}-${PV}.tar.gz \
            file://run-ptest \
            file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            "
 
-SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
-SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
+SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
+SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
 
 # Flex has moved to github from 2.6.1 onwards
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
-- 
1.9.1


