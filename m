Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B35FC78672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 01:53:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBK1rKPD017816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:53:20 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 19 Dec 2017 17:53:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Dec 2017 09:53:11 +0800
Message-ID: <cover.1513734733.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] sysvinit/systemd: inherit distro_features_check
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
X-List-Received-Date: Wed, 20 Dec 2017 01:53:19 -0000
Content-Type: text/plain

The following changes since commit 978472c58629d1448399207873bbead96b27102e:

  image.bbclass: Add additional bb.debug to help track 12304 (2017-12-18 18:02:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/systemd
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/systemd

Robert Yang (2):
  sysvinit: inherit distro_features_check
  systemd: inherit distro_features_check

 meta/recipes-core/systemd/systemd-serialgetty.bb | 10 ++++------
 meta/recipes-core/systemd/systemd_234.bb         | 13 +++++--------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb   |  9 +++------
 meta/recipes-core/udev/eudev_3.2.2.bb            |  9 +++------
 4 files changed, 15 insertions(+), 26 deletions(-)

-- 
2.7.4


