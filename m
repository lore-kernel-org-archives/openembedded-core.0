Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 507A96B260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:13:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9DjJv020308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:13:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:13:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:13:39 +0800
Message-ID: <cover.1374224424.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/2] python: fix importing readline with probably escape sequence output
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
X-List-Received-Date: Fri, 19 Jul 2013 09:13:44 -0000
Content-Type: text/plain

Change from V1: explicitly set meta key off rather than hardcore the terminal to 'dumb'.

Also remove the duplicated sitecustomize.py in python-native.

//Hongxu

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-python-readlne
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-python-readlne

Hongxu Jia (2):
  python: fix importing readline with probably escape sequence output
  python-native: remove unused and duplicated sitecustomize.py

 .../python/python-native/sitecustomize.py          | 45 ----------------------
 meta/recipes-devtools/python/python.inc            |  4 +-
 ...-to-avoid-probable-escape-sequence-output.patch | 43 +++++++++++++++++++++
 3 files changed, 46 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/sitecustomize.py
 create mode 100644 meta/recipes-devtools/python/python/readline-set-meta-key-off-to-avoid-probable-escape-sequence-output.patch

-- 
1.8.1.2


