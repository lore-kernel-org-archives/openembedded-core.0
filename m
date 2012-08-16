Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1vWT-0000Zr-Id
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 10:33:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7G8Lmod000885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 01:21:48 -0700 (PDT)
Received: from fc17-64.corp.ad.wrs.com (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 16 Aug 2012 01:21:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 16:27:39 +0800
Message-ID: <cover.1345105475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3 V2] Install external binary packages
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
X-List-Received-Date: Thu, 16 Aug 2012 08:33:46 -0000
Content-Type: text/plain

Changes of V2:
* Add commit message to each commit.

Changes of V1:
* Initial version

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

 meta/classes/external_package.bbclass | 91 +++++++++++++++++++++++++++++++++++
 meta/classes/image.bbclass            |  2 +
 meta/classes/package_deb.bbclass      | 43 ++++++++++-------
 meta/classes/package_ipk.bbclass      | 21 +++++++-
 meta/classes/package_rpm.bbclass      | 12 +++--
 meta/classes/rootfs_deb.bbclass       |  2 +-
 meta/classes/rootfs_ipk.bbclass       |  2 +-
 meta/classes/rootfs_rpm.bbclass       |  2 +-
 8 files changed, 151 insertions(+), 24 deletions(-)
 create mode 100644 meta/classes/external_package.bbclass

-- 
1.7.11.2



