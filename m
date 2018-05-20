Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E945F74CB9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 22:04:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a14-v6so6116187pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 15:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9qK0h0ciky00gPTvAsdzB9vMbCYJEpNk/VaFoel3dPs=;
	b=n3y7Lk9HxfgnBb1SifIUH8JX4ejq1+/cfmalCqrw7op8O/OCJ249t5TRO55bbMNhap
	5yddYdsKVacRwOB6SXB8afbdnNWuRYHq5/DmuNtpW0v2HlBvG6vHn0FUSFz0QdPUHjHw
	Tk6h1KxNOvmaT5B7QAazGoPXnsOtmc1rNO84heeDoYTMvC63E5+WkQaPhELilN0FasdV
	QQAMmhGKrLpoDsq/1DhvFPSN+YssGnHssKRmtFJiyHsYoYGRJkAGRsTpa/Q1vxk8NkRF
	OGIhVgN2vn1i4wJHRA7EKuO3V34b4mHmqlKhDliRIjabDlCCrBlU/HIE5Os5T8sXsJYZ
	MxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9qK0h0ciky00gPTvAsdzB9vMbCYJEpNk/VaFoel3dPs=;
	b=tZrIYkel/hgrDRm6h4qlH/NNSUB27RKawulh1SX7GoSr3Cjeo5SHMc2S4TlwnfIu/e
	m0IxECR1+jynxynNpbeO4zrII7EvZaNgAhs2udP0CS7HHYSuntKceU78kG6sUrgnXfUm
	5jIzQ0djYGvP499q4v2UlJ+Odi/10EEVVsGpD8WnVo9pemLfHpM9B0Pnoty+fthI9vu/
	z6D4EjyOt/TY6ECFfM1H1fd+K+2V0jyzaFHiQFwDbc2cdiTBTOXx+qP3JuMnvLUnfWEE
	NAhXOKHwn9SKqqHy4GhnewTe9yhp1LvN18ApqYvHFCefZD0s2Fg3wQBX1pVq3RNejxOn
	unEA==
X-Gm-Message-State: ALKqPwfesrCk1Fw5MDxxsbAVfVkVmealGeMNjqBB/BuJmgPmOWskuXPD
	HLTNhMtLxcs2TUtzLpj/q+s4JA==
X-Google-Smtp-Source: AB8JxZqj+gcPZPmVVBuBg5vV8vC46coaa1OkCkB8Qzo9YJl+THsytivOz2Y3GnJd0RalgMXszFsedg==
X-Received: by 2002:a63:584:: with SMTP id
	126-v6mr2451638pgf.272.1526853884397; 
	Sun, 20 May 2018 15:04:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c18-v6sm16667913pgu.63.2018.05.20.15.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:04:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2018 15:04:42 -0700
Message-Id: <20180520220442.16092-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180520220442.16092-1-raj.khem@gmail.com>
References: <20180520220442.16092-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Sun, 20 May 2018 22:04:44 -0000

Patch it to build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0012-soup-Forward-declare-URL-class.patch | 31 +++++++++++++++++++
 ...ebkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} |  7 +++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} (95%)

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
similarity index 95%
rename from meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
index 360ab8e69b..a3d62e7ba7 100644
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
 
@@ -85,7 +86,7 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
+#EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
 
-- 
2.17.0


