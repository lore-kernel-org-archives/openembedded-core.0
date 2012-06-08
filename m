Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sd1M5-0000z4-PO
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 17:44:06 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q58FXVfP011107;
	Fri, 8 Jun 2012 08:33:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Jun 2012 11:42:26 -0400
Message-Id: <cover.1339169970.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-libc-headers: set default LINUXLIBCVERSION to 3.4
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
X-List-Received-Date: Fri, 08 Jun 2012 15:44:07 -0000

Richard/Saul,

Fresh of my typo success of my last series .. I rebuilt core-image-minal
for all qemu machines from scratch with this in place. No issues were
seen here, and I'm not sufficiently paranoid for 10 people.

The 3.4 kernel is released, and is the default for qemu* builds, so
we can safely update the default libc-headers version to 3.4.

Cheers,

Bruce

The following changes since commit 0612cf3fcb3365e7721a2d5c331f8cd2647ae60b:
  Kang Kai (1):
        hob2: create a standalone deploy image tool

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/libc-headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers

Bruce Ashfield (1):
  linux-libc-headers: set default LINUXLIBCVERSION to 3.4

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb



