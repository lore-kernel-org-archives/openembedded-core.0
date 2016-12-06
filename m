Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0E0571A84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:07:27 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id r94so8113945ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+S0Io9UqI6lWchC6GYhVuqzfaBFP0l3LkuSk39gWus8=;
	b=bR3XvOhi5zQy7VFbvNP4VvUut8naN1pEzBWxzv5r1+rG5OYNjWpPwZd0pMg4H4iDDq
	IVSNz0SP6u3LLu44FYNdDgwp/uSygzwKCfVDgnuZY44jZe9OKZQWAO2sz2XzJuPOdY63
	X/zctJEjPf4w06kGwTaAVcOpxdcuh3X6UJ0K27H8/m5OuVhb3zUrCrrbRY2mWycWqeeD
	neSc0v5WWoHZk+RRTF5nXYdZMpfB1Y0td6p92l5YMHwX2DOmL9Nir0ky6bOrOc4eJkJN
	gbHxOEteEN4wje9+JHb762DZY4Hdt7tkqHrUc9bxRbfAyWNIJdstmwDcmZoR2mvyZV5M
	msow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+S0Io9UqI6lWchC6GYhVuqzfaBFP0l3LkuSk39gWus8=;
	b=ByemfX+hY2piONNvD5zCjE/BbbH1hNYB8uwvSlUPiYzIh4flRS7lCHxx7y4sOztKav
	ItVFiuzuHpphaFRQqKt8V8aXlpXIf5XHZrmkCQ/32Pyb8KvhCE7n+44yHlEF8byTSBnO
	aE6DNXi/W6C8tWbJkMdfdGzFtZOlIGG5eTy/aPSSbxVUyF2Pv2zRkp1ZDvXY0NmAM6r4
	sKz3rESaoWqZe75Gq9LYP7Ep5VPYkq19QVBLyy6hhRjKAovEUay2yyEpHnstHseImy9p
	WHi0h7PxsNq8q1X586VZeiwLkKoclR2hx+/ZiZVL+1IgNTQlubEz6AqZYq1nZDE0PYw7
	V7Wg==
X-Gm-Message-State: AKaTC00e77CGNCMjvW8ueC+HlIy0H34u4MtOzsFUT3uNfx5vkovgFQNLrany0UkTSvlRow==
X-Received: by 10.36.2.146 with SMTP id 140mr3455626itu.63.1481047648539;
	Tue, 06 Dec 2016 10:07:28 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id v74sm9454116ioi.2.2016.12.06.10.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 10:07:28 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:07:10 -0600
Message-Id: <b54efa51a07640cf94cf8645375a9ce47918aaa5.1481043778.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <e5818f1c19681484cb80f7a94c90824701c15b16.1481043778.git.george.mccollister@gmail.com>
References: <e5818f1c19681484cb80f7a94c90824701c15b16.1481043778.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1481043778.git.george.mccollister@gmail.com>
References: <cover.1481043778.git.george.mccollister@gmail.com>
Subject: [morty][PATCH 2/2] gdb-cross-canadian: Depend on nativesdk-python3-importlib
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
X-List-Received-Date: Tue, 06 Dec 2016 18:07:27 -0000

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


