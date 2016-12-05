Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 782416022F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:39:21 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id s82so909838ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yZmqnVA3Ksl0HFVlM8E7BQ9AyqrNCW/f9GjCqi/2LFw=;
	b=kP3O3QvcT0y96DRZx7O/wh3zgG1k76FlM2kvp63jyarmUs9S3qrowdJNeUxfevQ8Sm
	xrQd0qZQeN8PquMOj6rRra3A3kkJjJLkdt646MrGnUDkilHIU8KA74TKhFKgbLD0bWkH
	vpS2jYnlaIl+mCLeons44nwxdSMqyfHR1WqFMHP21j64ikOmpTv76EK3I1TW5eKZ+lcs
	bC5PrHaz/TfX900+BkBIB8joapRnWry70Zxwu/sOW/qOZ8GRc2OwRf4uWDmCtF41RxAn
	s/oqkVggD3ttoatDh4B/UuIY4ASQ0LhVH3mjLlbKXfoAUElP2yv16y7WbKC1W3FyQJM+
	wVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yZmqnVA3Ksl0HFVlM8E7BQ9AyqrNCW/f9GjCqi/2LFw=;
	b=SZ8g/9Ufdp8/TDi3K5T8a1bFSISQstazQjWtuZXvuL8zinqBnPzZDSrjqgPW8KadSf
	tJN8CvpqD1hYXu6U/ZxtDrwM+XjBF3kJiN1dchgoiwr+vG7QEYRh3VkmllIhYKGGg2nz
	E0g9zMe6vp7fuw/zDnqNjn7+sC0tB0Yp8hSmn8d22Ajr8FEAVxtnPIs4Ttaz5eM8JoC1
	S9jUKjiWv+a3o9XOcWjwhi9IMLHpESUT/tJMPp4m4VxZSTkmgmdki4Tb7bWBNxX6Js9o
	ouL23GP65Z8ATSoLYsVuFf96/wzjd0SKNtcOdcFIN7+Vd42QkwleacEV4yJNDNrZxpZS
	3uvA==
X-Gm-Message-State: AKaTC01HMEXSVbI4eArD0cHPFQhXmSLxMANcRNYf9eSpM6T1nLTLj0e0qekLgdBCs8S/cw==
X-Received: by 10.107.140.65 with SMTP id o62mr13397068iod.17.1480955963409;
	Mon, 05 Dec 2016 08:39:23 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id d186sm306964itc.7.2016.12.05.08.39.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 08:39:22 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2016 10:38:27 -0600
Message-Id: <20161205163827.21941-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] gdb-cross-canadian: Depend on nativesdk-python3-misc
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
X-List-Received-Date: Mon, 05 Dec 2016 16:39:23 -0000

Add missing dependency on nativesdk-python3-misc so the imp Python
module is installed.

Before this patch, running gdb from the sdk would give the following
error:

Python Exception <class 'ImportError'> No module named 'imp':

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index e53081d..844daf2 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -14,7 +14,8 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 PACKAGECONFIG ??= "python readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
-                         nativesdk-python3-codecs nativesdk-python3-netclient"
+                         nativesdk-python3-codecs nativesdk-python3-netclient \
+                         nativesdk-python3-misc"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
-- 
2.9.3


