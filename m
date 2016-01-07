Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A78EB600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 07:45:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u077jO3r005696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 23:45:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jan 2016 23:45:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jan 2016 23:45:21 -0800
Message-ID: <cover.1452152689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes
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
X-List-Received-Date: Thu, 07 Jan 2016 07:45:24 -0000
Content-Type: text/plain

The following changes since commit 95fced137a46dc98863fe5af7be5cbce708602f2:

  udev-extraconf: introduce multiple blacklist files for more complex setups (2016-01-05 17:55:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  cogl-1.0: fix may be used uninitialized error
  run-postinsts: can't be allarch
  liberation-fonts: can't be allarch

 .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
 ...ce-culling.c-fix-may-be-used-uninitialize.patch |   35 ++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |    2 ++
 .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
 4 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch

-- 
1.7.9.5


