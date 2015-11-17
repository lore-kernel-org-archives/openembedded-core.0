Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E82EA60110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:00 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so151498376wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=IkeGc2u6GBJnwwSMSFXpz7a+HtupEIWAhkIFdqDcAbM=;
	b=g3MiLyBzvycoUnJAF1M0W16nTnANG06jhwM5QVH6gDEcaEEjRV/5OjgbUprY5prPTy
	Oh1EBpZ2jv70WUYCC25Uhvp9IBQvR17AdCTRw4x2tiY8Mp+abQKoq6KhS8tw/+KB88Ni
	XqVjUy4N1r4qZuUnLgB+tNqk2zQcvXUK+9ugmOwi7gGqhKHKeyUaWqVMGTVNJfOQn4i/
	nziSrhpMMUPLrhAKxDtfoJE0CgNTD7nRhSQ7lmUdsAsWNatHEh84k7CS97xMNAdUYm9d
	gTIsx1nsJffEuaLeCXfwaL1RZHakhF7bTLMPL4CPu5m79k7SrBwb+aFtovLZFgnidGK4
	9G5A==
X-Received: by 10.194.89.135 with SMTP id bo7mr49244190wjb.147.1447761480975; 
	Tue, 17 Nov 2015 03:58:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h189sm23598922wme.1.2015.11.17.03.58.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:55 +0100
Message-Id: <6c1c6094974ca33d7000ca7048c3bc1f3546f5fd.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 03/16] directfb: add fPIC to CFLAGS
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:01 -0000

* fPIC is missing when building directfb-csource.o
  | arm-webos-linux-gnueabi-libtool: link: arm-webos-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp -mfpu=neon --sysroot=/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako -I/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/include/freetype2 -I/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE -std=gnu99 -Werror-implicit-function-declaration -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o directfb-csource directfb-csource.o  /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/lib/libts.so /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/lib/libpng16.so -lz -lm -ldl -lrt -lpthread
  | /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-webos-linux-gnueabi/gcc/arm-webos-linux-gnueabi/5.2.0/ld: error: directfb-csource.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
  | collect2: error: ld returned 1 exit status
  | make[2]: *** [directfb-csource] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 446aaea..e00b59b 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -20,7 +20,8 @@ SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.ta
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
-LDFLAGS_append =" -lts -lm"
+LDFLAGS_append = " -lts -lm"
+CFLAGS_append = " -fPIC"
 
 BINCONFIG = "${bindir}/directfb-config"
 
-- 
2.6.3


