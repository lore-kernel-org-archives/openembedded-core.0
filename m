Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3B871DD0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 08:02:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8582qpg013195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 01:02:52 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 01:02:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 16:07:58 +0800
Message-ID: <cover.1504598502.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] systemd: fix dependency issue related to serial getty
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
X-List-Received-Date: Tue, 05 Sep 2017 08:02:51 -0000
Content-Type: text/plain

The following changes since commit 15eac6befb6c4d16bc1b814e040bd7bf006a5bee:

  linux-yocto: add linux-yocto 4.12 bbappends (2017-08-31 23:37:10 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-serialgetty
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-serialgetty

Chen Qi (2):
  systemd: change some RRECOMMENDS to RDEPENDS
  systemd-serialgetty: remove systemd from RDEPENDS

 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
 meta/recipes-core/systemd/systemd_234.bb         | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
1.9.1


