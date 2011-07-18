Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QieEl-0004AU-Bx
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 05:11:15 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 972C830528;
	Sun, 17 Jul 2011 23:07:05 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jul 2011 20:06:57 -0700
Message-Id: <cover.1310958357.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 972C830528.21782
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/2] Upstream-Status patch additions
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
X-List-Received-Date: Mon, 18 Jul 2011 03:11:15 -0000

Hello,

This pull request simply adds the Upstream-Status metadata field to
patches for the man and unfs-server recipes.

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/upstream-status
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/upstream-status

Scott Garman (2):
  man: add Upstream-Status field to paches
  unfs-server: add Upstream-Status field to patches

 .../001-2.2b47-2.2b51.patch                        |    5 +++++
 .../unfs-server-2.1+2.2beta47/002-destdir.patch    |    5 +++++
 .../unfs-server-2.1+2.2beta47/003-manpages.patch   |    5 +++++
 .../unfs-server-2.1+2.2beta47/004-strsignal.patch  |    5 +++++
 .../unfs-server-2.1+2.2beta47/005-sys-time.patch   |    5 +++++
 .../unfs-server-2.1+2.2beta47/006-reiserfs.patch   |    5 +++++
 .../unfs-server-2.1+2.2beta47/007-map.patch        |    5 +++++
 .../unfs-server-2.1+2.2beta47/008-configure.patch  |    5 +++++
 .../unfs-server-2.1+2.2beta47/009-multirw.patch    |    5 +++++
 .../unfs-server-2.1+2.2beta47/010-realpath.patch   |    5 +++++
 .../011-fno-strict-aliasing.patch                  |    5 +++++
 .../unfs-server-2.1+2.2beta47/012-nostrip.patch    |    5 +++++
 .../unfs-server-2.1+2.2beta47/013-mntpathlen.patch |    5 +++++
 .../014-uninitialized.patch                        |    5 +++++
 .../unfs-server-2.1+2.2beta47/015-setattr.patch    |    5 +++++
 .../016-makefile.in.patch                          |    5 +++++
 .../017-wrs-dynamic-rpc.patch                      |    5 +++++
 .../018-remove-tcp-wrappers.patch                  |    5 +++++
 .../019-pid-before-fork.patch                      |    5 +++++
 .../020-undefined-chmod-fix.patch                  |    5 +++++
 .../unfs-server-2.1+2.2beta47/021-nolibwrap.patch  |    5 +++++
 .../022-add-close-on-exec-descriptors.patch        |    5 +++++
 .../man/man-1.6f/man-1.5g-nonrootbuild.patch       |    4 ++++
 .../man/man-1.6f/man-1.5h1-gencat.patch            |    4 ++++
 .../man/man-1.6f/man-1.5h1-make.patch              |    4 ++++
 .../man/man-1.6f/man-1.5i2-initial.patch           |    4 ++++
 .../man/man-1.6f/man-1.5i2-newline.patch           |    4 ++++
 .../man/man-1.6f/man-1.5i2-overflow.patch          |    4 ++++
 .../man/man-1.6f/man-1.5j-i18n.patch               |    4 ++++
 .../man/man-1.6f/man-1.5j-nocache.patch            |    4 ++++
 .../man/man-1.6f/man-1.5j-utf8.patch               |    4 ++++
 .../man/man-1.6f/man-1.5k-confpath.patch           |    4 ++++
 .../man/man-1.6f/man-1.5k-nonascii.patch           |    4 ++++
 .../man/man-1.6f/man-1.5k-sofix.patch              |    4 ++++
 .../man/man-1.6f/man-1.5m2-bug11621.patch          |    4 ++++
 .../man/man-1.6f/man-1.5m2-buildroot.patch         |    4 ++++
 .../man/man-1.6f/man-1.5m2-multiple.patch          |    4 ++++
 .../man-1.6f/man-1.5m2-no-color-for-printing.patch |    4 ++++
 .../man/man-1.6f/man-1.5m2-sigpipe.patch           |    4 ++++
 .../man/man-1.6f/man-1.5m2-tv_fhs.patch            |    4 ++++
 .../man/man-1.6f/man-1.6e-i18n_whatis.patch        |    4 ++++
 .../man/man-1.6f/man-1.6e-lzma+xz-support.patch    |    4 ++++
 .../man/man-1.6f/man-1.6e-mandirs.patch            |    4 ++++
 .../man/man-1.6f/man-1.6e-new_sections.patch       |    4 ++++
 .../man/man-1.6f/man-1.6e-ro_usr.patch             |    4 ++++
 .../man/man-1.6f/man-1.6e-security.patch           |    4 ++++
 .../man-1.6e-use_i18n_vars_in_a_std_way.patch      |    4 ++++
 .../man/man-1.6f/man-1.6e-whatis2.patch            |    4 ++++
 48 files changed, 214 insertions(+), 0 deletions(-)



