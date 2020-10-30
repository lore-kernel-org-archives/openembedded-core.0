Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.11262.1604052602636446637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 03:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: rcSSIPcpBJLPtoQS6choqile6Bpimfn8GuFWl6k0udixSeTGeTVh7CDau5l7WviZTbYkPhYWbr
 yYXFW3vOfehQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="156361290"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
   d="scan'208";a="156361290"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 03:10:01 -0700
IronPort-SDR: gNrZLUPaerA1ZRjLq8j5AfUaB+J/F7EVqgsfCgC/7CA5tyOJVGjDd82kk3Mth/51yroBKNwJip
 RxKItylbMRUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
   d="scan'208";a="304719426"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2020 03:10:01 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ruby: update to 2.7.2
Date: Fri, 30 Oct 2020 18:09:59 +0800
Message-Id: <20201030100959.14262-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030100959.14262-1-chee.yang.lee@intel.com>
References: <20201030100959.14262-1-chee.yang.lee@intel.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

updates also fix CVE-2020-25613

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.2.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.1.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.2.bb
index 3dd9fb0a62..055ea9343f 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
@@ -8,8 +8,8 @@ SRC_URI += " \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            "
 
-SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-SRC_URI[sha256sum] = "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
+SRC_URI[md5sum] = "2d4a28dcfa38352a627a597f6057c465"
+SRC_URI[sha256sum] = "6e5706d0d4ee4e1e2f883db9d768586b4d06567debea353c796ec45e8321c3d4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.17.1

