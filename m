Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0397879AE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 14:13:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so15840636wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cZg1KehFGbeeCsis/d+sb0entuolZYaobqnLuySf7fo=;
	b=H3uFc4ual9mdFZoSfxYvssunTRyw0ghaLS9oMqouyUYDiaWjbQgE6Zu9FUcngDTTjl
	LCr4LdaqXYz6Y27PZbdiK2SF+t3IWIGgMFJrPROOkBvaHd5tLaGurVALThKhxD3Mxcz+
	+KWKD89cXxNRi2KtsqeO6gYF94D5jDbQGJgny6U7Xda2OeWzIz6sRqv21prQRj7+t2tv
	KknN3sYGHz+H8ZUrF3wXR/4AzKvjQHQFYBLxy3ZnkXJs8Pc79SKQMm9PuR9YnXZWQgWt
	9WugRq2xPDzVblKSHS1wc7syTSW3HV7bYee/Byu7+CEWp7sruvJ7PTj5bUMA8KmTEUDq
	/lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cZg1KehFGbeeCsis/d+sb0entuolZYaobqnLuySf7fo=;
	b=kThnbAIGByLInL9qQhwCh5SdbJEkDWsC8aQ6e/puYoJedBiAtrNw/mtT1lLmmd4IXF
	09DDeMbKZxHwnAoYjO8OgZvPMqWGNy2EsiCSZZ3Z87rz30YTUQNym/lNFG6sT9nWYOhB
	Iw8QgDFQcplv4YJbE+jg2Ln0pgZTgCnoKs+hDNmjO+md9vUN4CDSoidXBhbR08MaS71n
	+l0UbaSlwmdOBwoJuscqYqhgXTEz1SxIzteEHCF+UPK534Ac0YR4GpPP2WoCcpF+qDCF
	QVzAotmlHtqgmzvBkvkxsUy1JFFT+ZTj92fNIU2rU0lYz3VpIbs1O6g+wcCBrDY73Jjz
	xr0A==
X-Gm-Message-State: APjAAAXKOQ6551jkHYGH5azv6YCbTViLIYIzEtFp15f/g12UrLaTCyjR
	r9r51SbMuM/45Tb/PG+B+hTKhHRFQ6g=
X-Google-Smtp-Source: APXvYqy2HioMp6+PxWoiDxW1CUPoHg/2UsVqxIENwpb1z56MifrjQghsL04vHnOmdH2e0hRbCKOm0g==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr31607753wrm.293.1579097589302; 
	Wed, 15 Jan 2020 06:13:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u1sm23491807wmc.5.2020.01.15.06.13.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 06:13:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 14:13:05 +0000
Message-Id: <20200115141305.11077-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] xf86-video-intel: bump to latest SRCREV
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
X-List-Received-Date: Wed, 15 Jan 2020 14:13:09 -0000
Content-Transfer-Encoding: 8bit

Drop the i686 build fix, this is integrated upstream now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../01_Fix-build-on-i686.patch                | 55 -------------------
 .../xorg-driver/xf86-video-intel_git.bb       |  7 +--
 2 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch
deleted file mode 100644
index 52916f8b4aa..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/01_Fix-build-on-i686.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a414d4e24461da1cb4cef8ee910bc57bab360ceb Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 6 Mar 2018 12:07:46 -0500
-Subject: [PATCH] Fix build on i686
-
-Presumably this only matters for i686 because amd64 implies sse2, but:
-
-BUILDSTDERR: In file included from gen4_vertex.c:34:
-BUILDSTDERR: gen4_vertex.c: In function 'emit_vertex':
-BUILDSTDERR: sna_render_inline.h:40:26: error: inlining failed in call to always_inline 'vertex_emit_2s': target specific option mismatch
-BUILDSTDERR:  static force_inline void vertex_emit_2s(struct sna *sna, int16_t x, int16_t y)
-BUILDSTDERR:                           ^~~~~~~~~~~~~~
-BUILDSTDERR: gen4_vertex.c:308:25: note: called from here
-BUILDSTDERR:  #define OUT_VERTEX(x,y) vertex_emit_2s(sna, x,y) /* XXX assert(!too_large(x, y)); */
-BUILDSTDERR:                          ^~~~~~~~~~~~~~~~~~~~~~~~
-BUILDSTDERR: gen4_vertex.c:360:2: note: in expansion of macro 'OUT_VERTEX'
-BUILDSTDERR:   OUT_VERTEX(dstX, dstY);
-BUILDSTDERR:   ^~~~~~~~~~
-
-The bug here appears to be that emit_vertex() is declared 'sse2' but
-vertex_emit_2s is merely always_inline. gcc8 decides that since you said
-always_inline you need to have explicitly cloned it for every
-permutation of targets. Merely saying inline seems to do the job of
-cloning vertex_emit_2s as much as necessary.
-
-So to reiterate: if you say always-inline, it won't, but if you just say
-maybe inline, it will. Thanks gcc, that's helpful.
-
-- ajax
-
-Patch taken from Fedora.
-
-Upstream-Status: Pending
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- src/sna/compiler.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sna/compiler.h b/src/sna/compiler.h
-index 3c176a16..bc447c7a 100644
---- a/src/sna/compiler.h
-+++ b/src/sna/compiler.h
-@@ -32,7 +32,7 @@
- #define likely(expr) (__builtin_expect (!!(expr), 1))
- #define unlikely(expr) (__builtin_expect (!!(expr), 0))
- #define noinline __attribute__((noinline))
--#define force_inline inline __attribute__((always_inline))
-+#define force_inline inline
- #define fastcall __attribute__((regparm(3)))
- #define must_check __attribute__((warn_unused_result))
- #define constant __attribute__((const))
--- 
-2.16.2
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index bf9009bda03..553840ddb8f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -9,14 +9,11 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRCREV = "33ee0c3b21ea279e08d0863fcb2e874f0974b00e"
+SRCREV = "f66d39544bb8339130c96d282a80f87ca1606caf"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
-           "
-
-SRC_URI_append_qemux86 = "file://01_Fix-build-on-i686.patch"
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.20.1


