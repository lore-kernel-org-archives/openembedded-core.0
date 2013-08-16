Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id A177F6B4FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:38:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7G9c8DW017471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 05:38:08 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 02:38:07 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 17:38:08 +0800
Message-ID: <cover.1376630883.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/2] minimal-installer: improvements and bug fixes
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
X-List-Received-Date: Fri, 16 Aug 2013 09:38:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit a7d1241db1120a5cce91395812e2613d1eacd652:

  Temporary workaround with qemu images (2013-08-16 10:37:37 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/minimal-installer
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/minimal-installer

Chen Qi (2):
  init-install.sh: improve hard drive searching process
  init-install.sh: fix to handle the boot partition correctly

 meta/recipes-bsp/grub/grub-2.00/40_custom          |    2 +-
 .../initrdscripts/files/init-install.sh            |  160 ++++++++++----------
 2 files changed, 85 insertions(+), 77 deletions(-)

-- 
1.7.9.5


