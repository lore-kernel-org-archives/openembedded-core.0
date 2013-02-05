Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U2pGp-0006aQ-2O
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 21:37:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r15KLjD4015028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 12:21:45 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 5 Feb 2013 12:21:43 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 14:21:41 -0600
Message-ID: <cover.1360095480.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: v2 [PATCH 0/1] pseudo 1.4.3 update
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
X-List-Received-Date: Tue, 05 Feb 2013 20:37:38 -0000
Content-Type: text/plain

This fixes (... I hope) a handful of problems relating to libdir
computation and sqlite. Basically, pseudo needs to be able to distinguish
32-bit and 64-bit library directories for "where do I store libpseudo.so",
but bitbake for native systems always uses "lib" for the directory
containing libsqlite.a. Solution: --with-sqlite-lib=${baselib}.

1.4.2/1.4.3 add linkat() support, fix some bitrot on Darwin, and add
the configure flags to make this possible.

This *appears* to build for 32-bit and 64-bit SDKMACHINE, targets, and
native builds, but I've said that before.

The following changes since commit 3b1beb8b15b8e3e397b3aa8320490103d4f29bac:
  Martin Jansa (1):
        dropbear: fix RPROVIDES

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo143
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo143

Peter Seebach (1):
  pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3

 meta/recipes-devtools/pseudo/pseudo.inc      |    8 ++++----
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb



