Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R5vq2-0007wm-E8
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 10:37:58 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 20 Sep 2011
	10:32:40 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 10:32:49 +0200
Message-ID: <cover.1316507540.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.6.3
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/3] [oe-core & yocto RC] Fix unfetchable zypp-related packages
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
X-List-Received-Date: Tue, 20 Sep 2011 08:37:58 -0000
Content-Type: text/plain


openSUSE has moved several of it's projects from gitorious to github. Lately,
these has become unfetchable from gitorius, thus the SRC_URI fixes are needed
also for the upcoming yocto release.

No other changes are included, SRCREV's are kept the same.

The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core opensuse-fixes
  https://github.com/darander/oe-core/tree/opensuse-fixes

Anders Darander (3):
  libzypp: git repo moved to github
  sat-solver: git repo moved to github
  zypper: git repo moved to github

 meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
 meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.6.3



