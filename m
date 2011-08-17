Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtkHe-0000Vo-Ab
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 19:52:06 +0200
Received: from localhost (85.231.30.150) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	19:47:26 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 19:47:34 +0200
Message-ID: <cover.1313603220.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v3 0/1] Qt4: reduce build time
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
X-List-Received-Date: Wed, 17 Aug 2011 17:52:06 -0000
Content-Type: text/plain


Reduce the build time of qt4-embedded.

V3: * Explicitly check if the phrasebook dir exists, instead of relying on a
    try-except clause that also would catch other errors.

V2 and earlier was a larger patch series. There were no modifications to this
patch in V2.

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core qt4-fixes
  https://github.com/darander/oe-core/tree/qt4-fixes

Anders Darander (1):
  qt4: allow a reduction in build time

 meta/recipes-qt/qt4/qt4.inc |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

-- 
1.7.5.4



