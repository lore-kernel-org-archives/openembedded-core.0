Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5370877EA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:20:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w116Kl2S014388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jan 2018 22:20:47 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 22:20:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<alexander.kanavin@linux.intel.com>, <randy.macleod@windriver.com>
Date: Thu, 1 Feb 2018 01:20:42 -0500
Message-ID: <1517466042-177651-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <72c0e55a-f317-aa60-0681-9be5ea41a549@windriver.com>
References: <72c0e55a-f317-aa60-0681-9be5ea41a549@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3] pigz: 2.3.4 -> 2.4
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
X-List-Received-Date: Thu, 01 Feb 2018 06:20:47 -0000
Content-Type: text/plain

License-checksum-change: license is no change, only version bump up.

https://github.com/madler/pigz/commit/fe822cb435622c43f491013da77b127e9fe851a9

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/pigz/{pigz_2.3.4.bb => pigz_2.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/pigz/{pigz_2.3.4.bb => pigz_2.4.bb} (86%)

diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
similarity index 86%
rename from meta/recipes-extended/pigz/pigz_2.3.4.bb
rename to meta/recipes-extended/pigz/pigz_2.4.bb
index 431d9bd..cb41154 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -6,13 +6,13 @@ Adler, and uses the zlib and pthread libraries."
 HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
-LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
+LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 PROVIDES_class-native += "gzip-native"
 
 SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
-SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
+SRC_URI[md5sum] = "3c8a601db141d3013ef9fe5f2daaf73f"
+SRC_URI[sha256sum] = "e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52"
 
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
-- 
2.8.1


