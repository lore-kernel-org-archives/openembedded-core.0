Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QWXKr-0004xx-Pc
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 19:23:30 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 588C9304FD;
	Tue, 14 Jun 2011 13:19:56 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 10:19:45 -0700
Message-Id: <cover.1308071077.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 588C9304FD.1B615
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/2] sudo upgrade
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
X-List-Received-Date: Tue, 14 Jun 2011 17:23:30 -0000

Hello,

Here's a recipe upgrade I squeezed in between some other things this
morning.

The following changes since commit 7aa7673459376aff911cef820c9417c998d1aa96:

  meta-yocto/linux-yocto: update to match the renamed linux-yocto recipes (2011-06-14 09:21:32 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/sudo-upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/sudo-upgrade

Scott Garman (2):
  sudo: upgrade to v1.8.1p2
  distro_tracking: update sudo tracking info

 .../conf/distro/include/distro_tracking_fields.inc |    8 +++---
 meta/recipes-extended/sudo/sudo.inc                |   27 ++++++++-----------
 .../sudo/{sudo_1.7.4p6.bb => sudo_1.8.1p2.bb}      |    4 +-
 3 files changed, 17 insertions(+), 22 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.7.4p6.bb => sudo_1.8.1p2.bb} (52%)



