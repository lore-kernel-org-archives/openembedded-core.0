Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q00Av-0003ke-Nc
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 00:30:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GNSxmw014298
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 16:29:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 16:28:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@lists.pokylinux.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2011 18:30:01 -0500
Message-ID: <cover.1300318053.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/7] Update the previous request with upstream solution
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
X-List-Received-Date: Wed, 16 Mar 2011 23:30:46 -0000
Content-Type: text/plain

The upstream maintainer came up with a proper solution to the problem.
This solution is brought in by a version uprev of sat-solver, as well as
some refactoring of the cmake.patch into two components.  One of which
will end up being sent to the upstream author for possible inclusion.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: mhatle/bernard/fixes
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/bernard/fixes

Thanks,
    Mark Hatle <mark.hatle@windriver.com>
---


Mark Hatle (7):
  package.bbclass: Fix missing debug src files
  rootfs_rpm.bbclass: Add additional system configuration to RPM space
  libzypp: Fix release query
  sat-solver: uprev to the latest version
  sat-solver: Add workaround for RPM 5 db construction
  rpm: Disable repackage on upgrade/erasure by default
  sat-solver: Fix solution DB generation and general cleanup

 meta/classes/package.bbclass                       |    3 +-
 meta/classes/rootfs_rpm.bbclass                    |   26 +++++++
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../libzypp/libzypp/config-release.patch           |   21 ++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
 .../sat-solver/sat-solver/cmake.patch              |   76 ++++----------------
 .../sat-solver/sat-solver/rpm5.patch               |   53 --------------
 .../sat-solver/sat-solver/sat-solver_rpm5.patch    |   67 +++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    6 +-
 10 files changed, 138 insertions(+), 122 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/config-release.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/rpm5.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch

-- 
1.7.3.4



