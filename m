Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id F04F0772D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:04:45 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 684771810; Fri, 05 Feb 2016 13:04:46 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkO-000CY0-8l; Fri, 05 Feb 2016 18:04:44 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkO-0002EW-8k; Fri, 05 Feb 2016 18:04:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 18:04:26 +0000
Message-Id: <1454695470-8205-12-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 11/15] stat: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Fri, 05 Feb 2016 18:04:47 -0000

This recipe currently relies on EXTRA_OEMAKE having been set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-extended/stat/stat_3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index 651831e..a5ece07 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
 SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
 SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_install() {
 	install -d ${D}${base_bindir} ${D}${mandir}/man1
 	install -m 755 stat ${D}${base_bindir}/stat.stat
-- 
2.1.4


