Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.6336.1602217972718026775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 21:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id E48D12201A6;
	Fri,  9 Oct 2020 17:32:47 +1300 (NZDT)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] allarch: Remove MACHINEOVERRIDES
Date: Fri,  9 Oct 2020 17:32:46 +1300
Message-Id: <20201009043246.20465-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1

Avoid machine-specific settings sneaking into allarch tasks.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/allarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 5bd5c44a27..2365691fae 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -42,6 +42,7 @@ python () {
         d.setVar("TARGET_CXXFLAGS", "none")
         d.setVar("TARGET_LDFLAGS", "none")
         d.setVar("POPULATESYSROOTDEPS", "")
+        d.setVar("MACHINEOVERRIDES", "allarch")
 
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
-- 
2.17.1

