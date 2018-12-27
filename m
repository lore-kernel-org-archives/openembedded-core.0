Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2A2C6C127
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 09:00:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBR8xr93005785
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 01:00:04 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Dec 2018 00:59:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2018 00:59:40 -0800
Message-ID: <cover.1545901142.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/3] oeqa related: 3 fixes
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
X-List-Received-Date: Thu, 27 Dec 2018 09:00:14 -0000
Content-Type: text/plain

The following changes since commit 7bbc453ac2b8d63680855789948a145fc448017f:

  glibc: Enable --with-default-link (2018-12-26 11:19:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/oeqa
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/oeqa

Robert Yang (3):
  oeqa: make it work for multiple users
  runqemu-gen-tapdevs: Allow run --help without sudo
  oeqa/utils/qemurunner: Print output when failed to login

 meta/classes/testimage.bbclass    |  2 +-
 meta/lib/oeqa/runtime/context.py  |  7 +++----
 meta/lib/oeqa/utils/dump.py       |  5 ++++-
 meta/lib/oeqa/utils/qemurunner.py |  1 +
 scripts/runqemu-gen-tapdevs       | 12 ++++++------
 5 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.10.2


