Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U12QX-0005Gp-5L
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 23:16:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0VM0RXK000697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 14:00:29 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 31 Jan 2013 14:00:26 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jan 2013 16:00:24 -0600
Message-ID: <cover.1359669354.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.4.3: @GLIBC_2.7, libdirs, and so on.
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
X-List-Received-Date: Thu, 31 Jan 2013 22:16:26 -0000
Content-Type: text/plain

So, staring closely at the problems pseudo 1.4.2 had with sqlite, I
fixed the libdir problem in a different enough way to justify a
version bump.  Also, we ran into some issues trying to use an SDK on
older machines, and it turned out we could avoid them very easily,
so those have been changed.

This also includes the other changes from 1.4.2:
* Support for linkat()
* Some Darwin bitrot fixups

I've sent a link to the tarball for inclusion in the Yocto download servers,
you can also test using the git version or the tarball temporarily
present at:

        ftp://ftp.windriver.com/pub/pseebach/pseudo-1.4.3.tar.bz2

The following changes since commit 1489a69cecb1dcc3502a4c24beaea81e6ca6dacc:
  Marko Lindqvist (1):
        harfbuzz: fix install of version.h

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo143
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo143

Peter Seebach (1):
  pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3

 meta/recipes-devtools/pseudo/pseudo.inc      |    8 ++++----
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb



