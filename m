Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6265970057
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 04:35:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB64Zgcj007493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Dec 2017 20:35:43 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Dec 2017 20:35:41 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Dec 2017 12:37:03 +0800
Message-ID: <cover.1512534912.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/3] Upgrade coreutils and pciutils
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
X-List-Received-Date: Wed, 06 Dec 2017 04:35:42 -0000
Content-Type: text/plain

Changes in V2:
* Backport a patch from upstream git repo to fix build failure on centos7.

The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-coreutils-pciutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-coreutils-pciutils

Chen Qi (3):
  pciutils: upgrade to 3.5.6
  coreutils: upgrade to 8.28
  coreutils: add PACKAGECONFIG for single-binary

 .../{pciutils_3.5.5.bb => pciutils_3.5.6.bb}       |  4 +--
 ...c-fix-Up-field-of-realpath-usage-examples.patch | 40 ++++++++++++++++++++++
 .../{coreutils_8.27.bb => coreutils_8.28.bb}       | 10 +++---
 3 files changed, 48 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.5.bb => pciutils_3.5.6.bb} (92%)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
 rename meta/recipes-core/coreutils/{coreutils_8.27.bb => coreutils_8.28.bb} (93%)

-- 
1.9.1


