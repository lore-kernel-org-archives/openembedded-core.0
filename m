Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4235.1794170762879812565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 12:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bxkIB4zX;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso363462eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 12:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170762; x=1794775562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqMn6ueoZnPfQQH9zu/PCRiBhNJ3SNcqJO+zQJob8rw=;
        b=bxkIB4zXiS73zA10ePDGGE3HmFqcLZmt5w5AYtxF1IQ1sU9szWNIEPEE+wMP+klItg
         BBTMtSj+dyWSgjZCuYlzeUMaOxBhMiM9i5niClsg0tb8TSrfD65IhClMKITwOxfA86id
         erY4juQ3hU4TNoT5tj0fcbzGzXWfK6yMr1WgHn/he0i4gg6/74gMNF1m/eJHSx+Q1c6t
         y2k9bAtVkGy5C+ZnOPk1h88+T8DaVOdLK8L5+7nsFSG9YssTc33j+BFlQTxcXM7MkIUD
         s3pEzEwHzLbPrgK0MVQKPlMo2eeC9OOxBq8fNcyYUHNT6OT6FlfPsLvT6QRLi+N3zr7g
         DM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170762; x=1794775562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqMn6ueoZnPfQQH9zu/PCRiBhNJ3SNcqJO+zQJob8rw=;
        b=EnG6fIInIBLwSjs0i1VTPwMv7P3xWP7bMTMfdqhm0ivwRO9j35IUAFtyuFUZMUiBn1
         zWcxJ9GDjcr/+Acp4XgLCCIAxMR5vdmSpY7Db1Ufj6lJEMM1ez0hpNDItGe5ktgqPIAA
         zD+sLxtUdB70SdPivOYgIssXlTwBS0hQa14+3KP2oCpyTsylLhdvMfAJ/5HAwfClYN/E
         wU6eWZDmvzpBVrD7OYyQm+1onTl8I7lVGmWuvmgCU3353pcurydTcIpXehwCIfE1vmZ7
         J/xZhA4iJe1tTZ4orOwHYY+VFraNnst5YQnUPZdehCwTAX+qzW+7d6gKAxAEaN2AH93I
         NiUA==
X-Gm-Message-State: APuU4Z+gMflZxJ4sDaLncjAn0Zq2+Ual3pDmNCuVBgHFBe/3wnsRR9zV
	icX4BDBwODT2AIL4FGCa/LdT+c1yUlPimRWpu4hmJGz/J5IIf3jd2zaVakHKK/Dqf5o=
X-Gm-Gg: AYBFou0RsawMM+hbf1bcOERUdYJL5nsmFUURs9clRhfjokh6B/Okmo6rbnywtAerkuK
	Wi/4Pnv9fC5CnzWTpsd3AZsX6gyp8vZe9bmUlkdczuHYiL9Mp9qe5YiQI/pgIHBiMUXV19kC5kV
	ktHj1FdwVDikw/zi0XXtk3M4Xat44SyP2pfnOg4QdXeRD5tHxIckfg0jHcKfr2VUEk8VuPiVhf2
	tLp1rVi9CdswO2m5Y/okaHCgVc0zhIeb4xD70QDpQgZlZSEdLPfrmFIb974qH2EsQ/JR2haC0ey
	tZwzT4iTqe5SOGU6faq0PbnecFVYUR6idW6mRQoBFYyg3jLNNBeVVwsDCNR4wflmYLhBGnMou9U
	R7KLPQnzA8lQUSHWzL3U5mTs49mU9yU/rtlHTOP3y8Tz23sW1W+scSZkEcm98wVrKS0iujMj/NV
	4twBaKRKXkq94TznzVvxqruLFnVIOObBn0Q9Z6FRknfVxSNwCwjaBn15avQSyhgtbAt3vOWmHBq
	26GjS6CYBL8sEC0C53VlHaG4maoCPnPQjXg8LdRVgAYpT/ba9VqKxT9oRuu7J49vb+XBOHfihPt
	BQvF3OcUuq46kQ9WP5uOnLErXt+QuTiYGhknolQN1rFwdpbJFayV0uUg/gPD3HYL9OF4s1LSGTA
	mqmCYFgdTWkLpoJbKk5vBDZYJnTkQej8PiNR9PoHMSj5NuwdT2FMa0+Gqibf3F0ggfpc6a53ga1
	n+9vDevkLJlOKh3qLUHxtACrVfCLmRf5g0zrK3o139A70SPT8/tQ8Eg5a5eTeGGLJjS9+y/j3Ml
	AxvU1UjXbRakmgaehfbb5BEFh4mCf00dXBqfqVIg8ZJ7CfyaWds7Ob8YiAWCrMEhR3XqFHlvYSi
	QEwoCrtpv+8k3EkjeZPLjPy6TPE=
X-Received: by 2002:a05:693c:4002:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37256615acamr3823736eec.38.1794170762090;
        Sun, 08 Nov 2026 12:46:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm6821005eec.23.2026.11.08.12.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:46:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Sunil Dora <sunilkumar.dora@windriver.com>
Subject: [PATCH v2] packagegroups: Add clang to the SDK
Date: Sun,  8 Nov 2026 12:45:58 -0800
Message-ID: <20261108204558.3577002-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 20:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249769
Content-Type: text/plain; charset="utf-8"

Add clang to packagegroup-clang-cross-canadian gate it on SDK_FEATURES

Add packagegroup-clang-cross-canadian-${MACHINE}, mirroring the go and
rust ones, and add it to TOOLCHAIN_HOST_TASK only when SDK_FEATURES
contains 'clang'.

This keeps clang out of SDKs that don't ask for it.

Add llvm runtime knob to the SDK

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: Add it via SDK_FEATURES

 meta/classes-recipe/populate_sdk_base.bbclass       |  2 ++
 .../packagegroup-clang-cross-canadian.bb            | 11 +++++++++++
 .../packagegroups/packagegroup-clang-sdk-target.bb  | 13 +++++++++++++
 .../packagegroups/packagegroup-core-sdk.bb          |  3 ++-
 .../packagegroup-core-standalone-sdk-target.bb      |  5 +++++
 5 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 0d67ab6ac6..35d2f20339 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -71,12 +71,14 @@ SDK_FEATURES:remove:powerpc = "go"
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
     packagegroup-cross-canadian-${MACHINE} \
+    ${@bb.utils.contains('SDK_FEATURES', 'clang', 'packagegroup-clang-cross-canadian-${MACHINE}', '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
 "
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= " \
     ${@oe.utils.multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
+    ${@bb.utils.contains('SDK_FEATURES', 'clang', oe.utils.multilib_pkg_extend(d, 'packagegroup-clang-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'go', oe.utils.multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'rust', oe.utils.multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
     ${@bb.utils.contains('SDK_FEATURES', 'kernel-src', 'kernel-devsrc', '', d)} \
diff --git a/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb
new file mode 100644
index 0000000000..a1d7445b71
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Host SDK package for clang cross canadian toolchain"
+
+include recipes-core/packagegroups/packagegroup-cross-canadian.bb
+
+PN = "packagegroup-clang-cross-canadian-${MACHINE}"
+
+CLANG = "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+RDEPENDS:${PN} += "\
+    ${@oe.utils.all_multilib_tune_values(d, 'CLANG')} \
+"
diff --git a/meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb
new file mode 100644
index 0000000000..fb6eff8707
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-clang-sdk-target.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Target packages for the clang SDK"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+    clang \
+    clang-format \
+    clang-tidy \
+    compiler-rt-dev \
+    compiler-rt-staticdev \
+    libcxx-dev \
+    libcxx-staticdev \
+"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index b3010d7674..56a2588e35 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -10,7 +10,7 @@ inherit packagegroup

 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'

-TARGET_TOOLCHAIN_LANGS ??= "${@bb.utils.filter('SDK_FEATURES', 'go rust', d)}"
+TARGET_TOOLCHAIN_LANGS ??= "${@bb.utils.filter('SDK_FEATURES', 'clang go rust', d)}"
 TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
 TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
@@ -30,6 +30,7 @@ RDEPENDS:packagegroup-core-sdk = "\
     ldd \
     file \
     tcl \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'clang', 'packagegroup-clang-sdk-target', '', d)} \
     ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
     ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
 "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 06fdda90c7..dbe9cc0449 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -12,6 +12,11 @@ RDEPENDS:${PN} = "\
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
+    ${@bb.utils.contains_any('TC_CXX_RUNTIME', 'llvm android', 'libcxx-dev \
+    libcxx-staticdev \
+    compiler-rt-dev \
+    compiler-rt-staticdev \
+    ', '', d)} \
     "

 RRECOMMENDS:${PN}:mingw32 = "\
