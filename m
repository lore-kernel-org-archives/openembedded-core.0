Return-Path: <net147@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6715B6A88E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:33:15 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so3167492pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EoxViCwc4t6QlM5tdQpXGb0gIsaSnqrAqRonpmiQ+54=;
	b=hq/y8GCdGrVH/VMk8rrupv13eE3otam5nq9eHdbasWzapdcdQb1jy6sy3h6RvoHPQU
	NpjTsaHehmniroZKxrLM6IrZY0GdMizNNsN64ueIAfrc1w6m3pHJXanu3wJXxkn1DjUj
	Ov4Md0GrOfWGLyYl85DGIuxofsRUs22pFs71yInzLAwOmnSROHoBl15a1s8ELXLN23NG
	2t8188BLNc+7jonhWDvHXFVjBCCclZeeRM7MqXFBKbtO2gvtUXRpAAYcNIr/D0joEOY7
	1bsJsdn0quaKytUrhyU+bxlR6Li+ir8HqOJK0KtsHPA69FQSvALMkRSbNcb9CKaHludX
	tv3w==
X-Received: by 10.68.225.100 with SMTP id rj4mr41905002pbc.109.1370583196780; 
	Thu, 06 Jun 2013 22:33:16 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nt6sm47516092pbb.4.2013.06.06.22.33.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:33:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:46:52 +1000
Message-Id: <1370584012-28002-6-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370584012-28002-1-git-send-email-net147@gmail.com>
References: <1370584012-28002-1-git-send-email-net147@gmail.com>
Subject: [PATCH 5/5] qt4-x11-free: update HOMEPAGE
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
X-List-Received-Date: Fri, 07 Jun 2013 05:33:15 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 8853260..4b29f55 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -1,7 +1,7 @@
 require qt4.inc
 
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
-HOMEPAGE = "http://qt.nokia.com"
+HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 PROVIDES += "qt4-x11"
-- 
1.8.2.3


