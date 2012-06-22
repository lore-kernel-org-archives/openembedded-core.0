Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Si7n4-0007xe-9W
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 19:37:02 +0200
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 5AFAB3044F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 13:26:00 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 10:25:49 -0700
Message-Id: <cover.1340385690.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 5AFAB3044F.D4E32
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] Recipe upgrades - gzip and sudo
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
X-List-Received-Date: Fri, 22 Jun 2012 17:37:02 -0000

Hello,

These are some trivial recipe upgrades for gzip and sudo. They have
been build-tested for all 5 of our qemu architectures, and I've done
a visual inspection of the package output to watch for any troublesome
differences. (I do intend to start using buildhistory soon)

Note, this pull request is for oe-core master.

Scott

The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:

  [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/recipe-upgrades-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-oe

Scott Garman (2):
  gzip: upgrade to 1.5
  sudo: upgrade to 1.8.5p2

 meta/recipes-extended/gzip/gzip.inc                |    7 +++++--
 meta/recipes-extended/gzip/gzip_1.4.bb             |   10 ----------
 meta/recipes-extended/gzip/gzip_1.5.bb             |   10 ++++++++++
 meta/recipes-extended/sudo/sudo.inc                |    2 +-
 .../sudo/{sudo_1.8.4p4.bb => sudo_1.8.5p2.bb}      |    6 +++---
 5 files changed, 19 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-extended/gzip/gzip_1.4.bb
 create mode 100644 meta/recipes-extended/gzip/gzip_1.5.bb
 rename meta/recipes-extended/sudo/{sudo_1.8.4p4.bb => sudo_1.8.5p2.bb} (83%)

-- 
1.7.9.5



