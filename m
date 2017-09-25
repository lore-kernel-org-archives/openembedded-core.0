Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B45E760602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 23:33:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 16:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,438,1500966000"; d="scan'208";a="139352691"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2017 16:33:38 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 16:33:43 -0700
Message-Id: <1506382426-2135-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/3] libxml2-ptest: various fixes
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
X-List-Received-Date: Mon, 25 Sep 2017 23:33:39 -0000

This patch-set contains three independent patches for libxml2-ptest.
The first one removes all build host references from the libxml2-ptest package.
While testing this patch, I noticed that some test were failing, but for
unrelated reasons. I added two fixes that address two different causes of
failures. With these fixes we get 133 tests passed, 0 failed.
(Previously it was 36 passed 3 failed, or something like that)


Juro Bystricky (3):
  libxml2-ptest: improve reproducibility
  libxml2-ptest: support for encoding ISO-8859-5
  libxml2-ptest: set LC_ALL=en_US.UTF-8

 meta/recipes-core/libxml/libxml2/run-ptest |  1 +
 meta/recipes-core/libxml/libxml2_2.9.4.bb  | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.7.4


