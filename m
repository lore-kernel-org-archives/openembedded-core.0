Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7498C6C4F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 06:08:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAL67URf008593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Nov 2018 22:07:51 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 20 Nov 2018 22:07:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2018 14:24:34 +0800
Message-ID: <cover.1542781427.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: c.andersen@kostal.com
Subject: [PATCH 0/1] uboot-sign.bbclass: fix signature and deployment
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
X-List-Received-Date: Wed, 21 Nov 2018 06:08:55 -0000
Content-Type: text/plain

The following changes since commit 19c9842644b7b0a599437fd394111f161c8b1f1e:

  apt: Improve SRC_URI (2018-11-20 10:11:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/uboot
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/uboot

Robert Yang (1):
  uboot-sign.bbclass: fix signature and deployment

 meta/classes/kernel-fitimage.bbclass | 17 ++++++-
 meta/classes/uboot-sign.bbclass      | 95 ++++++++++++++++++++----------------
 meta/recipes-bsp/u-boot/u-boot.inc   |  2 +-
 3 files changed, 69 insertions(+), 45 deletions(-)

-- 
2.7.4


