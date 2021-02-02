Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.48219.1612244095831924660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: c8y/Xo08u/W98/jJGj4iR+DtramVI/PuoLxYf+4mGoKhKxqyXzUPgDsmCoQtpkkouib/4ctopR
 97On/zZ8U+RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876973"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876973"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:43 -0800
IronPort-SDR: kuCS7R+LWBrGtA3mZWVQeH8uZwHpqfGd1cVH51JdqOYhRWXslHdhZ4cmdkze/LH2fMYwqTe64L
 NtM3Lg9VyKdQ==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370361074"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:41 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/25] strace: increase ptest timeout duration 120->240s
Date: Tue,  2 Feb 2021 13:34:08 +0800
Message-Id: <a9e28542129da6df133302cb8ce8219648c2a525.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

solve qual_fault-syscall.test and qual_fault.test
failing due to timeout.

Bug 14165

(From OE-Core rev: 5af9f32d9b12654793289f44366251f978f6378a)

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e03298201cf89b0d5987ec3a3639a3638b09979)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 4660207220..3a51fb0be9 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
-export TIMEOUT_DURATION=120
+export TIMEOUT_DURATION=240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
-- 
2.29.2

