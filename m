Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2FE376622
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 17:38:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t71HcY23016266
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 1 Aug 2015 10:38:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Sat, 1 Aug 2015 10:38:33 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 2 Aug 2015 01:35:51 +0800
Message-ID: <cover.1438450455.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/2] Fix rt-tests redo install error and add qemu ptest
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
X-List-Received-Date: Sat, 01 Aug 2015 17:38:35 -0000
Content-Type: text/plain

The following changes since commit a8bc06c3a001d89586f534c6411c3eeb2b106906:

  bitbake: bb.parse: properly error out on filesystem errors (2015-08-01 11:31:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/qemu-ptest
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemu-ptest

Kai Kang (2):
  rt-tests: fix redo install error
  qemu: add ptest sub-package

 meta/recipes-devtools/qemu/qemu.inc                | 16 +++++++-
 .../qemu/qemu/add-ptest-in-makefile.patch          | 29 +++++++++++++
 meta/recipes-devtools/qemu/qemu/run-ptest          |  8 ++++
 .../rt-tests/files/fix-re-install-failure.patch    | 48 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |  1 +
 5 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/run-ptest
 create mode 100644 meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch

-- 
1.9.1


