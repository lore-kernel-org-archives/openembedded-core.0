Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T11Ja-0003iU-FQ
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 22:32:42 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 45A6A30425
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 16:20:40 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 13:20:37 -0700
Message-Id: <cover.1344752146.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 45A6A30425.27D56
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu ramfs support
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
X-List-Received-Date: Mon, 13 Aug 2012 20:32:42 -0000

Added support for booting ramfs-based images (e.g, poky-tiny) which
do not have block device support.
    
This fixes [YOCTO #2612].

Scott

The following changes since commit 5290e82ecef08b5e573d7442627276d7b42c6b93:

  foomatic: fix perl path for target (2012-08-08 10:05:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib sgarman/runqemu-ramfs-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-ramfs-oe

Scott Garman (1):
  runqemu: support booting ramfs-based images

 scripts/runqemu          |    6 ++++++
 scripts/runqemu-internal |    5 +++++
 2 files changed, 11 insertions(+)

-- 
1.7.9.5



