Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3407606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 05:49:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t395nGIj017523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Apr 2015 22:49:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Apr 2015 22:49:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Apr 2015 13:49:27 +0800
Message-ID: <cover.1428558305.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] Fix for runtime error for rescue mode
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
X-List-Received-Date: Thu, 09 Apr 2015 05:49:16 -0000
Content-Type: text/plain

Changes in V2:
1. Add util-linux-sulogin to RDEPENDS of util-linux

The following changes since commit 6333186e9764b2c269a2b3869956860fa8fde2b1:

  binutils: Fix packaging now gold is always built (2015-04-08 23:10:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bug6698
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bug6698

Chen Qi (2):
  util-linux: split out util-linux-sulogin
  shadow: add 'util-linux-sulogin' to RDEPENDS

 meta/recipes-core/util-linux/util-linux.inc | 12 ++++++++----
 meta/recipes-extended/shadow/shadow.inc     |  3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
1.9.1


