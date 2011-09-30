Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xas-0005dU-QY
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:15 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506817bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JT4MJF5wG1CA8bjk14I2x4GVQcFKnkJw8Et//JBvbqI=;
	b=f9HFBgTgh1A5Dp/xHpoMLr4HikyVDLPutieviYeJdKVdupDYeEBgwL1g+OtqJCqtbQ
	AiYeBym3lXqfZqPpbio5t2xQNHbLd+Qm55BeUJhJsKENgJ2bM6P6SGFbJ1RAH5UeJzLl
	gQ2DHuL2RVK+A76sPnQ5KwxhVEqRr9Dy1R9RI=
Received: by 10.204.130.130 with SMTP id t2mr1325723bks.223.1317367668332;
	Fri, 30 Sep 2011 00:27:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm3928945bkn.7.2011.09.30.00.27.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:27:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:14 +0200
Message-Id: <8af2776a93c6a9a1918b3864f1606b25c52367ee.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/13] libxft, libxrender, renderproto: add native BBCLASSEXTEND
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 07:33:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    2 ++
 meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb |    2 +-
 .../xorg-proto/renderproto_0.11.1.bb               |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index ac7dfb1..0fb10e6 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -23,6 +23,8 @@ PE = "1"
 
 XORG_PN = "libXft"
 
+BBCLASSEXTEND = "native nativesdk"
+
 python () {
         if bb.data.getVar('DEBIAN_NAMES', d, 1):
             bb.data.setVar('PKG_${PN}', '${MLPREFIX}libxft2', d)
diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
index a5c5ead..893ea14 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
@@ -18,7 +18,7 @@ PE = "1"
 
 XORG_PN = "libXrender"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "3b3b7d076c2384b6c600c0b5f4ba971f"
 SRC_URI[sha256sum] = "7f58b1e263109e0a873eef8423aa14733a5499befbe645053aa622ed1f3ea668"
diff --git a/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb b/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
index a352b1e..5eb06cb 100644
--- a/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
+++ b/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
@@ -14,7 +14,7 @@ CONFLICTS = "renderext"
 PR = "r0"
 PE = "1"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "a914ccc1de66ddeb4b611c6b0686e274"
 SRC_URI[sha256sum] = "06735a5b92b20759204e4751ecd6064a2ad8a6246bb65b3078b862a00def2537"
-- 
1.7.6.1



