Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1483.1793986359018134951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rWV+3T+K;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso584311137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986358; x=1794591158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnqJ0mQFpzTUbPrfx4zr7w9MuHZfFBbWszmSPP2CqOk=;
        b=rWV+3T+KEaOLeLvalkTHGb0TvSM4QvypymxJAJckv/shTnSQNlKtB5i9iL65dfuuI5
         7UE/K86pK50wm2pVcL+oTwd7Rxa4JHybIfzN+6Lf0zC89SADEW8kIPQtRWBnrlYtsxUT
         3lP/FvDmDMhxo2aDqnBbYlExAXvRjW3rgqhigBui1emNebVmjaEuvGq0KXmKgR5J/y+r
         +J75fEXeQ/6/UiPYusXbYkH5FB09ba5Rt2gbpFNNNWZyRJkh+UCiHM7PFPkb/kR4sEBS
         68sNi3Rdvi3a/uo/HUEL2MDpw4/SczSN4kkHK8A0jinqe/BCC+YFKalFLHTFbAtPwQyO
         9dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986358; x=1794591158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnqJ0mQFpzTUbPrfx4zr7w9MuHZfFBbWszmSPP2CqOk=;
        b=KG5OQjzW+62GBfzPOWKyFN0utz9bu48ooN0T0f8lJE46k3p5hsOSwAKnoV8Qgg34Wf
         bEwc8fxAVOiNJc7TyomGdMgTUBy9+7icWtpO5BZlqVB99hI9uITrbTuhhgHQDhw5mA3O
         ZlEP05oXW2dBEYJErw2c9Npba3DhBZXq0ASr3gg2iyARhMro4nFrHnVqum8woG3RDimd
         Mu6OYK4IuxybW7EYP2bxYKYjx+t9AdnmOtXjjuaMUs9CHSh0X5qPOvHrYna1n1pApXeu
         rw1wPBoNN9YkrnCQp4YAtLGz7Q/G9X0zA2KJ7mIPy/v/bPdfI2zmQFV6IOAZ6PfvfD3s
         c1BA==
X-Gm-Message-State: APuU4Z/sUyVop78r1lXfp8ashG9eQXbt1FXA/zhsXwOOoUWhhgJgQJo9
	tkn1XEPTrTGdcYqt5strdTgQ9vbyjgVtU8INF08n0vWxuxgrqCeRGJlTH8l5mYNK
X-Gm-Gg: AYBFou1jrNnCiDAYneJQKsV/YObidJTH5bZ8aI7q/NwCuvVsUeadFs+GtVOUgG1LFlV
	Kt+nse/eW9vObr0HfU1OMBYfBkVdciigHkVC9/g+82xrgEMhdgI0SS57vEPMa4VW94XYgP6KTpB
	0EWqhuk0iLjuYBWeQOtOAai2g0Fadnw/XnwiZIg8zxlhryRrL1IIEgM8ymMXOS3xRJ3RWRTptOj
	0jq3gGNcGqk3iFSTvpDPKGJiNW6izLxiQaF3+LIKWDRbIKhQf6bgw33jLCm8i4KruwbfRv9ifXS
	P9o3FG8YO8jwL66uiCnrKgIiQGfSjagbC7jjD2QluugB4vtNHbBAUdL/5ovW3eSvyzuOcCoxLMt
	fPoQU7ennXvxqGtvyzsGmRmHWGjBOPXtMpYOZB9SS8eEM75bGu9N+TQzyoad5AvsjMdQ4gQ98wh
	vIO1Jd/sjCkT7pXbc03rsezTYRiGd7zgBx496q2RRPGhgoV0gUlVEXWzyI8kdsAZ4VdX8h+jllT
	flLV5z8VZFZtzfZDgiwZ0akCqzuHq6L+zLrtLBhmr21aUCV6Iuhe7bI6YJy1ZpWBolGocxVXbAt
	dIn2m95PBqP91FnHETZJALKBDLTSZdk9ckOh6yCz7oWerJ4nxDt7W12y/pmcAjYhdREOoOIOH9h
	4JvhTAEbAvoNa1zcSYZUPBVSCcGslhGYvdVgywpfHGS9bGKAvdVtHW7l9xmW2WBLkcYepflOpdV
	4rIbTtOQ9zUkaW+c6sRcIzp3LEKMJLnQP64m/JS5z8PAHVEYjMPQYP/r7EKHBNgblppoc=
X-Received: by 2002:a05:6102:94d:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7d2a16e219cmr1941276137.35.1793986357617;
        Fri, 06 Nov 2026 09:32:37 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 01/08] kernel.bbclass: map the kernel build directory to KERNEL_SRC_PATH
Date: Fri,  6 Nov 2026 12:32:28 -0500
Message-ID: <20261106173235.4155305-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249701
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel-arch's KERNEL_CC maps STAGING_KERNEL_DIR and
STAGING_KERNEL_BUILDDIR to KERNEL_SRC_PATH, but the kernel itself builds
in ${B}, which isn't mapped. Sources generated there (*.mod.c, asn1
parsers, data tables, etc) fall through to the generic debug prefix map,
so the kernel's debug info is split across two roots, and those files
are the only content of the kernel's ${PN}-src package.

Map ${B} to KERNEL_SRC_PATH too. All of the kernel's debug source paths
are then under /usr/src/kernel, and no ${PN}-src package is created
for the kernel.

The generated sources aren't packaged anywhere. They aren't needed to
debug the kernel, and those that are of any use can be regenerated from
the kernel source, where they land at the path the debug info expects.

This is only done in kernel.bbclass, since other kernel-arch users
(module-base, perf, make-mod-scripts) have their own mapping.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 46da867a63..ab064bb085 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -246,6 +246,12 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 # Some Linux kernel configurations need additional parameters on the command line
 KERNEL_EXTRA_ARGS ?= ""
 
+# The kernel builds out of tree in ${B}, which kernel-arch does not remap.
+# Map it to KERNEL_SRC_PATH as well, so generated sources are recorded under
+# the same root as the rest of the kernel and are not collected into a
+# ${PN}-src package. The last matching prefix map wins.
+KERNEL_CC:append = " -ffile-prefix-map=${B}=${KERNEL_SRC_PATH}"
+
 EXTRA_OEMAKE += ' ARCH="${@oe.kernel.map_kernel_arch(d)}"'
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
-- 
2.43.0

