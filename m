Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601D16AD81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:06:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r64A6OV2000224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jul 2013 03:06:24 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 4 Jul 2013 03:06:22 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2013 18:06:20 +0800
Message-ID: <cover.1372931983.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] initscripts: add dmesg file to /var/log
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
X-List-Received-Date: Thu, 04 Jul 2013 10:06:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 682bcd0939697c34ce9bc7b2fe8f7d734f280490:

  initscripts: overwrite default hostname.sh (2013-07-04 17:19:03 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_udev-initscripts_dmesg_0704_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_udev-initscripts_dmesg_0704_1

Jackie Huang (1):
  initscripts: add dmesg file to /var/log

 .../initscripts/initscripts-1.0/dmesg.sh           |   17 +++++++++++++++++
 .../initscripts-1.0/logrotate-dmesg.conf           |    9 +++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 +++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/logrotate-dmesg.conf

-- 
1.7.4.1


