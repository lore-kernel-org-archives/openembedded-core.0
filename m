Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Sdl-0008GV-1v
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 08:47:29 +0100
Received: by mail-wi0-f175.google.com with SMTP id hq12so1798934wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 23:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.106.9 as permitted sender)
	client-ip=10.180.106.9; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.106.9 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.106.9])
	by 10.180.106.9 with SMTP id gq9mr13058586wib.17.1330933137170
	(num_hops = 1); Sun, 04 Mar 2012 23:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.106.9 with SMTP id gq9mr10405094wib.17.1330933137119;
	Sun, 04 Mar 2012 23:38:57 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm57891888wib.0.2012.03.04.23.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 23:38:56 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2012 08:38:32 +0100
Message-Id: <1330933112-13510-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
References: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmh7+tHF3lmSt3u+li40N1KlWyHAmgEMeCgix2/GVmDFx2UPAvBi3Jn+tM8mrE81MdWE/Q8
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2 4/4] libx11: reinstate PE=1 that got lost in the big meta-oe Xorg merge
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

This prevents package managers 'upgrading' 1.4.4 to 1:1.4.3

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/xorg-lib/libx11.inc      |    2 ++
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 9057edc..a1e4386 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -8,6 +8,8 @@ require xorg-lib-common.inc
 
 inherit siteinfo
 
+PE = "1"
+
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
index 0428ff5..1ad8046 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
@@ -1,7 +1,7 @@
 require libx11.inc
 inherit gettext
 
-PR = "r2"
+PR = "r3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.2.5



