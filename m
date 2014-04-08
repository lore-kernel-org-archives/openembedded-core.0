Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-2.stofanet.dk (mx-aarh-2.stofanet.dk [212.10.10.12])
	by mail.openembedded.org (Postfix) with ESMTP id 946D565D62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:48:21 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WXRhd-0007Tc-1F
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Apr 2014 10:48:21 +0200
Received: from koontz.lgs-net.com (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTP id F1EC77EC32;
	Tue,  8 Apr 2014 10:48:20 +0200 (CEST)
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 10:48:10 +0200
Message-Id: <1396946890-16295-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.9.1
Cc: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
Subject: [PATCH] wvstreams: Set optimization to -O0 to avoid breaking stack protection.
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
X-List-Received-Date: Tue, 08 Apr 2014 08:48:23 -0000

A description of the bug is here :
See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=674006
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index ce2b337..869402b 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8eb
 inherit autotools pkgconfig
 
 PARALLEL_MAKE = ""
+TARGET_CFLAGS_append = " -O0"
+TARGET_CXXFLAGS_append = " -O0"
 
 LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
 
-- 
1.9.1


