Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SkgD5-0007Hl-4F
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 20:46:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5TIZSht002372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 11:35:29 -0700 (PDT)
Received: from yow-pgortmak-d2.corp.ad.wrs.com (128.224.146.165) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 29 Jun 2012 11:35:28 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 14:35:12 -0400
Message-ID: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.7.9.6
MIME-Version: 1.0
Subject: [PATCH 0/3] u-boot recipe updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 18:46:27 -0000
Content-Type: text/plain

These are the oe-core updates required so that yocto can do
a successful build of a working u-boot image for the mpc8315
reference BSP.

A follow up patch will be sent to the yocto list to enable
building it by default for the mpc8315-rdb.

---

Paul Gortmaker (3):
  u-boot: Don't make the -Os removal part of global settings.
  u-boot: make FILESDIR a shared setting.
  u-boot: make sure CROSS_COMPILE is passed into build

 meta/recipes-bsp/u-boot/u-boot.inc           |    4 +---
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    5 +++--
 4 files changed, 4 insertions(+), 9 deletions(-)

-- 
1.7.9.6



