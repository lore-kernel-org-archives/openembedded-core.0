Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SzIha-0000Qm-Bq
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 04:42:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q792UXTE003554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 19:30:33 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 8 Aug 2012 19:30:33 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Aug 2012 10:30:29 +0800
Message-ID: <cover.1344479229.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 09 Aug 2012 02:42:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If gtk+ is added to core-image-minimal, postinstall script failed on boot:

Running postinst /etc/rpm-postinsts/104...
gtk-update-icon-cache: No theme index file.
ERROR: postinst /etc/rpm-postinsts/104 failed.

This patch fixed the postinstall script to check for the icon
file first and not run the gtk-update-icon-cache if no icon
is installed.

[YOCTO #2905]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit 1e873271362b770381903098d46c4aec164d81de:

  automake: Fix version reference in path substitutions (2012-08-07 23:35:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/bug2905_gdk_0809
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2905_gdk_0809

Jackie Huang (1):
  gdk-pixbuf: fix the postinstall script failure when no icon is
    installed

 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.7.4



