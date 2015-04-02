Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42C51724DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 08:55:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t328tHeW013177
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Apr 2015 01:55:17 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 2 Apr 2015 01:55:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Apr 2015 01:55:15 -0700
Message-ID: <cover.1427964751.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] grub-efi: add PACKAGECONFIG for grub-mount and device-mapper
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
X-List-Received-Date: Thu, 02 Apr 2015 08:55:17 -0000
Content-Type: text/plain

The following changes since commit e6aab245623b6ba1ca5f06632d1028c863cef737:

  image_types: Add missing ext4 support (2015-03-31 22:38:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/grub
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/grub

Robert Yang (1):
  grub-efi: add PACKAGECONFIG for grub-mount and device-mapper

 meta/recipes-bsp/grub/grub2.inc    |    4 ++++
 meta/recipes-bsp/grub/grub_2.00.bb |    4 ----
 meta/recipes-bsp/grub/grub_git.bb  |    4 ----
 3 files changed, 4 insertions(+), 8 deletions(-)

-- 
1.7.9.5


