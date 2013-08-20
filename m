Return-Path: <Rongqing.Li@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 280B461883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 07:02:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7K72dsd005685
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:02:39 -0400 (EDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 00:02:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 15:02:48 +0800
Message-ID: <cover.1376982051.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] shadow: backport a patch to make newgrp work
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
X-List-Received-Date: Tue, 20 Aug 2013 07:02:41 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Diff with v1: fix a typOS

The following changes since commit fd9e591f266e1a6c183e77f24e50d31e0d52bdd5:

  cronie: fix out of tree build (2013-08-19 11:24:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/mewgrp1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/mewgrp1

Roy.Li (1):
  shadow: backport a patch to make newgrp work

 .../shadow/files/fix-etc-gshadow-reading.patch     |   36 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch

-- 
1.7.10.4


