Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA48713D7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 00:25:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s860PDUO011532
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 17:25:14 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 5 Sep 2014 17:25:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Sep 2014 20:25:12 -0400
Message-ID: <1409963112-12911-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] packagegroup-self-hosted: move graphics packages to graphics group
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
X-List-Received-Date: Sat, 06 Sep 2014 00:25:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following packages are gui based tools:
  xdg-utils       # A set of common interfaces for desktop
  leafpad         # A GTK+ text editor used in Build Appliance
  midori          # A web browser used in Build Appliance
  pcmanfm         # PCManFm file manager used in Build Appliance
  vte             # Virtual terminal emulator GTK+ widget library

Move them to packagegroup-self-hosted-graphics so that we can make
a graphics free self-hosted image by excluding the
packagegroup-self-hosted-graphics.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index fe49fb4..919f2da 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -41,19 +41,14 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     hdparm \
     iptables \
     lsb \
-    xdg-utils \
     mc \
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
     mc-helpers-python \
-    leafpad \
-    ${MIDORI} \
-    pcmanfm \
     parted \
     pseudo \
     screen \
-    vte \
     "
 
 RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
@@ -210,6 +205,11 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     libx11-dev \
     python-pygtk \
     gtk-theme-clearlooks \
+    xdg-utils \
+    ${MIDORI} \
+    leafpad \
+    pcmanfm \
+    vte \
     "
 PTH = "pth"
 PTH_libc-uclibc = ""
-- 
1.7.1


