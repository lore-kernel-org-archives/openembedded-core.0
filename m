Return-Path: <moritz.blume@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD3F60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:36:29 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:21215
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Moritz.Blume@bmw-carit.de>)
	id 1Z2aYc-0006d9-2q for openembedded-core@lists.openembedded.org;
	Wed, 10 Jun 2015 09:36:18 +0200
Received: from localhost (192.168.101.32) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Wed, 10 Jun 2015 09:36:18 +0200
X-CTCH-RefID: str=0001.0A0C0205.5577E8F2.0410, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Moritz Blume <moritz.blume@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 09:36:17 +0200
Message-ID: <1433921778-1835-1-git-send-email-moritz.blume@bmw-carit.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.101.32]
Subject: [PATCH v3 1/2] cmake: Whitespace fix
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
X-List-Received-Date: Wed, 10 Jun 2015 07:36:30 -0000
Content-Type: text/plain

Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 3549c38..1ebb936 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -82,7 +82,7 @@ cmake_do_configure() {
 		mkdir -p ${B}
 		cd ${B}
 	else
-		find ${B} -name CMakeFiles -or -name Makefile -or -name cmake_install.cmake -or -name CMakeCache.txt -delete	
+		find ${B} -name CMakeFiles -or -name Makefile -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
 	fi
 
 	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
-- 
1.9.1


