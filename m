Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9012A6C0C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 02:08:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAU28oQ8018648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2018 18:08:50 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 29 Nov 2018 18:08:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2018 10:26:13 +0800
Message-ID: <cover.1543544711.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] uboot-sign.bbclass: fix signature and deployment
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
X-List-Received-Date: Fri, 30 Nov 2018 02:08:53 -0000
Content-Type: text/plain

* V2
  Rebase to master-next and resend.

* V1
  Initial version

The following changes since commit e821100b1ee2a023b813adb20e56fe1ccc352d42:

  musl: Update to latest trunk (2018-11-29 23:34:46 +0000)

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


