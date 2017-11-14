Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6150278372
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 06:58:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE6wuxg024459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 22:58:56 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 22:58:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 14:57:35 +0800
Message-ID: <cover.1510642397.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] targetcontrol.py: make QEMU_USE_KVM = "1" work
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
X-List-Received-Date: Tue, 14 Nov 2017 06:58:56 -0000
Content-Type: text/plain

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/use_qemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/use_qemu

Robert Yang (1):
  targetcontrol.py: make QEMU_USE_KVM = "1" work

 meta/classes/testimage.bbclass | 2 +-
 meta/lib/oeqa/targetcontrol.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


