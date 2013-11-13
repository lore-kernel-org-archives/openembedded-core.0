Return-Path: <Hongbo.Zhong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5DB96D843
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 10:08:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rADA8hKc008475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:08:43 -0800 (PST)
Received: from hzhong.corp.ad.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 02:08:42 -0800
From: Zhong Hongbo <hongbo.zhong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 18:08:53 +0800
Message-ID: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] bluez4: Install and fix simpe-agent
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
X-List-Received-Date: Wed, 13 Nov 2013 10:08:41 -0000
Content-Type: text/plain

Zhong Hongbo (2):
  bluez4: Install simple-agent utility for pairing bluetooth devices
  bluez4: Fix no moudle named gi.repository and GObject for
    simpel-agent

 ...x-no-module-name-GObject-for-simple-agent.patch |   25 ++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-no-module-name-GObject-for-simple-agent.patch


