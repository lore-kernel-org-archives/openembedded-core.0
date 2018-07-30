Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 274A4606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:38:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6U9cBPv000473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 02:38:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 30 Jul 2018 02:37:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2018 17:41:56 +0800
Message-ID: <cover.1532943666.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] busybox: move init related configs to init.cfg
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
X-List-Received-Date: Mon, 30 Jul 2018 09:38:10 -0000
Content-Type: text/plain

The following changes since commit 1b56227d77d3113c9c17ec35cb7849a768078c4e:

  classes/package: fix variable name in comment (2018-07-26 17:14:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-init
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-init

Chen Qi (1):
  busybox: move init related configs to init.cfg

 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 meta/recipes-core/busybox/busybox/init.cfg  |  7 ++++++-
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
1.9.1


