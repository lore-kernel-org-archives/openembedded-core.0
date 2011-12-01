Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW4IM-0001Aa-Az
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:55:14 +0100
Received: by faaa19 with SMTP id a19so955360faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:48:33 -0800 (PST)
Received: by 10.180.81.73 with SMTP id y9mr4474878wix.37.1322736513285;
	Thu, 01 Dec 2011 02:48:33 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w8sm1464439wiz.4.2011.12.01.02.48.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 02:48:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 11:48:25 +0100
Message-Id: <1322736505-13901-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322736505-13901-1-git-send-email-koen@dominion.thruhere.net>
References: <1322736505-13901-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] pulseaudio 1.1: add filter-apply and filter-heuristics to pulseaudio-server RDEPENDS, it won't start without
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
X-List-Received-Date: Thu, 01 Dec 2011 10:55:15 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 ++
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4170857..38ecba5 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -112,6 +112,8 @@ python populate_packages_prepend() {
 
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-server = " \
+    pulseaudio-module-filter-apply \
+    pulseaudio-module-filter-heuristics \
     pulseaudio-module-udev-detect \
     pulseaudio-module-null-sink \
     pulseaudio-module-device-restore \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index 7fa5799..4c8b46f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.2.5



