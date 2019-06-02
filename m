Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC1266C216
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2019 14:55:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x52EtkYn022705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Jun 2019 07:55:47 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 2 Jun 2019 07:55:34 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 2 Jun 2019 10:55:28 -0400
Message-ID: <20190602145530.183521-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [meta-poky][PATCH v6 0/2] Make systemd as default init manager and configure wired network
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
X-List-Received-Date: Sun, 02 Jun 2019 14:55:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v6:
* create .inc files as Richard suggested, and include them according to POKY_INIT_MANAGER

Kai Kang (2):
  poky.conf: make systemd as default init manager
  systemd-conf: configure wired network with dhcp

 .../conf/distro/include/init-template-mdev-busybox.inc   | 7 +++++++
 .../conf/distro/include/init-template-systemd-compat.inc | 7 +++++++
 meta-poky/conf/distro/include/init-template-systemd.inc  | 5 +++++
 meta-poky/conf/distro/include/init-template-sysvinit.inc | 6 ++++++
 meta-poky/conf/distro/poky-tiny.conf                     | 8 +-------
 meta-poky/conf/distro/poky.conf                          | 6 ++++++
 meta/recipes-core/systemd/systemd-conf/wired.network     | 9 +++++++++
 meta/recipes-core/systemd/systemd-conf_242.bb            | 6 ++++++
 8 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 meta-poky/conf/distro/include/init-template-mdev-busybox.inc
 create mode 100644 meta-poky/conf/distro/include/init-template-systemd-compat.inc
 create mode 100644 meta-poky/conf/distro/include/init-template-systemd.inc
 create mode 100644 meta-poky/conf/distro/include/init-template-sysvinit.inc
 create mode 100644 meta/recipes-core/systemd/systemd-conf/wired.network

-- 
2.20.0


