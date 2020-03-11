Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DAD4C61BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 02:14:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02B2Dj9k030038
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 19:13:55 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.487.0; Tue, 10 Mar 2020 19:13:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 10:13:24 +0800
Message-ID: <1583892804-385900-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583892804-385900-1-git-send-email-changqing.li@windriver.com>
References: <1583892804-385900-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] parselogs.py: whitelist more xserver related error
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
X-List-Received-Date: Wed, 11 Mar 2020 02:14:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

With default config, these errors always exist for
core-image-sato, and xserver-nodm.server start successfully,
these errors are not critially.

If set default syslog to rsyslog, all these errors
will go into daemon.log and user.log, then test_parselog
will fail, so whitelist these errors

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 6e22520..2a5e5c6 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -58,7 +58,15 @@ common_errors = [
     "Failed to rename network interface",
     "Failed to process device, ignoring: Device or resource busy",
     "Cannot find a map file",
-    "[rdrand]: Initialization Failed"
+    "[rdrand]: Initialization Failed",
+    "libGL error:",
+    "[pulseaudio] authkey.c: Failed to open cookie file",
+    "[pulseaudio] authkey.c: Failed to load authentication key",
+    "FBIOPUT_VSCREENINFO failed, double buffering disabled",
+    "xserver-nodm.service: Failed with result 'exit-code'",
+    "xinit: server error",
+    "matchbox-wm: X error warning",
+    "X11 cannot support keycodes above 255"
     ]
 
 video_related = [
@@ -86,6 +94,8 @@ qemux86_common = [
     'tsc: HPET/PMTIMER calibration failed',
     "modeset(0): Failed to initialize the DRI2 extension",
     "glamor initialization failed",
+    "xf86OpenConsole: Switching VT failed",
+    "Fatal server error:",
 ] + common_errors
 
 ignore_errors = {
-- 
2.7.4


