Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D48836FA6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 05:35:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s545Zhgd012800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jun 2014 22:35:43 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Jun 2014 22:35:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jun 2014 13:35:40 +0800
Message-ID: <cover.1401859998.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1][V2] nfs-utils: unset CFLAGS for testlk build
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
X-List-Received-Date: Wed, 04 Jun 2014 05:35:47 -0000
Content-Type: text/plain

Change since V1:
unset CFLAGS for testlk build and still use host compiler.

The following changes since commit e7114046be6e71fb326477dc882adb814ef6a751:

  busybox: fix meta-yocto's bbappend's FILESEXTRAPATH (2014-06-03 17:53:13 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/nfs-utils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nfs-utils

Chong Lu (1):
  nfs-utils: unset CFLAGS for testlk build

 .../nfs-utils-unset-CFLAGS-for-testlk-build.patch  | 31 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch

-- 
1.8.1.2


