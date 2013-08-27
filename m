Return-Path: <Rongqing.Li@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id E617B6B8CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 02:07:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7R27eNg000307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 22:07:40 -0400 (EDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 26 Aug 2013 19:07:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 10:07:42 +0800
Message-ID: <cover.1377568883.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]libnfsidmap: Add and modify idmapd.conf
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
X-List-Received-Date: Tue, 27 Aug 2013 02:07:42 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 58d05c817cf3be071c66c7e4dbbb9942fd7a0752:

  xdg-utils: add runtime dependency on xprop (2013-08-23 16:08:30 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/libnfsidmap
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/libnfsidmap

Zhang Xiao (1):
  libnfsidmap: Add and modify idmapd.conf

 .../nfs-utils/files/Set_nobody_user_group.patch      |   18 ++++++++++++++++++
 .../nfs-utils/libnfsidmap_0.25.bb                    |    7 +++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch

-- 
1.7.10.4


