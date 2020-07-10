Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.5280.1594363003953293787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 23:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id CEB9A22019A;
	Fri, 10 Jul 2020 18:36:42 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] nativesdk: clear MACHINE_FEATURES
Date: Fri, 10 Jul 2020 18:36:39 +1200
Message-Id: <20200710063639.11598-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1

Further to 96c20c9df7:
Try to avoid nativesdk recipes accidentally being dependent on MACHINE_FEATURES.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7b75710726..cd389c9c77 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -9,6 +9,7 @@ NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
+MACHINE_FEATURES = ""
 
 MULTILIBS = ""
 
-- 
2.17.1

