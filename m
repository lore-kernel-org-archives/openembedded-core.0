Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBA56605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 13:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2DWxJk021456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 05:32:59 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 05:32:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Dec 2015 05:32:56 -0800
Message-ID: <cover.1449063064.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] rpm: Enable MIPS64 N32 transactions
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
X-List-Received-Date: Wed, 02 Dec 2015 13:33:01 -0000
Content-Type: text/plain

The following changes since commit 687e5ef86361a16d6c411386939d4ba96a5909ea:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:31:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rpm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rpm

Mark Hatle (1):
  rpm_5.4.14: Enable MIPS64 N32 transactions

Robert Yang (1):
  rpm: fix file conflicts for MIPS64 N32

 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   43 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    4 ++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch

-- 
1.7.9.5


