Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4CXu-0000oK-Fd
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 15:36:22 +0100
Received: by wibhq12 with SMTP id hq12so1523365wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 06:27:49 -0800 (PST)
Received: by 10.180.82.132 with SMTP id i4mr7382678wiy.12.1330871269192;
	Sun, 04 Mar 2012 06:27:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ep17sm13932122wid.2.2012.03.04.06.27.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 06:27:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2012 15:27:37 +0100
Message-Id: <1330871257-5525-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330871257-5525-1-git-send-email-koen@dominion.thruhere.net>
References: <1330871257-5525-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnt8KIPsCWj2GDKD2Znj+1FwAKjcNjYIM91uw+CdLVLjAKIsPhtW+HKYAt04VQJ0sndM7MA
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/3] gtk+ 2.24.8: bump PR to force rebuild and feed update
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
X-List-Received-Date: Sun, 04 Mar 2012 14:36:22 -0000

This should errors similar to this one:

/usr/libexec/gdm-simple-greeter: symbol lookup error: /usr/lib/libgdk-x11-2.0.so.0: undefined symbol: _XGetRequest

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index dab66c7..0b29ae1 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
-- 
1.7.2.5



