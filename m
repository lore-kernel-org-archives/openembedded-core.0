Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27B8177698
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 14:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BEnfPp021315; Sat, 11 Mar 2017 14:50:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fX1fsxdKY2kR; Sat, 11 Mar 2017 14:50:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BEoufm021372
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Mar 2017 14:50:57 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cmiMC-0005BM-G8; Sat, 11 Mar 2017 14:50:56 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 14:50:54 +0000
Message-Id: <1489243854-19877-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489243854-19877-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489243854-19877-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] yasm: Set CCLD_FOR_BUILD to ensure BUILD_CC is used
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
X-List-Received-Date: Sat, 11 Mar 2017 14:51:02 -0000

Otherwise cc may be used which isn't correct.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/yasm/yasm_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/yasm/yasm_1.3.0.bb b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
index 78702ed..31af1e2 100644
--- a/meta/recipes-devtools/yasm/yasm_1.3.0.bb
+++ b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://www.tortall.net/projects/yasm/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "fc9e586751ff789b34b1f21d572d96af"
 SRC_URI[sha256sum] = "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f"
 
+export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
+
 inherit autotools gettext
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


