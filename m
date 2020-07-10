Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.4959.1594360586917158683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 22:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 5687B2202D3;
	Fri, 10 Jul 2020 17:56:22 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] nativesdk: Set the CXXFLAGS to the BUILDSDK_CXXFLAGS
Date: Fri, 10 Jul 2020 17:56:20 +1200
Message-Id: <20200710055620.10886-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1

... which default to the BUILDSDK_CFLAGS in any case.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/nativesdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7b75710726..171ae72be0 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -57,7 +57,7 @@ EXTRA_OECONF_GCC_FLOAT = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
-CXXFLAGS = "${BUILDSDK_CFLAGS}"
+CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
 LDFLAGS = "${BUILDSDK_LDFLAGS}"
 
 # Change to place files in SDKPATH
-- 
2.17.1

