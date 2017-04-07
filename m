Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFA277D71
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37GwrWC014351; 
	Fri, 7 Apr 2017 17:58:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SjU7ihKL1jIF; Fri,  7 Apr 2017 17:58:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37GfqTt011515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 17:41:53 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cwWxM-0000QL-Sq; Fri, 07 Apr 2017 17:41:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 17:41:50 +0100
Message-Id: <1491583311-1551-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] ncurses: Drop incorrect option
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
X-List-Received-Date: Fri, 07 Apr 2017 16:58:55 -0000

The --disable-static option doesn't exist in ncurses. Its equivalent is
--without-normal so remove the option which does nothing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f4bf67..8990b0f 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -66,7 +66,6 @@ ncurses_configure() {
 	cd $1
 	shift
 	oe_runconf \
-	        --disable-static \
 	        --without-debug \
 	        --without-ada \
 	        --without-gpm \
-- 
2.7.4


