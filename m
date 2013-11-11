Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED186CFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:57:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rABBv2n8024475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Nov 2013 03:57:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 03:57:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 19:56:53 +0800
Message-ID: <cover.1384170897.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] kernel-grub.bbclass: fix update bzImage failed while /boot area within root partition
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
X-List-Received-Date: Mon, 11 Nov 2013 11:57:03 -0000
Content-Type: text/plain

The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:

  bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-bzimage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-bzimage

Hongxu Jia (1):
  kernel-grub.bbclass: support /boot area within root partition

 meta/classes/kernel-grub.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
1.8.1.2


