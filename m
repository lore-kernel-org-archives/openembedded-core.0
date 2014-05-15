Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5DB6A42A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 06:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4F604Qj001426
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 23:00:04 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 23:00:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 14:00:02 +0800
Message-ID: <cover.1400133537.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] forward 2 CVE patches for nss
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
X-List-Received-Date: Thu, 15 May 2014 06:00:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit 03ece04bb1379adc5729fd0857e5287dfcae0e3a:

  perl-5.14.3:fix CVE-2010-4777 (2014-05-15 11:10:52 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/nss

Li Wang (2):
  nss: CVE-2014-1492
  nss: CVE-2013-1740

 .../nss/files/nss-CVE-2013-1740.patch              |  914 ++++++++++++++++++++
 .../nss/files/nss-CVE-2014-1492.patch              |   66 ++
 meta/recipes-support/nss/nss.inc                   |    2 +
 3 files changed, 982 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
 create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch

-- 
1.7.10.4


