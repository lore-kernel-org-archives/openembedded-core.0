Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCC6F65FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:27:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5RPsV026417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:27:26 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:27:25 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:27:17 +0800
Message-ID: <cover.1400476449.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/6 v2] backport 6 CVE patches for subversion
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
X-List-Received-Date: Mon, 19 May 2014 05:27:26 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Diff with v1: add Upstream-status in two patches

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
 .../subversion/subversion-CVE-2013-4277.patch      |   15 ++
 .../subversion/subversion-CVE-2013-4505.patch      |  127 +++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    6 +-
 .../subversion/subversion_1.7.10.bb                |    3 +
 10 files changed, 586 insertions(+), 1 deletion(-)
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


