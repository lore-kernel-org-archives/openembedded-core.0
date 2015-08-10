Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEF8767D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:17:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7A3HoB2010982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 20:17:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 9 Aug 2015 20:17:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:17:58 +0800
Message-ID: <cover.1438667914.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/8] Extensible SDK fixes
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
X-List-Received-Date: Mon, 10 Aug 2015 03:17:51 -0000
Content-Type: text/plain

The following changes since commit 288c76a41aebaf54c7fca3782160830df462b9e4:

  builder: Fix multilib compile failure (2015-08-03 07:15:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sdktool
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sdktool

Chen Qi (8):
  populate_sdk_ext: install the latest buildtools-tarball
  copy_buildsystem: make sure bitbake directory is copied
  populate_sdk_ext: consider custom configuration in local.conf
  populate_sdk_ext: don't remove the native qemu dependencies
  Extensible SDK: allow for installation without preparing build system
  oe-publish-sdk: add script
  populate_sdk_ext: record SDK_TARGETS in devtool.conf
  devtool: add sdk.py plugin

 meta/classes/populate_sdk_ext.bbclass |  46 ++++++---
 meta/files/toolchain-shar-extract.sh  |   7 +-
 meta/lib/oe/copy_buildsystem.py       |   7 +-
 scripts/lib/devtool/sdk.py            | 182 ++++++++++++++++++++++++++++++++++
 scripts/oe-publish-sdk                | 124 +++++++++++++++++++++++
 5 files changed, 347 insertions(+), 19 deletions(-)
 create mode 100644 scripts/lib/devtool/sdk.py
 create mode 100755 scripts/oe-publish-sdk

-- 
1.9.1


