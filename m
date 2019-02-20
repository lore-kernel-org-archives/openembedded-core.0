Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBD07CA09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 01:31:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K1VDAT016385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:31:34 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 19 Feb 2019 17:31:12 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2019 09:40:34 +0800
Message-ID: <cover.1550626729.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrade: kmod, sysstat, tar
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
X-List-Received-Date: Wed, 20 Feb 2019 01:31:43 -0000
Content-Type: text/plain

The following changes since commit 8476abec290e253685ea33fa528936241a31537e:

  mc: upgrade 4.8.21 -> 4.8.22 (2019-02-19 16:14:58 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20190220
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20190220

Chen Qi (3):
  kmod: upgrade to 26
  sysstat: upgrade to 12.1.3
  tar: upgrade to 1.31

 .../sysstat/{sysstat_12.1.1.bb => sysstat_12.1.3.bb}    |  4 ++--
 meta/recipes-extended/tar/{tar_1.30.bb => tar_1.31.bb}  |  9 ++-------
 meta/recipes-kernel/kmod/kmod.inc                       |  4 ++--
 ...-to-calling-bswap_-instead-of-htobe-and-be-toh.patch | 17 +++++++++--------
 .../recipes-kernel/kmod/kmod/avoid_parallel_tests.patch | 15 ++++++++++-----
 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch       | 13 +++++++------
 6 files changed, 32 insertions(+), 30 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.1.1.bb => sysstat_12.1.3.bb} (53%)
 rename meta/recipes-extended/tar/{tar_1.30.bb => tar_1.31.bb} (88%)

-- 
1.9.1


