Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1R12gX-0006t1-AA
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 22:55:57 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p86Kor38018336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 15:50:53 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p86Korfq027315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 15:50:53 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86KordD006184
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 15:50:53 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Tue, 6 Sep 2011
	15:50:53 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p86KoqMf031102;	Tue, 6 Sep 2011 15:50:53 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 15:40:28 -0500
Message-ID: <1315341632-32153-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v4 meta-oe 0/4] gnome patches
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
X-List-Received-Date: Tue, 06 Sep 2011 20:55:58 -0000
Content-Type: text/plain

Dropped PR=r0 from all recipes
Removed RDEPENDS_

Koen's Feedback:
http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/7008

Joel A Fernandes (4):
  gedit: Imported from OE classic
  gtksourceview: Imported from OE classic
  libgnomecups: Imported from OE Classic
  libgnomeprint: Imported from OE classic

 meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb     |   21 +++
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |   15 ++
 .../recipes-gnome/gnome/libgnomeprint_2.18.7.bb    |   15 ++
 .../recipes-gnome/gtksourceview/files/acinclude.m4 |   90 ++++++++++
 .../recipes-gnome/gtksourceview/files/gtk-doc.m4   |   53 ++++++
 .../recipes-gnome/gtksourceview/files/gtk-doc.make |  173 ++++++++++++++++++++
 .../gtksourceview/gtksourceview2_2.10.0.bb         |   29 ++++
 7 files changed, 396 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/acinclude.m4
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.m4
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/gtk-doc.make
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.0.bb



