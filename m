Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SmqvJ-0006LE-QM
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 20:37:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q65IPxKW021160
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2012 11:25:59 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 5 Jul 2012 11:25:58 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 13:25:57 -0500
Message-ID: <cover.1341512659.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo update (1.3.1)
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
X-List-Received-Date: Thu, 05 Jul 2012 18:37:06 -0000
Content-Type: text/plain

The big change is a bug fix for path expansion inside a chroot,
which could cause memory corruption errors.

The following changes since commit dcc43c34bfa9304233ecfd3f518a84ddfdc2fd90:
  Tom Zanussi (1):
        perf: remove unconditional python-ext install

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



