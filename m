Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtKE1-0002I3-D3
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:02:37 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	15:57:36 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:57:41 +0200
Message-ID: <cover.1313503017.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/5] Miscellaneous fixes: mainly qt- and DISTRO_FEATURES-related
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
X-List-Received-Date: Tue, 16 Aug 2011 14:02:37 -0000
Content-Type: text/plain


A series with some miscellaneous fixes/changes.

Patches:
0001: make it possible to build qt4 while disabling certain parts of it.
0002: A partial sync of qmake_base.bbclass from meta-oe. Hopefully we should
      be able to delete qmake_base.bbclass from meta-oe after this sync.
0003-4: respect wifi and bluetooth in DISTRO_FEATURES while building connman 
	and ofono.
0005: increase the likelihood that a rename and modification is detected, 
      instead of a deleta/add-pair.

Patch 0005 is the patch that is most likely to be controversial. The other 
patches should be of minor impact, and result in a more consistent build 
environment (i.e. better respect for DISTRO_FEATURES).

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:

  distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core qt4-fixes
  https://github.com/darander/oe-core/tree/qt4-fixes

Anders Darander (5):
  qt4: allow a reduction in build time
  qmake_base: add uclibceabi
  connman: use DISTRO_FEATURES to enable wifi and bluetooth
  ofono: conditionally enable bluetooth
  create-pull-request: increase likelihood of detecting a rename

 meta/classes/qmake_base.bbclass                   |    2 +-
 meta/recipes-connectivity/connman/connman_0.75.bb |    4 ++--
 meta/recipes-connectivity/ofono/ofono.inc         |    3 ++-
 meta/recipes-connectivity/ofono/ofono_0.50.bb     |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb      |    4 ++++
 meta/recipes-qt/qt4/qt4.inc                       |   13 ++++++++-----
 scripts/create-pull-request                       |    2 +-
 7 files changed, 19 insertions(+), 10 deletions(-)

-- 
1.7.5.4



