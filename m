Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC89F786C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:18 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s24-v6so1661453plq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gKZsE6UxfuDDNdRqQXkpnWAUoIruJjNYziTH/r8UEP8=;
	b=Yk39fE1OjLSJbrPOrKF7xqqFyzjdC71IMJYWfhG1xH+YgFZBIswGHDFQxRV4KhT2pC
	FD5AOAWaqH1Xwo559NQV5yrjFxadFPi0cOSdW9Y5zz+vAuZnZkrulZVSu6+LqkYudTVH
	IPPi9mavJiFYEIlbtIRUXWwL0wpbPlKDVly405L4llFFhPLfwFdbg1wKQhctvB9vS1PA
	77YxLi5dH2Dx5Lywa1v9s5rJciusl3ZBwxj+v10tBU0ANjmswKQ9fXs5abtVioih6G2s
	AUm3zXu3lrun7gobRH7qRMSdzAlkafpePY4rbs0appE/RGj+8bG6nC6Bi8R/NFDG1NLq
	R/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gKZsE6UxfuDDNdRqQXkpnWAUoIruJjNYziTH/r8UEP8=;
	b=bTPQOSEI+oHkNUoetcoNxevnnOeCy9xmALI2Q34sssBd/yXXZ3AulT7tZzl57NSev+
	hmC8bj+3uhZY9nCIaISwHt5bwd1h6DxxRlJOa0GXI7Dr7pO9aSm6HmCQr5yToNd0U5bA
	LUzcnKqKYQu9KJspOvrxPB5yfWBLVj2J8APDOmwOuMIM/n1ZZE6R0H1edoU8RQK+hb5D
	3nFrSB3map2vTVuJKUe6Gr0V5m/XXdzeQUHdAvstWMGycnuJ1gPL0fnWL2OCTg9LQSf5
	apEjCDORbR/YL9VwgLZ2FojIvGaO4ONX7gMImvehMSqx9N0EYcHgopAO4bGvNp3cWKl7
	yyOQ==
X-Gm-Message-State: AElRT7HGMRDphABzOx8RK183A/jEMrzlP6GBe4sd+CXmNB3K9DYko8KU
	EMHs5Jye45UxjLUcuO/ZKml+Lg==
X-Google-Smtp-Source: AG47ELvDtYD6YWPkDmTcSqhpjorPws8u6oTX9cf3mbikMLo15kMmsdkUAW+MY5X03+xHub7Nw1sFOg==
X-Received: by 2002:a17:902:51c3:: with SMTP id
	y61-v6mr35802093plh.101.1522074680227; 
	Mon, 26 Mar 2018 07:31:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:08 -0700
Message-Id: <15e01288c9090d1425ea86826467083c6cf6ff01.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 05/21] nss: update to 3.35
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:19 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nss/nss/nss-build-hacl-poly1305-aarch64.patch  | 30 ++++++++++++++++++++++
 .../nss/{nss_3.34.1.bb => nss_3.35.bb}             |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
 rename meta/recipes-support/nss/{nss_3.34.1.bb => nss_3.35.bb} (97%)

diff --git a/meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch b/meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
new file mode 100644
index 0000000..8276f89
--- /dev/null
+++ b/meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
@@ -0,0 +1,30 @@
+# HG changeset patch
+# User Daiki Ueno <dueno@redhat.com>
+# Date 1516710574 -3600
+#      Tue Jan 23 13:29:34 2018 +0100
+# Node ID 27f27ce21c2c6ff5a47fa9e17c438b000366c9c9
+# Parent  be1dca5ac80541d3b81a8da9d42854d8b1cceefb
+Build Hacl_Poly1305_64.o on aarch64 even with make
+
+Upstream-Status: Backport
+https://bug1432455.bmoattachments.org/attachment.cgi?id=8944691
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nss-3.35/nss/lib/freebl/Makefile
+===================================================================
+--- nss-3.35.orig/nss/lib/freebl/Makefile
++++ nss-3.35/nss/lib/freebl/Makefile
+@@ -533,7 +533,12 @@ ifndef NSS_DISABLE_CHACHAPOLY
+             EXTRA_SRCS += chacha20_vec.c
+         endif
+     else
+-        EXTRA_SRCS += poly1305.c
++        ifeq ($(CPU_ARCH),aarch64)
++            EXTRA_SRCS += Hacl_Poly1305_64.c
++        else
++            EXTRA_SRCS += poly1305.c
++        endif
++
+         EXTRA_SRCS += chacha20.c
+         VERIFIED_SRCS += Hacl_Chacha20.c
+     endif # x86_64
diff --git a/meta/recipes-support/nss/nss_3.34.1.bb b/meta/recipes-support/nss/nss_3.35.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.34.1.bb
rename to meta/recipes-support/nss/nss_3.35.bb
index ae52a95..08e3a06 100644
--- a/meta/recipes-support/nss/nss_3.34.1.bb
+++ b/meta/recipes-support/nss/nss_3.35.bb
@@ -26,10 +26,11 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
            file://Fix-compilation-for-X32.patch \
+           file://nss-build-hacl-poly1305-aarch64.patch \
            "
 
-SRC_URI[md5sum] = "5922468bb1c54e4c8067f153fcf467e5"
-SRC_URI[sha256sum] = "a3c15d367caf784f33d96dbafbdffc16a8e42fb8c8aedfce97bf92a9f918dda0"
+SRC_URI[md5sum] = "9467ec9e65c5aeb3254a50250490f5f7"
+SRC_URI[sha256sum] = "f4127de09bede39f5fd0f789d33c3504c5d261e69ea03022d46b319b3e32f6fa"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


