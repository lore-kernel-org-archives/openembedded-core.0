Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRWtW-00078t-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 00:59:07 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 718392FF66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 18:49:07 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 15:49:12 -0700
Message-Id: <cover.1336430865.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 718392FF66.17DB3
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/3] opensp and openssh recipe upgrades
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
X-List-Received-Date: Mon, 07 May 2012 22:59:07 -0000

Hello,

This pull request includes upgrades for the opensp and openssh recipes.
They have been build-tested on all 5 of our QEMU architectures. The
distro tracking updates include a couple of recipes that I missed in
previous pull requests.

Scott

The following changes since commit 2929e7d590862d9649458c90804e79a1dce40423:

  glib-2.0: Fix issues with libelf dependency creeping in (2012-05-07 10:53:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-oe

Scott Garman (3):
  openssh: upgrade to 6.0p1
  opensp: upgrade to 1.5.2
  distro_tracking: updates for upgraded recipes

 .../conf/distro/include/distro_tracking_fields.inc |   25 +-
 .../openssh/{openssh-5.9p1 => openssh-6.0p1}/init  |    0
 .../{openssh-5.9p1 => openssh-6.0p1}/nostrip.patch |    0
 .../{openssh-5.9p1 => openssh-6.0p1}/ssh_config    |    0
 .../openssh/{openssh-5.9p1 => openssh-6.0p1}/sshd  |    0
 .../{openssh-5.9p1 => openssh-6.0p1}/sshd_config   |    0
 .../openssh/{openssh_5.9p1.bb => openssh_6.0p1.bb} |    8 +-
 .../opensp/opensp/attributevalue.patch             |   65 -
 .../opensp/opensp/fix-docdir.patch                 |   17 -
 meta/recipes-devtools/opensp/opensp/m4.patch       | 1928 --------------------
 .../opensp/opensp/rangmap-fix.patch                |   18 -
 .../opensp/{opensp_1.5.bb => opensp_1.5.2.bb}      |   20 +-
 12 files changed, 23 insertions(+), 2058 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.9p1.bb => openssh_6.0p1.bb} (94%)
 delete mode 100644 meta/recipes-devtools/opensp/opensp/attributevalue.patch
 delete mode 100644 meta/recipes-devtools/opensp/opensp/fix-docdir.patch
 delete mode 100644 meta/recipes-devtools/opensp/opensp/m4.patch
 delete mode 100644 meta/recipes-devtools/opensp/opensp/rangmap-fix.patch
 rename meta/recipes-devtools/opensp/{opensp_1.5.bb => opensp_1.5.2.bb} (71%)

-- 
1.7.5.4



