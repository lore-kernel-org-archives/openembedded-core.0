Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QUij0-00061D-7L
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 19:08:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p59H5XpC016575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 10:05:33 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 9 Jun 2011 10:05:32 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2011 12:15:44 -0500
Message-ID: <cover.1307639649.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix realpath issue in pseudo
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
X-List-Received-Date: Thu, 09 Jun 2011 17:08:54 -0000
Content-Type: text/plain

When pseudo is running in disabled mode (most of the time in oe-core), the
realpath function can fail on system systems.  This was discovered by some
problems found in Qt MOC and qmake.

The change is from upstream, and has been verified by the person who 
originally found the issue.

The following changes since commit d3e105451413617cf6415ae1600dc063f3d8d452:

  scripts/bitbake: Only build tar-replacement-native when the build system tar version < 1.24 (2011-06-09 16:32:03 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/pseudo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo

Mark Hatle (1):
  pseudo: Fix problem related to realpath

 .../pseudo/pseudo/realpath_fix.patch               |  165 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |    3 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 3 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch

-- 
1.7.3.4



