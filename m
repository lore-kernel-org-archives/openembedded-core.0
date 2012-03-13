Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7HIx-0003Qa-QP
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 03:17:39 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 8A18330511
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 22:08:48 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 19:08:44 -0700
Message-Id: <cover.1331604310.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 8A18330511.0B4DC
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/3] ncurses library location fix
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
X-List-Received-Date: Tue, 13 Mar 2012 02:17:40 -0000

Hello,

This pull request improves the way ncurses libraries are installed,
moving only libncurses, libncursesw, and libtinfo soname libs into
base_libdir, and leaving everything else in libdir. This is how
ncurses is packaged on my Ubuntu host, and doing things this way
fixes bug #2070 so ncurses will work within python again. It is
also a partial bugfix for bug #1937.

Scott

The following changes since commit f47ada62a3da879006e7cb27479dc9b72c56e923:

  cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH (2012-03-12 17:46:16 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/python-ncurses-fix-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/python-ncurses-fix-oe

Scott Garman (3):
  path.py: add make_relative_symlink method
  ncurses: move only libncurses and libtinfo to base_libdir
  gettext: do not set libncurses prefix explicitly

 meta/lib/oe/path.py                           |   27 +++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    5 +--
 meta/recipes-core/ncurses/ncurses.inc         |   40 +++++++++++++++++-------
 3 files changed, 56 insertions(+), 16 deletions(-)

-- 
1.7.5.4



