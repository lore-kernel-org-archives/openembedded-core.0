Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E59F461EEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:43:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6M9hKLN025062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 02:43:20 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 22 Jul 2013 02:43:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jul 2013 17:43:16 +0800
Message-ID: <cover.1374484672.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V3 0/2] readline: fix importing readline in python with probably escape sequence output
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
X-List-Received-Date: Mon, 22 Jul 2013 09:43:20 -0000
Content-Type: text/plain

Change from V2: Backport to gnu readline library 6.2 rather than modify
                python to fix this issue.

//Hongxu

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-readlne
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-python-readlne

Hongxu Jia (2):
  readline: fix importing readline in python with probably escape
    sequence output
  python-native: remove unused and duplicated sitecustomize.py

 ...ly-enable-meta-key-for-a-single-call-read.patch | 114 +++++++++++++++++++++
 meta/recipes-core/readline/readline_6.2.bb         |   1 +
 .../python/python-native/sitecustomize.py          |  45 --------
 3 files changed, 115 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
 delete mode 100644 meta/recipes-devtools/python/python-native/sitecustomize.py

-- 
1.8.1.2


