Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7ujt-00051I-Uz
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 21:24:06 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 238882FF3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 16:15:14 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 13:15:19 -0700
Message-Id: <cover.1331756004.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 238882FF3B.A40AE
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] ncurses packaging fix [v3]
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
X-List-Received-Date: Wed, 14 Mar 2012 20:24:06 -0000

Hello,

This fixes the ncurses library packaging.

v3 of this pull request uses do_split_packages to package the libraries
in base_libdir, and includes a commit which bumps PR for all recipes
which DEPEND on ncurses.

Scott

The following changes since commit 8567549a743cb5be157e7988e1f9227d91f48850:

  Revert "alsa-tools: update to 1.0.25" (2012-03-14 15:53:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/ncurses-pkg-fix3-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/ncurses-pkg-fix3-oe

Scott Garman (2):
  ncurses: fix packaging of moved libraries
  PR bump for all recipes that DEPEND on ncurses

 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    6 ++++--
 meta/recipes-core/readline/readline_5.2.bb         |    2 +-
 meta/recipes-core/readline/readline_6.2.bb         |    2 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
 meta/recipes-devtools/cmake/cmake.inc              |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-extended/bash/bash_3.2.48.bb          |    2 +-
 meta/recipes-extended/bash/bash_4.2.bb             |    2 +-
 meta/recipes-extended/less/less_444.bb             |    2 +-
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |    2 +-
 meta/recipes-extended/mc/mc_4.8.1.bb               |    2 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    2 +-
 meta/recipes-extended/psmisc/psmisc_22.16.bb       |    2 +-
 meta/recipes-extended/screen/screen_4.0.3.bb       |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    2 +-
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    2 +-
 meta/recipes-kernel/powertop/powertop_1.13.bb      |    2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 23 files changed, 26 insertions(+), 24 deletions(-)

-- 
1.7.5.4



