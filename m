Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 646D760616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 01:39:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBU1dBxr029130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 17:39:12 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Dec 2015 17:39:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Dec 2015 17:39:10 -0800
Message-ID: <cover.1451439524.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] python3: fix installed-vs-shipped when 64bit + multilib
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
X-List-Received-Date: Wed, 30 Dec 2015 01:39:12 -0000
Content-Type: text/plain

The following changes since commit 1568f4fa1c8f8abd9b365ecd264841cd4f6b66b1:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/python
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/python

Robert Yang (1):
  python3: fix installed-vs-shipped when 64bit + multilib

 .../python/python3/configure.ac-fix-LIBPL.patch    |   30 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.0.bb      |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch

-- 
1.7.9.5


