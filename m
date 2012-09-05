Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T9CFK-00020R-0c
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 11:50:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q859bggs029895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 02:37:42 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 5 Sep 2012 02:37:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 17:31:39 +0800
Message-ID: <cover.1346837268.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [RFC PATCH 0/2] package_ipk.bbclass: use "--force-arch" when install package
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
X-List-Received-Date: Wed, 05 Sep 2012 09:50:06 -0000
Content-Type: text/plain

Note:

* This is a RFC patch.

* This is for opkg_svn.bb, the opkg_0.1.8.bb also needs it, but needs re-work.

* Please feel free to give your comments.

// Robert

The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/ipk_arch
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ipk_arch

Robert Yang (2):
  opkg svn: Add the --force-arch option
  package_ipk.bbclass: use "--force-arch" when install package

 meta/classes/package_ipk.bbclass                 |    6 +-
 meta/recipes-devtools/opkg/opkg/force-arch.patch |  103 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb           |    3 +-
 3 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/force-arch.patch



