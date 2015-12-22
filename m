Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3022273188
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 01:17:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM1Hj9E002984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 17:17:45 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 17:17:45 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Dec 2015 09:04:52 +0800
Message-ID: <cover.1450746244.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Patches for guile and bind
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
X-List-Received-Date: Tue, 22 Dec 2015 01:17:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 5f406915b5e26761faa4ea5e0edd887ac5ae6e2f:

  bitbake: toaster: remove 2 confusing parameters (2015-12-18 13:51:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/misc

Kai Kang (2):
  guile: remove redundant replacement of .pc file
  bind: 9.10.2-P4 -> 9.10.3-P2

 .../0001-build-use-pkg-config-to-find-libxml2.patch  | 20 ++++++++++++++------
 .../bind/{bind_9.10.2-P4.bb => bind_9.10.3-P2.bb}    |  9 ++++++---
 meta/recipes-devtools/guile/guile_2.0.11.bb          | 19 ++++---------------
 3 files changed, 24 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.2-P4.bb => bind_9.10.3-P2.bb} (90%)

-- 
2.6.1


