Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD8306F594
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 10:56:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s23Au9mr001818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 02:56:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 02:56:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 18:55:56 +0800
Message-ID: <cover.1393839207.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/2] bash: upgrade to 4.3
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
X-List-Received-Date: Mon, 03 Mar 2014 10:56:13 -0000
Content-Type: text/plain

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/bash
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/bash

Hongxu Jia (2):
  bash: upgrade to 4.3
  bash: update build-tests.patch

 .../bash/{bash-4.2 => bash}/build-tests.patch      | 33 ++++++++------
 .../bash/{bash-4.2 => bash}/execute_cmd.patch      |  0
 .../mkbuiltins_have_stringize.patch                |  0
 .../bash/{bash-4.2 => bash}/run-ptest              |  0
 .../bash/{bash-4.2 => bash}/test-output.patch      |  0
 meta/recipes-extended/bash/bash_4.2.bb             | 50 ----------------------
 meta/recipes-extended/bash/bash_4.3.bb             | 18 ++++++++
 7 files changed, 38 insertions(+), 63 deletions(-)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/build-tests.patch (51%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/execute_cmd.patch (100%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/mkbuiltins_have_stringize.patch (100%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/run-ptest (100%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/test-output.patch (100%)
 delete mode 100644 meta/recipes-extended/bash/bash_4.2.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.3.bb

-- 
1.8.1.2


