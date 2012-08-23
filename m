Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T4Mhn-0002J1-Hk
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 03:59:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7N1lO3p000768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 18:47:24 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 22 Aug 2012 18:47:24 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2012 20:47:22 -0500
Message-ID: <cover.1345686284.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] v2: Move pseudo directory out of its filesystem
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
X-List-Received-Date: Thu, 23 Aug 2012 01:59:32 -0000
Content-Type: text/plain

The intent has been that pseudo's database be outside the hunk of space
it's trying to maintain -- we don't want an NFS-exported rootfs getting
its permissions destroyed by target apps! Based on feedback from v1,
I now use a name which uses the name of the rootfs so it's easier to
connect pseudo_state dirs to the rootfs, and also to have more than one
rootfs within a given directory.

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



