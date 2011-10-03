Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifJ-0004xG-AK
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:41 +0200
Received: by eya25 with SMTP id 25so3012972eya.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8Vi091X6oV170Rt2WOiOvVETVbWyoVdgUQmFbDkGSDU=;
	b=MLUt4OXJAHjVzWXKhAt+lp3gv/sEiukyIbaCu4ogvMjCBRyQCXbigRLyuhakMnZrjS
	YszhNHt9bS+nlZIC1WSmgpulwpqr9KwAbK0pEPDWIlv3hbXhGpcJ1Y8olc2aWCNnNg/p
	ED5r4naWyeirFVPsVOj8Gt6rg3wyCSwdBMySE=
Received: by 10.223.48.141 with SMTP id r13mr12767334faf.115.1317648549174;
	Mon, 03 Oct 2011 06:29:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm21262589fag.21.2011.10.03.06.29.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:32 +0200
Message-Id: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 01/30] libxft, libxrender, renderproto: add native BBCLASSEXTEND
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:41 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
1.7.7



