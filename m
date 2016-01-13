Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 146736FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 03:24:36 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id q63so75539083pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 19:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5HM8slB+2UXDSCV9CT4Yt1XqN7ClAe7exfm9j/r7X/4=;
	b=vSF4FB/yPU3Uu8QGX3T7+6Cwce3gj/buPhMIlzwmvTD/xGrYZfmIt9xYPfyQXSJjOs
	RLe77kohHJPhP6Wa7Kc6gYmZs2/ubpuuwYYwcgRonUPtDQ1L3od3McuHj/Fs6a9TULf3
	4Q0+3ACYFQWIKXplttlvFjyjakaST+6K+BuJfJlKMlD0grWrEkH4tNWvLh2Pz29dc1J5
	deWdyPnfs3tpA9fAtoZnrSXWURWJj6VawtNWEdPIK8xSwwucN5urhYcy3OTsb4L201RQ
	YPGIiWxNRQj1zWgL7W6jSCht6/74lWSUDHv74USe45IM7GKmtRlWCoURaVZQxyy8ZWUG
	aBbQ==
X-Received: by 10.98.76.149 with SMTP id e21mr39533529pfj.89.1452655477320;
	Tue, 12 Jan 2016 19:24:37 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qj8sm54868127pac.40.2016.01.12.19.24.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jan 2016 19:24:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 19:24:30 -0800
Message-Id: <1452655470-17292-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] valgrind: make it explicit that valgrind supports armv7a and above
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
X-List-Received-Date: Wed, 13 Jan 2016 03:24:37 -0000

Despite rumours to the contrary, valgrind really does require
armv7a or above.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 00217fa..70d84fe 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -29,6 +29,11 @@ SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
+# valgrind supports armv7 and above
+COMPATIBLE_HOST_armv4 = 'null'
+COMPATIBLE_HOST_armv5 = 'null'
+COMPATIBLE_HOST_armv6 = 'null'
+
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-- 
1.9.1


