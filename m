Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 737DC612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 21:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB2LUlpr009731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 13:30:47 -0800
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 13:30:46 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Dec 2015 15:30:43 -0600
Message-ID: <1449091845-168695-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [v2 PATCH 0/2] rpm: Enable MIPS64 N32 transactions
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
X-List-Received-Date: Wed, 02 Dec 2015 21:30:49 -0000
Content-Type: text/plain

patch 1/2 is the same.  patch 2/2 was revised.

Mark Hatle (1):
  rpm_5.4.14: Enable MIPS64 N32 transactions

Robert Yang (1):
  rpm: fix file conflicts for MIPS64 N32

 ...ction.c-fix-file-conflicts-for-mips64-N32.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  4 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch

-- 
2.5.0


