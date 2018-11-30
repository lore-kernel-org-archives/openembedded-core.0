Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 645646BE39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 01:58:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAU1wZZ5004354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 17:58:35 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 17:58:34 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2018 20:58:21 -0500
Message-ID: <cover.1543542953.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] u-boot-tools: fix compile error
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
X-List-Received-Date: Fri, 30 Nov 2018 01:58:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 41d89552620bfbc94031d314e6b3d0324f7a330e:

  bitbake: fetch2: Avoid warning about incorrect character escaping in regex (2018-11-27 22:15:34 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/uboot
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/uboot

Kai Kang (1):
  u-boot-tools: fix compile error

 meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.19.0.rc2


