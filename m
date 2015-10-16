Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5797677120
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 05:57:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G5vj8I000476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 22:57:45 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 15 Oct 2015 22:57:44 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2015 01:57:42 -0400
Message-ID: <cover.1444974811.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] mdadm: fix CFLAGS and ptest issue
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
X-List-Received-Date: Fri, 16 Oct 2015 05:57:45 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

* update commit subject:
  mdadm: fix CFLAGS invalid issue -> mdadm: fix CFLAGS and ptest issue

* rebase changes against latest master branch.

The following changes since commit 556c0ea92eb32ddb9c9a5e30a74b2ca24ac69c68:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:37 +0300)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/mdadm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/mdadm

Wenzong Fan (1):
  mdadm: fix CFLAGS and ptest issue

 .../mdadm/files/mdadm-fix-ptest-build-error.patch  | 34 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-error.patch

-- 
1.9.1


