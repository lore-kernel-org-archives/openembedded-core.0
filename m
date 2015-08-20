Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEA5F65CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:06:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K76WIc025781
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 00:06:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 20 Aug 2015 00:06:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Aug 2015 15:06:56 +0800
Message-ID: <cover.1440054343.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/7] Extensible SDK fixesExtensible SDK fixes
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
X-List-Received-Date: Thu, 20 Aug 2015 07:06:34 -0000
Content-Type: text/plain

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sdktool
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sdktool

Chen Qi (7):
  copy_buildsystem: make sure bitbake directory is copied
  populate_sdk_ext: consider custom configuration in local.conf
  populate_sdk_ext: don't remove the native qemu dependencies
  Extensible SDK: allow for installation without preparing build system
  oe-publish-sdk: add script
  populate_sdk_ext: record SDK_TARGETS in devtool.conf
  devtool: add sdk.py plugin

 meta/classes/populate_sdk_ext.bbclass |  42 +++++---
 meta/files/toolchain-shar-extract.sh  |   7 +-
 meta/lib/oe/copy_buildsystem.py       |   7 +-
 scripts/lib/devtool/sdk.py            | 188 ++++++++++++++++++++++++++++++++++
 scripts/oe-publish-sdk                | 143 ++++++++++++++++++++++++++
 5 files changed, 369 insertions(+), 18 deletions(-)
 create mode 100644 scripts/lib/devtool/sdk.py
 create mode 100755 scripts/oe-publish-sdk

-- 
1.9.1


