Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qgksp-0003bL-Sv
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 23:52:48 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A60E02FF36;
	Tue, 12 Jul 2011 16:26:03 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 13:25:57 -0700
Message-Id: <cover.1310502258.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A60E02FF36.15BAE
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
X-List-Received-Date: Tue, 12 Jul 2011 21:52:48 -0000

Hello,

This adds the RECIPE_MANUAL_CHECK_DATE field for various recipes
that the upstream tracking webapp can't figure out automatically.

The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:

  insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/distro-tracking
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/distro-tracking

Scott Garman (1):
  distro-tracking: add RECIPE_MANUAL_CHECK_DATE for various recipes

 .../conf/distro/include/distro_tracking_fields.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)



