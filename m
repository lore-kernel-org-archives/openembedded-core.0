Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAFup-00078m-A6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:29:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8DBd2006930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 00:13:11 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:13:09 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:14:24 +0800
Message-ID: <cover.1361866256.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/5] V2: Redirect output of postinstall scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 08:29:36 -0000
Content-Type: text/plain

When image feature "debug-tweaks" enabled, redirect output of postinstall scripts
to a log file when image first boot.

[YOCTO #3223]

The following changes since commit 2cc4fe4a0874c42421b1bf3fa100160a9e60a9da:

  upstream_tracking.inc: Coonectivity and multimedia packages updates (2013-02-25 05:58:20 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/debug-tweaks
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/debug-tweaks

Kang Kai (5):
  opkg: save output of postinst scripts when image first boot
  rootfs_deb: remove run-postinsts from ROOTFS_PKGMANAGE
  dpkg: save output of postinstall scripts when image firstboot
  rootfs_rpm: move run-postinsts scripts to rpm recipe
  rpm: save output of postinstall scripts when image first boot

 meta/classes/rootfs_deb.bbclass        |    2 +-
 meta/classes/rootfs_rpm.bbclass        |   23 -----------------------
 meta/recipes-devtools/dpkg/dpkg.inc    |    8 +++++---
 meta/recipes-devtools/opkg/opkg.inc    |    5 ++++-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |   27 +++++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 28 deletions(-)

-- 
1.7.5.4



