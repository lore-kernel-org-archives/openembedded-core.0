Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8Cea-0002by-29
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:31:48 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 91AB82FE9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 11:22:51 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 08:22:54 -0700
Message-Id: <cover.1331824888.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 91AB82FE9B.E3E5C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/4] Recipe upgrades - sudo, at, base-passwd
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
X-List-Received-Date: Thu, 15 Mar 2012 15:31:48 -0000

Hello,

Here are some recipe upgrades for sudo, at, and base-passwd.

These recipes have been build tested on all 5 of our qemu architectures.
I have also done a visual inspection of the image and package output
between the previous and new versions of each recipe to check for
potential errors. 

The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:

  qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades2-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades2-oesgarman/recipe-upgrades2-oe

Scott Garman (4):
  sudo: upgrade to 1.8.4p4
  at: upgrade to 3.1.13
  base-passwd: upgrade to 3.5.24
  distro_tracking: update sudo, at, base-passwd

 .../conf/distro/include/distro_tracking_fields.inc |   24 +++++++++---------
 .../nobash.patch                                   |    0
 .../root-home.patch                                |    0
 ...base-passwd_3.5.22.bb => base-passwd_3.5.24.bb} |   16 ++++++------
 .../at/{at_3.1.12.bb => at_3.1.13.bb}              |   13 ++++-----
 .../configure-add-enable-pam.patch                 |    0
 .../at/{at-3.1.12 => files}/configure.patch        |    0
 .../fix_parallel_build_error.patch                 |    0
 .../at/files/nonstripbinaries.patch                |   26 --------------------
 .../at/{at-3.1.12 => files}/pam.conf.patch         |    0
 meta/recipes-extended/at/files/use-ldflags.patch   |    5 ++-
 .../sudo/{sudo_1.8.4.bb => sudo_1.8.4p4.bb}        |    6 ++--
 12 files changed, 32 insertions(+), 58 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.22 => base-passwd-3.5.24}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.22 => base-passwd-3.5.24}/root-home.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.22.bb => base-passwd_3.5.24.bb} (95%)
 rename meta/recipes-extended/at/{at_3.1.12.bb => at_3.1.13.bb} (88%)
 rename meta/recipes-extended/at/{at-3.1.12 => files}/configure-add-enable-pam.patch (100%)
 rename meta/recipes-extended/at/{at-3.1.12 => files}/configure.patch (100%)
 rename meta/recipes-extended/at/{at-3.1.12 => files}/fix_parallel_build_error.patch (100%)
 delete mode 100644 meta/recipes-extended/at/files/nonstripbinaries.patch
 rename meta/recipes-extended/at/{at-3.1.12 => files}/pam.conf.patch (100%)
 rename meta/recipes-extended/sudo/{sudo_1.8.4.bb => sudo_1.8.4p4.bb} (83%)

-- 
1.7.5.4



