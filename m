Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2839D794FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:56:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N7umsL010188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:56:48 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 00:56:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:07:23 +0800
Message-ID: <cover.1535011588.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] meta: Cleanup getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 07:56:47 -0000
Content-Type: text/plain

The following changes since commit 1314a6953aa647706107557faaba8574e307d2bd:

  patch: fix CVE-2018-6952 (2018-08-23 07:45:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/subprocess
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/subprocess

Robert Yang (5):
  lib/oe/gpg_sign.py: Clean up getstatusoutput usage
  lib/oe/patch.py: Clean up getstatusoutput usage
  kernel-yocto.bbclass: Clean up getstatusoutput usage
  psplash: Clean up getstatusoutput usage
  compress_doc.bbclass: Clean up getstatusoutput usage

 meta/classes/compress_doc.bbclass        |  7 ++++---
 meta/classes/kernel-yocto.bbclass        |  5 +++--
 meta/lib/oe/gpg_sign.py                  | 15 +++++----------
 meta/lib/oe/patch.py                     |  3 ++-
 meta/recipes-core/psplash/psplash_git.bb |  5 +++--
 5 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.7.4


