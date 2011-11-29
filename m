Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVVHL-0005wW-FB
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:31:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so1363944eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:25:14 -0800 (PST)
Received: by 10.14.35.81 with SMTP id t57mr3172708eea.65.1322601914207;
	Tue, 29 Nov 2011 13:25:14 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q28sm109425045eea.6.2011.11.29.13.25.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:25:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 22:25:01 +0100
Message-Id: <1322601901-26195-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
References: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC 4/4] pulseaudio 1.1: add filter-apply and filter-heuristics to pulseaudio-server RDEPENDS, it won't start without
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
X-List-Received-Date: Tue, 29 Nov 2011 21:31:51 -0000

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



