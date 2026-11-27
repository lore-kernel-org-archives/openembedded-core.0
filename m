Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1548.1795801795678443104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=HtNUIvmF;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so68183575e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801794; x=1796406594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kaYjf8GRatX2PPzjAgzJjxpRLLK7OVCyGgqwZfRhwIo=;
        b=HtNUIvmFMwLrHJSE9rSu4AQFq+nlS2aVU0NhRdVV9d1qxFrh/0ovTqkzePjL9m8/IA
         N0KR8husBagj89/BXyOH1oeCmFrN8cISrCjW7+1WaJUMiaHvDaYTcjlfnie9LBOe3eMj
         wJ8nsvajAVf7Www82b/RrPwzddukg9p/WdFrcQdHxTvPQDKFeUJw5tAuzQOhyEBlKWAZ
         tLAj5x3xJ4Q7oI90pTA5SUaPpLLujC4uTX/4bsZG/wstyJJyz4AdMAF31keHjl6TCF/5
         LwOPeSJX9jQ8SeZz+/s+qazGaOVs68dP2HVuoW/NXJC2VduI8wC4pMh+nkLoHVpDclLs
         I0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801794; x=1796406594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kaYjf8GRatX2PPzjAgzJjxpRLLK7OVCyGgqwZfRhwIo=;
        b=GtJW4maQjP00PDD60z3rSA0fXOlYTjO52SbGmf+XhafOkpHReWtf4cCEmwWuBUs2Wx
         LuVDzFTYBrAludGFkpHPJaxUlI/ih+LiDY2TMcyx9s8mvdAJZZ9xK3MhDzeICHE+mynZ
         FiqC+g/zvH3xoHd1GXT7MCO3tVkxCXmhS+Z2WpJT8hylhyhgyaN74KeVAkF+zQVX1+7F
         s9FeitR5KFARzN4ui90WV500x6cltK/wSN093QdsDfTnwkAKiHNzFd2aMwUPZlho+e22
         2hC6dVtyB0vsu9wR2XJfzmnwjiksA4nsJP7fm347mRlpfcJzyJsZofnoqYqsAP5qAvzR
         QP9w==
X-Gm-Message-State: APuU4Z+Vov2BAJfkdh27YMJF0omUD9S1fCeqU8i0G7ywmf85O5cQTsM6
	r9Me0eZdAahbtCqkdmSTWGtNoeac56kD/HVKy4oAQyZrgWcyeLaxEJ+mn3HMnCstEbuxdAJJe8H
	D02yyl0Q=
X-Gm-Gg: AZFdTZdGKxtsMzu8I2DBkpc862tGJEqZQZTDYDRP7UWjsrSjIaGjNL1u0sVofJW6FyL
	c3kG190w4+h54rfh4rgqALmnqrw+tXhcsLYvKEA5JrDg/SYpqXG5g4bk0djkMSjfpZVaMt8OCby
	oyY4mzSdwW/0uCOGCoJMlvyBFCPqz5RANFoFFwfJxVCVeJdZf1dKkxNcjUdG3qBWLI35nmVxKY0
	4jc2D6hF77cW5PkvAorOsQ95piEgmOjp+Y14xA1nmLG38KJ4lLvJGYLkjE+RjRLJyMJRLeyP2Wp
	hKpEVIvnYDJ9kCSlkmwruQf+IzK86ITN/zPtAzDK9Ia55kUErCb1Y49aVf93P370xrqy5CIkT4J
	WizHgREgr02Z7MU5pQHl2Y/a59hkF3XC99u31rCkRIfiNCd6a4AZh2Q30wgisvI2Gf8BifsoXXg
	08I3/nEdD3O+5IpgUjgYZer5woo9FSWLiLpD/J2DkVIfDpxmoQBC5LA0znLjIEoAVpp3W4lWosL
	73kzqu0Oc3+hgygMfZkF3EKxTertLgoNo8yXEfFTz9Dsw/Yd+Wmr1LnnM9ktHWO8b35VJX8cLAe
	rLF5pqWxftoo19CBRvt5c8WzLH4YVSM2LaROIvxVKuVanMYw/zVamKQ1AD+9evxhTmFJn+icu0o
	NJ/x1b9SWWdyEMPqOT+7SfjTtrBjJ
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr485535035e9.24.1795801793924;
        Fri, 27 Nov 2026 09:49:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/37] rust-llvm: build and install the LLVM shared library
Date: Fri, 27 Nov 2026 18:49:18 +0100
Message-ID: <1d4332e084848a236fa6051df1fe6b28a7c395ef.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251441
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

For the rustc segfault in [YOCTO #16058] rust has to link LLVM
dynamically. On master libLLVM.so comes from the llvm recipe, rust-llvm
was dropped there [1]. scarthgap still builds LLVM for rust from this
recipe and it builds only static libs. So add the shared lib here.

Need both LLVM_BUILD_LLVM_DYLIB and LLVM_LINK_LLVM_DYLIB. With only the
first one "llvm-config --link-shared --libs" gives the per component
libs (which don't exist) instead of -lLLVM-17. llvm-config and
llvm-tblgen stay static, so the native llvm-config rust uses keeps
working. master had the same two options for rust-llvm [2] when it
still had the recipe.

LLVM installs the lib as ${libdir}/llvm-rust/lib/libLLVM-17.so. Nothing
looks there at runtime, it is not a default loader path and the RUNPATH
of the rust binaries does not point there. So move it to ${libdir} and
keep a symlink behind, the -L path from llvm-config still works at link
time.

Package it as ${PN}-libllvm. Otherwise the .so goes to ${PN}-dev by the
default rules and rust would rdepend on a -dev package. Static libs are
still installed, rust without llvm-shared is not affected.

[1] https://git.openembedded.org/openembedded-core/commit/?id=c116828a876853cd5b53f7bd4607f0037fef4ee4
[2] https://git.openembedded.org/openembedded-core/commit/?id=2b6a6d4199e4eed65f20351d077a04a7cf9da460

[YOCTO #16058]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index cba41c739e9..76335dc0559 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -47,6 +47,8 @@ EXTRA_OECMAKE = " \
     -DLLVM_ENABLE_LIBXML2=OFF \
     -DLLVM_ENABLE_FFI=OFF \
     -DLLVM_INSTALL_UTILS=ON \
+    -DLLVM_BUILD_LLVM_DYLIB=ON \
+    -DLLVM_LINK_LLVM_DYLIB=ON \
     -DLLVM_BUILD_EXAMPLES=OFF \
     -DLLVM_INCLUDE_EXAMPLES=OFF \
     -DLLVM_BUILD_TESTS=OFF \
@@ -84,15 +86,26 @@ export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
 do_install:append () {
     # we don't need any of this stuff to build Rust
     rm -rf "${D}/usr/lib/cmake"
+
+    # rustc links to libLLVM (llvm-shared in rust). Nothing searches
+    # llvm-rust/lib at runtime, so move the library to ${libdir} and keep
+    # a symlink for the -L path given by llvm-config.
+    for lib in ${D}${libdir}/llvm-rust/lib*/libLLVM-*.so; do
+        [ -f "$lib" ] && [ ! -L "$lib" ] || continue
+        mv "$lib" ${D}${libdir}/
+        ln -s ../../$(basename "$lib") "$lib"
+    done
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto ${PN}-libllvm"
 
 # Add the extra locations to avoid the complaints about unpackaged files
 FILES:${PN}-bugpointpasses = "${libdir}/llvm-rust/lib/BugpointPasses.so"
 FILES:${PN}-llvmhello = "${libdir}/llvm-rust/lib/LLVMHello.so"
 FILES:${PN}-liblto = "${libdir}/llvm-rust/lib/libLTO.so.*"
+FILES:${PN}-libllvm = "${libdir}/libLLVM-*.so"
 FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
+RDEPENDS:${PN}-dev += "${PN}-libllvm"
 FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
 FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
 
