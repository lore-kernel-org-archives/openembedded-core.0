Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9716BE9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:10 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so346604eaj.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Xh/DlyklriqOhqt4mUcgHhikUpRWUqv5mqvtjXCZtNA=;
	b=wjcb10nYOP1aDnN/Neprzh5AktHglaYsu+d6fWwXTh/tUJraJFK461wYs1KHjF1csu
	uCIpdHv0KvLWAruNO0A51eKBq+u+z09Lfrb4OHj6FT7FBK5JAg/Ty1cTHL3p1ZwaWYx6
	QD+nN/BYsyz7+sduZXj5aTSi9og9OZAOTAOTAnnldRAl9sg4jflIULu1bXc/xJ9UwSSE
	SDxz7HYB9lHsgwNNORLFAj9am/sckVl6O3e7gBD5ToYidmnvIjpWFY6QkQZMqSshP7Rq
	ncH7dhzl9VV5OFIDiBCuC0wNg/GmnZmYTUU9hVgXPxLXOlolj/utV3JbKfXAzcqQ/t9e
	1uqg==
X-Received: by 10.14.223.134 with SMTP id v6mr4063eep.88.1377792130640;
	Thu, 29 Aug 2013 09:02:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm47253487eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:59 +0200
Message-Id: <f774e0b175fe470e3df929b79df3c2e669094cb8.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 12/20] x11vnc: Add PACKAGECONFIG for xfixes, xinerama, xrandr and xdamage
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 4b8bed4..7c404e3 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -18,5 +18,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
 SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
 SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[xfixes] = "--with-xfixes,--without-xfixes,libxfixes"
+PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
+PACKAGECONFIG[xrandr] = "--with-xrandr,--without-xrandr,libxrandr"
+PACKAGECONFIG[xdamage] = "--with-xdamage,--without-xdamage,libxdamage"
+
 inherit autotools
 
-- 
1.8.3.2


