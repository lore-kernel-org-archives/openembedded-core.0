Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U7E8F-00086Z-1c
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 00:58:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1HNgkAV005754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 15:42:46 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sun, 17 Feb 2013 15:42:46 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 17:42:44 -0600
Message-ID: <cover.1361144379.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.5 -- now up to 25% faster!
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
X-List-Received-Date: Sun, 17 Feb 2013 23:58:55 -0000
Content-Type: text/plain

pseudo 1.5 is a significant update to a few internals, focused on
improving build performance. Of particular note, pseudo 1.5 suppresses
fsync() and fdatasync() calls for any part of the build running
under pseudo, even when pseudo is disabled. (This is controlled
by the --enable-force-async configure option; if you want to try
this out with the git package, you'll have to add it to pseudo_git.bb.)

The 1.5 tarball has been submitted to Michael Halstead for inclusion
on the Yocto servers, but I don't think it's up yet. (And it's been
nearly two whole minutes, too!)

You will note that this proposed patch does NOT remove the pseudo
1.4.5 tarball. This is a large enough change that I am inclined to
leave 1.4.5 very conveniently available (just a single PREFERRED_VERSION
away) until this has been shaken out a bit.

The following changes since commit cd503c7f7fec6d177209832f73cec9c5d490be6b:
  Richard Purdie (1):
        package_tar: Fix so it actually works

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo_15
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo_15

Peter Seebach (1):
  pseudo.inc: pseudo 1.5 uprev, support extra config flags

 meta/recipes-devtools/pseudo/pseudo.inc    |    8 ++++----
 meta/recipes-devtools/pseudo/pseudo_1.5.bb |   10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb |    4 ++--
 3 files changed, 16 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.bb



