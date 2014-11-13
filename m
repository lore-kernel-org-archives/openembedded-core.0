Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E70D965C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 04:42:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAD4g4XY020904
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 20:42:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 20:42:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 12:42:00 +0800
Message-ID: <cover.1415853569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] parted: upgrade to 3.2
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
X-List-Received-Date: Thu, 13 Nov 2014 04:42:10 -0000
Content-Type: text/plain

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-parted
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-meta-oe

Hongxu Jia (1):
  parted: upgrade to 3.2

 meta/recipes-extended/parted/files/Makefile        | 285 +++++++++++++++++++++
 .../files/fix-compile-failure-while-dis.patch      |  57 +++++
 .../parted/files/fix-doc-mandir.patch              |  20 ++
 meta/recipes-extended/parted/files/no_check.patch  |  20 ++
 meta/recipes-extended/parted/files/run-ptest       |   3 +
 meta/recipes-extended/parted/files/syscalls.patch  |  55 ++++
 .../parted/{parted_3.1.bb => parted_3.2.bb}        |   8 +-
 7 files changed, 443 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/parted/files/Makefile
 create mode 100644 meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
 create mode 100644 meta/recipes-extended/parted/files/fix-doc-mandir.patch
 create mode 100644 meta/recipes-extended/parted/files/no_check.patch
 create mode 100644 meta/recipes-extended/parted/files/run-ptest
 create mode 100644 meta/recipes-extended/parted/files/syscalls.patch
 rename meta/recipes-extended/parted/{parted_3.1.bb => parted_3.2.bb} (79%)

-- 
1.9.1


