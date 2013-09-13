Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 209046100B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:14:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D8EkAR000356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:14:46 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 01:14:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 16:14:40 +0800
Message-ID: <cover.1379059861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/4] fix LSB Command Check failed
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
X-List-Received-Date: Fri, 13 Sep 2013 08:14:44 -0000
Content-Type: text/plain

Change in V2: Rebase to current branch.

*Problem
LSB Command Check failed
...
su 1 failed
install_initd 1 failed
remove_initd 1 failed
...

The journal shows the command didsn't exist.
...
Looking for command su
Looking for command install_initd
Looking for command remove_initd
...

//Hongxu


The following changes since commit dd36930f3f37b2e0e1258de28ac1b1fa99cf196f:

  bitbake: data_smart: Account for changes in append/prepend/remove in the config hash (2013-09-12 17:03:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-lsb-cmdchek
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lsb-cmdchek

Hongxu Jia (4):
  LSB Command Check: fix install_initd and remove_initd not found
  busybox: move su to /bin for lsb command check test
  shadow: move su to /bin for lsb command check test
  util-linux: move su to /bin for lsb command check test

 .../busybox/busybox-1.21.1/su-usr-bin.patch        | 26 ----------------------
 meta/recipes-core/busybox/busybox_1.21.1.bb        |  1 -
 meta/recipes-core/util-linux/util-linux.inc        |  4 ++--
 meta/recipes-extended/lsb/lsb_4.1.bb               |  4 ++--
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  3 ++-
 5 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch

-- 
1.8.1.2


