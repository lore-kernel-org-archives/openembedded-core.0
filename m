Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 704FA6A60F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 06:31:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r566VKXG013790
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jun 2013 23:31:21 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 5 Jun 2013 23:31:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 14:31:16 +0800
Message-ID: <cover.1370499356.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] init-live.sh: fix media automount failed after booting from usb-drive
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
X-List-Received-Date: Thu, 06 Jun 2013 06:31:20 -0000
Content-Type: text/plain

The following changes since commit 5cb59cc6910d8f3165528c4a71e29e4de897d242:

  yocto-bsp: re-enable AutoAddDevices in xorg.conf for generated BSPs (2013-05-29 22:25:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-init-live
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-init-live

Hongxu Jia (1):
  init-live.sh: fix media automount failed after booting from usb-drive

 meta/recipes-core/initrdscripts/files/init-live.sh |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.10.4


