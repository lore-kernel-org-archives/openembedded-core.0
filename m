Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15F2C76932
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:22:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B8Mri0025933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:22:53 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 11 Aug 2015 01:22:52 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Aug 2015 16:22:22 +0800
Message-ID: <cover.1439279286.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] kernel: Correct mishandling of linux.bin for building uImage
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
X-List-Received-Date: Tue, 11 Aug 2015 08:22:59 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The following changes since commit a16e0b4014173af46ef80d643bb71055219b0dab:

  bitbake: toaster: reduced amount of instance attributes (2015-08-10 13:58:02 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib zhe/kernel-uboot
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/kernel-uboot

for you to fetch changes up to 925eb33167a5510d9d2ec76b0d3e1c2f3f109008:

  kernel: Correct mishandling of linux.bin for building uImage (2015-08-11 03:37:27 -0400)

----------------------------------------------------------------
He Zhe (1):
      kernel: Correct mishandling of linux.bin for building uImage

 meta/classes/kernel-uboot.bbclass | 1 -
 1 file changed, 1 deletion(-)

-- 
1.9.1


