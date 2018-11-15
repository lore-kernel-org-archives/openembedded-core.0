Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21AAA6C182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:55:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAF1toEh022336
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 17:55:50 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 17:55:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 10:02:26 +0800
Message-ID: <cover.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/8] Fixes for busybox ptest
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
X-List-Received-Date: Thu, 15 Nov 2018 01:55:50 -0000
Content-Type: text/plain

The following changes since commit be1c84a91eb3ddddbef5cb7d4f74ffbb0ffe5778:

  poky.conf: Update the distros we test against on the autobuilder (2018-11-14 11:18:18 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-ptest
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-ptest

Chen Qi (8):
  busybox: enable bzip2 by default
  busybox: skip known bugs in ptest
  busybox: add zip to RDEPENDS of ptest package
  busybox: check uudecode before using it in test case
  busybox: use example.org instead of google.com in wget test case
  busybox: remove three hostname test cases
  busybox: fix du-l-works test case
  busybox: add coreutils to RDEPENDS of busybox-ptest

 meta/recipes-core/busybox/busybox.inc              | 12 +++++
 ...-du-l-works-fix-to-use-145-instead-of-144.patch | 32 +++++++++++
 ...-testsuite-check-uudecode-before-using-it.patch | 45 ++++++++++++++++
 ...e-use-www.example.org-for-wget-test-cases.patch | 62 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox/defconfig        |  2 +-
 meta/recipes-core/busybox/busybox_1.29.2.bb        |  3 ++
 meta/recipes-core/busybox/files/run-ptest          |  1 +
 7 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-du-l-works-fix-to-use-145-instead-of-144.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-use-www.example.org-for-wget-test-cases.patch

-- 
1.9.1


