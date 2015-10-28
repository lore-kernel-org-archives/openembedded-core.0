Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 57187755F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:53:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9S5rdFn008127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 22:53:39 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 27 Oct 2015 22:53:38 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 01:53:36 -0400
Message-ID: <cover.1445943047.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] gnupg: fix find-version for beta checking
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
X-List-Received-Date: Wed, 28 Oct 2015 05:53:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

Fix find-version beta checking logic from autogen.sh instead of set
development_version to 'no' in configure.ac.

The following changes since commit 8a0d8eee432924433c3e70198aaeab3161476c5f:

  toaster manual: Updated the set up and use chapter (2015-10-27 07:28:22 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/gnupg-new
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/gnupg-new

Wenzong Fan (1):
  gnupg: fix find-version for beta checking

 ...gen.sh-fix-find-version-for-beta-checking.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.1.7.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch

-- 
1.9.1


