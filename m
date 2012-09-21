Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TFBYM-00050w-6S
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:18:30 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 27C3530451
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 18:05:37 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 15:06:01 -0700
Message-Id: <cover.1348265025.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 27C3530451.826CE
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu tap device fix
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
X-List-Received-Date: Fri, 21 Sep 2012 22:18:30 -0000

Hello,

n Fedora systems (and likely others), ifconfig returns interface
names that end with a colon. Make sure we strip the colon off
the tap device name before using it.

This fixes [YOCTO #3028] 

I don't have a Fedora system handy, so I asked Tom Zanussi to test
this patch, and he confirms it works for him.

Scott

The following changes since commit 5e03d1e83d0536a2fc69a88d3e5407108836203f:

  gcc: Use 4.7.2 release tarball (2012-09-21 14:55:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib sgarman/runqemu-tap-fix-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-tap-fix-oe

Scott Garman (1):
  runqemu: work with tap device names that end with a colon

 scripts/runqemu-gen-tapdevs |    2 +-
 scripts/runqemu-internal    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5



