Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1DDF6C7A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:35:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8H2Z5iV025251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 19:35:55 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 16 Sep 2013 19:35:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2013 22:35:01 -0400
Message-ID: <cover.1379384999.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] python-smartpm: truncate the filename to meet NAME_MAX
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
X-List-Received-Date: Tue, 17 Sep 2013 02:35:55 -0000
Content-Type: text/plain

Now, with this and other patches that have been sent, the build work
well when len(TMPDIR) = 410

MACHINE = qemux86
PACKAGE_CLASSES ?= "package_rpm"
$ bitbake core-image-sato core-image-sato-sdk meta-toolchain-sdk

// Robert

The following changes since commit 39931100ed6fb53105bf159edbdead0260d824a6:

  coreutils: set acpaths to avoid "Argument list too long" error (2013-09-16 22:23:14 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/smart
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/smart

Robert Yang (1):
  python-smartpm: truncate the filename to meet NAME_MAX

 .../python-smartpm/smart-filename-NAME_MAX.patch   |   35 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch

-- 
1.7.10.4


