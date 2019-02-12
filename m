Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A32AC7BE41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:57:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1C9vsJ6017022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 01:57:54 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Tue, 12 Feb 2019 01:57:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2019 18:16:40 +0800
Message-ID: <cover.1549966555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] checklayer: Avoid adding the layer if it is already present
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
X-List-Received-Date: Tue, 12 Feb 2019 09:57:53 -0000
Content-Type: text/plain

The following changes since commit 2dbbf598192ae2b3aa488df042f56aa6c6634a00:

  oe-build-perf-report: Fix missing buildstats comparisions (2019-02-11 17:46:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/check
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/check

Robert Yang (2):
  yocto-check-layer-wrapper: Fix path for oe-init-build-env
  checklayer: Avoid adding the layer if it is already present

 scripts/lib/checklayer/__init__.py | 36 +++++++++++++++++-------------------
 scripts/yocto-check-layer          |  6 +++---
 scripts/yocto-check-layer-wrapper  |  4 +++-
 3 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.7.4


