Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13AC360778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:06:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAR866KK003327
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 00:06:06 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 27 Nov 2017 00:06:05 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Nov 2017 16:07:16 +0800
Message-ID: <cover.1511770008.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: fix daemon startup failure on sysvinit
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
X-List-Received-Date: Mon, 27 Nov 2017 08:06:06 -0000
Content-Type: text/plain

The following changes since commit 72867393fe2004ab9f0ee23eb09a975c82938b9e:

  runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bind-daemon-sysvinit
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bind-daemon-sysvinit

Chen Qi (1):
  bind: fix daemon startup failure on sysvinit

 ...owner-of-rndc.key-to-correctly-start-daem.patch | 32 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.6.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-init.d-fix-owner-of-rndc.key-to-correctly-start-daem.patch

-- 
1.9.1


