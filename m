Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6O-0006Mu-0l
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4s0A009104; Thu, 21 Mar 2013 16:04:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bTvqZFCCaTdu; Thu, 21 Mar 2013 16:04:56 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4nsg009085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:50 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpn-0006MI-Ia; Thu, 21 Mar 2013 15:55:19 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:09 +0000
Message-Id: <1363881315-24352-10-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/16] lzop: Fix case where ${B} != ${S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Remove path assumptions and ensure out of tree builds work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/lzop/lzop_1.03.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index 63a2a62..8b5756a 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909
 inherit autotools
 
 do_configure () {
-    ln -sf ../acinclude.m4
+    ln -sf  ../acinclude.m4 ${S}/acinclude.m4
     autotools_do_configure
 }
 
-- 
1.7.10.4



