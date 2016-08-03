Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB099700F0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 13:32:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 03 Aug 2016 06:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="1029002103"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2016 06:32:20 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 16:32:13 +0300
Message-Id: <1470231135-2058-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2 0/2] Improved handling of LICENSE_<pkg> variables
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
X-List-Received-Date: Wed, 03 Aug 2016 13:32:50 -0000

The first patch is actually unchanged, just re-sending it.

However, in the discussion on the patch there seemed to be some confusion
regarding the relation between LICENSE and LICENSE_<pkg> variables. Thus, I
decided to implement the second patch of this series which does basic
verification/sanity checking of LICENSE_<pkg> values.

Looking at the warnings I get after applying the second patch, at least nettle
2.7.1 and hdparm in OE-Core seem to be using LICENSE and LICENSE_<pkg>
incorrectly.

[YOCTO #9499]

The following changes since commit 986f7fbe37a48d050611f08f7160ed96755ac3dc:

  foomatic-filters: Security fixes CVE-2015-8327 (2016-08-01 12:11:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9499
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9499


Markus Lehtonen (2):
  license.bbclass: do not process LICENSE_pn variables
  license: simple verification of LICENSE_<pkg> values

 meta/classes/base.bbclass    | 13 +++++++++++++
 meta/classes/license.bbclass | 16 +---------------
 meta/lib/oe/license.py       | 18 ++++++++++++++++++
 3 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.6.6


