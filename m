Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrgMV-0007yj-6P
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 03:16:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7C1C2Ox023490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 18:12:02 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 11 Aug 2011 18:12:02 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 20:14:57 -0500
Message-ID: <cover.1313111544.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/3] Fix ATTEMPTONLY and SUGGESTS in package_rpm
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
X-List-Received-Date: Fri, 12 Aug 2011 01:16:35 -0000
Content-Type: text/plain

Fix ATTEMPTONLY and SUGGESTS in package_rpm.  This relies on the previous
changes to the rpm platform and package_rpm.bbclass I sent earlier today.

Note patch 1 and 2 are the earlier set, which I am not resending.

The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:

  gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 19:13:38 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/fix_1366
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fix_1366

Mark Hatle (3):
  rpm: Fix the canonical arch --target processing and cleanup
  package_rpm.bbclass: Update the platform config and --target
  package_rpm: Fix attemptonly and suggest packages

 meta/classes/package_rpm.bbclass                   |   39 +++++--
 .../recipes-devtools/rpm/rpm/export-rpmbag-h.patch |   45 -------
 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch |   22 ----
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  134 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch    |   38 ------
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   16 +++
 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch    |   17 ---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    8 +-
 8 files changed, 184 insertions(+), 135 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch

-- 
1.7.3.4



