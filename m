Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXGGR-0001cN-Rk
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 19:21:55 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2707F30519;
	Thu, 16 Jun 2011 13:18:13 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 10:18:06 -0700
Message-Id: <cover.1308244596.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2707F30519.07342
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/2] mtools upgrade
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
X-List-Received-Date: Thu, 16 Jun 2011 17:21:56 -0000

Upgrade the mtools recipe to the latest upstream release, v4.0.16.

Build tested for all 5 of our qemu MACHINEs.

The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16845c:

  meta-yocto: use FILESEXTRAPATHS_prepend := in all bbappends (2011-06-15 11:49:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/mtools-upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/mtools-upgrade

Scott Garman (2):
  mtools: upgrade to v4.0.16
  distro_tracking: update mtools tracking info

 .../conf/distro/include/distro_tracking_fields.inc |    9 ++++-----
 .../mtools/mtools/no-x11.gplv3.patch               |    9 ++++++---
 .../mtools/{mtools_4.0.15.bb => mtools_4.0.16.bb}  |    4 ++--
 3 files changed, 12 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.15.bb => mtools_4.0.16.bb} (80%)



