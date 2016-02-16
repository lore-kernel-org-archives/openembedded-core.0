Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1FD731B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 07:14:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1G7ENX5020000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Feb 2016 23:14:23 -0800 (PST)
Received: from k-desktop.wrs.com (128.224.162.231) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Feb 2016 23:14:22 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Feb 2016 15:14:12 +0800
Message-ID: <cover.1455606710.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V2: Replace retry logic in useradd with flock
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
X-List-Received-Date: Tue, 16 Feb 2016 07:14:26 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:

* Use $SYSROOT/etc as flock file

The following changes since commit da13f0bce5d1b3c52f5716ae8d104372a820e5f9:

  buildhistory.bbclass: remove out-dated information on request (2016-02-15 17:47:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/flock
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/flock

Kai Kang (1):
  useradd_base.bbclass: fix simultaneous with flock

 meta/classes/useradd.bbclass      |   8 +-
 meta/classes/useradd_base.bbclass | 165 ++++++++++----------------------------
 2 files changed, 48 insertions(+), 125 deletions(-)

-- 
2.7.0


