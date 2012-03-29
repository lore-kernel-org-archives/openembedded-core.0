Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SDHs5-00041U-BV
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:06:45 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0B630304FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:57:37 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:57:36 -0700
Message-Id: <cover.1333036186.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0B630304FF.5147D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu change to show early boot messages
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
X-List-Received-Date: Thu, 29 Mar 2012 16:06:45 -0000

Hello,

This pull request sets console=ttyS0 in the kernel options when booting
images with the nographic option to runqemu. It is a bugfix for
[YOCTO #1475].

I have runtime tested it on all 5 of our QEMU architectures using
core-image-minimal, both for standard boot cases as well as booting
via NFS. 

Scott

The following changes since commit 8fe53bdc807184bc41469d8587368b31192e6252:

  ghostscript: Fix remaining CP_ prallel make races (2012-03-29 09:44:36 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/runqemu-fix-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-fix-oe

Scott Garman (1):
  runqemu: set console=ttyS0 when running with nographic option

 scripts/runqemu |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.5.4



