Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5D0471978
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH6Jbco021289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:38 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:29 -0800
Message-ID: <cover.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/8] Fixes for eSDK and testsdkext
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:37 -0000
Content-Type: text/plain

The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:

  sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/eSDK
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK

Robert Yang (8):
  populate_sdk_ext.bbclass: install multilib targets as populate_sdk
    does
  oeqa/sdkext/devtool.py: remove workspace/sources before running test
    cases
  oe-publish-sdk: make cmd easier to read
  oe-publish-sdk: add pyshtables.py to .gitignore
  oeqa/sdkext/devtool.py: don't reset when the test is failed
  oeqa/oetest.py: add hasLockedSig()
  oeqa/sdkext/devtool.py: skip test_extend_autotools_recipe_creation
    when no libxml2
  oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN

 meta/classes/populate_sdk_ext.bbclass | 61 ++++++++++++++++++++++-------------
 meta/lib/oe/copy_buildsystem.py       | 18 +++++++++++
 meta/lib/oeqa/oetest.py               | 13 ++++++++
 meta/lib/oeqa/sdkext/devtool.py       | 13 ++++----
 scripts/oe-publish-sdk                | 19 +++++++++--
 5 files changed, 93 insertions(+), 31 deletions(-)

-- 
2.10.2


