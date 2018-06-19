Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 952DD75402
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:10:17 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 15-v6so8526137pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fmdfAk0ltZLZwTVkUJAzXMG8lkaDSy4bHhv8Bb+1254=;
	b=Qd/NVeZd8dq1YKHJNon/YfMbjV8Jvic54LCAUdn57uW0OCOGIdkHbEdGhx8TdFC4sw
	0jEyLQGeUO3xWsaWdshg7+HNGdOGe8t3mdklr47ubiscU/iUVMnxLRrRagp3DN65Azmc
	b76LYkszNfxkKc5SKiwprHK4YQ9GfwuE/8a0bUQQUiiNIzu5CFqiGi/TBQBsDkOd3DSO
	YhaOZq2xQFZtUgYfftkAgUNSZWwhbMXcA4xeGGzuFS3KayvvVnl2Y1/Mj4Vq11dJIGRv
	wITJ60yaz14o/+2mhCfezTDvOYVAMzSj66wS7KLyANTdMPf2z3OMAWSOPjYgShsgyKYX
	Ih3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fmdfAk0ltZLZwTVkUJAzXMG8lkaDSy4bHhv8Bb+1254=;
	b=gXsRHJz3nXc+C0bEOdBwJDLbPbh+tVhsk5/DNZJH10NXA3cbl/Wd+twXm+GfR66chV
	fpOp+Vs98cOHeeVH30xEB7EnDWjrBdeSVHq7NcjsoTWDmvFKiQKo0EN4qtY21C62QJk4
	+l9nhDkhgioGqGW8NY3psEEE8wd/BOFGFGa2ljewTuewXU0mhLySbFJdFPoTDjSmpDrc
	PAATToYqc6A/hWXqSE29sq7zjIaE0AGH0Uu0ExRuxlHL0G0YpDF+nHJxtoGujd5qU2SK
	R6/EUYYypbG/6r7ASkcVjpBr0fKWqtW+xP4nZthvtURDzUQEHpxKZ/RTB9ypNUVpr3MO
	enQg==
X-Gm-Message-State: APt69E1AnHY4WIaKKZgEvsRXDuMcb5M6uCNiWoDKIKyzv5CnMYeNtyaZ
	TEO2sMVoyvwOKSbcJLOf3bk=
X-Google-Smtp-Source: ADUXVKLHghbLde72+AsbBOlpmcx0hXmwoUIQRPpuJp3R23mQrnESuTQOGk8Q6JBzngpvIBce30RLUA==
X-Received: by 2002:a62:8d03:: with SMTP id
	z3-v6mr16033232pfd.112.1529381418732; 
	Mon, 18 Jun 2018 21:10:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23326731pfn.149.2018.06.18.21.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 21:10:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 21:10:11 -0700
Message-Id: <1529381411-5045-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 6/6] nss: update to 3.37.1
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
X-List-Received-Date: Tue, 19 Jun 2018 04:10:17 -0000

remove Fix-compilation-for-X32.patch as a solution simular is included in update.

notable changes:
The TLS 1.3 implementation was updated to Draft 28.
The CA certificates list was updated to version 2.24.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...tics_1.9.0.bb => xf86-input-synaptics_1.9.1.bb} |  4 +--
 .../nss/nss/Fix-compilation-for-X32.patch          | 33 ----------------------
 .../nss/{nss_3.36.1.bb => nss_3.37.1.bb}           |  5 ++--
 3 files changed, 4 insertions(+), 38 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.9.0.bb => xf86-input-synaptics_1.9.1.bb} (79%)
 delete mode 100644 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
 rename meta/recipes-support/nss/{nss_3.36.1.bb => nss_3.37.1.bb} (97%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
index d327a3b..dc31890 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
@@ -10,7 +10,7 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "58e5b7722a402114093bf193962d1e3a"
-SRC_URI[sha256sum] = "afba3289d7a40217a19d90db98ce181772f9ca6d77e1898727b0afcf02073b5a"
+SRC_URI[md5sum] = "cfb79d3c975151f9bbf30b727c260cb9"
+SRC_URI[sha256sum] = "7af83526eff1c76e8b9e1553b34245c203d029028d8044dd9dcf71eef1001576"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
diff --git a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch b/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
deleted file mode 100644
index 80b8690..0000000
--- a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c8eadfcdfbc1d5a4799e9a264b0f859cb5954c05 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 11:40:47 -0700
-Subject: [PATCH 7/7] Fix compilation for X32
-
-X32 uses 32-bit pointers, not 64-bit.
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Upstream-Status: Pending
----
- nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c b/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
-index 2a3301e..d4ade41 100644
---- a/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
-+++ b/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
-@@ -87,7 +87,11 @@ static poly1305_state_internal INLINE
-     *
-     poly1305_aligned_state(poly1305_state *state)
- {
-+#ifdef __ILP32__
-+    return (poly1305_state_internal *)(((uint32_t)state + 63) & ~63);
-+#else
-     return (poly1305_state_internal *)(((uint64_t)state + 63) & ~63);
-+#endif
- }
- 
- /* copy 0-63 bytes */
--- 
-2.8.0
-
diff --git a/meta/recipes-support/nss/nss_3.36.1.bb b/meta/recipes-support/nss/nss_3.37.1.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.36.1.bb
rename to meta/recipes-support/nss/nss_3.37.1.bb
index f855538..cf60a7f 100644
--- a/meta/recipes-support/nss/nss_3.36.1.bb
+++ b/meta/recipes-support/nss/nss_3.37.1.bb
@@ -25,11 +25,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
-           file://Fix-compilation-for-X32.patch \
            "
 
-SRC_URI[md5sum] = "814d8fe3ec89006cf62078e2a56cf2f9"
-SRC_URI[sha256sum] = "6025441d528ff6a7f1a4b673b6ee7d3540731ada3f78d5acd5c3b3736b222bff"
+SRC_URI[md5sum] = "e9526d7217d02afa96b90b89924c38df"
+SRC_URI[sha256sum] = "097b30e436479ad737b3703b25b6198b6513e202731085c6f097d8853dd20405"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


