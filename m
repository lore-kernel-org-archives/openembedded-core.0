Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3CA6D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:30:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9UpNL000021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:30:51 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:30:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:30:50 +0800
Message-ID: <cover.1569403775.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:30:51 -0000
Content-Type: text/plain

The following changes since commit 95ad5626296380358c8a502a3e04879dab653d78:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sdk
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/sdk

Robert Yang (3):
  net-tools: Fix installed-vs-shipped for nativesdk
  expect: Fix configure error for nativesdk
  apr: Fix configure error for nativesdk

 meta/recipes-devtools/expect/expect_5.45.4.bb        | 1 +
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 8 ++++++++
 meta/recipes-support/apr/apr_1.7.0.bb                | 2 ++
 3 files changed, 11 insertions(+)

-- 
2.7.4


