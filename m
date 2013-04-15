Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1URhWp-0007lk-Ii
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:25:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7bcK003445; Mon, 15 Apr 2013 12:07:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gwBnEA9l2aQG; Mon, 15 Apr 2013 12:07:40 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7Z3a003436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Apr 2013 12:07:36 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1URhFh-0006V6-10; Mon, 15 Apr 2013 12:07:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:05 +0100
Message-Id: <1366024028-24911-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/7] encodings: Set RDEPENDS correctly
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
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000

The .inc file sets RDEPENDS for the general font case but the dependencies
don't apply to this recipe. This removes those dependencies, simplifying the
dependency chains a little.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.4.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
index cf7b3e3..90846d8 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
@@ -10,6 +10,7 @@ PE = "1"
 PR = "${INC_PR}.1"
 
 DEPENDS = "mkfontscale-native font-util-native"
+RDEPENDS_${PN} = ""
 
 SRC_URI += "file://nocompiler.patch"
 
-- 
1.7.10.4



