Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SXCMg-0004r8-6K
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 16:16:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4NE6RbV009644
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 07:06:27 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 23 May 2012 07:06:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2012 22:06:30 +0800
Message-ID: <cover.1337781684.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] V2 rpm 5.4.0: respect to the arch when choose the alternatives
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
X-List-Received-Date: Wed, 23 May 2012 14:16:38 -0000
Content-Type: text/plain

Changes of V2:

Fix the rpm rather than the PACKAGE_EXTRA_ARCHS

// Robert

The following changes since commit 3bf8069100e54153d13319dc32ca089327b6a139:

  documentation/yocto-project-qs/yocto-project-qs.xml: added quotes (2012-05-01 21:00:36 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/121_rpm_arch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/121_rpm_arch

Robert Yang (1):
  rpm 5.4.0: respect to the arch when choose the alternatives

 .../rpm/rpm/rpm-respect-arch.patch                 |   67 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 2 files changed, 69 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch



