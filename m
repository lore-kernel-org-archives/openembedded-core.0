Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41EE06C5D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:09:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN29YnA010003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:09:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:09:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:16:23 +0800
Message-ID: <cover.1542939066.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/9] Fixes for busybox ptest
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
X-List-Received-Date: Fri, 23 Nov 2018 02:09:34 -0000
Content-Type: text/plain

Changes in V2:
* fix bzip2 recipe to extend its alternatives list
* check CONFIG_DESKTOP beforing using 'od -t' in test cases

Changes in V3:
* add a symlink farm for busybox ptest to ensure utilities provided by busybox are used in ptest
* default hostname to 'localhost'
* drop the patch to remove three test cases for hostname

The following changes since commit 6b84ac788321b24cfa2e6a883806eb3f3198254b:

  ref-manual: Updated list of supported Linux Distros: (2018-11-22 12:20:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-ptest
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-ptest

Chen Qi (8):
  busybox: enable bzip2 by default
  bzip2: extend alternatives list to include bzip2
  busybox: add zip to RDEPENDS of ptest package
  busybox: check uudecode before using it in test case
  busybox: use example.org instead of google.com in wget test case
  busybox: fix du-l-works test case
  busybox: check CONFIG_DESKTOP before using 'od -t' in test case
  base-files: default hostname to localhost

Ross Burton (1):
  busybox: ship a symlink farm for ptest

 meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
 meta/recipes-core/busybox/busybox.inc              | 17 +++++
 ...-du-l-works-fix-to-use-145-instead-of-144.patch | 32 +++++++++
 ...te-check-CONFIG_DESKTOP-before-using-od-t.patch | 83 ++++++++++++++++++++++
 ...-testsuite-check-uudecode-before-using-it.patch | 45 ++++++++++++
 ...e-use-www.example.org-for-wget-test-cases.patch | 62 ++++++++++++++++
 meta/recipes-core/busybox/busybox/defconfig        |  2 +-
 meta/recipes-core/busybox/busybox_1.29.2.bb        |  4 ++
 meta/recipes-core/busybox/files/run-ptest          |  5 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  2 +-
 10 files changed, 250 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-du-l-works-fix-to-use-145-instead-of-144.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-uudecode-before-using-it.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-use-www.example.org-for-wget-test-cases.patch

-- 
1.9.1


