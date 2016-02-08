Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C92F86E268
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:20:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2016 07:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,416,1449561600"; d="scan'208";a="649015124"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2016 07:20:07 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 17:20:04 +0200
Message-Id: <1454944806-27252-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/2] Bugfixes to package signing
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
X-List-Received-Date: Mon, 08 Feb 2016 15:20:08 -0000

This patchset contains two small bugfixes to rpm package and package feed
signing.

Markus Lehtonen (2):
  oe/gpg_sign: fix incorrect variable name
  sign_package_feed.bbclass: fix task dependencies

 meta/classes/sign_package_feed.bbclass | 1 +
 meta/lib/oe/gpg_sign.py                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.6.2


