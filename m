Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82CB873000
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 02:25:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1M2PgAC032424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Feb 2017 18:25:43 -0800
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 18:25:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 10:25:39 +0800
Message-ID: <cover.1487729362.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH V5 0/1] bash: 4.3.30 -> 4.4
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
X-List-Received-Date: Wed, 22 Feb 2017 02:25:48 -0000
Content-Type: text/plain

Changed in V5:
- Squash into a single commit.

Changed in V4:
- Rebase bash, to drop backported patch CVE-2016-9401.patch

//Hongxu

The following changes since commit e436a6398684d2872cb541f1cfb0f67b3618d15a:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:39:03 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20170214
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20170214

Zheng Ruoqin (1):
  bash: 4.3.30 -> 4.4

 ...e-builtins-uname-could-not-be-parsed-by-r.patch |  89 +++++++++++++
 .../0001-patch-to-obtain-pkgconfig-sanity.patch    |  28 +++++
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 --------
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 137 ++-------------------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 -----------------
 meta/recipes-extended/bash/bash/test-output.patch  |  20 ++-
 meta/recipes-extended/bash/bash_4.3.30.bb          |  72 -----------
 meta/recipes-extended/bash/bash_4.4.bb             |  66 ++++++++++
 8 files changed, 209 insertions(+), 363 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
 create mode 100644 meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb

-- 
2.9.3


