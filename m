Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dp5ndPbaEdu97FUvawQUvqTS4+BOutmtGXKiZgz4Dc6Gi44M0vrDsiv2ycIkOilV6z0OUf+1xn
 YXRGkiqRhisw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467923"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467923"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:49 -0700
IronPort-SDR: z4JPelkfBwih5VWPJqS87CZDJYtXoSm7zR6feW49a1rqM2OuahBLRW3oLKBdQ36WbTjWVaj3Ry
 A7i/DN4Ep1JA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809101"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/18] scripts/verify-bashisms: Update checkbashisms.pl URL
Date: Mon, 12 Apr 2021 17:08:18 +0800
Message-Id: <9bdc9a1da39017cd54434e49f14ab2d8ba75930a.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Petr Vorel <petr.vorel@gmail.com>

anonscm.debian.org is not used any more, update the URL.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c89071a2c19a522c1df5919f500b88339ec6294)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/verify-bashisms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index fb0cc719ea..14d8c298e9 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -100,7 +100,7 @@ if __name__=='__main__':
     args = parser.parse_args()
 
     if shutil.which("checkbashisms.pl") is None:
-        print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
+        print("Cannot find checkbashisms.pl on $PATH, get it from https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl")
         sys.exit(1)
 
     # The order of defining the worker function,
-- 
2.30.2

