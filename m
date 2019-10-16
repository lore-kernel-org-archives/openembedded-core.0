Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3EE97E093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 12:05:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9GC5R7r023268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 05:05:28 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 16 Oct 2019 05:05:27 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id 7C7C2C610F8;
	Wed, 16 Oct 2019 05:05:27 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2019 05:05:26 -0700
Message-ID: <20191016120526.67433-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] aspell: upgrade from 0.60.7 to 0.60.8
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
X-List-Received-Date: Wed, 16 Oct 2019 12:05:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

New version fixes CVE-2019-17544 as well as various other bugs.

CVE: CVE-2019-17544

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../aspell/{aspell_0.60.7.bb => aspell_0.60.8.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/aspell/{aspell_0.60.7.bb => aspell_0.60.8.bb} (86%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.7.bb b/meta/recipes-support/aspell/aspell_0.60.8.bb
similarity index 86%
rename from meta/recipes-support/aspell/aspell_0.60.7.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.bb
index da99d12630..c6db9d5354 100644
--- a/meta/recipes-support/aspell/aspell_0.60.7.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[md5sum] = "8ef2252609c511cd2bb26f3a3932ef28"
-SRC_URI[sha256sum] = "5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4"
+SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
+SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
-- 
2.23.0


