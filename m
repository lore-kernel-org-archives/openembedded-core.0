Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjCNl-0003fn-15
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 17:38:49 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JFYhMf027827
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:34:43 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:34:41 -0700
Message-Id: <cover.1311089204.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/4] Misc fixes, July 19
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
X-List-Received-Date: Tue, 19 Jul 2011 15:38:49 -0000

Hey all,

As part of doing some "fix builds in very long paths" builds of world I've
hit a few DEPENDS problems.  The following series is mostly adding DEPENDS
where they're missing today.  While I was fixing up gnome-doc-utils-native
I noticed it has the installed but not packaged QA problem so I fixed that
while in here.

The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
  Saul Wold (1):
        libx11: ensure nativesdk uses correct DEPENDS and XCB flags

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/misc-fixes-19july
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc-fixes-19july

Tom Rini (4):
  metacity: Add gnome-doc-utils to DEPENDS
  gnome-doc-utils: Package up python site packages, bump PR
  iptuils: Add sgmlspl-native to DEPENDS
  btrfs-tools: Add util-linux to DEPENDS

 .../btrfs-tools/btrfs-tools_git.bb                 |    3 ++-
 meta/recipes-extended/iputils/iputils_s20101006.bb |    4 ++--
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    4 ++--
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)



