Return-Path: <jan.siegmund0@hm.edu>
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
	by mail.openembedded.org (Postfix) with ESMTP id B74D07864F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:14:08 +0000 (UTC)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 3zM4Gp098Nzyq1;
	Wed, 17 Jan 2018 12:14:10 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.894
X-Spam-Level: 
X-Spam-Status: No, score=-2.894 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
	port 20024)
	with LMTP id 2QcCtlKd8UZH; Wed, 17 Jan 2018 12:14:09 +0100 (CET)
Received: from build-platform.arri.de (unknown [217.111.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 3zM4Gn3sSyzyW0;
	Wed, 17 Jan 2018 12:14:09 +0100 (CET)
From: Jan Siegmund <jan.siegmund0@hm.edu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 12:13:59 +0100
Message-Id: <1516187640-54936-1-git-send-email-jsiegmun@hm.edu>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH 1/2] lz4: fix upstream version check
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
X-List-Received-Date: Wed, 17 Jan 2018 11:14:09 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/lz4/lz4_1.7.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/lz4/lz4_1.7.4.bb b/meta/recipes-support/lz4/lz4_1.7.4.bb
index 1e98c1b..9e86985 100644
--- a/meta/recipes-support/lz4/lz4_1.7.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.7.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/lz4/lz4.git \
            file://0001-tests-Makefile-don-t-use-LIBDIR-as-variable.patch \
            file://run-ptest \
 "
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 inherit ptest
-- 
2.7.4


