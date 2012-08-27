Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T64Im-0000rh-8D
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 20:44:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7RIWVfK003699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 11:32:31 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 27 Aug 2012 11:32:30 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2012 13:32:29 -0500
Message-ID: <cover.1346087164.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] v3: Move pseudo localstatedir outside of rootfs.
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
X-List-Received-Date: Mon, 27 Aug 2012 18:44:44 -0000
Content-Type: text/plain

On reflection, I like "rootfs.pseudo_state" better than
"pseudo_state_rootfs". Also found a typo in which *one* reference
had pseudo_state/rootfs rather than pseudo_state_rootfs. (My keyboard
layout hates me.)

This version has been actually tested complete with running the
associated bitbake targets.

The following changes since commit 4ef8960c8d2876914bb78cbdce5fae3c5297e942:
  Khem Raj (1):
        gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/varpseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/varpseudo

Peter Seebach (1):
  runqemu-export-rootfs and friends: don't put pseudo db in target fs

 .../installer/adt-installer/scripts/extract_rootfs |    8 ++++----
 scripts/runqemu-export-rootfs                      |    2 +-
 scripts/runqemu-extract-sdk                        |   15 +++++++++------
 3 files changed, 14 insertions(+), 11 deletions(-)



