Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SmEiA-0002tg-Va
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 03:48:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q641btrr002847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2012 18:37:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 Jul 2012 18:37:55 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2012 20:37:53 -0500
Message-ID: <cover.1341365770.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] *** SUBJECT HERE ***
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
X-List-Received-Date: Wed, 04 Jul 2012 01:48:59 -0000
Content-Type: text/plain

Robert Yang identified a crash with chroot in long directories,
which was a logic bug in the allocate-and-copy logic when
expanding paths inside a base path. Fixed in upstream pseudo,
along with a couple of other minor tweaks, since the crash is
blocking other work we should probably update.

The following changes since commit a6b6df1350149c116050cb93c3c7b4802c709d31:
  Lianhao Lu (1):
        task-core-tools-debug: Added openssh-sftp-server.

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo

Peter Seebach (1):
  pseudo: Update to 1.3.1 (fixing chroot crash)

 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_1.3.bb   |    8 --------
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.bb



