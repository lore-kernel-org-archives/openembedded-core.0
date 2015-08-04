Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D46E075A60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 03:28:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t743SSEo006839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Aug 2015 20:28:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 3 Aug 2015 20:28:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Aug 2015 11:25:34 +0800
Message-ID: <cover.1438658497.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V2: Fix rt-tests redo install error and add qemu ptest
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
X-List-Received-Date: Tue, 04 Aug 2015 03:28:30 -0000
Content-Type: text/plain

V2:
* add upstream status for add-ptest-in-makefile.patch of qemu.

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


