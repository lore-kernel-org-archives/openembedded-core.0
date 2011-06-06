Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTiv1-0001zI-HH
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 01:09:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p56N5rem001048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 16:05:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 6 Jun 2011 16:05:53 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jun 2011 18:15:45 -0500
Message-ID: <cover.1307402014.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] pseudo: Update pseudo to 1.1.1 version
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
X-List-Received-Date: Mon, 06 Jun 2011 23:09:11 -0000
Content-Type: text/plain

Update pseudo to latest release version.

This has been tested with an core-minimal-image, as well as existing
pseudo tests outside of oe-core.

The following changes since commit 925de3b3e74d15547840a2edaceff437e135bddd:

  tzcode: Update to 2011g (2011-06-06 15:52:18 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/pseudo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=WIP

Mark Hatle (1):
  pseudo: Update pseudo to 1.1.1 version

 meta/recipes-devtools/pseudo/pseudo.inc            |   10 +++++-----
 .../pseudo/{pseudo_1.0.bb => pseudo_1.1.1.bb}      |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.0.bb => pseudo_1.1.1.bb} (51%)

-- 
1.7.3.4



