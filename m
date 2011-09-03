Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qzz7h-0001wN-QD
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 00:55:37 +0200
Received: from localhost.localdomain (c-98-246-165-28.hsd1.or.comcast.net
	[98.246.165.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 4810D2FF7D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2011 18:50:35 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 15:50:29 -0700
Message-Id: <cover.1315090054.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 4810D2FF7D.A6E35
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu fixes
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
X-List-Received-Date: Sat, 03 Sep 2011 22:55:38 -0000

Hello,

This pull request standardizes/normalizes the way custom options are
passed to QEMU and the kernel boot parameters.

The old manner of specifying custom options to QEMU in this script
using angle brackets was a frequent source of confusion. Meanwhile,
Otavio Salvador added a decent method of specifying custom kernel
boot options to this script. This patch documents the bootparams
option and adds a similar way of specifying custom QEMU options
using qemuparams="".
    
This fixes [YOCTO #1019]

Scott Garman

The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:

  populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH (2011-09-02 23:38:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/runqemu-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-fixes

Scott Garman (1):
  runqemu: standardize ability to specify custom qemu/kenel boot
    options

 scripts/runqemu |   32 ++++++++++++++++++--------------
 1 files changed, 18 insertions(+), 14 deletions(-)



