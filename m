Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D195E6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 01:28:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O1Se1Q022433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:28:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 23 Aug 2016 18:28:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2016 09:27:06 +0800
Message-ID: <cover.1472001956.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/2] Toggle bind configure options
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
X-List-Received-Date: Wed, 24 Aug 2016 01:28:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 94646f4828c2aa11a89996763edaa2e9d57106a9:

  oeqa/buildiptables: Switch from netfilter.org to yoctoproject.org mirror (2016-08-23 17:59:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/bind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bind

Kai Kang (2):
  bind: enable threads support and use epoll
  dhcp: build shared libraries

 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   6 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   6 +-
 .../dhcp/dhcp/build-shared-libs.patch              | 186 +++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb       |   1 +
 4 files changed, 194 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch

-- 
2.9.3


