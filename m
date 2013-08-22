Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D8FD76B2C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fZ001261; Thu, 22 Aug 2013 12:42:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s9rG_MZFiLeW; Thu, 22 Aug 2013 12:42:12 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg7WZ001220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:08 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001i3-Mg; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:41 +0100
Message-Id: <1377171000-6469-9-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/28] gcc-configure-sdk.inc: Don't build target-libgcc
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:54 -0000

I don't understand why we're building the target libgcc in the canadian-cross build
since it should have been built elsewhere. The compiler configuration isn't correct
to build a working target libgcc in all cases anyway.

To avoid various weird build errors, stop building it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index 51c0217..6c55bc7 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -43,5 +43,5 @@ do_configure () {
 }
 
 do_compile () {
-	oe_runmake all-host all-target-libgcc
+	oe_runmake all-host
 }
-- 
1.8.1.2


