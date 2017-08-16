Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21294784F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 10:23:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GANVSk027662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 03:23:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 03:23:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 18:28:09 +0800
Message-ID: <cover.1502879234.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] shadow: fix CVE-2017-12424
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
X-List-Received-Date: Wed, 16 Aug 2017 10:23:31 -0000
Content-Type: text/plain

The following changes since commit 6016ec177af2406cacfeb3276dfcb8bfc3df8fce:

  poky.conf: Enable vulkan by default (2017-08-16 00:04:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/CVE-2017-12424
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/CVE-2017-12424

Chen Qi (1):
  shadow: fix CVE-2017-12424

 .../shadow/files/0001-shadow-CVE-2017-12424        | 46 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424

-- 
1.9.1


