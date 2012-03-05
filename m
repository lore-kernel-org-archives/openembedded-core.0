Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Sdl-0008Go-8B
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 08:47:29 +0100
Received: by wera1 with SMTP id a1so2246756wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 23:38:55 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.90.212 as permitted sender)
	client-ip=10.180.90.212; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.90.212 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.90.212])
	by 10.180.90.212 with SMTP id by20mr13181067wib.12.1330933135303
	(num_hops = 1); Sun, 04 Mar 2012 23:38:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.90.212 with SMTP id by20mr10496582wib.12.1330933135081;
	Sun, 04 Mar 2012 23:38:55 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm57891303wib.0.2012.03.04.23.38.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 23:38:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2012 08:38:31 +0100
Message-Id: <1330933112-13510-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
References: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnOGKP9RZQGCoA70jLIjyneUl8yQddYpxe7v2/GF96EQjxQu/LRMW0OdHcY8mwjkQ2bPawu
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2 3/4] gtk+ 2.24.8: bump PR to force rebuild and feed update
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
X-List-Received-Date: Mon, 05 Mar 2012 07:47:29 -0000

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



