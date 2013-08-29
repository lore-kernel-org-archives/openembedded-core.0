Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 00D7B6BECB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:00 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so351157eek.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NeIRWd7a4R8tNqy0BEWSR35TKkoGJzXMbYIGLRDoMII=;
	b=NucH6PKiXIUQxrWXDkwmjZQeVs8e/dmaA7DWu5RDVT+PUvzRE3ENKdE1b6J9p1yI2i
	/jFCXG7WQG6GlhT3KgcUN/2HfQbHz8UuY9LaltBNsu2NHMLllL0O3yMakhX6w2YJHfd0
	F/n4HSDmsTAp2AaGNHjqJWL4voFm99PEGLdLRNG/aYxztmbwgy5uFPl15ib4W8Wjip2g
	0g0xj49NfmqSA7ao909AW5hQpg4szVxV73SgkEl0XPhoGE2JF9y0RiISSpKI4uQStrZl
	ZCMJpebvlZt9SJCWjmCR69WAgfW7T/T9eBm5IJlOihB2lkuZX11cntueORDMFGi0g0S5
	a71A==
X-Received: by 10.14.9.72 with SMTP id 48mr5358152ees.42.1377792121447;
	Thu, 29 Aug 2013 09:02:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm47233827eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:52 +0200
Message-Id: <75b5f2fe123fe20e0222bf25e4b0c5a1f836b602.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 05/20] xdypinfo: Add dependency on libxcomposite
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
index c853926..3688e1b 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
@@ -9,7 +9,7 @@ clients and the server, and the different types of screens and visuals \
 that are available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
-DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxau"
+DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
-- 
1.8.3.2


