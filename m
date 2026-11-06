Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1484.1793986360082248024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z6uURdV1;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso459272137.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986359; x=1794591159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvE6KWUywlNLc5Q3YCQD0nbxnKpwXn8czgROVdoU6U8=;
        b=z6uURdV1gKv4kw9ejTmKOEqGV9LJeb+4/HH4Oa7HCdHOiTyM9/7Eq5o3pxB0lALGZh
         Tz4Rz9S3LvIGLgEB63tp3TO7OLJooyFo4jl0fLzdyfi31KvSD43CqdvcclBttMeZ+Lvf
         nLYGGtvdvmCgl6r/AHlu9OFA3I0Uy46WTS6dqgVLx+Uze99mpvVI4KP1yNRtf8KvgVRC
         5MkDo/xW6qvkff8+HhX+HBJTGG3xhRSAhCSB2JlJi3VykUwEHNn2IKBxJBOSOCT6Fsn4
         oYUsAxOdD4ZloM9cYs6nwL7+o/j0PBoiiRaUeUKXEdSVkYdD3WsbQOBzK/iOmWMobqnP
         yboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986359; x=1794591159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvE6KWUywlNLc5Q3YCQD0nbxnKpwXn8czgROVdoU6U8=;
        b=WxtmO9jQKJ9Q/5oXIBq85xa0k8zUecQOCDAf7PS2xqXswL/fqfu3YkqoksGYI/CXe/
         azndHZ8pBfEuEtusWj7lIyn6uS3D/khNT4zJdVamxF3w/8U5A61laVCnKlLEkh3UUjpC
         yTdu71TR0gdRFQ4bv6bCydkrEi54BWtMLvzpdwGldtss4k2Nd7gJ56BeRs5grJ3g2ZiO
         V/1Cwj40kUlln5nhaeAx8ZicvcbZAD7UlWgQW/GlWW6l7PZXkk5fbROrk+EWF/8XpJFX
         DjLtUJlACEe2lu6BUVXLNQ8wgM3reduDuLnnV/qTxAGr2kx/7l6E0gByAskELbzk6qUT
         lQqA==
X-Gm-Message-State: APuU4Z982xmCiBMKjv0TVO80/G1z9EqQTEVTKJ9oKdJ2UdoOALjlpefG
	1GE6hTUynlJOkIaQAg9NrpiPs/buswnNQxSNRiI+APwwZhWCuXzunHQCmTHOe9P6
X-Gm-Gg: AYBFou0CGr5KDY/hnXA1NFLFhe2RfRMZeQMAcZTBpvJjlkY79WnOAWt1/c3Ub8rH3td
	HyofOp23LNfiNzCa7SKvOtu4GvMIZCj6OcpotxLNyKRyQC3V5JgXMXNVRckcw4GkwWqkb0lNIOu
	I6TkKOkG7IS44XlhGRG2fus1fUGnyc6Q4oP55tky8oByIhrQrRnW9WlUN8nWUIon7oErWyOQHmf
	6BXqQ1oIxv4q6tJYRaBHXOoW9AHP1Q+ZKEk/wIGk+BCk1/zroEOoRLrkvuVWyfkt6ZyaxQ9qyq3
	BSQGVHTcVXZFRRruGbIYPNEcTDhb/61do//+mMKGlWUMw+IO3o7Ejbe0hlH7Czi40StXZ2v5Rsq
	YttyTctHDB7xOPcn7jHlO8PSGgAAMys+dhQUsk4JyplK9O+g6Au/uC1ShDAE6vu0xhj+fSvDTtN
	9t+S650aTPL6rnZ5q6mAjkZHI6bJfGMH5yOWBjkq3V37D6w5dLc/qTdyWRMtHTgRVCKEzH0hGPV
	e/H8+PvRJ4NnYuKiDUMpYwY+3OX9Jwp/XLUwYNieha0TEDZph6OL3LncQX2+4nlblvFLG0LMDL3
	iaBsaeajKWsCL3pPduyAAw5DsBSp+ukfCWU4J0u5E2mhBIXCerrOndCGhIQkUVzccMIOX+OFD1/
	lDQ//P7yDDBsBEJHEbo9r4jbfEAD0dge6ntGozb77Kd8lGx2jfuolNK3XsolHGyPzKCQ6S5oNyY
	scUdnC83RDQ0omScFRWvgjt5Z2unByb52w8xy1AaSJ7TChSQ==
X-Received: by 2002:a05:6102:448a:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d2a164e350mr2026643137.26.1793986358671;
        Fri, 06 Nov 2026 09:32:38 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 02/08] kernel.bbclass: stage a manifest of the source files the build read
Date: Fri,  6 Nov 2026 12:32:29 -0500
Message-ID: <20261106173235.4155305-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249702
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel-devsrc packages from the shared work directories and can't see the
kernel's ${B}, so it has no way to know which parts of the tree the
kernel for a given MACHINE was built from. kbuild already records that:
every .cmd file lists the source and headers the compiler read for its
object.

Collect those paths (relative to ${S}) in do_shared_workdir, after the
build, into kernel-source-files in STAGING_KERNEL_BUILDDIR. kernel-devsrc
can then package the source needed to debug a kernel built for a specific
MACHINE, without copying the whole tree.

The new kernel_source_manifest function does it in three steps, and leaves
each intermediate list in the recipe's temporary directory, so a wrong
manifest can be traced back:

  - the .cmd files whose savedcmd starts with ${HOST_PREFIX} (the target
    compiler, optionally through ccache). Host programs (scripts/mod,
    scripts/kconfig, objtool) are built with the host compiler, and are
    not part of the kernel.
  - every path under ${S} those files name.
  - the paths normalized with realpath, since some sources are included
    with ../ (kernel/bpf includes tools/lib/bpf), and kept only if they
    are regular files in ${S}.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index ab064bb085..f7910fbdee 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -538,6 +538,44 @@ emit_depmod_pkgdata() {
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
 
+# Print, relative to ${S}, the source files the target compiler read, from
+# kbuild's .cmd files. The intermediate lists are left in ${T}.
+kernel_source_manifest() {
+	(
+		cd ${B}
+		# The .cmd files hold millions of lines: a UTF-8 locale is ~40x slower
+		export LC_ALL=C
+
+		cmds=${T}/kernel-source-cmds
+		paths=${T}/kernel-source-paths
+
+		# The .cmd files of objects built with the target compiler, matching:
+		#   savedcmd_kernel/fork.o := x86_64-poky-linux-gcc -fuse-ld=bfd ...
+		#   savedcmd_kernel/fork.o := ccache x86_64-poky-linux-gcc ...
+		target_cc="^savedcmd_[^ ]+ := ([^ ]*ccache )?${HOST_PREFIX}"
+		find . -name '.*.cmd' -exec grep -l -E "$target_cc" {} + > $cmds
+
+		# Every path under ${S} they name, matching (dedup before the regex):
+		#   source_kernel/fork.o := ${S}/kernel/fork.c
+		#     ${S}/include/linux/types.h
+		#   ... -I${S}/include -include ${S}/include/linux/kconfig.h ...
+		# Directories and other non-files are dropped below.
+		xargs -r grep -hF "${S}/" < $cmds | sort -u | \
+			grep -o "${S}/[^ ]*" | sort -u > $paths
+
+		# Normalized relative to ${S}, for example:
+		#   ${S}/arch/x86/boot/compressed/../../../../lib/ctype.c -> lib/ctype.c
+		# and kept only if they are regular files inside ${S}.
+		xargs -r realpath -m --relative-to=${S} < $paths | \
+			grep -v '^\.\./' | sort -u | \
+			while read f; do
+				if [ -f "${S}/$f" ]; then
+					echo "$f"
+				fi
+			done
+	)
+}
+
 do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
 do_shared_workdir () {
 	cd ${B}
@@ -605,6 +643,9 @@ do_shared_workdir () {
 		fi
 	fi
 
+	# The source files this kernel was built from, for kernel-devsrc
+	kernel_source_manifest > $kerneldir/kernel-source-files
+
 	# When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
 	# to copy the build assets generated for the randstruct seed to
 	# STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
-- 
2.43.0

