Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A59577027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 07:40:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t917eJiC024246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Oct 2015 00:40:19 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 1 Oct 2015 00:40:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Oct 2015 00:40:18 -0700
Message-ID: <cover.1443684954.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] smart: speed up installation (reduce 28% ~ 57%)
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
X-List-Received-Date: Thu, 01 Oct 2015 07:40:20 -0000
Content-Type: text/plain

Here is the test result:
  MACHINE = "qemux86-64"
  - When multilib enabled:
    $ bitbake core-image-sato -cpopulate_sdk
    time: 6m5s -> 2m34s (Reduce 57% )

    $ bitbake core-image-minimal -cpopulate_sdk
    time: 2m1s -> 1m26s (Reduce 28% )

    $ bitbake core-image-sato-sdk
    time: 10m15s -> 7m12s (Reduce 29% )

  - When multilib NOT enabled:
    $ bitbake core-image-sato-sdk -cpopulate_sdk
    time: 4m25s -> 2m28s (Reduce 44% )

// Robert

The following changes since commit 16957f5f1de0f1fb4052d5aef93ee10c893f4a38:

  oeqa/selftest/wic: Use SetupLocal instead of Setup (2015-10-01 07:40:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/smart
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/smart

Robert Yang (1):
  smart:cache.py: getPackages() matches name + arch

 ...cache.py-getPackages-matches-name-version.patch |   43 ++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-cache.py-getPackages-matches-name-version.patch

-- 
1.7.9.5


