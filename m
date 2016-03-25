Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF82A6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 02:18:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2P2Ilmx023352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 19:18:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Mar 2016 19:18:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2016 10:19:08 +0800
Message-ID: <cover.1458872261.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix aarch64 multilib SDK problems
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
X-List-Received-Date: Fri, 25 Mar 2016 02:18:54 -0000
Content-Type: text/plain

The following changes since commit 34e7292fb40635cee1f1237ac3156530f8dfce37:

  parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:53:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/aarch64-multilib
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/aarch64-multilib

Chen Qi (1):
  libgcc: ensure gnueabi suffix is added when necessary

Robert Yang (1):
  cross-canadian/libgcc: fix aarch64's multilib SDK

 meta/classes/cross-canadian.bbclass         |  3 +++
 meta/recipes-devtools/gcc/libgcc-common.inc | 35 ++++++++++++++++++++++-------
 meta/recipes-devtools/gcc/libgcc.inc        |  2 +-
 3 files changed, 31 insertions(+), 9 deletions(-)

-- 
1.9.1


