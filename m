Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82BDF60557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 06:57:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x046vfI5011791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jan 2019 22:57:41 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 22:57:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jan 2019 15:15:42 +0800
Message-ID: <cover.1546585931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2 0/3] oeqa: Fix for QEMU_USE_KVM
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
X-List-Received-Date: Fri, 04 Jan 2019 06:57:40 -0000
Content-Type: text/plain

* V2:
  - Fix RP's comments:
    Enable KVM if the target arch matches build arch.

* V1:
  - Initial version

// Robert

The following changes since commit c22b0bf66a28324da66caf0660f171cc279a1f2b:

  cmake-native: Set --parallel for configure (2019-01-03 21:14:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kvm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/kvm

Robert Yang (3):
  oeqa: Fix for QEMU_USE_KVM
  oeqa/manual/bsp-qemu.json: Update for QEMU_USE_KVM
  oeqa/selftest/runqemu: Enable kvm when QEMU_USE_KVM is set

 meta/classes/testimage.bbclass          |  8 +-------
 meta/lib/oe/types.py                    | 24 ++++++++++++++++++++++++
 meta/lib/oeqa/manual/bsp-qemu.json      |  4 ++--
 meta/lib/oeqa/selftest/cases/runqemu.py |  5 +++++
 meta/lib/oeqa/targetcontrol.py          |  8 +-------
 5 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.7.4


