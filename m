Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFc9-0000iv-Vz
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:07:46 +0200
Received: by qabg1 with SMTP id g1so2420034qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UegGEKK8HXpKepX6fThQcuvrgV4hKNe9aeDrylXkp+8=;
	b=olEU/vWZMbFuFDFU4kssdUym9+AdVmkatNqQjxhGAGTp9qkzMKzv/zgv/r3aMSVyKi
	OpxDzhtRxIMb0L18KIw3x3oMcX5CfmboebULurMoKBbeDfdF0Fv9hgNvX6VHeGW6DBk1
	janSvv0N4TI63N1jmLDsk5NMFU2B1seBo9Xva3xwUeWsbjZW6DypGycCpo8nYGLqBYOX
	OQ+dx1YXLyeC0rT6Digmmd8vTR1O+HoY2FFa/jUjVxxzD+O7jvSrnLrsQoO7vfY2RgzX
	zpbB4JVnOMxV2TfqBnDZGWICBRrMX8OyFKfFUFxY9ZDa8X6cfHASXTZUCYRLONLDeH6p
	TaDQ==
Received: by 10.60.24.202 with SMTP id w10mr10774903oef.28.1335887882360;
	Tue, 01 May 2012 08:58:02 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h7sm16733267oeh.9.2012.05.01.08.58.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 08:58:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 10:58:20 -0500
Message-Id: <f37eb9afddd95c029f18aa3e06938fb2a2c46cdd.1335887732.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
Subject: [PATCH 2/8] external-csl-toolchain: split out a libstdc++-staticdev package
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
X-List-Received-Date: Tue, 01 May 2012 16:07:46 -0000

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



