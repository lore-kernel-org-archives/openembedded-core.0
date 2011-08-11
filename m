Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrXUa-0001jk-3J
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 17:48:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7BFhlwR003103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 08:43:47 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 11 Aug 2011 08:43:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 10:46:36 -0500
Message-ID: <cover.1313077484.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Fix on-target RPM platform mismatch
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
X-List-Received-Date: Thu, 11 Aug 2011 15:48:20 -0000
Content-Type: text/plain

This fixes the Yocto bug #1352.  When trying to install an arm package
on the target, the platform no longer matched properly.  The platform was
being set to arm*-oe-linux-gnu, instead of the proper arm*-oe-linux-gnueabi.

The following changes since commit 87456db10d6e615e5f49453befedaa5957dfe292:

  package_rpm.bbclass: Update the platform config and --target (2011-08-11 10:42:02 -0500)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/fix_1352
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fix_1352

Mark Hatle (2):
  rpm: Fix the canonical arch --target processing and cleanup
  package_rpm.bbclass: Update the platform config and --target

 meta/classes/package_rpm.bbclass                   |   14 ++-
 .../recipes-devtools/rpm/rpm/export-rpmbag-h.patch |   45 -------
 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch |   22 ----
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  134 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch    |   38 ------
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   16 +++
 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch    |   17 ---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    8 +-
 8 files changed, 164 insertions(+), 130 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch

-- 
1.7.3.4



