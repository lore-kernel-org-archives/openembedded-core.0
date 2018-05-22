Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF55748A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 02:11:57 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id i5-v6so9901055plt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Dmb46D3Gg9bcQhNJhx/nu2ygDjgRpyq2Ejvq0QGvtEs=;
	b=hixw9VU5ktiI6DU2XVexrnYzTiSq0LWlwGq82f48dxpMVyfFUay1ZfyHPu6GpHTxmi
	jwLZcF2y9uJDDeWe8lLvij/cntRWtCmbacGfImvDn6m9nz74Z1/6CoDuRGhRAQ8Ske+4
	0PE6kw+HkndQ4jcj2uz30Gz+tatuIloWXl1Vi9mZDMySnerxcWNgZr0Gj+qkr3hOFUYn
	8vQlxFx3w+fR6c81cmn9r0fmCA0eXsqGFgspXAY6gW/YR3luOn1/Zzzqr/YJ9meYAFd9
	XdolAp6o8repu3PBeczifSUiK0lrXyc+U46f07W+JVpiJ5PrE5klDhcfvGFr7OxjCGxC
	Icaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dmb46D3Gg9bcQhNJhx/nu2ygDjgRpyq2Ejvq0QGvtEs=;
	b=UftkjDW1SwdszTHQvIqLaHq477i2Mkla4Hzsq6fmMGtlu1QlGQX7ffhWIe87ENZkcB
	GwX/A627CLwodNW9tB/LwYlBl0Sowh4YC2lxlHAbDcSq6B2QQZpx07ncvxt55HBgYqc5
	D5y6RQ6dQNNG6qn/09PwwSi67DH24l5XAP3bySxD6oQ/C91Lk/YpoDfa1AlkWU62+YVO
	lI0IfQyGuvwWG420iV/J7eqT7JPv7fvYwAxEOyI5WMCw3RIcXD349SkIbdXO7pPoLTP6
	b3M9Ca3GmaJCRSPe2maH9srjzLXft3mrtvFWoHmlDrecv5JJ8m2rTONfZ6MNPhL6ZQkU
	zCGg==
X-Gm-Message-State: ALKqPwdDQdRUnjEEWXOHzspQbpBD0unpcaKrCoNcUefNwHTgMpMYhOyh
	6eNPsKz/SKKxTITP+Xp7z6tKTw==
X-Google-Smtp-Source: AB8JxZrYgzeqrWOY3hlAfyyFM8vXhnoCvRpBPtwyzjC85JPkQgFESxxiYSkhPhSLodq79VoSXyPG8Q==
X-Received: by 2002:a17:902:3381:: with SMTP id
	b1-v6mr22820932plc.248.1526955118127; 
	Mon, 21 May 2018 19:11:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x71-v6sm41582146pfe.47.2018.05.21.19.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 19:11:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 19:11:56 -0700
Message-Id: <20180522021156.6074-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V3] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Tue, 22 May 2018 02:11:57 -0000

Backport a patch to fix build

clang 6.0+ driver can correclty detect corss gold linker now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2:
- Remove code to disable gold with clang instead of commenting, and describe why remove

V3:
- Mark patch status properly as backport

 .../0012-soup-Forward-declare-URL-class.patch | 31 +++++++++++++++++++
 ...ebkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} |  6 ++--
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
new file mode 100644
index 0000000000..78fd4dc79b
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
+Upstream-Status: Backport [https://trac.webkit.org/changeset/231876/webkit]
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


