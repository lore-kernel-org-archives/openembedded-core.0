Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 338D76F587
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 14:45:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s23EjugI019843
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 06:45:56 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 06:45:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 22:49:47 +0800
Message-ID: <cover.1393855671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/3] grub: add oe's kernel name to the conf file
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
X-List-Received-Date: Mon, 03 Mar 2014 14:46:00 -0000
Content-Type: text/plain

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/grub
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/grub

Robert Yang (3):
  grub 2.00: add oe's kernel name to the conf file
  grub git: add oe's kernel name to the conf file
  grub-efi: add oe's kernel name to the conf file

 .../grub/files/grub-2.00-add-oe-kernel.patch       | 53 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
 meta/recipes-bsp/grub/grub_git.bb                  |  1 +
 4 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch

-- 
1.8.3.1


