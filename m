Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3DE366007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 06:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G605wR004216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 23:00:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 23:00:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 14:00:00 +0800
Message-ID: <cover.1400219191.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/6] subversion: backport 6 CVE patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 May 2014 06:00:08 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/subversion-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/subversion-1

Yue Tao (6):
  subversion: fix for Security Advisory CVE-2013-1849
  subversion: fix for Security Advisory CVE-2013-4505
  subversion: fix for Security Advisory CVE-2013-4131
  subversion: fix for Security Advisory CVE-2013-1845
  subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
  subversion: fix for Security Advisory CVE-2013-4277

 .../subversion-CVE-2013-4131.patch                 |   42 +++++
 .../subversion-CVE-2013-4277.patch                 |   15 ++
 .../subversion-CVE-2013-4505.patch                 |  130 +++++++++++++++
 .../subversion/subversion-CVE-2013-1845.patch      |  171 ++++++++++++++++++++
 .../subversion-CVE-2013-1847-CVE-2013-1846.patch   |   53 ++++++
 .../subversion/subversion-CVE-2013-1849.patch      |   25 +++
 .../subversion/subversion-CVE-2013-4277.patch      |   13 ++
 .../subversion/subversion-CVE-2013-4505.patch      |  125 ++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    8 +-
 .../subversion/subversion_1.7.10.bb                |    3 +
 10 files changed, 583 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch

-- 
1.7.10.4


