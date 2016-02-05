Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6FA7736A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:04:46 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 684771846; Fri, 05 Feb 2016 13:04:46 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkO-000CXo-5O; Fri, 05 Feb 2016 18:04:44 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkO-0002ED-4p; Fri, 05 Feb 2016 18:04:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 18:04:23 +0000
Message-Id: <1454695470-8205-9-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 08/15] ed: Explicitly set EXTRA_OEMAKE as required
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
 meta/recipes-extended/ed/ed_1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index 8e94eed..f2ec42a 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
 SRC_URI[md5sum] = "565b6d1d5a9a8816b9b304fc4ed9405d"
 SRC_URI[sha256sum] = "d5b372cfadf073001823772272fceac2cfa87552c5cd5a8efc1c8aae61f45a88"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 inherit texinfo
 
 do_configure() {
-- 
2.1.4


