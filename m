Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 814797F0DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 07:35:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8O7YJ6u017082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 00:35:10 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 00:34:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2019 15:34:25 +0800
Message-ID: <cover.1569306585.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] expect: Fix buffer overflow error when build in long path
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
X-List-Received-Date: Tue, 24 Sep 2019 07:35:19 -0000
Content-Type: text/plain

The following changes since commit 95ad5626296380358c8a502a3e04879dab653d78:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/expect
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/expect

Robert Yang (1):
  expect: Fix buffer overflow error when build in long path

 ...0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch | 55 ++++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch

-- 
2.7.4


