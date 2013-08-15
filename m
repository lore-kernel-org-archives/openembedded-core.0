Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5A9361037
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 14:41:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7FEfLOD001423
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Aug 2013 07:41:21 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 15 Aug 2013 07:41:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 15 Aug 2013 10:41:11 -0400
Message-ID: <cover.1376577495.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto/3.8: configuration tweaks
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
X-List-Received-Date: Thu, 15 Aug 2013 14:41:24 -0000
Content-Type: text/plain

Saul/Richard,

Thes are two small configuration tweaks, that I didn't want to sit on
while the larger kernel updates brew.

One is from Khem for Yocto 1914 and the other is the emgd tweak from Nitin
that has already gone into use in the Intel BSPs.

Cheers,

Bruce

The following changes since commit ff10f72abda52315b892c64f711096772d9a4c1c:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:06:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto-3.8/meta: update drm and intel power management settings
  linux-yocto-3.8/meta: enable ALTIVEC for qemuppc

 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4


