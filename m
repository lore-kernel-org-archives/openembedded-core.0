Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61CDA60144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 08:31:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s488VcjB025549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 May 2014 01:31:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 8 May 2014 01:31:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 May 2014 16:31:51 +0800
Message-ID: <cover.1399537861.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: fix parallel build issure for PATHFILES
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
X-List-Received-Date: Thu, 08 May 2014 08:31:40 -0000
Content-Type: text/plain

The following changes since commit 337798fa5c0a1d1e745a143f6a9f398b07f0628f:

  python3/gcc/autoconf: Fix Upstream-Status in some patches I authored (2014-05-07 15:14:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/util-linux-PATHFILES
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/util-linux-PATHFILES

Chen Qi (1):
  util-linux: fix parallel build issure for PATHFILES

 ...ensure-the-existence-of-directory-for-PAT.patch |   34 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.2.bb  |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch

-- 
1.7.9.5


