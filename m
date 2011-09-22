Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6YQP-0001Be-6S
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 03:50:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8M1iiNq010959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 18:44:44 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 21 Sep 2011 18:44:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 20:46:59 -0500
Message-ID: <cover.1316655855.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/6] Fix core-image-lsb dependencies
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
X-List-Received-Date: Thu, 22 Sep 2011 01:50:05 -0000
Content-Type: text/plain

Fix additional dependencies found while building core-image-lsb.  Most of
the issues are related to simple errors in the recipes or PAM integration
problems.

The following changes since commit 40b52d9ed9b7b39bc86b3c87ae60fa6359cac265:

  distro tracking: Update Distro Aliases (2011-09-22 01:30:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm

Mark Hatle (6):
  python: Fix cgi.py runtime issue
  usbutils: Move the pkgconfig file(s) to the -dev package
  foomatic-filters: Disable filter checking
  perl: Fix a few perl binaries to use target interpreter paths
  sudo: Fix PAM dependencies
  task-core-lsb: Remove perl-dev

 meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    4 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |   10 ++++++++-
 meta/recipes-devtools/python/python/cgi_py.patch   |   21 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 .../foomatic/foomatic-filters_4.0.7.bb             |   21 ++++++++++++++-----
 meta/recipes-extended/sudo/sudo_1.8.1p2.bb         |    5 +++-
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 7 files changed, 54 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/cgi_py.patch

-- 
1.7.3.4



