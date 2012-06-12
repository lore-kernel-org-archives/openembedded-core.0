Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeXzn-00024v-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:24 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 4B9552FD1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:43 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:31 -0700
Message-Id: <cover.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 4B9552FD1D.0F136
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: RFC: [PATCH 00/16] denzil pull request 2
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:24 -0000

Hello,

This is the second pull request for the oe-core denzil branch, based on
a set of commits I've been testing from my sgarman/denzil-next branch.

I'm submitting this as an RFC so the community can offer feedback as
soon as possible. I'm planning on running this through the Yocto
autobuilder tonight and will reply to this thread with test results.
Assuming we get green builds, the goal is to get this pull request
merged into oe-core's denzil branch fairly quickly, so please speak
up if you have any comments or concerns with these commits.

Thanks,

Scott

The following changes since commit d7bf94647f17c0382caad8af0bdda837b14b22dc:

  fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 16:20:31 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull2

Jesse Zhang (1):
  beecrypt: disable java

Joe Slater (1):
  shared-mime-info: fix build race condition

Joshua Lock (1):
  sanity.bbclass: copy the data store and finalise before running
    checks

Laurentiu Palcu (1):
  freetype: upgrade to 2.4.9

Mihai Lindner (1):
  sudo: fixed wrong `chmod` path

Paul Eggleton (1):
  classes/sanity: send sanity check failure as a separate event for Hob

Paul Gortmaker (1):
  gitignore: add wildcard to match toplevel patch files

Richard Purdie (2):
  bitbake.conf: Improve wget timeouts
  image.bbclass: Ensure ${S} is cleaned at the start of rootfs
    generation

Robert Yang (1):
  rpm 5.4.0: respect to the arch when choose the alternatives

Scott Garman (1):
  runqemu-ifup: enable arp proxying

Song.Li (1):
  groff: Fix build on Fedora 17

Tom Zanussi (2):
  gnupg: add libusb to DEPENDS
  gnupg: disable CCID driver

Xiaofeng Yan (1):
  ncurses: Avoid occasional builling failure when having parallel
    processable task

Zhai Edwin (1):
  webkit-gtk: Use glib as unicode backend to avoid browser crash

 .gitignore                                         |    1 +
 meta/classes/image.bbclass                         |    1 +
 meta/classes/sanity.bbclass                        |  143 +++++++++++---------
 meta/conf/bitbake.conf                             |    8 +-
 meta/recipes-core/ncurses/ncurses.inc              |   23 +++-
 .../rpm/rpm/rpm-respect-arch.patch                 |   67 +++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |   24 +++-
 meta/recipes-extended/sudo/sudo_1.8.4p4.bb         |    6 +-
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.8.bb => freetype_2.4.9.bb}       |    4 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   10 +-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    4 +-
 meta/recipes-support/gnupg/gnupg_2.0.18.bb         |    3 +-
 .../shared-mime-info/install-data-hook.patch       |   21 +++
 .../shared-mime-info/shared-mime-info_0.91.bb      |    5 +-
 scripts/runqemu-ifup                               |    1 +
 17 files changed, 240 insertions(+), 84 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
 rename meta/recipes-graphics/freetype/{freetype-2.4.8 => freetype-2.4.9}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.8.bb => freetype_2.4.9.bb} (91%)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch

-- 
1.7.9.5



