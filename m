Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3TwQ-0001O6-GU
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:30:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7KFIsJX005733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:18:54 -0700 (PDT)
Received: from fc17-64.corp.ad.wrs.com (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 08:18:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 23:24:42 +0800
Message-ID: <cover.1345471555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3 V3] Install external binary packages
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
X-List-Received-Date: Mon, 20 Aug 2012 15:30:58 -0000
Content-Type: text/plain

Changes of V3:
* Fix the "bitbake package-index" failure.
  # Tested: (with rpm/ipk/deb rootfs):
  $ bitbake core-image-minimal core-image-sato \
	meta-toolchain meta-toolchain-sdk core-image-sato-sdk
  $ bitbake package-index (I had forgot to test this in V2).

Changes of V2:
* Add commit message to each commit.

Changes of V1:
* Initial version

// Robert

The following changes since commit 91ece5d5668ee1adb5c5e3d757426a0d5187bd84:

  libpam: Fix missing DESTDIR for a mkdir causing build failures (2012-08-19 13:32:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/external_install
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/external_install

Robert Yang (3):
  rpm: install external binary packages
  ipk: install external binary packages
  deb: install external binary packages

 meta/classes/external_package.bbclass | 91 +++++++++++++++++++++++++++++++++++
 meta/classes/package_deb.bbclass      | 44 ++++++++++-------
 meta/classes/package_ipk.bbclass      | 22 ++++++++-
 meta/classes/package_rpm.bbclass      | 13 +++--
 meta/classes/rootfs_deb.bbclass       |  2 +-
 meta/classes/rootfs_ipk.bbclass       |  2 +-
 meta/classes/rootfs_rpm.bbclass       |  2 +-
 7 files changed, 152 insertions(+), 24 deletions(-)
 create mode 100644 meta/classes/external_package.bbclass

-- 
1.7.11.2



