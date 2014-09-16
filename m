Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCC371478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 03:10:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G3AxV1022963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 20:10:59 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 20:10:58 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Sep 2014 23:10:56 -0400
Message-ID: <cover.1410836877.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] libpam / xtests: remove bash dependency
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
X-List-Received-Date: Tue, 16 Sep 2014 03:10:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

There's not bash specific syntax in the xtests scripts:

  $ cd Linux-PAM-1.1.6/xtests
  # replace /bin/bash to /bin/sh and check the bashisms:
  $ checkbashisms *.sh
  No output

So the runtime dependency to bash could be removed.

The following changes since commit 429802fe6691c8a70ec9735c0db4c6a4e1e1b038:

  classes/populate_sdk_base: enable adding custom commands to SDK install script (2014-09-11 18:02:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/libpam-bash
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/libpam-bash

Wenzong Fan (1):
  libpam / xtests: remove bash dependency

 .../libpam-xtests-remove-bash-dependency.patch     |  226 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +-
 2 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch

-- 
1.7.9.5


