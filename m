Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAE76C63C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:47:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wANAlWZP028849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:47:47 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:47:34 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 19:04:50 +0800
Message-ID: <cover.1542971027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] classes/recipes: Remove tab indentations in python code
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
X-List-Received-Date: Fri, 23 Nov 2018 10:47:56 -0000
Content-Type: text/plain

The following changes since commit c80972be1f3592d797da9eb0845b739420c6da4a:

  maintainers: Add entry for new recipe libdazzle (2018-11-22 10:00:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/py
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/py

Robert Yang (2):
  classes: Remove tab indentations in python code
  recipes: Remove tab indentations in python code

 meta/classes/crosssdk.bbclass                      |  4 +--
 meta/classes/license.bbclass                       |  2 +-
 meta/classes/linux-kernel-base.bbclass             |  4 +--
 meta/classes/siteconfig.bbclass                    | 18 +++++-----
 meta/recipes-core/busybox/busybox.inc              | 42 +++++++++++-----------
 meta/recipes-core/coreutils/coreutils_8.30.bb      |  8 ++---
 .../images/build-appliance-image_15.0.0.bb         |  6 ++--
 meta/recipes-devtools/python/python3_3.5.6.bb      |  2 +-
 .../net-tools/net-tools_1.60-26.bb                 |  8 ++---
 9 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.7.4


