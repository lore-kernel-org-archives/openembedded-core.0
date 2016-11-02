Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D793719E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 07:12:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA27CBoa009001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2016 00:12:12 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 2 Nov 2016 00:12:11 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 15:12:09 +0800
Message-ID: <cover.1478070580.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] fix "svnadmin create" fail on x86
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
X-List-Received-Date: Wed, 02 Nov 2016 07:12:12 -0000
Content-Type: text/plain

The following changes since commit c3d2df883a9d6d5036277114339673656d89a728:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-svnadmin-create-fail
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-svnadmin-create-fail

Dengke Du (1):
  fix "svnadmin create" fail on x86

 .../0001-fix-svnadmin-create-fail-on-x86.patch     | 56 ++++++++++++++++++++++
 .../subversion/subversion_1.9.4.bb                 |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch

-- 
2.7.4


