Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC1686011C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:46:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x037kvSi028226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jan 2019 23:46:57 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 23:46:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 16:04:58 +0800
Message-ID: <cover.1546502650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] oeqa: Fix for QEMU_USE_KVM
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
X-List-Received-Date: Thu, 03 Jan 2019 07:46:57 -0000
Content-Type: text/plain

The following changes since commit caa776bdcf8ea34c857f45970370bf771075f4bc:

  testimage.bbclass: remove boot parameter systemd.log_target (2018-12-27 22:50:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kvm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/kvm

Robert Yang (2):
  oeqa: Fix for QEMU_USE_KVM
  oeqa/selftest/runqemu: enable kvm when QEMU_USE_KVM is set

 meta/classes/testimage.bbclass          |  8 +-------
 meta/lib/oe/types.py                    | 18 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/runqemu.py |  5 +++++
 meta/lib/oeqa/targetcontrol.py          |  8 +-------
 4 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.7.4


