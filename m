Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TEDNx-0006Sf-0T
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 08:03:45 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C07E72FD0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 01:50:58 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 22:50:49 -0700
Message-Id: <cover.1348033737.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C07E72FD0F.37FE6
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu bugfix [v2]
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
X-List-Received-Date: Wed, 19 Sep 2012 06:03:45 -0000

Hello,

This is a fix for Yocto bug #3112, where there are certain edge cases
where the bitbake command is avalable to fails to run. Previously we
mistakenly treated that as the same case as if bitbake didn't exist in
the user's $PATH, and this fix causes us to show the user the output
of bitbake so they can view the error message.

v2 includes rework based on feedback from Mark Hatle (thanks!).

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



