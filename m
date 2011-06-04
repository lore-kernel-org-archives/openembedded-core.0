Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QSvPx-0008Eu-7M
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Jun 2011 20:17:49 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 049D42FF42;
	Sat,  4 Jun 2011 14:14:27 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jun 2011 11:14:21 -0700
Message-Id: <cover.1307210880.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 049D42FF42.467E5
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/1] distro tracking updates
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
X-List-Received-Date: Sat, 04 Jun 2011 18:17:49 -0000

This pull request updates some distro tracking fields and should
quiet some manual check warnings the Yocto package reporting system
has been sending me recently.

The following changes since commit 6b5d323b6c8960a0999dbafa0422fe127fd0fa97:

  event: don't catch systemexit from handler execution (2011-06-02 23:58:05 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/version-checks
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/version-checks

Scott Garman (1):
  distro-tracking: updates

 .../conf/distro/include/distro_tracking_fields.inc |   34 +++++++++++--------
 1 files changed, 20 insertions(+), 14 deletions(-)



