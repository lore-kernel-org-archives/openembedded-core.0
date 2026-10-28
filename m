Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36519.1793164803745458103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xUJPCPNs;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so844631c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793164803; x=1793769603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GD4p7w24nU0zCQVmGhkE1H5k0KbnGgFXlG7/i9aFB5U=;
        b=xUJPCPNstWwY/swfxKqjEHUeV6XGGPRIGBDL8sseBbappiYlnPuNnoNoWdl5cURIi4
         9UoYzAsRcYmO02GOrGuEgoDJ+uaWKKoSMROvmHWHnjLOxj0REj5k7ARwyDPU3tInkLNi
         3/kqqs0pKmrvHdr0BNWxFVJd7Yw6AqQ5rZYyp8ZuHAivynkugKUvexkwVqRFzDvXIpVc
         C2ZYvpcJc4zPMUrswu6HV7sg470eOln/Q83y2ihzzrG3ftgYo3zMJHgXDLcJMJSvgQ48
         hIHB7ibB6lipcutMF/uhOmjY7BePPQm61VJjAG5Mi94WazmvS4dD4nDf/YOra9sdYh7q
         70mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164803; x=1793769603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GD4p7w24nU0zCQVmGhkE1H5k0KbnGgFXlG7/i9aFB5U=;
        b=Qnvctat/DSUxWGBVkXyG9oQfhojUz/277lvBTVa8uW4fyovoPH0tREOTCLLfgAFnEF
         TGudUrh+vlAVITinVSwExBswtVHZYOhPUBrEjo10Rj76eFJmaS55RkOCWdsPpEpEkcYv
         uD+Snn2Lcc+PIbF0BLgVhCF5oopL3v+9oxw3EYS/PNoe+gVgsFN6FBkgEu4eF3Innh6w
         M+5w3tGBb7By3eTvq0pF4Rvmfe/wK2zMnFOMW3VrkQMUe9+Yfm/T+ILDIaygdZyJ0vU5
         HQL8XB4huRlazEAMRDant6CMd21Un+DnTLNZz+95zNzAj57+0YrjH98D2JkKWNhKiZS1
         tlmw==
X-Gm-Message-State: AFq9FYI+SKLdyB1BVU56fzSPlYbAVfHzmSUvfRnmKMRn9GBrCk0g5ZsD
	2mtY6hCmAuV+XNNa6zhKX5CyucznC2Ts6YrQMCkt2Rr7qxB2ybcKSyyxzohUmBA4H7w=
X-Gm-Gg: AYBFou2OdhZswpwjoYo6hEtahC9kAf7CIs5/lQH52F5e6X0QlN2qdtfaweUKisxj1xE
	RwRlKM9fbBLTQrLt6fAQ+OBQs2KIJI9AQQ8Aha6cBcE7EBq263rtjdcF1ufxJG4RoNu2XpvwvM3
	f7UHrJA6bVQFAhg1FES/JalzMWK2b5xiobSTyOickDBe/v/vDGlxqKG6HqefUFmTzrA/JgsIA3M
	5rnQOjkksAvATv2ohlkSLqgDmTtJlZI8SJ9pU+/MICThvp1n6Of0Am0wW673zKJUZzrZochPyQJ
	DMqNWcUlatVnozIOcTRt5D/gFAtc5fKMaRwkPLJvLfHOPYwCB96VHU9zXgnd4IAIkMrNUk21OrR
	mW6PHfbkoWnO/k0hvjVmhb5INwXjnayCYdyVkVTlwVwtRzqwkVp+cfRJC3rT3bJleVIgAALuHZj
	3b8B/ZUffvX1GJD/sf3iuCBfjgzhCE9GnHlsgLG0S09VZ62bhsF1PJKpnduuTk7s0zt0cpckSdt
	A5LGkwy+umLxDid013hZu5LWryI952rg6IUXq8huxwx0Y5ve6dJz3cw776bi3jzE18gBIcIK0V9
	lY827EIFkNkOxaRy2SQ4G/s0tpTss/mYFgk+cTM5h1AnNCzWQt3Aoed6dL+f/6m5IBJ8/BO7uS7
	H6jdxoeV9NGXx7y1QztO2PGQ2OC1aH3IHW+u1cBqQE05hLzNTH0FkvbszQYDNttvx8t/rDpb+KE
	FhSSwJn5YwwSyyV3ElKPKfQXj4HZ9bsNzbaZWjdcyCWSIJXSy+Cp+zQIW0oqQUIyoo1J96ghom1
	dkaxQkYyJixx0xVJw2U2vU3hSIH8oIiXxq5ub6Ughb8cYDq6OCiSp2mrXvxo05rxZPITSdRaRMV
	cH7BnuJT58Scw8sa9JF1FAz8pw==
X-Received: by 2002:a05:701b:4649:b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1a6d02bbb2dmr1690916c88.38.1793164802809;
        Tue, 27 Oct 2026 22:20:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a64fe0fsm2597074c88.1.2026.10.27.22.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:20:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] musl: Keep clang from raising spurious FP exceptions
Date: Tue, 27 Oct 2026 22:19:59 -0700
Message-ID: <20261028051959.2975770-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 05:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248773
Content-Type: text/plain; charset="utf-8"

With clang built musl's math code assumes
floating point exceptions are never inspected and speculates FP
operations across branches. expm1() then evaluates both scaling
multiplies and selects one, raising a spurious OVERFLOW, and libc-test
math/expm1, expm1f, hypot, hypotf and sinh fail on qemuarm64.

Pass -ffp-exception-behavior=maytrap from musl's configure when the
compiler accepts it. GCC does not accept it, so GCC builds are
unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...p-exception-behavior-maytrap-when-su.patch | 46 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch

diff --git a/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch
new file mode 100644
index 0000000000..dfff81299b
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch
@@ -0,0 +1,46 @@
+From fe310a5e2fe6be3c28f800bde383d7df5aac4b49 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 25 Oct 2026 21:54:26 -0700
+Subject: [PATCH] configure: use -ffp-exception-behavior=maytrap when supported
+
+The math library relies on floating point exception flags being raised
+exactly as the C code would raise them. GCC keeps that by default
+(-ftrapping-math), but clang assumes floating point exceptions are never
+inspected unless told otherwise, and may then evaluate both arms of a
+branch and select the result. Built with clang 23 for aarch64, expm1()
+computes both y*2.0*0x1p1023 and y*twopk for the k < 0 || k > 56 case
+and picks one with fcsel, so the unused multiply raises a spurious
+OVERFLOW. libc-test's math/expm1, expm1f, hypot, hypotf and sinh fail
+because of that.
+
+-ffp-exception-behavior=maytrap tells clang to avoid transformations
+that raise exceptions the original code would not raise. GCC does not
+accept the option, so tryflag leaves GCC builds unchanged.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/10/28/1]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/configure b/configure
+index bc9fbe48..7e1e1b72 100755
+--- a/configure
++++ b/configure
+@@ -355,6 +355,16 @@ tryflag CFLAGS_C99FSE -fexcess-precision=standard \
+ || { test "$ARCH" = i386 && tryflag CFLAGS_C99FSE -ffloat-store ; }
+ tryflag CFLAGS_C99FSE -frounding-math
+ 
++#
++# The math library relies on floating point exception flags being
++# raised exactly as the C code would raise them. GCC does not move
++# floating point operations that may trap across branches by default
++# (-ftrapping-math), but clang assumes exceptions are never inspected
++# unless told otherwise, and may then evaluate both sides of a branch,
++# raising spurious exceptions (e.g. OVERFLOW from expm1, hypot, sinh).
++#
++tryflag CFLAGS_C99FSE -ffp-exception-behavior=maytrap
++
+ #
+ # Semantically we want to insist that our sources follow the
+ # C rules for type-based aliasing, but most if not all real-world
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index c81178c15a..b53b4be84c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
+           file://0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
