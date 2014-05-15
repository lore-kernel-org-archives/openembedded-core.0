Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B62C565F99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 08:54:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4F8sZHU027282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 01:54:35 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 01:54:34 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 16:54:31 +0800
Message-ID: <cover.1400144017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] syslinux-native: fix parallel building issue
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
X-List-Received-Date: Thu, 15 May 2014 08:54:38 -0000
Content-Type: text/plain

The following changes since commit d6900a5fe7670cb4514969d60e0ca65372121c87:

  wic: Extend indirect string connection to support image names and rootfs (2014-05-13 19:35:11 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/syslinux
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/syslinux

Chong Lu (1):
  syslinux-native: fix parallel building issue

 .../syslinux-fix-parallel-building-issue.patch     | 38 ++++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch

-- 
1.8.1.2


