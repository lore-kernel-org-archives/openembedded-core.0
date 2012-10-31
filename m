Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TTfkh-0007kB-9N
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 22:23:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9VL9TaQ012405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 14:09:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 31 Oct 2012 14:09:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Oct 2012 16:19:22 -0500
Message-ID: <cover.1351718092.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/4] First pass at implementing SMART
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
X-List-Received-Date: Wed, 31 Oct 2012 21:23:07 -0000
Content-Type: text/plain

This patch set is the first pass at implementing smart.  Patch 1/4 is the same
as what was previously sent to the list that fixed some issues with the rpm
python module.

I did not squash 1/4 and 3/4 and 2/4 and 4/4 together as they are separate
components of the overall development.  1/4 is the basic fix, while 3/4 adds
support to the rpm-python to export more information.

2/4 is the initial SMART implementation and 4/4 adds support for the MISSINGOK
exported by 3/4.

The following changes since commit 0e90a303bc5cb0ede21ff4346843f9daeddfff45:

  openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION} (2012-10-30 11:03:46 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/smart
  http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/rpm

Mark Hatle (4):
  rpm: Slightly change the way python-rpm is constructed
  python-smartpm: Add smartpm recipe
  rpm: Add additional RPMSENSE values to python module
  python-smartpm: Add basic knowledge of RPMSENSE_MISSINGOK

 .../python/python-smartpm/smart-missingok.patch    |   43 +++++++
 .../python/python-smartpm/smart-rpm-root.patch     |   80 +++++++++++++
 .../python/python-smartpm/smartpm-rpm5-nodig.patch |   46 ++++++++
 .../python/python-smartpm_1.4.1.bb                 |  120 ++++++++++++++++++++
 .../rpm/rpm/python-rpm-rpmsense.patch              |   33 ++++++
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   27 +++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   17 ++-
 9 files changed, 365 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm_1.4.1.bb
 create mode 100644 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch

-- 
1.7.3.4



