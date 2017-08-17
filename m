Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5967840A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:19:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H6JmXT007135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:19:48 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 23:19:47 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 02:19:45 -0400
Message-ID: <cover.1502950742.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cairo: Fix CVE-2017-9814
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
X-List-Received-Date: Thu, 17 Aug 2017 06:19:47 -0000
Content-Type: text/plain

The following changes since commit 55bf88603927469de9aa9f6fd4d449230d2e61e3:

  poky: Add nios2 to list of qemu targets (2017-08-17 00:21:35 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/fix-CVE-2017-9814
  https://github.com//tree/dengke/fix-CVE-2017-9814

Dengke Du (1):
  cairo: Fix CVE-2017-9814

 .../cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch | 45 ++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.10.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch

-- 
2.8.1


