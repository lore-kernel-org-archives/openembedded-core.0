Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1551.1795801796951232095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=AoreOG62;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so81842875e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801795; x=1796406595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0jEMJWIFzk//wt4/s7u1H0mJ+xn8zBL2gb6AosflASg=;
        b=AoreOG629F6atg8dZZINawuZuGzusaPlEyeZpdjW7PCUi1RIos8rJ+6L6I9Ua5yC0I
         wsTqt18XwZ3LrIENMs4uddHBJlHoVo4jWZFFP3NiiDGQTSEiL79kLE1R98BwbnXUuaDt
         0tnz8M+lz0hLjD4k1z1XgeB0LpSm6+eWc74BtqpAzMa78bAeFbkm7hu0Mii6BqcYoHoO
         LsGvRisIwHb943X7ANP/+XbKG1LGJmsOPMwyq31H95veGWJXl8/ktHKqh7Ff8fPdYMMd
         1mZWRgqB/Un1aS8HL+7sSA702DTlAUcbq5vXxzpfLbS6hm3mntNAD88MQZZAzO3vKl4z
         hrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801795; x=1796406595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0jEMJWIFzk//wt4/s7u1H0mJ+xn8zBL2gb6AosflASg=;
        b=WrhaV8ZHeHugX49whPr8mxMGsYVmGnFMO7ExlJD1Iu89NRjiQXzrJdjP18R4lSfSNW
         +JBwa+zc+SxYlZLoT+HwL85pxcW4RS7M09ftcUBqU60PO56bD7ySSnNHWTOzD21Ih4SZ
         lpnssHxP30KLf8T/h36i9I64SmNG25hzKApuQ63HNDVDm3/jLelMMwAT/vUm4/X2kocg
         Ykwcc1nU+g5d3s15Bvdbs4uRg2Dsq+0XMX/o17d5ZgI0jcMvWRMHNlPXYGXkM+feW2Ik
         M8q4lbdJuySbK+Xc+o1p42ClMRUDkAV17DjxAF/ejYYWxjL0K15OQHCMjg+GpEld7GkV
         IyfA==
X-Gm-Message-State: APuU4Z/hB9sl9bO5Hs3OXlm82yODSWPTALMZ+39Be0IYC8dqZX+NugHa
	GQSWYh1KdbgzFfxAMvzWgT7xd+OHBKqmr3HzEpiynR+7A3hgt52xY73g85j52MEJfzyCRvY/pBH
	lnP/lTY4=
X-Gm-Gg: AZFdTZfdx3F0SC4RWzOniDPUUO57EXFnb8LVV5JdZswN2PDPr9lazjozp8m7NYRk29J
	/sdhzXHwunrkxuLkm7vPoWNUMqmIdnq20nt+xIWWhN2IQC/s2xK7EjQHM7+0VSxP/4YVfLtAONn
	50lGePEHzVn9/bPAmm5SJWlUGPboEL7+vqWCNm5hgKpAEjQsl6Xqz6njNN219uEdjek2YwjeaYe
	xr+0NzltDS9HhlO8A62UlXrqoMKF4kw8sF35pe+ivQD+kh0Bk0Q111rIO6DjVK7gHRVAn83XuF6
	RD0jAutjZ7TPWrg1JxPEdWe2p0n39QGpss/d6MCj5zKsfni73p2dYBkrmv86rW5bx3FTBcRQ+Rb
	SeiWP0uWZ0YcEy2tqW3uulNuEGigFiZrpHBFqZmdypsVAO5qKHb8qPvhq3X95njDimLLCbkl37Q
	8YWwbRnRPQz8606Yy+PrWa76XzKmCpoqKlaDuCX0kAaScxq+0DW4vDsCR9dfeMr1bxRjZvfP5jp
	v7DQ5ujJxSKGC13F6eP+SxLjvV8ByjtIVoC/ZWuHEO6Fzc6hBlaMo6Dpcjd49G9qH6BV5jacuge
	d10tlTo3OrR451lN6+6Ho7jlySY4DzB/7nEWKhdinOgG00qv26wlgoFRtAbdO5JVgYkb4kBXO6R
	WAfHrnZwBYve+cZqLkJU+E9hzZyBF
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr533349275e9.3.1795801795027;
        Fri, 27 Nov 2026 09:49:55 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/37] rust: enable dynamic LLVM linking by default
Date: Fri, 27 Nov 2026 18:49:20 +0100
Message-ID: <3948efd5497c7ad5dcb71aedc47cae6dfb72d65b.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251443
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

Backport of master "rust: enable dynamic LLVM linking by default" [1].
On master rust links against the llvm recipe, here against rust-llvm
which provides libLLVM-17.so now.

rustc segfaults (e.g. in llvm::X86ReadAdvanceTable) when
rust-llvm-native comes from sstate built on a host with binutils >= 2.45
and rust-native is linked on a host with an older ld.
This is binutils PR ld/32991 [2]: newer gas emits R_X86_64_GOTPCRELX for
"push foo@GOTPCREL(%rip)" and an ld without the fix rewrites the push
into a call, so the statically linked LLVM code in librustc_driver jumps
into data at runtime. scarthgap links the static rust-llvm libs the same
way master did before the fix.

With dynamic linking the host ld only sees the exported symbols of
libLLVM and does not relink any LLVM code.

Add llvm-shared PACKAGECONFIG, default on for native, nativesdk and
target like master. Native only is not enough, target rust bootstraps
its own rustc with the target settings and crashes the same way. Remove
llvm-shared to get the static build back.

Selftest image installs rust-llvm-libllvm now, the test binaries need
it (master installs llvm there).

[1] https://git.openembedded.org/openembedded-core/commit/?id=d0671c3dad87a063b3a41dd07cde89b5684e692c
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=32991

[YOCTO #16058]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/rust.py      | 2 +-
 meta/recipes-devtools/rust/rust_1.75.0.bb | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 26f132edc4d..b2ad7c099f2 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -51,7 +51,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "rust-llvm-libllvm"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index b9348bf0507..b2fac124288 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -20,6 +20,9 @@ DEPENDS += "rust-llvm (=${PV})"
 
 RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
 
+PACKAGECONFIG ??= "llvm-shared"
+PACKAGECONFIG[llvm-shared] = ",,,"
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
 # We don't need to depend on gcc-native because yocto assumes it exists
@@ -128,6 +131,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    config.set("llvm", "link-shared", e(bb.utils.contains('PACKAGECONFIG', 'llvm-shared', True, False, d)))
     config.set("llvm", "static-libstdcpp", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))
