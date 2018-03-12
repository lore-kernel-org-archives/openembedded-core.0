Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3778D7883F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:18:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9IsOe014217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:18:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 02:18:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 17:19:18 +0800
Message-ID: <cover.1520846324.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] btrfs-tools: set CLEANBROKEN to 1 to avoid rebuild failure
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
X-List-Received-Date: Mon, 12 Mar 2018 09:18:53 -0000
Content-Type: text/plain

The following changes since commit 5350ee317740751f2417c1794dd39d3880347dbf:

  yocto-uninative: Upgrade to 1.8 version with glibc 2.27 (2018-03-11 06:27:02 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/btrfs-tools-rebuild
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/btrfs-tools-rebuild

Chen Qi (1):
  btrfs-tools: set CLEANBROKEN to 1 to avoid rebuild failure

 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


