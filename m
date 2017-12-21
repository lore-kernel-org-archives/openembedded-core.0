Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39AAE77E88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 02:02:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBL22Tkj020519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 18:02:29 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Dec 2017 18:02:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Dec 2017 10:02:20 +0800
Message-ID: <cover.1513821698.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] fix for oeqa/core/loader.py and image_types.bbclass
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
X-List-Received-Date: Thu, 21 Dec 2017 02:02:28 -0000
Content-Type: text/plain

The following changes since commit 978472c58629d1448399207873bbead96b27102e:

  image.bbclass: Add additional bb.debug to help track 12304 (2017-12-18 18:02:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/2fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/2fixes

Robert Yang (2):
  oeqa/core/loader.py: fix re for module
  image_types.bbclass: use stat to get sparse file's size

 meta/classes/image_types.bbclass | 2 +-
 meta/lib/oeqa/core/loader.py     | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.7.4


