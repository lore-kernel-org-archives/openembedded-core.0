Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJXPa-0000lU-AV
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 00:27:26 +0200
Received: from localhost (m8a2036d0.tmodns.net [208.54.32.138])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9D97330434
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 18:14:15 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:13:50 -0700
Message-Id: <cover.1349302333.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9D97330434.3A970
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/3] runqemu multiple unfs instances fix
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
X-List-Received-Date: Wed, 03 Oct 2012 22:27:27 -0000

Hello,

Here's a bugfix to allow multiple instances of unfs-based qemu to
run. A bit thank you to Rudolf J Streif for proposing the final
commit in this series.

Scott

The following changes since commit ae9dbd0e1e26ba2b35cbd08ec731aee62adedc23:

  distrodata: Update distrocheck functions (2012-10-03 17:37:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/runqemu-unfs-fix-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-unfs-fix-oe

Scott Garman (3):
  runqemu-export-rootfs: use consistent whitespace
  runqemu-export-rootfs: improve rpcbind error detection
  runqemu: allow multiple unfs instances to run simultaneously

 scripts/runqemu-export-rootfs |  113 +++++++++++++++++++++++------------------
 scripts/runqemu-internal      |    4 +-
 2 files changed, 66 insertions(+), 51 deletions(-)

-- 
1.7.9.5



