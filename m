Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 451C765FD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:42:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5gtkT027533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:42:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:42:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:42:51 +0800
Message-ID: <cover.1400477654.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] nss: backport two CVE patches
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
X-List-Received-Date: Mon, 19 May 2014 05:42:56 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Diff with v1: add Upstream-status in patches 

The following changes since commit 9138880cd286d2700a380bfc21f70bfeb98ce675:

  subversion: fix for Security Advisory CVE-2013-4277 (2014-05-19 13:07:22 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/nss

Li Wang (2):
  nss: CVE-2014-1492
  nss: CVE-2013-1740

 .../nss/files/nss-CVE-2013-1740.patch              |  916 ++++++++++++++++++++
 .../nss/files/nss-CVE-2014-1492.patch              |   68 ++
 meta/recipes-support/nss/nss.inc                   |    2 +
 3 files changed, 986 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch

-- 
1.7.10.4


