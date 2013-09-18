Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8466C722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 05:09:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8I59fQX011328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:09:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Sep 2013 22:09:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 13:09:38 +0800
Message-ID: <cover.1379480857.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pciutils: remove pcimodules
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
X-List-Received-Date: Wed, 18 Sep 2013 05:09:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit 1ab0813c819d3b785178faa458486efa6992c636:

  linux-yocto/3.10: genericx86 meta data factoring (2013-09-14 08:36:23 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/pciutils-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/pciutils-1

Roy Li (1):
  pciutils: remove pcimodules

 .../pciutils/pciutils-3.2.0/lib-build-fix.patch    |   20 +-
 .../pciutils-3.2.0/pcimodules-pciutils.diff        |  340 --------------------
 meta/recipes-bsp/pciutils/pciutils_3.2.0.bb        |    1 -
 3 files changed, 9 insertions(+), 352 deletions(-)
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils-3.2.0/pcimodules-pciutils.diff

-- 
1.7.10.4


