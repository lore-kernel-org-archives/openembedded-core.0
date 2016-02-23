Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF1117704E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 02:49:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1N2n9uM020409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Feb 2016 18:49:09 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Feb 2016 18:49:08 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 10:45:56 +0800
Message-ID: <cover.1456195451.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V3: Replace retry logic in useradd with flock
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
X-List-Received-Date: Tue, 23 Feb 2016 02:49:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V3:

* remove checks before operations such as useradd/userdel etc.

The following changes since commit ea8c34e976c11757ed9869c51b48f39050e25708:

  libnewt: Fix build with PIE flags (2016-02-21 09:32:43 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/flockv3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/flockv3

Kai Kang (1):
  useradd_base.bbclass: fix simultaneous with flock

 meta/classes/useradd.bbclass      |   6 +-
 meta/classes/useradd_base.bbclass | 186 ++++++++------------------------------
 2 files changed, 40 insertions(+), 152 deletions(-)

-- 
2.6.1


