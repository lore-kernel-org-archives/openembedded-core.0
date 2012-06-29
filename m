Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisP-00087L-Nv
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:18 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLNEc028202 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:23 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLNaA028201
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:12 -0700
Message-Id: <cover.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/7] Simplify lib_package
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:18 -0000

This series continues the PACKAGES changes and takes
advanatage of having a ${PN}-bin, by adding a
PACKGE_BEFORE_PN in the PACKAGES list.

Update other recipes that had defined ${PN}-bin.

I verified these changes did not affect any packages directly
with buildhistory, which can be seen at poky-contrib/sgw/libhistory

Sau!


The following changes since commit 3347ea9e300514d07315a8a044b9b3be206a30ea:

  upstream_tracking: update boost (2012-06-29 14:07:59 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgw/lib_package
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/lib_package

Saul Wold (7):
  bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
  lib_package: use PACKAGE_BEFORE_PN
  libacpi: use lib_package bbclass
  pulseaudio: use lib_package bbclass
  db: use lib_package bbclass
  gnutls: use lib_package bbclass
  speex: use lib_package bbclass

 meta/classes/lib_package.bbclass                     |    3 +--
 meta/conf/bitbake.conf                               |    3 ++-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb              |    7 ++-----
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    3 +--
 meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb |    2 +-
 meta/recipes-multimedia/speex/speex_1.2rc1.bb        |    8 ++------
 meta/recipes-support/db/db_5.3.15.bb                 |    4 +---
 meta/recipes-support/gnutls/gnutls.inc               |   14 +++-----------
 8 files changed, 13 insertions(+), 31 deletions(-)

-- 
1.7.10.4



