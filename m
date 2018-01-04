Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBCB784F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 07:33:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w047Xbh8017199
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jan 2018 23:33:38 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 23:33:36 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jan 2018 15:35:44 +0800
Message-ID: <cover.1515051241.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Thu, 04 Jan 2018 07:33:37 -0000
Content-Type: text/plain

The following changes since commit 433ef0f8e9e63e4459934a06a42b56989c885e44:

  u-boot: Add Upstream-Status line missed from merged patch (2018-01-03 09:26:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/coreutils-8.29
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/coreutils-8.29

Chen Qi (1):
  coreutils: upgrade to 8.29

 .../man-decouple-manpages-from-build.patch         | 27 ----------------------
 .../{coreutils_8.28.bb => coreutils_8.29.bb}       | 24 +++++--------------
 2 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/man-decouple-manpages-from-build.patch
 rename meta/recipes-core/coreutils/{coreutils_8.28.bb => coreutils_8.29.bb} (80%)

-- 
1.9.1


