Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDyH-0005r4-PN
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:12:29 +0200
Received: by mail-ey0-f175.google.com with SMTP id 24so2129441eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xinbbdyAtVDc/CVZtZvvpbFuPOlW6Ro1VtMvkXGro5E=;
	b=wmRVktyMjsYFQchxMVQZjdv2Wb1WjPxQ5PuCPA1ZVkbjvINxD01ALuwMb7ix6Q0N/J
	zolD9L9gVBWGr/3/B3xKT0UnIm5Iy/mUknB0MTJZttO9fc3XPquSNFsWtmLTMugZuHig
	K8qEG7XyxzTgf+d+B/2anveZiRAr5NHqcdvfs=
Received: by 10.223.75.137 with SMTP id y9mr11905415faj.14.1318007214958;
	Fri, 07 Oct 2011 10:06:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a1sm13627288fab.4.2011.10.07.10.06.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:06 +0200
Message-Id: <8ead384b9724381f66f553367721b4b451864ed4.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 11/31] xserver-xorg: remove FILES_${PN} += "${bindir}/Xorg ", now we have whole ${bindir} in FILES_ defined in shared .inc
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
X-List-Received-Date: Fri, 07 Oct 2011 17:12:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-lite.inc             |    2 --
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index 2483553..b82d153 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,7 +1,5 @@
 require xserver-xorg-common.inc
 
-FILES_${PN} += "${bindir}/Xorg "
-
 EXTRA_OECONF += "--disable-static \
                  --disable-acfb \
                  --disable-ccfb \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6a4f978..dfad8f3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -3,8 +3,6 @@ require xserver-xorg-common.inc
 PROTO_DEPS += "xf86driproto dri2proto"
 LIB_DEPS += "virtual/libgl"
 
-FILES_${PN} += "${bindir}/Xorg "
-
 EXTRA_OECONF += "--disable-static \
                  --disable-acfb \
                  --disable-ccfb \
-- 
1.7.7



