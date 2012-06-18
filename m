Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiFj-0008QV-Ed
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:08:47 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C235230461
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 15:57:57 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:57:54 -0700
Message-Id: <cover.1340038108.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C235230461.34BBD
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/6] denzil pull request 3
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
X-List-Received-Date: Mon, 18 Jun 2012 20:08:47 -0000

Hello,

This is the third pull request for the oe-core denzil branch, based on
a set of commits I've been testing from my sgarman/denzil-next branch.

These commits have undergone the following testing on the autobuilder:

nightly:


nightly-multilib:
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/114

nightly-non-gpl3:
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/115

nightly-tiny:
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/97

nightly-meta-intel:
http://autobuilder.yoctoproject.org:8010/builders/nightly-meta-intel/builds/106

I'll note these tests were done with the poky-based tree.

Scott

The following changes since commit 7c767d3723e0b55d3bcd3864a9cdbce6d11d5b35:

  freetype: upgrade to 2.4.9 (2012-06-12 13:29:31 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull3

Gary Thomas (1):
  webkit-gtk: Apply work around for all PowerPC targets

Laurentiu Palcu (1):
  sanity.bbclass: warn the user if BBPATH contains wrong entries

Nitin A Kamble (1):
  eglibc: package mtrace separately

Richard Purdie (1):
  openjade-native: Ensure we reautoconf the package

Saul Wold (2):
  quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
  eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS

 meta/classes/sanity.bbclass                        |   13 ++-
 meta/recipes-core/eglibc/eglibc-package.inc        |    7 +-
 meta/recipes-core/eglibc/eglibc.inc                |    2 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |    4 +
 .../openjade/openjade-1.3.2/reautoconf.patch       |   83 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    5 ++
 meta/recipes-devtools/quilt/quilt_0.51.bb          |    5 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   15 ++--
 10 files changed, 127 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch

-- 
1.7.9.5



