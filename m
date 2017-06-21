Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id DCD9277972
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 08:07:10 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym03.jp.fujitsu.com with smtp
	id 1a0c_3686_af2aa48b_1fb3_4c15_b9cf_babfe27fb761;
	Wed, 21 Jun 2017 17:07:06 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id E9D37AC01A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 17:07:05 +0900 (JST)
Received: from G01JPEXCHYT13.g01.fujitsu.local
	(G01JPEXCHYT13.g01.fujitsu.local [10.128.194.52])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	DE0946D673B for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 17:07:04 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT13.g01.fujitsu.local (10.128.194.52) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 21 Jun 2017 17:07:04 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jun 2017 17:08:30 +0900
Message-ID: <1498032510-12688-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libpcre2: 10.22 -> 10.23
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
X-List-Received-Date: Wed, 21 Jun 2017 08:07:12 -0000
Content-Type: text/plain

1. Upgrade libpcre2 from 10.22 to 10.23

2. Update the checksum of LIC_FILES_CHKSUM
   The copyright time of LICENCE is updated to 2017, the content of LICENCE has no change.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../libpcre/{libpcre2_10.22.bb => libpcre2_10.23.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.22.bb => libpcre2_10.23.bb} (89%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.22.bb b/meta/recipes-support/libpcre/libpcre2_10.23.bb
similarity index 89%
rename from meta/recipes-support/libpcre/libpcre2_10.22.bb
rename to meta/recipes-support/libpcre/libpcre2_10.23.bb
index 1e00ed5..17d397e 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.22.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.23.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ab9633efd38d6f799398df2c248b5aec"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=3de34df49e1fe3c3b59a08dff214488b"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "c0c02517938ee2b0d350d53edf450664"
-SRC_URI[sha256sum] = "b2b44619f4ac6c50ad74c2865fd56807571392496fae1c9ad7a70993d018f416"
+SRC_URI[md5sum] = "b2cd00ca7e24049040099b0a46bb3649"
+SRC_URI[sha256sum] = "dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e"
 
 S = "${WORKDIR}/pcre2-${PV}"
 
-- 
2.7.4


