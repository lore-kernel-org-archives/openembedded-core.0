Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6FF8615E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:33:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8D5XGgM002108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 22:33:16 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 22:33:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 13:33:09 +0800
Message-ID: <cover.1379049723.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/4] fix LSB Command Check failed
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
X-List-Received-Date: Fri, 13 Sep 2013 05:33:16 -0000
Content-Type: text/plain

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

The following changes since commit 1b814498b60d5f354d8cc5bdf568b91baf0745dc:

  bitbake: bitbake/cooker: fix some calls of cookerdata.findConfigFile method (2013-09-02 12:26:20 +0100)

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
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |  4 ++--
 meta/recipes-extended/lsb/lsb_4.1.bb               |  4 ++--
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  3 ++-
 6 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch

-- 
1.8.1.2


