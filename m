Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96B8C7723C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 08:29:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u858TnZ1028549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2016 01:29:50 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 01:29:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Sep 2016 01:29:46 -0700
Message-ID: <cover.1473064099.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/2] meta: fix gobject-introspection-native and coreutils-native
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
X-List-Received-Date: Mon, 05 Sep 2016 08:29:50 -0000
Content-Type: text/plain

The following changes since commit 0a024bf2f2ed14be9b6e3e8e911e826969ff9b7e:

  poky: Update to linux-yocto 4.8 (2016-09-04 16:58:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/2fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/2fixes

Robert Yang (2):
  coreutils: enable xattr for native
  gobject-introspection: set GI_SCANNER_DISABLE_CACHE for native

 meta/recipes-core/coreutils/coreutils_8.25.bb                          | 3 ++-
 .../gobject-introspection/gobject-introspection_1.48.0.bb              | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.9.0


