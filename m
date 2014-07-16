Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC996705E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTjT011065; Wed, 16 Jul 2014 17:26:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kjv_D9O4plDh; Wed, 16 Jul 2014 17:26:32 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRMU011044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004NX-A0; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:07 +0100
Message-Id: <0f6b0d02f397d8658fca6f64130bd8f0767cf5b0.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/19] nasm: Update 2.11.02 -> 2.11.05
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:11 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/{nasm_2.11.02.bb => nasm_2.11.05.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.11.02.bb => nasm_2.11.05.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.11.02.bb b/meta/recipes-devtools/nasm/nasm_2.11.05.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.11.02.bb
rename to meta/recipes-devtools/nasm/nasm_2.11.05.bb
index db84ec5..fbfd585 100644
--- a/meta/recipes-devtools/nasm/nasm_2.11.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.11.05.bb
@@ -6,8 +6,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "3bbc8ed83115b8caf7931f35ec3bc5e0"
-SRC_URI[sha256sum] = "ece26b5ef565f94d19a72756d05965e424d2e5ca55f88b949852da70dd62f0e0"
+SRC_URI[md5sum] = "f6b1db2858cad82bbb0c8c6f3e2b0fb2"
+SRC_URI[sha256sum] = "4a417bcf5cde5d203e228feea3f428a6ff4d700d558e4d79d50a30a695bdfae9"
 
 inherit autotools-brokensep
 
-- 
1.9.2


