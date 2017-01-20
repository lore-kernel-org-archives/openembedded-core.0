Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C66372003
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:11:19 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id un2so1002289wjb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UoMjotQCUjU9CpFJ6o8zL7zbOMDJrPrzmetBqwKsptY=;
	b=jzKr6RjzMYYzNI1+tx5fkBJEejIcBBmOoWrdoz2loMDXFRIvyfw5KAEU8zy4K/4zey
	1g6j6Pi0KJ7MzRnfxtTVD102fDXS+sPIpPyHNatJNFPOyC6GR+rcIdG2StHU9JR/pcDr
	pJyDets/dH7qv5auKSz9JvygBHDucjt3GrlqspmIgVJzGj4wbD3DDIZGIbt0cjP7BvA3
	XcKAnigAFDi5eg5lGw/9n597vhbYkUJseRFFnriviMYpmhidYfsa3s5/Pefh/bcPi+JZ
	lJGbsZzY+DaQF70k39knG3OBwEICJv655SGLtx69oAq8B5xFfWstk1bKpqQXesbwy9AP
	ELiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UoMjotQCUjU9CpFJ6o8zL7zbOMDJrPrzmetBqwKsptY=;
	b=k/rgFVGlTTcsbsWklPLJUH+IPp0eq4jq3cRp3Bm/BSG29ZR10uwmde91gt7RwAClyI
	JC6ivGThr5BoTpmNymTP83oC299HwdUPco7U5LB4qMHlPwS4fSM9CeLB2eITIZVxt6eE
	2mJUQ4TV2LWpdgRUEOXOZ1VAwj7UywNuf+jwaqf6ZUTtVyj9LEzSCTmrHcjl5SzFIPXh
	X2NN/ABEwuDO2l6YlSJVWqxNpZiN8FgAEcKxZ3paZzjhF7qnZE30JqjjhTCu2ewZ2qzB
	FW5Pb82yd6S78GqgYG6nQ1eTFSVfKRlbQ+sMe8eHup4Jm2EYB/NnvBUTubBhAz/yQOC8
	Zwhw==
X-Gm-Message-State: AIkVDXKlA8OtiCxgSTqRv3xDHIAPlYIpBdXgezHf5Nl+UnHpfk2YwjP6vgMsBrgLZ8k4Kg==
X-Received: by 10.223.160.14 with SMTP id k14mr13404744wrk.69.1484917878970;
	Fri, 20 Jan 2017 05:11:18 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm6109457wmf.1.2017.01.20.05.11.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 05:11:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:11:06 +0100
Message-Id: <1484917866-24351-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Fri, 20 Jan 2017 13:11:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33 ++++++++++++++++++++++
 .../alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb}  |  5 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (87%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
new file mode 100644
index 0000000..9d464f4
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
@@ -0,0 +1,33 @@
+From 9ed4075f05a4242f32331f7f2c365767970f5003 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 21 Dec 2016 19:46:34 -0300
+Subject: [PATCH] ucm: parser needs limits.h
+
+It's using PATH_MAX which is defined there, otherwise the build fails on
+musl libc.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+Upstream-Status: Backport [1]
+
+[1] http://git.alsa-project.org/?p=alsa-lib.git;a=commit;h=9ed4075f05a4242f32331f7f2c365767970f5003
+---
+ src/ucm/parser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ucm/parser.c b/src/ucm/parser.c
+index c98373a..f520abc 100644
+--- a/src/ucm/parser.c
++++ b/src/ucm/parser.c
+@@ -32,6 +32,7 @@
+ 
+ #include "ucm_local.h"
+ #include <dirent.h>
++#include <limits.h>
+ 
+ /** The name of the environment variable containing the UCM directory */
+ #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
index e313da7..9a8a167 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
@@ -11,9 +11,10 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
+           file://0001-ucm-parser-needs-limits.h.patch \
 "
-SRC_URI[md5sum] = "1946e6438b8262a7b8fdadacd0e06ba7"
-SRC_URI[sha256sum] = "d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6"
+SRC_URI[md5sum] = "eefe5992567ba00d6110a540657aaf5c"
+SRC_URI[sha256sum] = "71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


