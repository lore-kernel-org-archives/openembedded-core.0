Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E44B77EAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 23:36:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 187so3946822wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=icz3Dtv96z6ORTs5rGmpu9FP5wKjnpXmT52Av9rEkI0=;
	b=VguGLcD38iJI3kFw8d2RWr2Y4YBPCgYTlBIFzup0NXScqFukPtyVnzR576iQrPgFna
	MC9hxtzuHMSsvM4SH9UzjDVqzzIQXNl4CMtAmpgkUBDpjpOO6GmsxLk/XECoFo8el2LV
	/eOitqRcWTiqCPRady1rsFi3RESGOymoL8JcQSWz43q6PLMRxpqpm/jt7JIguxYU9bAg
	wXt/D+nLLZrDETa9pt4x0Jo6h9kBZOaQ89H8tBa41FDQMyyvJA4fSH8PSVrnhOAqi9Wg
	uX655ycKEAhfDqjOIz6J9z7lEJZ7UBZKIHYIuzUXXdDULLl/leM9gR1zrGLdHgc51WWT
	nKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=icz3Dtv96z6ORTs5rGmpu9FP5wKjnpXmT52Av9rEkI0=;
	b=sBgw+m+TxRyNLWDN0JKA6mBMY5psKcqs7xTRrOim66bm27HoTCPWEd89PV495XtQZf
	2ehGaU/HkxtYWOm4Xp/vo+uUY8lubgE2kLFC3ejQuofLT9a8fXcCms6wdD3bRTi864LX
	H71U6F9dxH0xC5CBspkWNTvF/qxhle92W00aEog9tbAtmdHK+TbTBCycLhb8liIAUlCN
	z4421BzBsE0rTac0C1ETsl48J9CuFETAxHFb71w49D3lB7wHnNITKXzME7B1jFwL480w
	YSeFy7Nsuz9A0OLFEsjyM2NeV+rZ+bpDfnXNql4YjJ8aC/N0aj0Nm8A/qZJK33FKJFyS
	/MQA==
X-Gm-Message-State: AHPjjUiOvf2v2BynvUmQBGJwHnQV+H/mpQXGGSfxlKHlPB/euH+J+KTZ
	6jAVB8AutGDwdnOBY4l5Zu8aUQ==
X-Google-Smtp-Source: AOwi7QDZrN5PXm3JDQx9xZ8PEeqPldE2SCwY9z2NOrSuic5h/DiG4EEYocxYD/+SqPGIV8j7dA06aw==
X-Received: by 10.28.54.3 with SMTP id d3mr3874361wma.56.1505518565770;
	Fri, 15 Sep 2017 16:36:05 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	y84sm1340368wmg.43.2017.09.15.16.36.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 16:36:05 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Sep 2017 01:35:50 +0200
Message-Id: <1505518550-13471-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505518550-13471-1-git-send-email-andrea.adami@gmail.com>
References: <1505518550-13471-1-git-send-email-andrea.adami@gmail.com>
Subject: [PATCH 2/2] sysvinit-inittab: start_getty: Cleanup comments
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
X-List-Received-Date: Fri, 15 Sep 2017 23:36:05 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../sysvinit/sysvinit-inittab/start_getty          | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index f0d9f8c..e15ae35 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,16 +1,16 @@
 #!/bin/sh
-####################################################################################
-# This script is use to automatic start serial console once power up.
-# Script enhancement has been done base on Bug YOCTO 10844.
-# Configuration can be done in meta/conf/machine/*.conf variable SERIAL_CONSOLES.
-# Most of the information is retrieve from /proc virtual filesystem which
-# contain all the runtime system information (eg. system memory, device mount, etc).
-####################################################################################
+###############################################################################
+# This script is used to automatically set up the serial console(s) on startup.
+# The variable SERIAL_CONSOLES can be set in meta/conf/machine/*.conf.
+# Script enhancement has been done based on Bug YOCTO #10844.
+# Most of the information is retrieved from /proc virtual filesystem containing
+# all the runtime system information (eg. system memory, device mount, etc).
+###############################################################################
 
 # Get active serial filename.
 active_serial=$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ *$//")
 
-# Re-phrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
+# Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
 runtime_tty=$(echo $2 | grep -oh '[0-9]')
 
 # Backup $IFS.
@@ -19,14 +19,14 @@ DEFAULT_IFS=$IFS
 IFS="$(printf '\n\t')"
 
 for line in $active_serial; do
-	# File is availability, file content current active serial target index.
+	# Check we have the file containing current active serial target index.
 	if [ -e "/proc/tty/driver/$line" ]
         then
-		# File content a lot of unknown serial. We use -v to remove all unmatch and get left off.
-		# Tail use to avoid 1st line included into the filter because 1st line is file description.
-		activetty=$(grep -v "unknown" "/proc/tty/driver/$line" | tail -n +2 | grep -oh "^\s*\S*[0-9]")
+		# Remove all unknown entries and discard the first line (desc).
+		activetty=$(grep -v "unknown" "/proc/tty/driver/$line" \
+			    | tail -n +2 | grep -oh "^\s*\S*[0-9]")
 		for active in $activetty; do
-			# Check if both index is match then proceed to enable the serial console.
+			# If indexes do match then enable the serial console.
 			if [ $active -eq $runtime_tty ]
 			then
 				if [ -c /dev/$2 ]
-- 
2.7.4


