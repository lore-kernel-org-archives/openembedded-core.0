Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08768731C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 08:55:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6L8td0j023780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 01:55:42 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 21 Jul 2016 01:55:37 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2016 16:52:57 +0800
Message-ID: <cover.1469091122.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix a error in kernel-uimage.bbclass
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
X-List-Received-Date: Thu, 21 Jul 2016 08:55:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 36feb38045b7a2af86ece147fec54b0db3bf491f:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4 (2016-07-21 07:48:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/kernel

Kai Kang (1):
  kernel-uimage.bbclass: indeed update var KERNEL_IMAGETYPE_FOR_MAKE

 meta/classes/kernel-uimage.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.9.2.368.g08bb350


