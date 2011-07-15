Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QhqZ1-0006C2-9r
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:09:07 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6FM3CMf018958
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 17:03:12 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 15:03:04 -0700
Message-Id: <cover.1310758615.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] Optionally trade required_utils for -native builds
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
X-List-Received-Date: Fri, 15 Jul 2011 22:09:07 -0000

Hey all,

As I said in another thread, today we depend on a few more host utilities
being installed on the host than oe.dev does.  This is an attempt to fix
that a bit and improve on the situation at the same time.  First up is
adding mercurial-native and then a test to add it to ASSUME_PROVIDED.  This
was build tested but I can't spot any hg URIs in the metadata.  Next up is
help2man-native.  First, I've added the GPLv2 and GPLv3 versions.  Second,
I've tested this with qemux86 and core-image-sato and it still all builds
and works as much as it has been for me wrt tests.  Finally, in the commit
message I said avoiding perl-native problem and what I'm speaking of is
that since I put help2man-native in with all of the autotools deps, adding
perlnative to the inherits list would bring perl in for everything.  We
can punt on this by just not adding target help2man for now.

The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
  Saul Wold (1):
        libx11: ensure nativesdk uses correct DEPENDS and XCB flags

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/add-more-native-recipes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/add-more-native-recipes

Tom Rini (5):
  mercurial-native: Add 1.9 version
  bitbake.conf, sanity.bbclass: Make mercurial-native optional
  help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
  sanity.bbclass: Add help2man-native to ASSUME_PROVIDED if found
  autotools.bbclass: Add help2man-native to the main DEPENDS tree

 meta/classes/autotools.bbclass                     |    4 +-
 meta/classes/sanity.bbclass                        |   10 +++++++-
 meta/conf/bitbake.conf                             |    1 -
 .../help2man/help2man-native_1.36.4.bb             |   26 ++++++++++++++++++++
 .../help2man/help2man-native_1.38.2.bb             |   24 ++++++++++++++++++
 .../mercurial/mercurial-native_1.9.bb              |   24 ++++++++++++++++++
 6 files changed, 85 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
 create mode 100644 meta/recipes-devtools/mercurial/mercurial-native_1.9.bb



