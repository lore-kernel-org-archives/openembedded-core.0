Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7457814B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:29:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K7Tv7f028899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 00:29:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 20 Jul 2017 00:29:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 15:33:57 +0800
Message-ID: <cover.1500535946.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dhcp: add dhclient.service
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
X-List-Received-Date: Thu, 20 Jul 2017 07:29:57 -0000
Content-Type: text/plain

The following changes since commit 57f606b12b339c82e6981d7ac32450c00d787085:

  libgcrypt: upgrade to 1.7.8 (2017-07-19 15:13:40 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/dhclient_service
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/dhclient_service

Chen Qi (1):
  dhcp: add dhclient.service

 meta/recipes-connectivity/dhcp/dhcp.inc            | 21 ++++++++++--
 .../dhcp/files/dhclient-systemd-wrapper            | 39 ++++++++++++++++++++++
 .../dhcp/files/dhclient.service                    | 13 ++++++++
 3 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient.service

-- 
1.9.1


