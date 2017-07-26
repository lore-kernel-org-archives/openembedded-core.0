Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3673478225
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 09:11:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6Q9Bmtg023049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 26 Jul 2017 10:11:49 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1daIM8-0002BK-F9; Wed, 26 Jul 2017 10:11:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 10:11:46 +0100
Message-Id: <1501060306-8348-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 26 Jul 2017 10:11:49 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] gnome-themes-standard: Fix packages so dev-pkgs image generation works
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
X-List-Received-Date: Wed, 26 Jul 2017 09:11:50 -0000

A change from Ross removed the dual -dev/-dbg packages but this broke
deb/ipk rootfs constuction due to a dependency on a package which doesn't
exist (for dev-pkgs images). Remove the dependency on that package to
allow images to build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
index e49ad5e..3b41328 100644
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
@@ -38,3 +38,6 @@ FILES_gnome-theme-adwaita = "${prefix}/share/themes/Adwaita \
 
 FILES_gnome-theme-adwaita-dark = "${prefix}/share/themes/Adwaita-dark"
 RDEPENDS_gnome-theme-adwaita-dark = "gnome-theme-adwaita"
+
+# gnome-themes-standard is empty and doesn't exist
+RDEPENDS_${PN}-dev = ""
-- 
2.7.4


