Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S2Uzf-0006PC-40
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 22:53:59 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 72E5C2FF3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 16:45:28 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 13:45:27 -0800
Message-Id: <cover.1330465479.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 72E5C2FF3C.D5D4B
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] sudo upgrade
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
X-List-Received-Date: Tue, 28 Feb 2012 21:53:59 -0000

Hello,

This upgrade to sudo fixes a significant security vulnerability.

The following changes since commit 61216d2743502ef38955054aad6a4f2ed63e6d43:

  licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES (2012-02-28 17:51:42 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/sudo-upgrade-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/sudo-upgrade-final

Scott Garman (1):
  sudo: upgrade to 1.8.4

 meta/recipes-extended/sudo/sudo.inc                |    7 ++++---
 .../sudo/{sudo_1.8.3.bb => sudo_1.8.4.bb}          |    4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.3.bb => sudo_1.8.4.bb} (84%)

-- 
1.7.5.4



