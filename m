Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id BC50B76104
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 14:05:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9RE5ui8019621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 07:05:56 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 27 Oct 2015 07:05:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2015 07:05:54 -0700
Message-ID: <cover.1445954460.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] python-smartpm-native: prefer same arch when install
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
X-List-Received-Date: Tue, 27 Oct 2015 14:05:57 -0000
Content-Type: text/plain

The following changes since commit f787b688f2884ce3fa888b4041030538c7d2bf55:

  oeqa/utils/decorators: fix missing keyword arguments on decorators (2015-10-27 07:22:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/smart
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/smart

Robert Yang (1):
  python-smartpm-native: prefer same arch when install

 .../python-smartpm/smart-prefer-same-arch.patch    |  119 ++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |    2 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-prefer-same-arch.patch

-- 
1.7.9.5


