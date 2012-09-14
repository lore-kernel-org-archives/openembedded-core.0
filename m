Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TCfJb-0007Dp-FT
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 01:28:51 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D45E53053D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 19:16:04 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 16:15:58 -0700
Message-Id: <cover.1347664421.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D45E53053D.D7440
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu bugfix
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
X-List-Received-Date: Fri, 14 Sep 2012 23:28:51 -0000

Hello,

This is a fix for Yocto bug #3112, where there are certain edge cases
where the bitbake command is avalable to fails to run. Previously we
mistakenly treated that as the same case as if bitbake didn't exist in
the user's $PATH, and this fix causes us to show the user the output
of bitbake so they can view the error message.

Scott

The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:

  local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/runqemu-bitbake-fix-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-bitbake-fix-oe

Scott Garman (1):
  runqemu: show bitbake errors to user

 scripts/runqemu |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
1.7.9.5



