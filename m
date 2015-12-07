Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF1960110
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 08:25:35 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym01.jp.fujitsu.com with smtp
	id 3dd7_57c4_50169b5b_639f_4d56_aeb9_9d266f4136bd;
	Mon, 07 Dec 2015 17:25:27 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id F12BDAC0497
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 17:25:26 +0900 (JST)
Received: from g01jpexchkw36.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	36E913286E3 for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 17:25:26 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw36.g01.fujitsu.local (10.0.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 7 Dec 2015 17:25:26 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Dec 2015 17:26:28 +0900
Message-ID: <1449476788-28731-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH v2] libpcre: upgrade to 8.38
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
X-List-Received-Date: Mon, 07 Dec 2015 08:25:36 -0000
Content-Type: text/plain

This is the latest release in the 8.xx series.
It fixes 46 bugs as listed:
http://vcs.pcre.org/pcre/code/trunk/ChangeLog?view=markup

Vulnerabilities from CVE-2015-8380 to CVE-2015-8395 have been fixed in 8.38.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.38.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.37.bb
rename to meta/recipes-support/libpcre/libpcre_8.38.bb
index 1880639..4f31f8c 100644
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
@@ -7,15 +7,15 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
            file://run-ptest \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
-SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
+SRC_URI[md5sum] = "00aabbfe56d5a48b270f999b508c5ad2"
+SRC_URI[sha256sum] = "b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.8.4.2


