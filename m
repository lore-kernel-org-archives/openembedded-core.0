Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAkB-0002cS-2C
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:03 +0200
Received: by yenm3 with SMTP id m3so3178107yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UegGEKK8HXpKepX6fThQcuvrgV4hKNe9aeDrylXkp+8=;
	b=R7ID6N69yHgGP/amkXRuCWjA9Is+OSRdok/CpUBGIBADc2UjDewO7Gq9b0QMzT5Mr9
	4VKE8EraQbUHok+XSPDzR0XQ1L0UoHBJyShssjrTNY+UkniUFU74BuRh+ERmZzM/He9D
	EAhVvFIssePuWd7O4VJh+gCzpCVwN4DoFR2mP3Kels2Hl0N3W09J1rdsZaxVlSCXNY82
	RLAAZn9JuwLlHtrzUIw6Etkrf9QmC8n8itr2cpUwA2xwBMDl+smwLFGynfqAw5RkMMCw
	6GeBy8yt1VhefWw4Hen2sT+fRm4v/N0ydAA6wI1ArfP/dJqDKUuyElFjzNewXP9IYudS
	Jm1g==
Received: by 10.182.155.35 with SMTP id vt3mr22434621obb.63.1334677536488;
	Tue, 17 Apr 2012 08:45:36 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:33 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:11 -0500
Message-Id: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
Subject: [PATCH 1/6] external-csl-toolchain: split out a libstdc++-staticdev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 15:55:03 -0000

This silences one of the QA warnings.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 3e820ff..bafa331 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -88,7 +88,7 @@ external_toolchain_sysroot_adjust() {
        fi
 }
 
-PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
+PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
 
 INSANE_SKIP_libgcc = "1"
 INSANE_SKIP_libstdc++ = "1"
@@ -111,6 +111,7 @@ PKGV_libgcc = "${CSL_VER_GCC}"
 PKGV_libgcc-dev = "${CSL_VER_GCC}"
 PKGV_libstdc++ = "${CSL_VER_GCC}"
 PKGV_libstdc++-dev = "${CSL_VER_GCC}"
+PKGV_libstdc++-staticdev = "${CSL_VER_GCC}"
 PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
 PKGV_linux-libc-headers-dev = "${CSL_VER_KERNEL}"
 PKGV_gdbserver = "${CSL_VER_GDB}"
@@ -122,9 +123,8 @@ FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "${includedir}/c++/${PV} \
 	${libdir}/libstdc++.so \
 	${libdir}/libstdc++.la \
-	${libdir}/libstdc++.a \
-	${libdir}/libsupc++.la \
-	${libdir}/libsupc++.a"
+	${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = "${libdir}/libstdc++.a ${libdir}/libsupc++.a"
 FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/linux \
 	${includedir}/mtd \
-- 
1.7.7



