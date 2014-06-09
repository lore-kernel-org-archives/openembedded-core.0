Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9E96ABDA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 06:30:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s596UIxM017499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jun 2014 23:30:18 -0700 (PDT)
Received: from PEK-WKANG-D1.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sun, 8 Jun 2014 23:30:17 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jun 2014 14:29:32 +0800
Message-ID: <1402295373-27606-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2] bash: fix to build bash/po/ correctly
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
X-List-Received-Date: Mon, 09 Jun 2014 06:30:24 -0000
Content-Type: text/plain

Changes from V1:
1. add Signed-off-by: tag
2. remake the patch, make it can apply correctly

Wenlin Kang (1):
  bash: fix to build bash/po/ correctly

 .../bash/bash/fix-to-build-po-correctly.patch      |   87 ++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.bb             |    1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-to-build-po-correctly.patch

-- 
1.7.9.5


