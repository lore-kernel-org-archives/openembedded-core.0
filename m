Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id B8E21763F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 15:04:47 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.156.126]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0LcT2M-1YaMDT21JO-00juMo;
	Tue, 28 Jul 2015 16:59:41 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:58:37 +0200
Message-Id: <1438095518-7513-4-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
References: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:QTcy3V8G3FATb7Ht/iQi3vma79ZV+GVaBYsZbEZGIetgIFSJ6oc
	xewHwVfi/pgurpXiReC/FmJX+USod91Vp2DYLzrdKvDbSKSU9K3tJsN+1KHqaPvuvRCHtA1
	O5k+OXKRiDNeQwpLNiq5nqaI1iBomafgOOTNBSiT/9WddqKrttdN/trWdi3t2c5S/kcC5km
	hDULlK5pdH7AQp0b+ZfzQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:1EY8nZ6tCwU=:Z0DeLlWFtzYW1N2P6lezOh
	K+/rFs2PUqu22EIEU5TRv9gOdPsKtMFkTDm62p406XG1AOOf2qn1N+nrq7eqQMBL5jc5e7HTa
	Wp+VUw3g5CUoox9B75Lz65fKbYA5f/v8LWjI1feX+Qg9pJSFtxm/B3cDwFeK234NMHtOo7l8s
	s5YVLV5mP+cRyUDTrL/noLBXfx+mefBD8gsJAZIA6yaAS5r9jWcfXaZXiLaLZdG/xdAh4QDXL
	Y2UYIzaENGM+mxEAzukB7RBScW29/kyF1FPD8msgRhlikIrXr01B/a/g8QISr2Xxgdpv1HrYo
	pboQxOMdUi2coLpiwFlISqkqB/aY1bhoQxtMuZJMB6vZ0sWtiUSRibKLhR+rRwxMi+3yHtB0Z
	YXJ4RrS69R+gokrL0GbAGH2m57gY35Jvzu+Z1sfE8ysFdtnAAOE2L2L+Z9g73C0ymD8SfeKxZ
	WHMWHfTxrCVK3RQ89OliZ0WNseKNWso6u5jDXeeH5RTmtlvSeWKwS2XMudRIn230J+2/4/C/s
	WUVrmpU0ErrZFyMbJ9ozYYCB4nWuLupDUw70g+A5TQfVmMJLqOvIsU1OfHgwKgExHITGd53C0
	7umM0R/qr4V/6RxJHZqPn7XT2aVwrEIfC7okCUL000scogw2qkomBSqjLd/rkFzlJ9Mg7fA9k
	02CL2T2ZY/C1R//Jgjy/bmwCLhctV+wZ8PlOlWh6//Pf7Xga91SrBmnAeDxjo2ZgE7UQ=
Subject: [PATCH 3/4] python3: remove 2to3 symlink from package python3-2to3
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
X-List-Received-Date: Tue, 28 Jul 2015 15:04:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 2to3 symlink conflicts with its Python 2 equivalent in package
python-2to3.
The Python 3 version of the tool is still available as 2to3-3.4.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/recipes-devtools/python/python-3.4-manifest.inc | 2 +-
 meta/recipes-devtools/python/python3_3.4.3.bb        | 3 +++
 scripts/contrib/python/generate-manifest-3.4.py      | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.4-manifest.inc b/meta/recipes-devtools/python/python-3.4-manifest.inc
index 77f0125..07e1490 100644
--- a/meta/recipes-devtools/python/python-3.4-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
@@ -11,7 +11,7 @@ PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-comp
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
-FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
+FILES_${PN}-2to3="${libdir}/python3.4/lib2to3 "
 
 SUMMARY_${PN}-asyncio="Python Asynchronous I/O, event loop, coroutines and tasks"
 RDEPENDS_${PN}-asyncio="${PN}-core"
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index e2d9f79..6c2e21d 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -162,6 +162,9 @@ do_install() {
 		ARCH=${TARGET_ARCH} \
 		DESTDIR=${D} LIBDIR=${libdir} install
 
+	# avoid conflict with 2to3 from Python 2
+	rm -f ${D}/${bindir}/2to3
+
 	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 
 	if [ -e ${WORKDIR}/sitecustomize.py ]; then
diff --git a/scripts/contrib/python/generate-manifest-3.4.py b/scripts/contrib/python/generate-manifest-3.4.py
index 42c851c..06eecdc 100755
--- a/scripts/contrib/python/generate-manifest-3.4.py
+++ b/scripts/contrib/python/generate-manifest-3.4.py
@@ -194,7 +194,7 @@ if __name__ == "__main__":
     "${datadir}/pkgconfig " )
 
     m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code translator", "${PN}-core",
-    "${bindir}/2to3 lib2to3" ) # package
+    "lib2to3" ) # package
 
     m.addPackage( "${PN}-idle", "Python Integrated Development Environment", "${PN}-core ${PN}-tkinter",
     "${bindir}/idle idlelib" ) # package
-- 
2.4.6


