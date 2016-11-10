Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E0F9460103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 07:08:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAA78PIV009886
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2016 23:08:25 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 23:08:24 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 15:01:22 +0800
Message-ID: <cover.1478760924.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Fix CVEs and qemu run-ptest script
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
X-List-Received-Date: Thu, 10 Nov 2016 07:08:26 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 09278be8c209976da03f63b5a956d212ac171317:

  conf/distro/include/maintainers: move toolchain to Khem Raj (2016-11-09 12:20:48 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/fixes-20161110
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fixes-20161110

Kai Kang (4):
  openssh: fix CVE-2016-8858
  glibc: fix CVE-2016-6323
  qemu: fix CVE-2016-7909
  qemu: update run-ptest script

 .../openssh/openssh/fix-CVE-2016-8858.patch        | 39 ++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb |  1 +
 ...k-__startcontext-as-.cantunwind-bug-20435.patch | 46 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
 .../qemu/qemu/0004-fix-CVE-2016-7909.patch         | 42 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu/run-ptest          |  8 ++--
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  1 +
 7 files changed, 135 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch

-- 
2.10.1


