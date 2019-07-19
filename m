Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01D837E5F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 04:59:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J4xJut026442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 21:59:19 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 18 Jul 2019 21:59:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 12:59:05 +0800
Message-ID: <1563512345-367867-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] oeqa/parselogs: Whitelist qemuarm64 runtime errors
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
X-List-Received-Date: Fri, 19 Jul 2019 04:59:21 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

The qemuarm64 machine doesn't have graphics so whitelist the
X server related failures

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index eb2ebb1..633811d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -129,6 +129,13 @@ ignore_errors = {
         '(EE) Server terminated with error (1). Closing log file.',
         'dmi: Firmware registration failed.',
         'irq: type mismatch, failed to map hwirq-27 for /intc',
+        'xinit: server error',
+        'XKB: Failed to compile keymap',
+        'Keyboard initialization failed',
+        '(EE) Failed to activate virtual core keyboard',
+        'xserver-nodm.service: Failed with result',
+        'Failed to initialize the DRI2 extension',
+        'XKB: Failed to load keymap',
         ] + common_errors,
     'intel-core2-32' : [
         'ACPI: No _BQC method, cannot determine initial brightness',
-- 
2.7.4


