Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 312A471978
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:34:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAEEY79A023080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:34:07 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 06:34:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:34:02 -0800
Message-ID: <cover.1479133967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/4] Fixes for sanity.bbclass and sdk
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
X-List-Received-Date: Mon, 14 Nov 2016 14:34:06 -0000
Content-Type: text/plain

The following changes since commit 9303d8055c45a0f6af295d70a6f6a8b9d8d8a7c9:

  devtool: add "rename" subcommand (2016-11-07 11:04:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  populate_sdk_ext.bbclass: use weak assignment for
    TOOLCHAINEXT_OUTPUTNAME
  testsdk.bbclass: print which file is not found
  sanity.bbclass:check_connectivity(): print more error messages
  sanity.bbclass: fix check_connectivity() for BB_NO_NETWORK = "0"

 meta/classes/populate_sdk_ext.bbclass |  2 +-
 meta/classes/sanity.bbclass           | 19 +++++++++++++------
 meta/classes/testsdk.bbclass          |  6 +++---
 3 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.10.2


