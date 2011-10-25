Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RIoi5-0004jA-Q0
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:39:02 +0200
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B284B304CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 17:32:54 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 14:32:44 -0700
Message-Id: <cover.1319576293.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B284B304CC.EBE35
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/5] Recipe upgrades
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
X-List-Received-Date: Tue, 25 Oct 2011 21:39:02 -0000

Hello,

Here is a set of some straightfoward recipe upgrades: sudo, grep,
mtools, and openssh.

Build testing: These have been successfully built for all 5 qemu
architectures.

Runtime testing: I have performed basic runtime testing for all of
these recipe upgrades as well within a qemux86 session.

The following changes since commit f586aaa8d00361a9597a546d665077c75cf4d520:

  libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade (2011-10-25 08:36:01 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-final

Scott Garman (5):
  sudo: upgrade to 1.8.3
  grep: upgrade to 2.9
  mtools: upgrade to 4.0.17
  openssh: upgrade to 5.9p1
  distro_tracking_fields: updates for sudo, mtools, grep, and openssh

 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 .../openssh/{openssh-5.8p2 => openssh-5.9p1}/init  |    0
 .../{openssh-5.8p2 => openssh-5.9p1}/nostrip.patch |    0
 .../{openssh-5.8p2 => openssh-5.9p1}/ssh_config    |    0
 .../openssh/{openssh-5.8p2 => openssh-5.9p1}/sshd  |    0
 .../{openssh-5.8p2 => openssh-5.9p1}/sshd_config   |    0
 .../openssh/{openssh_5.8p2.bb => openssh_5.9p1.bb} |    4 +-
 .../mtools/{mtools_4.0.16.bb => mtools_4.0.17.bb}  |    4 +-
 .../grep/{grep_2.8.bb => grep_2.9.bb}              |    4 +-
 .../sudo/{sudo_1.8.1p2.bb => sudo_1.8.3.bb}        |    6 ++--
 10 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.8p2.bb => openssh_5.9p1.bb} (96%)
 rename meta/recipes-devtools/mtools/{mtools_4.0.16.bb => mtools_4.0.17.bb} (80%)
 rename meta/recipes-extended/grep/{grep_2.8.bb => grep_2.9.bb} (88%)
 rename meta/recipes-extended/sudo/{sudo_1.8.1p2.bb => sudo_1.8.3.bb} (82%)

-- 
1.7.5.4



