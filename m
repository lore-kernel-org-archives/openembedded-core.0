Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id C594C6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 03:53:22 +0000 (UTC)
Received: by obbnk6 with SMTP id nk6so66499258obb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 19:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jzOXXbJ7B3Wx+ECYcvfPapnfE2bOI4USNCWXBtMj7HY=;
	b=kb73qhnfflKJoX3DUzxabu1tik9xuxVsq8x8gQQfqBKt8jKh6EINOCg1mC4/47EiqV
	oW9Vn4oQFR3J0NWpeFMo+V5bzD4Jq6/J98X2YcpEXPSaO8hjZb9iRAOF8NtbFPJj8edQ
	xquHo6WCjkcW08yXuWWx/4vMXaoww4B1COXKnH/0cyG6Ok+GNBXHxG7Oe1r1bPGtA64i
	pEv3AWh3L8Z08cx2Lwky7Ltn69RMcMv3PquukHOZ3ijNu2mYY2n8nThAL/g10KO6DiBe
	EEuyw1C+ZTMCk6hJZ0pOSAiJ5Zgb1ACfdSzVqA4KTuBTCex5XGWPuw1jtfcAO83dSuY3
	rj8A==
X-Received: by 10.182.236.101 with SMTP id ut5mr7554943obc.1.1449201203092;
	Thu, 03 Dec 2015 19:53:23 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 133sm5104188oid.5.2015.12.03.19.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 19:53:22 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:53:16 -0800
Message-Id: <1449201196-14450-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] waf.bbclass: remove unused parameter from get_waf_parallel_make()
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
X-List-Received-Date: Fri, 04 Dec 2015 03:53:23 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/waf.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 220dc58..b3b5e94 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,4 +1,4 @@
-def get_waf_parallel_make(bb, d):
+def get_waf_parallel_make(d):
     pm = d.getVar('PARALLEL_MAKE', True)
     if pm:
         # look for '-j' and throw other options (e.g. '-l') away
@@ -25,7 +25,7 @@ waf_do_configure() {
 }
 
 waf_do_compile()  {
-	${S}/waf build ${@get_waf_parallel_make('PARALLEL_MAKE', d)}
+	${S}/waf build ${@get_waf_parallel_make(d)}
 }
 
 waf_do_install() {
-- 
1.9.1


