Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.30226.1601887133900738786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 01:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: mkWePRBnMrnS4mBEfV6y1+wPMVsAAfVbOO7ceahc+/R447E7ngqSm+cK3MSiZz2JC2Pisj67Sw
 Fr3Vg/6SHP1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="162595946"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="162595946"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 01:38:45 -0700
IronPort-SDR: F3+z+N0/DLDH5o2VMYcfeYlxigSjanZ8pjTtLcirfjCuqT75T1xDNf+a6NNheOaIei4hsJLQ8W
 5OBACR2OenLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="295539620"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2020 01:38:43 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] perl: fix ptest test count
Date: Mon,  5 Oct 2020 16:38:43 +0800
Message-Id: <20201005083843.8405-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Chee Yang Lee <chee.yang.lee@intel.com>

patche added in commit c2710903859a5545aa9dd56251f61667ee8d80bd
failed ptest perl.t/re/pat. The patch updates incorrect test cases
count causes the ptest to fail.
864 test cases before apply the patch while the patch added only 4
test cases so it should be 868 instead of 873.

ptest-runner log :-
  PASS: t/re/overload
  # Looks like you planned 873 tests but ran 868.
  FAIL: t/re/pat
  PASS: t/re/pat_advanced

[YOCTO #14071]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
index ad195cffab..d25f4d4a74 100644
--- a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
+++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
@@ -265,7 +265,7 @@ index 6a868f4..2869b58 100644
  skip_all_without_unicode_tables();
  
 -plan tests => 864;  # Update this when adding/deleting tests.
-+plan tests => 873;  # Update this when adding/deleting tests.
++plan tests => 868;  # Update this when adding/deleting tests.
  
  run_tests() unless caller;
  
-- 
2.17.1

