Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 4D59A7473A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 15:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 11:58:28 -0400
Message-Id: <20180331155828.28679-1-bradleyb@fuzziesquirrel.com>
Subject: [PATCH v2] autoconf-archive: update to version to 2018.03.13
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
X-List-Received-Date: Sat, 31 Mar 2018 15:58:50 -0000

2016.09.16 -> 2018.03.13

License-Update: s/http/https/ in the license requires md5sum update.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v2: Add License-Update tag to commit message.
---
 ...utoconf-archive_2016.09.16.bb => autoconf-archive_2018.03.13.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2016.09.16.bb => autoconf-archive_2018.03.13.bb} (66%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
similarity index 66%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
index 89d57ac079..7d62e52ab8 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
@@ -2,12 +2,12 @@ SUMMARY = "a collection of freely re-usable Autoconf macros"
 HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
-SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
+SRC_URI[md5sum] = "46b13a5936372297b6d49980327a3c35"
+SRC_URI[sha256sum] = "6175f90d9fa64c4d939bdbb3e8511ae0ee2134863a2c7bf8d9733819efa6e159"
 
 inherit autotools allarch
 
-- 
2.14.3

