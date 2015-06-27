Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 086EC60125
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 21:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5RLhuem004332 for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 22:43:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DjThg_eDzTiP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 22:43:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5RLhddv004315
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 22:43:51 +0100
Message-ID: <1435441418.10583.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Jun 2015 22:43:38 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Sat, 27 Jun 2015 21:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The qemuarm64 machine doesn't have graphics so whitelist the
X server failures to start.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 7095a36..8757c9c 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -70,6 +70,10 @@ ignore_errors = {
         'mmci-pl18x: probe of fpga:0b failed with error -22',
         'Failed to load module "glx"'
         ] + common_errors,
+    'qemuarm64' : [
+        'Fatal server error:',
+        '(EE) Server terminated with error (1). Closing log file.',
+        ] + common_errors,
     'emenlow' : [
         '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
         '(EE) Failed to load module "psb"',



