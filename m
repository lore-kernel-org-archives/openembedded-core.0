Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93D346D803
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 08:52:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s258qqM6012303
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Mar 2014 00:52:52 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 5 Mar 2014 00:52:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Mar 2014 16:52:48 +0800
Message-ID: <cover.1394009171.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V3 0/1] dhcp-client: fix invoke dhclient-script failed on Read-only file system
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
X-List-Received-Date: Wed, 05 Mar 2014 08:52:53 -0000
Content-Type: text/plain

Change in V3:
 - Reduce the calling from the shell script, use shell variable instead;

//Hongxu

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-dhcpclient
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-dhcpclient

Hongxu Jia (1):
  dhcp-client: fix invoke dhclient-script failed on Read-only file
    system

 ...dhclient-script-drop-resolv.conf.dhclient.patch | 70 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb    |  3 +-
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch

-- 
1.8.1.2


