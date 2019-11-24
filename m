Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB847FC86
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:53 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d199so1700252pfd.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hB8fjsCtDA2XDxxRLv9B9P5Rs6M6DYx/M0u5xcbTBnc=;
	b=CciLjrSeMlbo8S5k1IWFzW6bgxyMqHljSNSQ7oT3aJr64YNr5iZHyCvg4rdvYfFyF1
	+VDTirBbr9qfWMNo8nZMoUJDo0WY9WhqC9HBCy9UG9GRE4gCxJiwIule149kaOrb2DRB
	TYkBqSASIoJy6ZJ6TacPdBPgz+PIqHm277fYHqwBgY9C+9LR+u8vGdzEm9RhtQ5Y2C7v
	e0QxE/S0BzacfC0SHbLObPLIthMfLpWQ46pwLiWTUd1Bfqk+tVFDy3RD9eTn5s0BklMn
	VVuWHl5p+LFZ11VuDO/NLJeZC0s+kNq0pMQvTC74CUXtiwLIF2ViK0xtUfsL3zBY+SER
	JhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hB8fjsCtDA2XDxxRLv9B9P5Rs6M6DYx/M0u5xcbTBnc=;
	b=CU1cXAIuhRJ1l1Ln8RngrZdUzjNWmGsfObkluf+q2keTvxiCSjm1MmHBTXwT/YVyEa
	0Q1Kmj5f8bKclGZmePrtgZFfn9+XeiQjZbCURDEJ59QEOQD3h7zLZTCdY83lD7nrSHce
	3qVEBVxgOGEzP206bK1fKI7TmjSn7TU7ANdldX5I7g18ZF/QqzSRJUHKP1BwZVJRlPrI
	SeZ1qH1Td46Zvq8GqvaqiGXSmzpFGe4kmHY4m6kZzUV6xup6bxkr++OWpGGZZPL/IMYh
	O0rQiZBT3FBwx2tgmZyzbhQpMSrai81dEzj524lkxbmrDgUifqVoBKOBwFItNUffT2k3
	yrLw==
X-Gm-Message-State: APjAAAVvtyc4x8drmwxjZPjRMYDhvWbIEcmyrbhw0eDeZa2PH+KqD5Pw
	ypmrcys7ioXJZyZUjSS6iGxGwXbj
X-Google-Smtp-Source: APXvYqylF/7aYCBzORPOdifEOW1ik+6V3dbUE2XLXzHyxyHZWsk+wKWNL3b3ayAUxsVGMGB0vEi4aA==
X-Received: by 2002:a63:4c14:: with SMTP id z20mr20451872pga.10.1574639453852; 
	Sun, 24 Nov 2019 15:50:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:16 -0800
Message-Id: <ad39b52d0355301afa8c8483ce86c80ddf65a5c0.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 11/35] boost: fix build for x32
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:53 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Commit: d336110b94 boost: update to 1.67.0

dropped the patch that ensured boost doesn't over-ride the architecture flags
set by us resulting in errors:

| build/tmp/work/x86_64_x32-poky-linux-gnux32/boost/1.69.0-r0/recipe-sysroot/usr/include/bits/long-double.h:44:10: fatal error: bits/long-double-64.h: No such file or directory
| #include <bits/long-double-64.h>
|          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Remove the relevant part from gcc.jam again to ensure we are passing
them correctly again.

Fixes [YOCTO #13598]

(From OE-Core rev: aad28f42b1c8aa1335c040630ebff4a69be07e35)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-dont-setup-compiler-flags-m32-m64.patch   | 42 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.71.0.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch

diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
new file mode 100644
index 0000000..78b1922
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -0,0 +1,42 @@
+From 59402e3a61d14eb7ce8c2019ea1a87ad4bd28605 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Thu, 14 Nov 2019 10:13:53 +0800
+Subject: [PATCH] dont setup compiler flags -m32/-m64
+
+We don't want these to be setup by boost as we pass our own flags.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ tools/build/src/tools/gcc.jam | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index c7e3cf3..24486e0 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -430,20 +430,6 @@ local rule compile-link-flags ( * )
+ }
+ 
+ {
+-    # Handle address-model
+-    compile-link-flags <target-os>aix/<address-model>32 : -maix32 ;
+-    compile-link-flags <target-os>aix/<address-model>64 : -maix64 ;
+-
+-    compile-link-flags <target-os>hpux/<address-model>32 : -milp32 ;
+-    compile-link-flags <target-os>hpux/<address-model>64 : -mlp64 ;
+-
+-    local generic-os = [ set.difference $(all-os) : aix hpux ] ;
+-    local arch = power sparc x86 ;
+-    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>32 : -m32 ;
+-    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>64 : -m64 ;
+-}
+-
+-{
+     # Handle threading
+     local rule threading-flags ( * )
+     {
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/boost/boost_1.71.0.bb b/meta/recipes-support/boost/boost_1.71.0.bb
index 324b46f..5e9e0d8 100644
--- a/meta/recipes-support/boost/boost_1.71.0.bb
+++ b/meta/recipes-support/boost/boost_1.71.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://0001-dont-setup-compiler-flags-m32-m64.patch \
            "
-- 
2.7.4


