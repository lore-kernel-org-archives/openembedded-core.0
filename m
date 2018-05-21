Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3CA74CB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 13:37:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c10-v6so7099321pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WNOAjrPZO9/Vrm1v4Poci1uxOIWRht3pYR9C1UWGkHY=;
	b=Ukdk9ft9fVPHsJpXov25uocyBdJCp7OESxtTt5nZ5pxdy/m9jBYlZVmTxDl0kCpC5E
	XOO5LRdtsjriIYuHZEjuidoqld0rybLAxdLf/a8NK0S8gTHe5znX6dzjDBWAY8VSobru
	6wlDcBSWoubnpQJDEqcdbjNfMluSIPEM/gH0rUr40MdvyBcnEU45i02xfRNdq1i0Hc80
	1PhAGzLjm3Km2M3Rxwu0CnNTXJfet7UeRZa26DT421YG9r0em4FQB381K/KnpFEU/x+g
	1jJbp5V0CY7ln/VOPgY8XxjUlXzuA756qi2Wibhsv+Bqd5ddyjFV+qnRrIs/2hoM2twz
	APvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WNOAjrPZO9/Vrm1v4Poci1uxOIWRht3pYR9C1UWGkHY=;
	b=HEzq67z+AfD64RVHaHssi9fhVTAzfIXgAP6rvHDKYMs1rqwav2pnvvo/9OV4wx4px7
	QQQ5T/avE0ErneJ1pxbdR1FAWhIuX/M6ZgnUcMavQFqPjTMD+rhCbKhyf7sWllr4cGnX
	D9hIbLU3MR1pTF9IpYKwaLn1OZk5tthvvwFyBxBSzU01VprlhKMNdCixkP9EfV3ZNL2D
	/6yjbKmQfAZyoQO4wz4X/vbD9tOrOar7dKECseYgByJga4Zcy2fPSky7cfAta63uh+V8
	96zWDF6DPH/lvlyQ5slAC3AXnWhOAZPsK22FNF4n9NARxkAdBNDzmRWpSbTfhXvAxzTF
	rz4w==
X-Gm-Message-State: ALKqPwdfnNTUKnXcB4/iOW1KNofj2XDDX6LfPbYj2xWQF5DV2aYEtMck
	HKxZ9gqzxlSHdgSs/QmKZlALhA==
X-Google-Smtp-Source: AB8JxZpWc9WWhO1Lfn6cMGSwznVvVYXHoLqS4C/DkkNW6FJyshD3pqZ4EEHNbKMJkLRdzUmgXYbOMA==
X-Received: by 2002:a65:4d8a:: with SMTP id
	p10-v6mr15793872pgq.21.1526909866370; 
	Mon, 21 May 2018 06:37:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x71-v6sm39225398pfe.47.2018.05.21.06.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 06:37:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 06:37:42 -0700
Message-Id: <20180521133742.15994-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Mon, 21 May 2018 13:37:46 -0000

Patch it to build with clang

clang 6.0+ driver can correclty detect corss gold linker now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2:
- Remove code to disabel gold with clang instead of commenting, and descrive the removal

 .../0012-soup-Forward-declare-URL-class.patch | 31 +++++++++++++++++++
 ...ebkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} |  6 ++--
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
new file mode 100644
index 0000000000..c689117650
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
@@ -0,0 +1,31 @@
+From 59f6903ad96f3213f248b672d5fd526cc0d666ce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 May 2018 14:28:27 -0700
+Subject: [PATCH] soup: Forward declare URL class
+
+This helps getting away with compiler errors seen with clang
+
+/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
+error: unknown type name 'URL'
+    static std::optional<ResourceError> checkTLSErrors(const URL&,
+GTlsCertificate*, GTlsCertificateFlags);
+                                                             ^
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/platform/network/soup/SoupNetworkSession.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WebCore/platform/network/soup/SoupNetworkSession.h b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
+index 03bd72ba..7ca8792d 100644
+--- a/Source/WebCore/platform/network/soup/SoupNetworkSession.h
++++ b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
+@@ -43,6 +43,7 @@ namespace WebCore {
+ 
+ class CertificateInfo;
+ class ResourceError;
++class URL;
+ struct SoupNetworkProxySettings;
+ 
+ class SoupNetworkSession {
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
index 360ab8e69b..a68a69f43c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
@@ -21,10 +21,11 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
            file://detect-gstreamer-gl.patch \
+           file://0012-soup-Forward-declare-URL-class.patch \
            "
 
-SRC_URI[md5sum] = "0cd9b9ae1f48c04de5314f77806eceb4"
-SRC_URI[sha256sum] = "43e43285fa4e393080cc4fbd5ad8644749a75b1e0b811b230b63ae56806c8959"
+SRC_URI[md5sum] = "3fdda40dc10eb2a00d5fba4219b83967"
+SRC_URI[sha256sum] = "dffe93a241f03f1c73b369f4e323e4d8f12e39d33d5515948cbf454ca4b526e2"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -85,7 +86,6 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
 
-- 
2.17.0


