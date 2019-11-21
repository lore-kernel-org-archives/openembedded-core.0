Return-Path: <lkml@jv-coder.de>
X-Greylist: delayed 508 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Nov 2019 08:42:23 UTC
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
	by mail.openembedded.org (Postfix) with ESMTP id 7089A7F8AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:42:23 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 8D7A89F805;
	Thu, 21 Nov 2019 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1574325235; bh=QpfNNE/GSkh86m5jnAfeZS2WJwA/lSigrrC2tsJ4Ums=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=fHpG1uaTS96j2yyPUXOvuuWTsjNCIT8IuNZFX2uzOzvVP/9CVbzCmA+ZaXKqGCJFl
	eG5/ClqHIRyD5dSX85Kha4tAqqSd7187f4LuFAD2z/2rBdMGpL94Yxb7SXLa42f7p0
	zOxUQmlyBsdw1NClgkGE28Vo829lQvOvkxkU63pE=
From: Joerg Vehlow <lkml@jv-coder.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 09:33:49 +0100
Message-Id: <20191121083349.77105-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.jv-coder.de
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Subject: [PATCH] ltp: Remove acl and at runtime dependency
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
X-List-Received-Date: Thu, 21 Nov 2019 08:42:23 -0000
Content-Transfer-Encoding: 8bit

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Tests that use at and acl tool were removed in release 20190115.
See ltp commit 0fc9b8624bea8acfdb408bf5ff4916b1453e3daa

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 meta/recipes-extended/ltp/ltp_20190517.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 47aa9675d8..60f749b4c0 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -85,8 +85,6 @@ do_install(){
 }
 
 RDEPENDS_${PN} = "\
-    acl \
-    at \
     attr \
     bash \
     cpio \
-- 
2.20.1


