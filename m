Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF6E78416
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 06:08:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA668voZ025715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Nov 2017 22:08:57 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 5 Nov 2017 22:08:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Nov 2017 14:10:15 +0800
Message-ID: <cover.1509948552.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] util-linux upgrade and related fix
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
X-List-Received-Date: Mon, 06 Nov 2017 06:08:57 -0000
Content-Type: text/plain

The following changes since commit 58ef101032c301f54b9ecc9fcc9b84b5038df030:

  scripts/lib/bsp: delete, all users have been removed (2017-11-05 22:33:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/util-linux-2.31
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/util-linux-2.31

Chen Qi (2):
  util-linux: upgrade to 2.31
  bash-completion: remove rfkill file that util-linux provides

 meta/recipes-core/util-linux/util-linux.inc        | 24 +++++++++-------------
 .../{util-linux_2.30.bb => util-linux_2.31.bb}     |  6 +++---
 .../bash-completion/bash-completion_2.7.bb         |  2 +-
 3 files changed, 14 insertions(+), 18 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.30.bb => util-linux_2.31.bb} (84%)

-- 
1.9.1


