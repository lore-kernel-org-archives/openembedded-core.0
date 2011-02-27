Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyl-0007Da-Im
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:51 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:29 -0800 (PST)
Received: by 10.227.138.17 with SMTP id y17mr3809776wbt.13.1298799029590;
	Sun, 27 Feb 2011 01:30:29 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm2266294wbd.22.2011.02.27.01.30.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:29 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:30:03 +0100
Message-Id: <210131b80a736defedcfe97f1d39195f9998e4e5.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 49/50] linux-yocto: add crownbay BSP infrastructure
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:29 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the meta SRCREV to grab this linux-yocto commit:

    meta: add crownbay BSP infrastructure

    Import the 2.6.34 crownbay infrastructure and update for the
    2.6.37 kernel. This also brings in the feature/drm-emgd that
    the crownbay requires.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 5e9c39f..2f33630 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -108,7 +108,7 @@ SRCREV_machine_pn-linux-yocto_atom-pc ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3
 SRCREV_machine_pn-linux-yocto_routerstationpro ?= "17dedeb17887eb398743b04615302b61bd95ffdd"
 SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "6117f19403ccd5c288ce553def432925296a28b7"
 SRCREV_machine_pn-linux-yocto_beagleboard ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
-SRCREV_machine_pn-linux-yocto ?= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
+SRCREV_machine_pn-linux-yocto ?= "e2cabadc059ad8d91f7e4a023106620d93abd23a"
 SRCREV_meta_pn-linux-yocto ?= "e2737075b79e4fc682e41051cf1c0bc47a47d502"
 SRCREV_pn-linux-libc-headers-yocto ??= "2b412826bbeb4a16abe2ea74f2456ab880c6e3c1"
 SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
-- 
1.6.6.1



