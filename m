Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACF87F261
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:44:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T3i6c8012919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 20:44:06 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 20:44:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Sep 2019 11:44:10 +0800
Message-ID: <cover.1569728615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] bluez5: Fix for --enable-btpclient
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
X-List-Received-Date: Sun, 29 Sep 2019 03:44:05 -0000
Content-Type: text/plain

The following changes since commit f963a51544a9a7b1abbaa87c95b3c0279847d697:

  kernel.fitimage.bbclass: remove ramdisk_ctype (2019-09-27 13:01:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bluez
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/bluez

Robert Yang (1):
  bluez5: Fix for --enable-btpclient

 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../0001-tools-btpclient.c-include-signal.h.patch  | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch

-- 
2.7.4


