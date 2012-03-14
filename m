Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7rJk-00009D-RS
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:44:52 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C45072FF38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:36:00 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 09:36:07 -0700
Message-Id: <cover.1331742556.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C45072FF38.85F43
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] ncurses packaging fix [v2]
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
X-List-Received-Date: Wed, 14 Mar 2012 16:44:53 -0000

Hello,

This fixes the ncurses library packaging. Thanks to Andreas Oberritter
for pointing it out.

v2 of this pull request increments INC_PR again, since Paul Eggleton
got a patch into master while my pull request was pending, so it needed
another bump.

Scott

The following changes since commit 8567549a743cb5be157e7988e1f9227d91f48850:

  Revert "alsa-tools: update to 1.0.25" (2012-03-14 15:53:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/ncurses-pkg-fix-oe2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/ncurses-pkg-fix-oe2

Scott Garman (1):
  ncurses: fix packaging of moved libraries

 meta/recipes-core/ncurses/ncurses.inc |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

-- 
1.7.5.4



