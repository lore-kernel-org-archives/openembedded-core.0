Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TCENB-00042z-8Y
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 20:42:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8DIU0pw026860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 11:30:01 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 13 Sep 2012 11:30:00 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Sep 2012 13:29:58 -0500
Message-ID: <cover.1347559925.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo update to 1.4.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 18:42:45 -0000
Content-Type: text/plain

The patches here are trivial. The upstream fixes are pretty
non-trivial, but have been used moderately extensively on a handful
of hosts, and appear to work. Long story short, pseudo could cause
rm to fail on files >2GB on 32-bit hosts which didn't use a 64-bit
off_t. Fixing this required addressing a surprising number of
assumptions, but it appears to work now.

The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:
  Darren Hart (1):
        rt: Add hwlatdetect to rt images

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo141
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo141

Peter Seebach (1):
  pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems

 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 --------
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb



