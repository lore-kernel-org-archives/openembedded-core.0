Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 28B616FED0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:49:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GDnKpG014517
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:49:20 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 16 Jun 2014 06:49:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 06:49:17 -0700
Message-ID: <cover.1402926503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] fix libpcap/systemd/guile
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
X-List-Received-Date: Mon, 16 Jun 2014 13:49:20 -0000
Content-Type: text/plain

The following changes since commit 3a88df915831f2fd5e46ed71b21190398d1de0f1:

  alsa-tools: Add missing pkgconfg dependency (2014-06-14 08:46:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/3fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/3fixes

Hu Yadi (1):
  libpcap: Avoid libpcap build error when libnl1 is involved

Robert Yang (1):
  systemd: check IFLA_VLAN_PROTOCOL

Yue Tao (1):
  guile: depends on texinfo-native

 meta/recipes-connectivity/libpcap/libpcap.inc      |    3 ++
 .../systemd/systemd/systemd-older-kernel.patch     |   56 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_213.bb           |    2 +-
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    2 +-
 4 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch

-- 
1.7.9.5


