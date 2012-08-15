Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1fgD-0001d3-QF
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 17:38:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7FFQiLA014591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 08:26:44 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 15 Aug 2012 08:26:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 23:32:16 +0800
Message-ID: <cover.1345044352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3] Install external binary packages
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
X-List-Received-Date: Wed, 15 Aug 2012 15:38:46 -0000
Content-Type: text/plain

Hi folks,

Please see the first commit for details, and I will send a patch to
add the usage to local.conf.sample.extended when this is OK.

// Robert

The following changes since commit 0c6ac62a9fb81146ace64ae7493dcc56b4bed197:

  documentation: remove references to Pimlico (2012-08-15 15:26:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/external_install
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/external_install

Robert Yang (3):
  rpm: install external binary packages
  ipk: install external binary packages
  deb: install external binary packages

 meta/classes/external_package.bbclass | 89 +++++++++++++++++++++++++++++++++++
 meta/classes/image.bbclass            |  2 +
 meta/classes/package_deb.bbclass      | 43 ++++++++++-------
 meta/classes/package_ipk.bbclass      | 21 ++++++++-
 meta/classes/package_rpm.bbclass      | 12 +++--
 meta/classes/rootfs_deb.bbclass       |  2 +-
 meta/classes/rootfs_ipk.bbclass       |  2 +-
 meta/classes/rootfs_rpm.bbclass       |  2 +-
 8 files changed, 149 insertions(+), 24 deletions(-)
 create mode 100644 meta/classes/external_package.bbclass

-- 
1.7.11.2



