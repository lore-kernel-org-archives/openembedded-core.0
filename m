Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuZ-0001fg-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:47 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm4VD003000; Thu, 23 Feb 2012 14:48:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CS7rPtGk9Qr1; Thu, 23 Feb 2012 14:48:04 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm1Ke002947
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT);
	Thu, 23 Feb 2012 14:48:02 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>)
	id 1S0YsG-0001j4-Ev; Thu, 23 Feb 2012 13:38:20 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:17 +0000
Message-Id: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 00/16] Various fixes, mostly for WARNING messages
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:58 -0000

These patches mainly fix various warning issues reported by the build but 
there are a couple of other improvements/fixes thrown in.

The following changes since commit a578fbce14b6f3391f28d59f287160e04590fa77:

  netbase: remove redundant assignments (2012-02-22 22:11:27 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib rpurdie/fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rpurdie/fixes

This repository is based against Poky, not OE-Core.

Richard Purdie (16):
  eglibc: Fix package warning
  rpm: Fix LICENSE field
  libusb1: Address unpackaged files warning
  libusb-compat: Address unpackaged files warning
  readline: Add a patch to remove the redundant rpath linker option
  libgcrypt: Fix unpackaged file warning
  dbus: Fix unpackaged files warning
  e2fsprogs: Fix unpackaged file warning
  cracklib: Fix unpackaged files warning by disabling autodetected
    python
  glib-2.0: Fix unpackaged files warning
  dbus-glib: Correctly package bash completion pieces to avoid QA
    warning
  package.bbclass: Remove empty directories created as part of srcdebug
    handling
  insane.bbclass: Only depend on desktop-file-utils-native when we need
    it
  autotools.bbclass: Make builds deterministic
  gthumb: Resolve staticdev QA warnings
  sstatesig.py: Add handling for machine specific module depenedencies

 meta/classes/autotools.bbclass                     |    2 +
 meta/classes/insane.bbclass                        |    8 +++++-
 meta/classes/package.bbclass                       |   13 +++++++++-
 meta/lib/oe/sstatesig.py                           |   26 +++++++++++++++----
 meta/recipes-core/dbus/dbus-glib.inc               |    4 ++-
 meta/recipes-core/dbus/dbus-glib_0.92.bb           |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    3 ++
 meta/recipes-core/eglibc/eglibc-package.inc        |    1 +
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    5 +++-
 meta/recipes-core/readline/files/norpath.patch     |   21 ++++++++++++++++
 meta/recipes-core/readline/readline.inc            |    1 +
 meta/recipes-core/readline/readline_6.2.bb         |    2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    4 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    4 +-
 meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    4 ++-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    6 ++++-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 ++
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +-
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    4 +-
 19 files changed, 95 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-core/readline/files/norpath.patch

-- 
1.7.5.4



