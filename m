Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QVnYD-0001tq-Gl
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 18:30:13 +0200
Received: by wwb17 with SMTP id 17so3478560wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2011 09:26:50 -0700 (PDT)
Received: by 10.227.57.81 with SMTP id b17mr4190404wbh.98.1307896010350;
	Sun, 12 Jun 2011 09:26:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm3586187wbb.51.2011.06.12.09.26.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Jun 2011 09:26:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 18:26:39 +0200
Message-Id: <cover.1307895912.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/2] qemu and connman tweaks
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
X-List-Received-Date: Sun, 12 Jun 2011 16:30:13 -0000

2 small patches

The following changes since commit 6a3e57fcd3a172c9b2707510d65741734c98a143:
  Richard Purdie (1):
        Revert "gcc: rebase the patch to avoid patch rejection"

are available in the git repository at:

  git://github.com/koenkooi/oe-core master
  https://github.com/koenkooi/oe-core/tree/master

Koen Kooi (2):
  qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
  connman-gnome 0.5: build from git

 meta/conf/machine/include/qemu.inc                 |    2 +-
 .../connman-gnome/applet_menu_popup_fix.patch      |   19 -
 .../connman/connman-gnome/connman-gnome.patch      | 4162 --------------------
 .../remove-connman-property-desktop-file.patch     |   42 -
 .../connman-gnome/service_name_update.patch        |   36 -
 .../connman/connman-gnome_0.5.bb                   |   13 +-
 6 files changed, 5 insertions(+), 4269 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/applet_menu_popup_fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/remove-connman-property-desktop-file.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/service_name_update.patch



