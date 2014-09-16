Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0073B65E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:08:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G88XxO029759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:08:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:08:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Sep 2014 16:09:01 +0800
Message-ID: <cover.1410854885.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] use ${PN} for SYSTEMD_SERVICE
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
X-List-Received-Date: Tue, 16 Sep 2014 08:08:36 -0000
Content-Type: text/plain

The following changes since commit 10df0718d6a626d99beb68cde8d914ee0820d7eb:

  classes/populate_sdk_base: enable adding custom commands to SDK install script (2014-09-11 17:44:40 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/multilib-SYSTEMD_SERVICE
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/multilib-SYSTEMD_SERVICE

Chen Qi (3):
  acpid: use ${PN} for SYSTEMD_SERVICE
  dhcp: use ${PN} for SYSTEMD_SERVICES
  volatile-binds: use ${PN} for SYSTEMD_SERVICE

 meta/recipes-bsp/acpid/acpid.inc                   |  3 +--
 meta/recipes-connectivity/dhcp/dhcp.inc            | 10 +++++-----
 meta/recipes-core/volatile-binds/volatile-binds.bb |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

-- 
1.9.1


