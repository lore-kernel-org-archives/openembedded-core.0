Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A255E70100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:48:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 26 Apr 2016 01:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,536,1455004800"; d="scan'208";a="92043312"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2016 01:48:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0F9186A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 02:36:18 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 11:48:22 +0300
Message-Id: <1461660505-24823-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/3] Fix some dependencies and QA Issues
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
X-List-Received-Date: Tue, 26 Apr 2016 08:48:43 -0000

Fix for some QA issues observed while building core-image-minimal with uclibc

Maxin B. John (3):
  popt: fix dependencies and QA Issue
  bash: fix dependencies and QA Issue
  libxml2: fix dependencies and QA Issues

 meta/recipes-core/libxml/libxml2_2.9.3.bb | 2 +-
 meta/recipes-extended/bash/bash.inc       | 2 +-
 meta/recipes-support/popt/popt_1.16.bb    | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.4.0


