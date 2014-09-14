Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16A026FC4C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 06:48:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8E6mOIl001171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 23:48:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 13 Sep 2014 23:48:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Sep 2014 14:48:50 +0800
Message-ID: <cover.1410677291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] portmap: fixes for sysvinit and systemd
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
X-List-Received-Date: Sun, 14 Sep 2014 06:48:28 -0000
Content-Type: text/plain

The following changes since commit 10df0718d6a626d99beb68cde8d914ee0820d7eb:

  classes/populate_sdk_base: enable adding custom commands to SDK install script (2014-09-11 17:44:40 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/portmap-systemd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/portmap-systemd

Chen Qi (2):
  portmap: fix INITSCRIPT_PARAMS
  portmap: add systemd service file

 meta/recipes-connectivity/portmap/portmap.inc             |  7 +++++--
 meta/recipes-connectivity/portmap/portmap/portmap.service | 10 ++++++++++
 meta/recipes-connectivity/portmap/portmap_6.0.bb          |  7 ++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/portmap/portmap/portmap.service

-- 
1.9.1


