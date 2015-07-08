Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF5D73B10
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 06:27:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t686R2mQ006683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 23:27:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 7 Jul 2015 23:27:01 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 14:25:59 +0800
Message-ID: <cover.1436336502.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/2] V2: Add /sbin/sushell when SELinux is enabled
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
X-List-Received-Date: Wed, 08 Jul 2015 06:27:07 -0000
Content-Type: text/plain

debug-shell.service from systemd starts different shell according to whether selinux is enabled.
If selinux is enabled, it starts /sbin/sushell. Add /sbin/sushell from fedora.

Tested with and without layer meta-selinux for x86-64.

The following changes since commit 8ad9a434c9fd0300cf5c38c368b181b78421e95a:

  bitbake: tests/data: Add new data tests (2015-07-01 15:40:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/initscripts
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/initscripts

Kai Kang (2):
  initscripts: add /sbin/sushell for systemd service debug-shell
  systemd: add PACKAGECONFIG selinux

 meta/recipes-core/initscripts/initscripts-1.0/sushell |  5 +++++
 meta/recipes-core/initscripts/initscripts_1.0.bb      | 10 +++++++++-
 meta/recipes-core/systemd/systemd_219.bb              |  5 ++++-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/sushell

-- 
1.9.1


