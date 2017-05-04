Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D8B1477BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 11:49:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 04:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1164500781"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2017 04:49:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 14:49:58 +0300
Message-Id: <20170504114958.9763-2-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170504114958.9763-1-markus.lehtonen@linux.intel.com>
References: <20170504114958.9763-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] oe-build-perf-report: allow slashes in {branch} field in tag names
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
X-List-Received-Date: Thu, 04 May 2017 11:49:59 -0000

The target branch name might contain slashes.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 876e3b1a76..d460caae18 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -63,6 +63,7 @@ def get_test_runs(repo, tag_name, **kwargs):
 
     # Parse undefined fields from tag names
     str_fields = dict([(f, r'(?P<{}>[\w\-.()]+)'.format(f)) for f in field_names])
+    str_fields['branch'] = r'(?P<branch>[\w\-.()/]+)'
     str_fields['commit'] = '(?P<commit>[0-9a-f]{7,40})'
     str_fields['commit_number'] = '(?P<commit_number>[0-9]{1,7})'
     str_fields['tag_number'] = '(?P<tag_number>[0-9]{1,5})'
-- 
2.12.0


