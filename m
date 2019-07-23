Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id A84CB7EE86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 04:40:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jul 2019 21:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; d="scan'208";a="169446407"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.221.21.220])
	by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2019 21:40:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2019 12:40:27 +0800
Message-Id: <20190723044027.29697-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] mpg123: upgrade 1.25.10 -> 1.25.11
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
X-List-Received-Date: Tue, 23 Jul 2019 04:40:30 -0000
Content-Transfer-Encoding: 8bit

Release notes:
https://www.mpg123.de/#2019-07-18

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mpg123/{mpg123_1.25.10.bb => mpg123_1.25.11.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.10.bb => mpg123_1.25.11.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.11.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.11.bb
index dfb10bb1cd..d063ef5c59 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.11.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
            file://sdl2.patch"
-SRC_URI[md5sum] = "ea32caa61d41d8be797f0b04a1b43ad9"
-SRC_URI[sha256sum] = "6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023"
+SRC_URI[md5sum] = "64749512a6fdc117227abe13fee4cc36"
+SRC_URI[sha256sum] = "df063307faa27c7d9efe63d2139b1564cfc7cdbb7c6f449c89ef8faabfa0eab2"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


