Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 35E5F772A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:50:08 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 682781956; Tue, 02 Feb 2016 09:50:09 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQcHQ-0003wz-6s; Tue, 02 Feb 2016 14:50:08 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aQcHQ-0002ZG-5t; Tue, 02 Feb 2016 14:50:08 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:49:47 +0000
Message-Id: <1454424587-4251-4-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 3/3] bitbake.conf: Remove unhelpful default value for EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 02 Feb 2016 14:50:08 -0000

Setting EXTRA_OEMAKE to "-e MAKEFLAGS=" by default is a historical
accident and many classes (e.g. autotools.bbclass, module.bbclass) and
recipes have to override this default in order to work with sensible
build systems.

Now that openssl and pciutils have been fixed to set EXTRA_OEMAKE
explicitly it is possible to set EXTRA_OEMAKE = "".

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1a2f420..a32d293 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -474,7 +474,7 @@ export BUILD_STRIP = "${BUILD_PREFIX}strip"
 export BUILD_NM = "${BUILD_PREFIX}nm"
 
 export MAKE = "make"
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = ""
 EXTRA_OECONF = ""
 export LC_ALL = "C"
 
-- 
2.1.4


