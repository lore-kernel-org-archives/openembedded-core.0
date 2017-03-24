Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8253272F4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:55:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2O8tXpQ008829
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:55:36 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 01:55:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 01:55:30 -0700
Message-ID: <cover.1490345691.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 minor fixes
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
X-List-Received-Date: Fri, 24 Mar 2017 08:55:35 -0000
Content-Type: text/plain

The following changes since commit 3b5ac72bdf76ac8ff98dc3c882a4edc77c6e2c33:

  rpm: add a "rpm-build" PROVIDES (2017-03-22 15:09:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  runtime-test.py: fix typo
  scripts/wic: fix typo
  apt: fix hardcode of /usr/lib

 meta/lib/oeqa/selftest/runtime-test.py    | 4 ++--
 meta/recipes-devtools/apt/apt-package.inc | 2 +-
 scripts/wic                               | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.9.0


