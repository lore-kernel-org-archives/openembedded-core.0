Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00BD178371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 15:40:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7GFeknM019480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Aug 2017 08:40:46 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 08:40:45 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 23:30:00 +0800
Message-ID: <cover.1502897149.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1][V2] nss: 3.30.2 -> 3.31.1
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
X-List-Received-Date: Wed, 16 Aug 2017 15:40:47 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* remove 0001-Fix-warnings-found-with-gcc7.patch

The following changes since commit 6016ec177af2406cacfeb3276dfcb8bfc3df8fce:

  poky.conf: Enable vulkan by default (2017-08-16 00:04:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/nss

Kai Kang (1):
  nss: 3.30.2 -> 3.31.1

 .../nss/0001-Fix-warnings-found-with-gcc7.patch    | 41 ----------------------
 .../nss/{nss_3.30.2.bb => nss_3.31.1.bb}           | 10 +++---
 2 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Fix-warnings-found-with-gcc7.patch
 rename meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} (96%)

-- 
2.10.1


