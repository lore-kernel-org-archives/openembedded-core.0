Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC2172738
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 01:39:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI1d09M001332
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Dec 2014 17:39:01 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 17 Dec 2014 17:39:00 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 09:36:39 +0800
Message-ID: <1418866600-19393-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] Upgrade qemu to version 2.2.0
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
X-List-Received-Date: Thu, 18 Dec 2014 01:39:11 -0000
Content-Type: text/plain

Hi Ross,

This upgrade includes the signle step support for aarch64, so I'll drop the
patch which add the single step support in the qemuarm64 serial commits.

Kai Kang (1):
  qemu: upgrade to 2.2.0

 .../files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch  | 10 +++++++---
 meta/recipes-devtools/qemu/{qemu_2.1.2.bb => qemu_2.2.0.bb}    |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.1.2.bb => qemu_2.2.0.bb} (82%)

-- 
1.9.1


