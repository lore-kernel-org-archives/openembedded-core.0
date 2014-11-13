Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC6D965C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 04:48:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD4mk5E002572
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 20:48:47 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 20:48:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 12:48:42 +0800
Message-ID: <cover.1415853991.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] parted: upgrade to 3.2
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
X-List-Received-Date: Thu, 13 Nov 2014 04:48:48 -0000
Content-Type: text/plain

Changed in V2:
Remove the obsolete parted-3.1 dir.

//Hongxu

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-parted
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-meta-oe

Hongxu Jia (1):
  parted: upgrade to 3.2

 .../parted/{parted-3.1 => files}/Makefile          |  0
 .../files/fix-compile-failure-while-dis.patch      | 57 ++++++++++++++++++++++
 .../{parted-3.1 => files}/fix-doc-mandir.patch     |  0
 .../parted/{parted-3.1 => files}/no_check.patch    |  0
 .../parted/{parted-3.1 => files}/run-ptest         |  0
 .../parted/{parted-3.1 => files}/syscalls.patch    |  0
 .../parted-3.1/fix-deprecated-readline.patch       | 34 -------------
 .../parted/parted-3.1/fix-dvh-overflows.patch      | 35 -------------
 .../parted/parted-3.1/fix-git-version-gen.patch    | 43 ----------------
 .../parted/{parted_3.1.bb => parted_3.2.bb}        |  8 ++-
 10 files changed, 60 insertions(+), 117 deletions(-)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/Makefile (100%)
 create mode 100644 meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
 rename meta/recipes-extended/parted/{parted-3.1 => files}/fix-doc-mandir.patch (100%)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/no_check.patch (100%)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/run-ptest (100%)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/syscalls.patch (100%)
 delete mode 100644 meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch
 delete mode 100644 meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
 delete mode 100644 meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
 rename meta/recipes-extended/parted/{parted_3.1.bb => parted_3.2.bb} (79%)

-- 
1.9.1


