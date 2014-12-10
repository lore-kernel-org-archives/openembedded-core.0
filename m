Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C36007253A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:49:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAnk3u008059
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:49:47 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:49:46 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 10 Dec 2014 05:49:40 -0500
Message-ID: <cover.1418208337.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] [daisy] kernel: consolidated pull
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
X-List-Received-Date: Wed, 10 Dec 2014 10:49:53 -0000
Content-Type: text/plain

Saul,

The maintainers page told me that you are looking after daisy .. if
I'm wrong, can you point me at the right contact ?

These are 4 kernel SRCREV updates to 3.14 that Kexin @ Wind River
identified as fixing bug/issues with the boards he looks after. All
are safe for daisy, and only bring in stability/bug fixes.

Cheers,

Bruce

Bruce Ashfield (4):
  linux-yocto/3.14: update to v3.14.2
  linux-yocto/3.14: update to v3.14.4
  linux-yocto-rt/3.14: update to 3.14-rt5
  beaglebone: enable the nowayout option for the watchdog

 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.1.0


