Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 105F277BBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490366607; x=1521902607;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vQ3O+tLV5auZJfUHG+WGRufSbMy3ubOopAZH+8aq+i8=;
	b=Y6aQdh2DlzXJlErt6gkYydc0bs2Q4HQcrSv+ZaBvk/7rkKLnOSKL/LPB
	se+bkHknqsh4rODtNT+A+rx99twuqw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="947835369"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 24 Mar 2017 07:43:26 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:43:25 +0200
Message-Id: <20170324144325.28637-2-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170324144325.28637-1-markus.lehtonen@linux.intel.com>
References: <20170324144325.28637-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] oeqa.buildperf: limit the length of error output
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
X-List-Received-Date: Fri, 24 Mar 2017 14:43:26 -0000

Limit the length of error logs to 40 lines. We don't need to
show/archive thousands of lines of bitbake logs if an error occurs.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index dd473a0..e9a53dc 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -35,7 +35,7 @@ log = logging.getLogger('build-perf')
 
 # Our own version of runCmd which does not raise AssertErrors which would cause
 # errors to interpreted as failures
-runCmd2 = partial(runCmd, assert_error=False)
+runCmd2 = partial(runCmd, assert_error=False, limit_exc_output=40)
 
 
 class KernelDropCaches(object):
-- 
2.10.2


