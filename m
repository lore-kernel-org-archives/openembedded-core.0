Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QjDF7-0004ts-F8
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:33:57 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id F0D6730535;
	Tue, 19 Jul 2011 12:29:47 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 09:29:39 -0700
Message-Id: <cover.1311092892.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: F0D6730535.F042E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/2] libpng upgrade
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
X-List-Received-Date: Tue, 19 Jul 2011 16:33:57 -0000

Hello,

This upgrade to libpng addresses some security vulnerabilities. It
has been build tested on all five of our qemu MACHINEs.

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/libpng-upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/libpng-upgrade

Scott Garman (2):
  libpng: upgrade to v1.2.46
  distro-tracking: update libpng

 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++-----
 .../libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb}  |   11 ++++++-----
 2 files changed, 11 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb} (55%)



