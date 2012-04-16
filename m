Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvY-00055f-2k
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:36 +0200
Received: by obceq6 with SMTP id eq6so1435981obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UegGEKK8HXpKepX6fThQcuvrgV4hKNe9aeDrylXkp+8=;
	b=OyoYHhr/x3Aaff7T5SH1yYvVa7NPCoAkVfux9WzBvX2fWeedE9n+cxqOjgNbkCTFh0
	NIvYenoZuCeori5bRYRddFIZuVA7/b2jyK+pDaJZwBHKADPko/b0RexklJVDf+E8rgUf
	bb/bgas74z/fAM5C+fnXDNime8TPq6ebN23MMoxffhQQzj57ANxdGdDaXriABSbYgIpY
	7paA2u6qs/z0hGtoG6o1T0PgFcCgywaYwLp9VIDyPBBKIlquUs6geyCjz/csHdHi9o+v
	ZPIRr4OT/U96d2FWIbDab3Q1ADIVyBv+Q0GNQ+kdgtWEOE4f/NOzL0XxCozb3BTncokH
	WA6Q==
Received: by 10.182.72.38 with SMTP id a6mr1041265obv.38.1334609050334;
	Mon, 16 Apr 2012 13:44:10 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:43:58 -0500
Message-Id: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 1/7] external-csl-toolchain: split out a libstdc++-staticdev package
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
X-List-Received-Date: Mon, 16 Apr 2012 20:53:36 -0000

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



