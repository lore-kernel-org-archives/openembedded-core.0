Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60B3175129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 07:21:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4A7LkAC004211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 00:21:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 10 May 2018 00:21:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2018 15:23:37 +0800
Message-ID: <cover.1525936967.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] devtool/upgrade: fix the order of license checksum representation
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
X-List-Received-Date: Thu, 10 May 2018 07:21:45 -0000
Content-Type: text/plain

The following changes since commit f4c938c47424424b89cde2269bd92cebc9a6ac1a:

  packagegroup: Do not add libssp to SDK (2018-05-09 10:47:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/devtool-upgrade-license
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/devtool-upgrade-license

Chen Qi (1):
  devtool/upgrade: fix the order of license checksum representation

 scripts/lib/devtool/upgrade.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.9.1


