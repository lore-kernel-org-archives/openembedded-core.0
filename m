Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 15932607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:54:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9T7sBkB024232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 00:54:11 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 00:54:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2015 15:54:11 +0800
Message-ID: <cover.1446105200.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: fix reporting 'unknown' by `uname -p' and `uname -i'
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
X-List-Received-Date: Thu, 29 Oct 2015 07:54:12 -0000
Content-Type: text/plain

The following changes since commit f787b688f2884ce3fa888b4041030538c7d2bf55:

  oeqa/utils/decorators: fix missing keyword arguments on decorators (2015-10-27 07:22:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/coreutils-uname
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/coreutils-uname

Chen Qi (1):
  coreutils: fix reporting 'unknown' by `uname -p' and `uname -i'

 ...e-report-processor-and-hardware-correctly.patch | 64 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.24.bb      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.24/0001-uname-report-processor-and-hardware-correctly.patch

-- 
1.9.1


