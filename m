Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1DrG-0005HJ-5a
	for openembedded-core@linuxtogo.org; Tue, 14 Aug 2012 11:56:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7E9iLnb027987
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Aug 2012 02:44:21 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 14 Aug 2012 02:44:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 17:41:00 +0800
Message-ID: <cover.1344929471.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: openembedded-core@linuxtogo.org, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] apt-native and rootfs_deb fixes
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
X-List-Received-Date: Tue, 14 Aug 2012 09:56:18 -0000
Content-Type: text/plain

* Remove an extra line from apt.conf
* Fix the race issue and populate_sdk_deb

Test info:
$ bitbake core-image-sato meta-toolchain-sdk core-image-sato-sdk

The build is OK, it would fail by strange errors without these
2 patches.

// Robert

The following changes since commit d45bbc5c75a8f277fc1185a5f28847116eec376d:

  createrepo: add wrapper script to fix paths (2012-08-13 20:10:34 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/deblock
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/deblock

Robert Yang (2):
  apt-native 0.7.14: remove an extra line from apt.conf
  rootfs_deb: move the lock from WORKDIR  to DEPLOY_DIR_DEB

 meta/classes/populate_sdk_deb.bbclass          |    3 ++-
 meta/classes/rootfs_deb.bbclass                |    2 +-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb |    2 +-
 meta/recipes-devtools/apt/files/apt.conf       |    1 -
 4 files changed, 4 insertions(+), 4 deletions(-)



