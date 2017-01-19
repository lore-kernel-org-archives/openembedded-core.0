Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D557F71DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrQiB005703; Thu, 19 Jan 2017 22:53:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 84iHJblr8i0z; Thu, 19 Jan 2017 22:53:32 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrOkg005680
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:25 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa8-0004jY-2Y; Thu, 19 Jan 2017 22:53:24 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:53:14 +0000
Message-Id: <1484866395-17971-32-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 32/33] cantarell-fonts: inherit pkgconfig
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:40 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

configure fails without pkg-config.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index e3e4cde..c71ab11 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-inherit autotools allarch fontcache
+inherit autotools allarch fontcache pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fontforge] = "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
-- 
2.7.4


