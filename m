Return-Path: <george.mccollister@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id B64B171A89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:08:43 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id s68so29562293ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+S0Io9UqI6lWchC6GYhVuqzfaBFP0l3LkuSk39gWus8=;
	b=x4r2zQ5MKxpPg9+R6C7i7njysbSohaySU7MZrXj1NO7QVYUc3daH+jLEcEbomXEWUM
	32otpr9j3AwbYQQv4d7bvjkqYNur8ylKoJJdjQxa+QUhivh4SX5P0pD9nrO4BnnWxUA9
	aOx9j4uK33NjTR68ONjXH2DD7cjtQ2O6+pUFl2yE8JJIPrhb+HZ7PNNMQ0LZy56NgTqG
	oXWcVIhfrOKgtTebLpzrpcf7GH8tQcafydpdZFF6eqUE1PokxAwXH3CbOZnJRM0kn89Z
	fv4wjGnD3Oqf7E5ALZFlGvhpVSJZzY0AVa3FDCv5wWhFg4M0Zxk+nVKDTJ1pMdMd+kYB
	fckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+S0Io9UqI6lWchC6GYhVuqzfaBFP0l3LkuSk39gWus8=;
	b=XgbG96P71KSV3K90ilYdqEYbYn61t8Wk6ZWOn4U0PagTdLal/59fDU5/mNzxM02o/A
	AArXPF4W4JGaqyeeQEf1tLVpjAIC00NY2NMPPx3qYenPABa8Yzf35SL7UQbUDt6eA0ct
	EsQg19xyUsVfusngsLzqhrFR1N4eA1b5Rz3qJJ/pe60CpfJVqQvh9LCd6PQYqWIPudZY
	V1ZzDzikYhwKzhaFGFlKNw9lDhgNPCC4A8WnzBVTXf8JIj2Oqn388+iBjK47gOr1ABG3
	UlfqWms0R/7s5aI4IdD/6VCDg3G3X0iHZeEqyM5BUDBIdj9I7OtGSyBf2ETbVFB1kdo+
	c4iA==
X-Gm-Message-State: AKaTC01R9Np9SB1eW/s9oD4n/2KyAJcaAgGkY3oO35TeNcsn4Kew5vVl3f3HTNsKwR1n+g==
X-Received: by 10.36.76.85 with SMTP id a82mr3503406itb.67.1481047724347;
	Tue, 06 Dec 2016 10:08:44 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 17sm9417317ioh.12.2016.12.06.10.08.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 10:08:43 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:08:31 -0600
Message-Id: <21bd42735a2e34975a1b5686232676c3908624a9.1481047167.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <8b52033562719fb4654f2d0c1fa49357722ff27f.1481047167.git.george.mccollister@gmail.com>
References: <8b52033562719fb4654f2d0c1fa49357722ff27f.1481047167.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1481047167.git.george.mccollister@gmail.com>
References: <cover.1481047167.git.george.mccollister@gmail.com>
Subject: [master][PATCH 2/2] gdb-cross-canadian: Depend on nativesdk-python3-importlib
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
X-List-Received-Date: Tue, 06 Dec 2016 18:08:44 -0000

Add missing dependency on nativesdk-python3-importlib so the imp Python
module is installed.

Before this patch, running gdb from the sdk would give the following
error:

Python Exception <class 'ImportError'> No module named 'imp':

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index e53081d..3ff1989 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -14,7 +14,8 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 PACKAGECONFIG ??= "python readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
-                         nativesdk-python3-codecs nativesdk-python3-netclient"
+                         nativesdk-python3-codecs nativesdk-python3-netclient \
+                         nativesdk-python3-importlib"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
-- 
2.9.3


