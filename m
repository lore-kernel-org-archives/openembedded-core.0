Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 29A547E648
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:51:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8Q2php8014380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:51:43 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 19:51:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2019 10:51:42 +0800
Message-ID: <cover.1569466181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/3] meta: 3 fixes for nativesdk
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
X-List-Received-Date: Thu, 26 Sep 2019 02:51:42 -0000
Content-Type: text/plain

* V2:
  - Fix comments from Ross.

* V1
  - Initial version

// Robert

The following changes since commit 95ad5626296380358c8a502a3e04879dab653d78:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sdk
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/sdk

Robert Yang (3):
  expect: Fix configure error for nativesdk
  apr: Fix configure error for nativesdk
  net-tools: Fix installed-vs-shipped for nativesdk

 meta/recipes-devtools/expect/expect_5.45.4.bb        | 6 +++---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 2 +-
 meta/recipes-support/apr/apr_1.7.0.bb                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.7.4


