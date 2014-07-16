Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A82E5705DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTjO011065; Wed, 16 Jul 2014 17:26:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 06iK4ktHeszn; Wed, 16 Jul 2014 17:26:29 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRY7011042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004NM-4E; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:05 +0100
Message-Id: <53d7a8f7e6c202155af2e3238a46daf90c8a24d0.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/19] gccmakedep: Upgrade 1.0.2 -> 1.0.3
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:10 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-util/{gccmakedep_1.0.2.bb => gccmakedep_1.0.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{gccmakedep_1.0.2.bb => gccmakedep_1.0.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-util/gccmakedep_1.0.2.bb b/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-util/gccmakedep_1.0.2.bb
rename to meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
index 23cef63..ccf2f4b 100644
--- a/meta/recipes-graphics/xorg-util/gccmakedep_1.0.2.bb
+++ b/meta/recipes-graphics/xorg-util/gccmakedep_1.0.3.bb
@@ -13,5 +13,5 @@ RDEPENDS_${PN} = "gcc"
 PR = "r3"
 PE = "1"
 
-SRC_URI[md5sum] = "fc49f45251c1336fe1dad5dba1c83fcd"
-SRC_URI[sha256sum] = "fdd3963294e80b27416f902a5c029c033d321f03310d3cafa3afb62b50ddce92"
+SRC_URI[md5sum] = "127ddb6131eb4a56fdf6644a63ade788"
+SRC_URI[sha256sum] = "f9e2e7a590e27f84b6708ab7a81e546399b949bf652fb9b95193e0e543e6a548"
\ No newline at end of file
-- 
1.9.2


