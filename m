Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 18E237EE19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 23:01:10 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id y8so265037plr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 16:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fIDTFTmFAYnTAGZpANyKp8g7NpoF/vc2SJL8gu6Gjs0=;
	b=rxJ1jAgci3IzWiD/q78Sd3Vvsbo9QP7tAdC6ti3Qw5KnGrU8A3sQhAsl9b47COQg3Z
	P1RYI3q3qAh1JXRf0SEf2QG0ktbvPiYETN6vrRDWWps9mrLm6bRMQUG5FT/4CUG40g60
	jtOGLddc8wWBUhkh5gMSrnO/DheOO0wL7rE1oGpU48AUSl1ghGKfjE900idwM5Yw1L8I
	4yGW4HOZyiViT8aL+LzfLCqWCGzvqfepy4a8VwBJ6JYsAXjWcnbQ9lzg9P6UK/sIYcKF
	rFaGmZM8enMH+VpMuE4HkplfKnmuNCYQOwPh2/aDau/kx8LkhCtn3IH0Cb/Iv3w2rpPD
	tsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fIDTFTmFAYnTAGZpANyKp8g7NpoF/vc2SJL8gu6Gjs0=;
	b=C2dqphXpLyYJ1UoTCsKi+U5xpc612GYkz0I9cPz/vVdy781EF3ttWWeTqlgraK0Erc
	Jak0GWD/z0RbrpFcy5sHqbAzFEIZuhERXHVpQgBPRBSrbREKE/sTssVTBbbt49UjtyVh
	UnMkswcx3EXFfjxAzgsp7drSZFkItJvc175YUQgO+9D2pEvsJq8YIr8D/1/yR1diGuSI
	0cKLqpIcg/8dFa1lLassvr7oUyvcBQfcwbWfUHZjwNEgIPhaq9LC0e/OKoNel7mixS1M
	lAd5coklyBPkNUE44sfO8aR124FEsHCTdGteXeExDV+RTL25lPhEC3Vk3XdExzOkDhgH
	rlpA==
X-Gm-Message-State: APjAAAUtEdvallAcf5w78Z1xYVdIzQjS4T4KtOeoQ2yibgXNUoVhKMc/
	K591hc2ZGIT8MxCXKmfkDKvWcc1DYiI=
X-Google-Smtp-Source: APXvYqz3s8lLIJi/yNCpKfK4WGNx1bQeH4qJJKGIhXjmgB21JnGbKZDB/bMWRlwaFIuWfTRXs1vS5w==
X-Received: by 2002:a17:902:7d8b:: with SMTP id
	a11mr1595693plm.306.1565823671050; 
	Wed, 14 Aug 2019 16:01:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	m125sm146544pfm.139.2019.08.14.16.01.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 16:01:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 16:00:57 -0700
Message-Id: <20190814230057.31103-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V2] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Wed, 14 Aug 2019 23:01:11 -0000
Content-Transfer-Encoding: 8bit

libffi 3.1 release has been a bit aged and new architectures, compilers
have since been come on stage to compile it, we have been carrying
patches, but its better to use the latest 3.3 rc0 which has lot of these
issues handled and is in good shape.

Use 3.2.1+3.3-rc0 for PV to keep room for upgrade path without PE bump

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Set PV = 3.2.1+3.3-rc0

 .../libffi/0001-New-RISC-V-port-281.patch     | 827 ------------------
 .../0001-libffi-Support-musl-x32-build.patch  |  30 -
 ...e-compiler-internal-define-for-linux.patch |  32 -
 ...-mips-fix-MIPS-softfloat-build-issue.patch | 177 ----
 .../libffi/libffi/not-win32.patch             |  10 +-
 ...ibffi_3.2.1.bb => libffi_3.2.1+3.3-rc0.bb} |  13 +-
 6 files changed, 9 insertions(+), 1080 deletions(-)
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-New-RISC-V-port-281.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch
 rename meta/recipes-support/libffi/{libffi_3.2.1.bb => libffi_3.2.1+3.3-rc0.bb} (72%)

diff --git a/meta/recipes-support/libffi/libffi/0001-New-RISC-V-port-281.patch b/meta/recipes-support/libffi/libffi/0001-New-RISC-V-port-281.patch
deleted file mode 100644
index 589c4d3c44..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-New-RISC-V-port-281.patch
+++ /dev/null
@@ -1,827 +0,0 @@
-From 8ac73103bf12ce4f776940cb17f3ced15a362f23 Mon Sep 17 00:00:00 2001
-From: Stef O'Rear <sorear2@gmail.com>
-Date: Sun, 11 Mar 2018 05:55:15 -0700
-Subject: [PATCH] New RISC-V port (#281)
-
-* Add RISC-V support
-
-This patch adds support for the RISC-V architecture (https://riscv.org).
-
-This patch has been tested using QEMU user-mode emulation and GCC 7.2.0
-in the following configurations:
-
-* -march=rv32imac -mabi=ilp32
-* -march=rv32g -mabi=ilp32d
-* -march=rv64imac -mabi=lp64
-* -march=rv64g -mabi=lp64d
-
-The ABI currently can be found at
-https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md .
-
-* Add RISC-V to README
-
-* RISC-V: fix configure.host
-
-Upstream-Status: Backport [https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- Makefile.am           |   4 +
- configure.ac          |   5 +
- src/riscv/ffi.c       | 445 ++++++++++++++++++++++++++++++++++++++++++
- src/riscv/ffitarget.h |  68 +++++++
- src/riscv/sysv.S      | 214 ++++++++++++++++++++
- 5 files changed, 736 insertions(+)
- create mode 100644 src/riscv/ffi.c
- create mode 100644 src/riscv/ffitarget.h
- create mode 100644 src/riscv/sysv.S
-
-diff --git a/Makefile.am b/Makefile.am
-index 0e40451..3837650 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -32,6 +32,7 @@ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj			\
- 	 src/powerpc/asm.h src/powerpc/aix.S src/powerpc/darwin.S	\
- 	 src/powerpc/aix_closure.S src/powerpc/darwin_closure.S		\
- 	 src/powerpc/ffi_darwin.c src/powerpc/ffitarget.h		\
-+	 src/riscv/ffi.c src/riscv/ffitarget.h src/riscv/sysv.S		\
- 	 src/s390/ffi.c src/s390/sysv.S src/s390/ffitarget.h		\
- 	 src/sh/ffi.c src/sh/sysv.S src/sh/ffitarget.h src/sh64/ffi.c	\
- 	 src/sh64/sysv.S src/sh64/ffitarget.h src/sparc/v8.S		\
-@@ -122,6 +123,9 @@ endif
- if MIPS
- nodist_libffi_la_SOURCES += src/mips/ffi.c src/mips/o32.S src/mips/n32.S
- endif
-+if RISCV
-+nodist_libffi_la_SOURCES += src/riscv/ffi.c src/riscv/sysv.S
-+endif
- if BFIN
- nodist_libffi_la_SOURCES += src/bfin/ffi.c src/bfin/sysv.S
- endif
-diff --git a/configure.ac b/configure.ac
-index ce30853..33375aa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -226,6 +226,10 @@ case "$host" in
- 	TARGET=MIPS; TARGETDIR=mips
- 	;;
- 
-+  riscv*-*-*)
-+	TARGET=RISCV; TARGETDIR=riscv
-+	;;
-+
-   nios2*-linux*)
- 	TARGET=NIOS2; TARGETDIR=nios2
- 	;;
-@@ -298,6 +302,7 @@ if test $TARGETDIR = unknown; then
- fi
- 
- AM_CONDITIONAL(MIPS, test x$TARGET = xMIPS)
-+AM_CONDITIONAL(RISCV, test x$TARGET = xRISCV)
- AM_CONDITIONAL(BFIN, test x$TARGET = xBFIN)
- AM_CONDITIONAL(SPARC, test x$TARGET = xSPARC)
- AM_CONDITIONAL(X86, test x$TARGET = xX86)
-diff --git a/src/riscv/ffi.c b/src/riscv/ffi.c
-new file mode 100644
-index 0000000..b744fdd
---- /dev/null
-+++ b/src/riscv/ffi.c
-@@ -0,0 +1,445 @@
-+/* -----------------------------------------------------------------------
-+   ffi.c - Copyright (c) 2015 Michael Knyszek <mknyszek@berkeley.edu>
-+                         2015 Andrew Waterman <waterman@cs.berkeley.edu>
-+                         2018 Stef O'Rear <sorear2@gmail.com>
-+   Based on MIPS N32/64 port
-+
-+   RISC-V Foreign Function Interface
-+
-+   Permission is hereby granted, free of charge, to any person obtaining
-+   a copy of this software and associated documentation files (the
-+   ``Software''), to deal in the Software without restriction, including
-+   without limitation the rights to use, copy, modify, merge, publish,
-+   distribute, sublicense, and/or sell copies of the Software, and to
-+   permit persons to whom the Software is furnished to do so, subject to
-+   the following conditions:
-+
-+   The above copyright notice and this permission notice shall be included
-+   in all copies or substantial portions of the Software.
-+
-+   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
-+   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-+   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-+   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-+   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+   DEALINGS IN THE SOFTWARE.
-+   ----------------------------------------------------------------------- */
-+
-+#include <ffi.h>
-+#include <ffi_common.h>
-+
-+#include <stdlib.h>
-+#include <stdint.h>
-+
-+#if __riscv_float_abi_double
-+#define ABI_FLEN 64
-+#define ABI_FLOAT double
-+#elif __riscv_float_abi_single
-+#define ABI_FLEN 32
-+#define ABI_FLOAT float
-+#endif
-+
-+#define NARGREG 8
-+#define STKALIGN 16
-+#define MAXCOPYARG (2 * sizeof(double))
-+
-+typedef struct call_context
-+{
-+#if ABI_FLEN
-+    ABI_FLOAT fa[8];
-+#endif
-+    size_t a[8];
-+    /* used by the assembly code to in-place construct its own stack frame */
-+    char frame[16];
-+} call_context;
-+
-+typedef struct call_builder
-+{
-+    call_context *aregs;
-+    int used_integer;
-+    int used_float;
-+    size_t *used_stack;
-+} call_builder;
-+
-+/* integer (not pointer) less than ABI XLEN */
-+/* FFI_TYPE_INT does not appear to be used */
-+#if __SIZEOF_POINTER__ == 8
-+#define IS_INT(type) ((type) >= FFI_TYPE_UINT8 && (type) <= FFI_TYPE_SINT64)
-+#else
-+#define IS_INT(type) ((type) >= FFI_TYPE_UINT8 && (type) <= FFI_TYPE_SINT32)
-+#endif
-+
-+#if ABI_FLEN
-+typedef struct {
-+    char as_elements, type1, offset2, type2;
-+} float_struct_info;
-+
-+#if ABI_FLEN >= 64
-+#define IS_FLOAT(type) ((type) >= FFI_TYPE_FLOAT && (type) <= FFI_TYPE_DOUBLE)
-+#else
-+#define IS_FLOAT(type) ((type) == FFI_TYPE_FLOAT)
-+#endif
-+
-+static ffi_type **flatten_struct(ffi_type *in, ffi_type **out, ffi_type **out_end) {
-+    int i;
-+    if (out == out_end) return out;
-+    if (in->type != FFI_TYPE_STRUCT) {
-+        *(out++) = in;
-+    } else {
-+        for (i = 0; in->elements[i]; i++)
-+            out = flatten_struct(in->elements[i], out, out_end);
-+    }
-+    return out;
-+}
-+
-+/* Structs with at most two fields after flattening, one of which is of
-+   floating point type, are passed in multiple registers if sufficient
-+   registers are available. */
-+static float_struct_info struct_passed_as_elements(call_builder *cb, ffi_type *top) {
-+    float_struct_info ret = {0, 0, 0, 0};
-+    ffi_type *fields[3];
-+    int num_floats, num_ints;
-+    int num_fields = flatten_struct(top, fields, fields + 3) - fields;
-+
-+    if (num_fields == 1) {
-+        if (IS_FLOAT(fields[0]->type)) {
-+            ret.as_elements = 1;
-+            ret.type1 = fields[0]->type;
-+        }
-+    } else if (num_fields == 2) {
-+        num_floats = IS_FLOAT(fields[0]->type) + IS_FLOAT(fields[1]->type);
-+        num_ints = IS_INT(fields[0]->type) + IS_INT(fields[1]->type);
-+        if (num_floats == 0 || num_floats + num_ints != 2)
-+            return ret;
-+        if (cb->used_float + num_floats > NARGREG || cb->used_integer + (2 - num_floats) > NARGREG)
-+            return ret;
-+        if (!IS_FLOAT(fields[0]->type) && !IS_FLOAT(fields[1]->type))
-+            return ret;
-+
-+        ret.type1 = fields[0]->type;
-+        ret.type2 = fields[1]->type;
-+        ret.offset2 = ALIGN(fields[0]->size, fields[1]->alignment);
-+        ret.as_elements = 1;
-+    }
-+
-+    return ret;
-+}
-+#endif
-+
-+/* allocates a single register, float register, or XLEN-sized stack slot to a datum */
-+static void marshal_atom(call_builder *cb, int type, void *data) {
-+    size_t value = 0;
-+    switch (type) {
-+        case FFI_TYPE_UINT8: value = *(uint8_t *)data; break;
-+        case FFI_TYPE_SINT8: value = *(int8_t *)data; break;
-+        case FFI_TYPE_UINT16: value = *(uint16_t *)data; break;
-+        case FFI_TYPE_SINT16: value = *(int16_t *)data; break;
-+        /* 32-bit quantities are always sign-extended in the ABI */
-+        case FFI_TYPE_UINT32: value = *(int32_t *)data; break;
-+        case FFI_TYPE_SINT32: value = *(int32_t *)data; break;
-+#if __SIZEOF_POINTER__ == 8
-+        case FFI_TYPE_UINT64: value = *(uint64_t *)data; break;
-+        case FFI_TYPE_SINT64: value = *(int64_t *)data; break;
-+#endif
-+        case FFI_TYPE_POINTER: value = *(size_t *)data; break;
-+
-+        /* float values may be recoded in an implementation-defined way
-+           by hardware conforming to 2.1 or earlier, so use asm to
-+           reinterpret floats as doubles */
-+#if ABI_FLEN >= 32
-+        case FFI_TYPE_FLOAT:
-+            asm("" : "=f"(cb->aregs->fa[cb->used_float++]) : "0"(*(float *)data));
-+            return;
-+#endif
-+#if ABI_FLEN >= 64
-+        case FFI_TYPE_DOUBLE:
-+            asm("" : "=f"(cb->aregs->fa[cb->used_float++]) : "0"(*(double *)data));
-+            return;
-+#endif
-+        default: FFI_ASSERT(0); break;
-+    }
-+
-+    if (cb->used_integer == NARGREG) {
-+        *cb->used_stack++ = value;
-+    } else {
-+        cb->aregs->a[cb->used_integer++] = value;
-+    }
-+}
-+
-+static void unmarshal_atom(call_builder *cb, int type, void *data) {
-+    size_t value;
-+    switch (type) {
-+#if ABI_FLEN >= 32
-+        case FFI_TYPE_FLOAT:
-+            asm("" : "=f"(*(float *)data) : "0"(cb->aregs->fa[cb->used_float++]));
-+            return;
-+#endif
-+#if ABI_FLEN >= 64
-+        case FFI_TYPE_DOUBLE:
-+            asm("" : "=f"(*(double *)data) : "0"(cb->aregs->fa[cb->used_float++]));
-+            return;
-+#endif
-+    }
-+
-+    if (cb->used_integer == NARGREG) {
-+        value = *cb->used_stack++;
-+    } else {
-+        value = cb->aregs->a[cb->used_integer++];
-+    }
-+
-+    switch (type) {
-+        case FFI_TYPE_UINT8: *(uint8_t *)data = value; break;
-+        case FFI_TYPE_SINT8: *(uint8_t *)data = value; break;
-+        case FFI_TYPE_UINT16: *(uint16_t *)data = value; break;
-+        case FFI_TYPE_SINT16: *(uint16_t *)data = value; break;
-+        case FFI_TYPE_UINT32: *(uint32_t *)data = value; break;
-+        case FFI_TYPE_SINT32: *(uint32_t *)data = value; break;
-+#if __SIZEOF_POINTER__ == 8
-+        case FFI_TYPE_UINT64: *(uint64_t *)data = value; break;
-+        case FFI_TYPE_SINT64: *(uint64_t *)data = value; break;
-+#endif
-+        case FFI_TYPE_POINTER: *(size_t *)data = value; break;
-+        default: FFI_ASSERT(0); break;
-+    }
-+}
-+
-+/* adds an argument to a call, or a not by reference return value */
-+static void marshal(call_builder *cb, ffi_type *type, int var, void *data) {
-+    size_t realign[2];
-+
-+#if ABI_FLEN
-+    if (!var && type->type == FFI_TYPE_STRUCT) {
-+        float_struct_info fsi = struct_passed_as_elements(cb, type);
-+        if (fsi.as_elements) {
-+            marshal_atom(cb, fsi.type1, data);
-+            if (fsi.offset2)
-+                marshal_atom(cb, fsi.type2, ((char*)data) + fsi.offset2);
-+            return;
-+        }
-+    }
-+
-+    if (!var && cb->used_float < NARGREG && IS_FLOAT(type->type)) {
-+        marshal_atom(cb, type->type, data);
-+        return;
-+    }
-+#endif
-+
-+    if (type->size > 2 * __SIZEOF_POINTER__) {
-+        /* pass by reference */
-+        marshal_atom(cb, FFI_TYPE_POINTER, &data);
-+    } else if (IS_INT(type->type) || type->type == FFI_TYPE_POINTER) {
-+        marshal_atom(cb, type->type, data);
-+    } else {
-+        /* overlong integers, soft-float floats, and structs without special
-+           float handling are treated identically from this point on */
-+
-+        /* variadics are aligned even in registers */
-+        if (type->alignment > __SIZEOF_POINTER__) {
-+            if (var)
-+                cb->used_integer = ALIGN(cb->used_integer, 2);
-+            cb->used_stack = (size_t *)ALIGN(cb->used_stack, 2*__SIZEOF_POINTER__);
-+        }
-+
-+        memcpy(realign, data, type->size);
-+        if (type->size > 0)
-+            marshal_atom(cb, FFI_TYPE_POINTER, realign);
-+        if (type->size > __SIZEOF_POINTER__)
-+            marshal_atom(cb, FFI_TYPE_POINTER, realign + 1);
-+    }
-+}
-+
-+/* for arguments passed by reference returns the pointer, otherwise the arg is copied (up to MAXCOPYARG bytes) */
-+static void *unmarshal(call_builder *cb, ffi_type *type, int var, void *data) {
-+    size_t realign[2];
-+    void *pointer;
-+
-+#if ABI_FLEN
-+    if (!var && type->type == FFI_TYPE_STRUCT) {
-+        float_struct_info fsi = struct_passed_as_elements(cb, type);
-+        if (fsi.as_elements) {
-+            unmarshal_atom(cb, fsi.type1, data);
-+            if (fsi.offset2)
-+                unmarshal_atom(cb, fsi.type2, ((char*)data) + fsi.offset2);
-+            return data;
-+        }
-+    }
-+
-+    if (!var && cb->used_float < NARGREG && IS_FLOAT(type->type)) {
-+        unmarshal_atom(cb, type->type, data);
-+        return data;
-+    }
-+#endif
-+
-+    if (type->size > 2 * __SIZEOF_POINTER__) {
-+        /* pass by reference */
-+        unmarshal_atom(cb, FFI_TYPE_POINTER, (char*)&pointer);
-+        return pointer;
-+    } else if (IS_INT(type->type) || type->type == FFI_TYPE_POINTER) {
-+        unmarshal_atom(cb, type->type, data);
-+        return data;
-+    } else {
-+        /* overlong integers, soft-float floats, and structs without special
-+           float handling are treated identically from this point on */
-+
-+        /* variadics are aligned even in registers */
-+        if (type->alignment > __SIZEOF_POINTER__) {
-+            if (var)
-+                cb->used_integer = ALIGN(cb->used_integer, 2);
-+            cb->used_stack = (size_t *)ALIGN(cb->used_stack, 2*__SIZEOF_POINTER__);
-+        }
-+
-+        if (type->size > 0)
-+            unmarshal_atom(cb, FFI_TYPE_POINTER, realign);
-+        if (type->size > __SIZEOF_POINTER__)
-+            unmarshal_atom(cb, FFI_TYPE_POINTER, realign + 1);
-+        memcpy(data, realign, type->size);
-+        return data;
-+    }
-+}
-+
-+static int passed_by_ref(call_builder *cb, ffi_type *type, int var) {
-+#if ABI_FLEN
-+    if (!var && type->type == FFI_TYPE_STRUCT) {
-+        float_struct_info fsi = struct_passed_as_elements(cb, type);
-+        if (fsi.as_elements) return 0;
-+    }
-+#endif
-+
-+    return type->size > 2 * __SIZEOF_POINTER__;
-+}
-+
-+/* Perform machine dependent cif processing */
-+ffi_status ffi_prep_cif_machdep(ffi_cif *cif) {
-+    cif->riscv_nfixedargs = cif->nargs;
-+    return FFI_OK;
-+}
-+
-+/* Perform machine dependent cif processing when we have a variadic function */
-+
-+ffi_status ffi_prep_cif_machdep_var(ffi_cif *cif, unsigned int nfixedargs, unsigned int ntotalargs) {
-+    cif->riscv_nfixedargs = nfixedargs;
-+    return FFI_OK;
-+}
-+
-+/* Low level routine for calling functions */
-+extern void ffi_call_asm(void *stack, struct call_context *regs, void (*fn)(void)) FFI_HIDDEN;
-+
-+void ffi_call(ffi_cif *cif, void (*fn)(void), void *rvalue, void **avalue)
-+{
-+    /* this is a conservative estimate, assuming a complex return value and
-+       that all remaining arguments are long long / __int128 */
-+    size_t arg_bytes = cif->nargs <= 3 ? 0 :
-+        ALIGN(2 * sizeof(size_t) * (cif->nargs - 3), STKALIGN);
-+    size_t rval_bytes = 0;
-+    if (rvalue == NULL && cif->rtype->size > 2*__SIZEOF_POINTER__)
-+        rval_bytes = ALIGN(cif->rtype->size, STKALIGN);
-+    size_t alloc_size = arg_bytes + rval_bytes + sizeof(call_context);
-+
-+    /* the assembly code will deallocate all stack data at lower addresses
-+       than the argument region, so we need to allocate the frame and the
-+       return value after the arguments in a single allocation */
-+    size_t alloc_base;
-+    /* Argument region must be 16-byte aligned */
-+    if (_Alignof(max_align_t) >= STKALIGN) {
-+        /* since sizeof long double is normally 16, the compiler will
-+           guarantee alloca alignment to at least that much */
-+        alloc_base = (size_t)alloca(alloc_size);
-+    } else {
-+        alloc_base = ALIGN(alloca(alloc_size + STKALIGN - 1), STKALIGN);
-+    }
-+
-+    if (rval_bytes)
-+        rvalue = (void*)(alloc_base + arg_bytes);
-+
-+    call_builder cb;
-+    cb.used_float = cb.used_integer = 0;
-+    cb.aregs = (call_context*)(alloc_base + arg_bytes + rval_bytes);
-+    cb.used_stack = (void*)alloc_base;
-+
-+    int return_by_ref = passed_by_ref(&cb, cif->rtype, 0);
-+    if (return_by_ref)
-+        marshal(&cb, &ffi_type_pointer, 0, &rvalue);
-+
-+    int i;
-+    for (i = 0; i < cif->nargs; i++)
-+        marshal(&cb, cif->arg_types[i], i >= cif->riscv_nfixedargs, avalue[i]);
-+
-+    ffi_call_asm((void*)alloc_base, cb.aregs, fn);
-+
-+    cb.used_float = cb.used_integer = 0;
-+    if (!return_by_ref && rvalue)
-+        unmarshal(&cb, cif->rtype, 0, rvalue);
-+}
-+
-+extern void ffi_closure_asm(void) FFI_HIDDEN;
-+
-+ffi_status ffi_prep_closure_loc(ffi_closure *closure, ffi_cif *cif, void (*fun)(ffi_cif*,void*,void**,void*), void *user_data, void *codeloc)
-+{
-+    uint32_t *tramp = (uint32_t *) &closure->tramp[0];
-+    uint64_t fn = (uint64_t) (uintptr_t) ffi_closure_asm;
-+
-+    if (cif->abi <= FFI_FIRST_ABI || cif->abi >= FFI_LAST_ABI)
-+        return FFI_BAD_ABI;
-+
-+    /* we will call ffi_closure_inner with codeloc, not closure, but as long
-+       as the memory is readable it should work */
-+
-+    tramp[0] = 0x00000317; /* auipc t1, 0 (i.e. t0 <- codeloc) */
-+#if __SIZEOF_POINTER__ == 8
-+    tramp[1] = 0x01033383; /* ld t2, 16(t1) */
-+#else
-+    tramp[1] = 0x01032383; /* lw t2, 16(t1) */
-+#endif
-+    tramp[2] = 0x00038067; /* jr t2 */
-+    tramp[3] = 0x00000013; /* nop */
-+    tramp[4] = fn;
-+    tramp[5] = fn >> 32;
-+
-+    closure->cif = cif;
-+    closure->fun = fun;
-+    closure->user_data = user_data;
-+
-+    __builtin___clear_cache(codeloc, codeloc + FFI_TRAMPOLINE_SIZE);
-+
-+    return FFI_OK;
-+}
-+
-+/* Called by the assembly code with aregs pointing to saved argument registers
-+   and stack pointing to the stacked arguments.  Return values passed in
-+   registers will be reloaded from aregs. */
-+void FFI_HIDDEN ffi_closure_inner(size_t *stack, call_context *aregs, ffi_closure *closure) {
-+    ffi_cif *cif = closure->cif;
-+    void **avalue = alloca(cif->nargs * sizeof(void*));
-+    /* storage for arguments which will be copied by unmarshal().  We could
-+       theoretically avoid the copies in many cases and use at most 128 bytes
-+       of memory, but allocating disjoint storage for each argument is
-+       simpler. */
-+    char *astorage = alloca(cif->nargs * MAXCOPYARG);
-+    void *rvalue;
-+    call_builder cb;
-+    int return_by_ref;
-+    int i;
-+
-+    cb.aregs = aregs;
-+    cb.used_integer = cb.used_float = 0;
-+    cb.used_stack = stack;
-+
-+    return_by_ref = passed_by_ref(&cb, cif->rtype, 0);
-+    if (return_by_ref)
-+        unmarshal(&cb, &ffi_type_pointer, 0, &rvalue);
-+    else
-+        rvalue = alloca(cif->rtype->size);
-+
-+    for (i = 0; i < cif->nargs; i++)
-+        avalue[i] = unmarshal(&cb, cif->arg_types[i],
-+            i >= cif->riscv_nfixedargs, astorage + i*MAXCOPYARG);
-+
-+    (closure->fun)(cif, rvalue, avalue, closure->user_data);
-+
-+    if (!return_by_ref && cif->rtype->type != FFI_TYPE_VOID) {
-+        cb.used_integer = cb.used_float = 0;
-+        marshal(&cb, cif->rtype, 0, rvalue);
-+    }
-+}
-diff --git a/src/riscv/ffitarget.h b/src/riscv/ffitarget.h
-new file mode 100644
-index 0000000..fcaa899
---- /dev/null
-+++ b/src/riscv/ffitarget.h
-@@ -0,0 +1,68 @@
-+/* -----------------------------------------------------------------*-C-*-
-+   ffitarget.h - 2014 Michael Knyszek
-+
-+   Target configuration macros for RISC-V.
-+
-+   Permission is hereby granted, free of charge, to any person obtaining
-+   a copy of this software and associated documentation files (the
-+   ``Software''), to deal in the Software without restriction, including
-+   without limitation the rights to use, copy, modify, merge, publish,
-+   distribute, sublicense, and/or sell copies of the Software, and to
-+   permit persons to whom the Software is furnished to do so, subject to
-+   the following conditions:
-+
-+   The above copyright notice and this permission notice shall be included
-+   in all copies or substantial portions of the Software.
-+
-+   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
-+   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-+   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-+   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-+   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+   DEALINGS IN THE SOFTWARE.
-+
-+   ----------------------------------------------------------------------- */
-+
-+#ifndef LIBFFI_TARGET_H
-+#define LIBFFI_TARGET_H
-+
-+#ifndef LIBFFI_H
-+#error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
-+#endif
-+
-+#ifndef __riscv
-+#error "libffi was configured for a RISC-V target but this does not appear to be a RISC-V compiler."
-+#endif
-+
-+#ifndef LIBFFI_ASM
-+
-+typedef unsigned long ffi_arg;
-+typedef   signed long ffi_sarg;
-+
-+/* FFI_UNUSED_NN and riscv_unused are to maintain ABI compatibility with a
-+   distributed Berkeley patch from 2014, and can be removed at SONAME bump */
-+typedef enum ffi_abi {
-+    FFI_FIRST_ABI = 0,
-+    FFI_SYSV,
-+    FFI_UNUSED_1,
-+    FFI_UNUSED_2,
-+    FFI_UNUSED_3,
-+    FFI_LAST_ABI,
-+
-+    FFI_DEFAULT_ABI = FFI_SYSV
-+} ffi_abi;
-+
-+#endif /* LIBFFI_ASM */
-+
-+/* ---- Definitions for closures ----------------------------------------- */
-+
-+#define FFI_CLOSURES 1
-+#define FFI_TRAMPOLINE_SIZE 24
-+#define FFI_NATIVE_RAW_API 0
-+#define FFI_EXTRA_CIF_FIELDS unsigned riscv_nfixedargs; unsigned riscv_unused;
-+#define FFI_TARGET_SPECIFIC_VARIADIC
-+
-+#endif
-+
-diff --git a/src/riscv/sysv.S b/src/riscv/sysv.S
-new file mode 100644
-index 0000000..2d09865
---- /dev/null
-+++ b/src/riscv/sysv.S
-@@ -0,0 +1,214 @@
-+/* -----------------------------------------------------------------------
-+   ffi.c - Copyright (c) 2015 Michael Knyszek <mknyszek@berkeley.edu>
-+                         2015 Andrew Waterman <waterman@cs.berkeley.edu>
-+                         2018 Stef O'Rear <sorear2@gmail.com>
-+
-+   RISC-V Foreign Function Interface
-+
-+   Permission is hereby granted, free of charge, to any person obtaining
-+   a copy of this software and associated documentation files (the
-+   ``Software''), to deal in the Software without restriction, including
-+   without limitation the rights to use, copy, modify, merge, publish,
-+   distribute, sublicense, and/or sell copies of the Software, and to
-+   permit persons to whom the Software is furnished to do so, subject to
-+   the following conditions:
-+
-+   The above copyright notice and this permission notice shall be included
-+   in all copies or substantial portions of the Software.
-+
-+   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
-+   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-+   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-+   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-+   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+   DEALINGS IN THE SOFTWARE.
-+   ----------------------------------------------------------------------- */
-+
-+#define LIBFFI_ASM
-+#include <fficonfig.h>
-+#include <ffi.h>
-+
-+/* Define aliases so that we can handle all ABIs uniformly */
-+
-+#if __SIZEOF_POINTER__ == 8
-+#define PTRS 8
-+#define LARG ld
-+#define SARG sd
-+#else
-+#define PTRS 4
-+#define LARG lw
-+#define SARG sw
-+#endif
-+
-+#if __riscv_float_abi_double
-+#define FLTS 8
-+#define FLARG fld
-+#define FSARG fsd
-+#elif __riscv_float_abi_single
-+#define FLTS 4
-+#define FLARG flw
-+#define FSARG fsw
-+#else
-+#define FLTS 0
-+#endif
-+
-+#define fp s0
-+
-+    .text
-+    .globl  ffi_call_asm
-+    .type   ffi_call_asm, @function
-+    .hidden ffi_call_asm
-+/*
-+  struct call_context {
-+      floatreg fa[8];
-+      intreg a[8];
-+      intreg pad[rv32 ? 2 : 0];
-+      intreg save_fp, save_ra;
-+  }
-+  void ffi_call_asm(size_t *stackargs, struct call_context *regargs,
-+      void (*fn)(void));
-+*/
-+
-+#define FRAME_LEN (8 * FLTS + 8 * PTRS + 16)
-+
-+ffi_call_asm:
-+    .cfi_startproc
-+
-+    /*
-+      We are NOT going to set up an ordinary stack frame.  In order to pass
-+      the stacked args to the called function, we adjust our stack pointer to
-+      a0, which is in the _caller's_ alloca area.  We establish our own stack
-+      frame at the end of the call_context.
-+
-+      Anything below the arguments will be freed at this point, although we
-+      preserve the call_context so that it can be read back in the caller.
-+    */
-+
-+    .cfi_def_cfa 11, FRAME_LEN # interim CFA based on a1
-+    SARG    fp, FRAME_LEN - 2*PTRS(a1)
-+    .cfi_offset 8, -2*PTRS
-+    SARG    ra, FRAME_LEN - 1*PTRS(a1)
-+    .cfi_offset 1, -1*PTRS
-+
-+    addi    fp, a1, FRAME_LEN
-+    mv      sp, a0
-+    .cfi_def_cfa 8, 0 # our frame is fully set up
-+
-+    # Load arguments
-+    mv      t1, a2
-+
-+#if FLTS
-+    FLARG   fa0, -FRAME_LEN+0*FLTS(fp)
-+    FLARG   fa1, -FRAME_LEN+1*FLTS(fp)
-+    FLARG   fa2, -FRAME_LEN+2*FLTS(fp)
-+    FLARG   fa3, -FRAME_LEN+3*FLTS(fp)
-+    FLARG   fa4, -FRAME_LEN+4*FLTS(fp)
-+    FLARG   fa5, -FRAME_LEN+5*FLTS(fp)
-+    FLARG   fa6, -FRAME_LEN+6*FLTS(fp)
-+    FLARG   fa7, -FRAME_LEN+7*FLTS(fp)
-+#endif
-+
-+    LARG    a0, -FRAME_LEN+8*FLTS+0*PTRS(fp)
-+    LARG    a1, -FRAME_LEN+8*FLTS+1*PTRS(fp)
-+    LARG    a2, -FRAME_LEN+8*FLTS+2*PTRS(fp)
-+    LARG    a3, -FRAME_LEN+8*FLTS+3*PTRS(fp)
-+    LARG    a4, -FRAME_LEN+8*FLTS+4*PTRS(fp)
-+    LARG    a5, -FRAME_LEN+8*FLTS+5*PTRS(fp)
-+    LARG    a6, -FRAME_LEN+8*FLTS+6*PTRS(fp)
-+    LARG    a7, -FRAME_LEN+8*FLTS+7*PTRS(fp)
-+
-+    /* Call */
-+    jalr    t1
-+
-+    /* Save return values - only a0/a1 (fa0/fa1) are used */
-+#if FLTS
-+    FSARG   fa0, -FRAME_LEN+0*FLTS(fp)
-+    FSARG   fa1, -FRAME_LEN+1*FLTS(fp)
-+#endif
-+
-+    SARG    a0, -FRAME_LEN+8*FLTS+0*PTRS(fp)
-+    SARG    a1, -FRAME_LEN+8*FLTS+1*PTRS(fp)
-+
-+    /* Restore and return */
-+    addi    sp, fp, -FRAME_LEN
-+    .cfi_def_cfa 2, FRAME_LEN
-+    LARG    ra, -1*PTRS(fp)
-+    .cfi_restore 1
-+    LARG    fp, -2*PTRS(fp)
-+    .cfi_restore 8
-+    ret
-+    .cfi_endproc
-+    .size   ffi_call_asm, .-ffi_call_asm
-+
-+
-+/*
-+  ffi_closure_asm. Expects address of the passed-in ffi_closure in t1.
-+  void ffi_closure_inner(size_t *stackargs, struct call_context *regargs,
-+      ffi_closure *closure);
-+*/
-+
-+    .globl ffi_closure_asm
-+    .hidden ffi_closure_asm
-+    .type ffi_closure_asm, @function
-+ffi_closure_asm:
-+    .cfi_startproc
-+
-+    addi    sp,  sp, -FRAME_LEN
-+    .cfi_def_cfa_offset FRAME_LEN
-+
-+    /* make a frame */
-+    SARG    fp, FRAME_LEN - 2*PTRS(sp)
-+    .cfi_offset 8, -2*PTRS
-+    SARG    ra, FRAME_LEN - 1*PTRS(sp)
-+    .cfi_offset 1, -1*PTRS
-+    addi    fp, sp, FRAME_LEN
-+
-+    /* save arguments */
-+#if FLTS
-+    FSARG   fa0, 0*FLTS(sp)
-+    FSARG   fa1, 1*FLTS(sp)
-+    FSARG   fa2, 2*FLTS(sp)
-+    FSARG   fa3, 3*FLTS(sp)
-+    FSARG   fa4, 4*FLTS(sp)
-+    FSARG   fa5, 5*FLTS(sp)
-+    FSARG   fa6, 6*FLTS(sp)
-+    FSARG   fa7, 7*FLTS(sp)
-+#endif
-+
-+    SARG    a0, 8*FLTS+0*PTRS(sp)
-+    SARG    a1, 8*FLTS+1*PTRS(sp)
-+    SARG    a2, 8*FLTS+2*PTRS(sp)
-+    SARG    a3, 8*FLTS+3*PTRS(sp)
-+    SARG    a4, 8*FLTS+4*PTRS(sp)
-+    SARG    a5, 8*FLTS+5*PTRS(sp)
-+    SARG    a6, 8*FLTS+6*PTRS(sp)
-+    SARG    a7, 8*FLTS+7*PTRS(sp)
-+
-+    /* enter C */
-+    addi    a0, sp, FRAME_LEN
-+    mv      a1, sp
-+    mv      a2, t1
-+
-+    call    ffi_closure_inner
-+
-+    /* return values */
-+#if FLTS
-+    FLARG   fa0, 0*FLTS(sp)
-+    FLARG   fa1, 1*FLTS(sp)
-+#endif
-+
-+    LARG    a0, 8*FLTS+0*PTRS(sp)
-+    LARG    a1, 8*FLTS+1*PTRS(sp)
-+
-+    /* restore and return */
-+    LARG    ra, FRAME_LEN-1*PTRS(sp)
-+    .cfi_restore 1
-+    LARG    fp, FRAME_LEN-2*PTRS(sp)
-+    .cfi_restore 8
-+    addi    sp, sp, FRAME_LEN
-+    .cfi_def_cfa_offset 0
-+    ret
-+    .cfi_endproc
-+    .size ffi_closure_asm, .-ffi_closure_asm
diff --git a/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch b/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
deleted file mode 100644
index 6b167c8421..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 69c3906c85c791716bf650aa36d9361d22acf3fb Mon Sep 17 00:00:00 2001
-From: sweeaun <swee.aun.khor@intel.com>
-Date: Thu, 6 Jul 2017 16:32:46 -0700
-Subject: [PATCH] libffi: Support musl x32 build
-
-Support libffi build with target musl-x32.
-
-Upstream-Status: Pending
-
-Signed-off-by: sweeaun <swee.aun.khor@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a7bf5ee..8ebe99c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -177,7 +177,7 @@ case "$host" in
- 	TARGETDIR=x86
- 	if test $ac_cv_sizeof_size_t = 4; then
- 	  case "$host" in
--	    *-gnux32)
-+	    *-gnux32 | *-muslx32)
- 	      TARGET=X86_64
- 	      ;;
- 	    *)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch b/meta/recipes-support/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
deleted file mode 100644
index db96e63547..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a5efaa96fd934eb245c234a5275fcf62698ef986 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Apr 2015 21:38:03 -0700
-Subject: [PATCH] mips: Use compiler internal define for linux
-
-__linux__ is defined by compiler when building for
-linux platforms, lets use it
-
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mips/ffitarget.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mips/ffitarget.h b/src/mips/ffitarget.h
-index 717d659..6faa358 100644
---- a/src/mips/ffitarget.h
-+++ b/src/mips/ffitarget.h
-@@ -32,7 +32,7 @@
- #error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
- #endif
- 
--#ifdef linux
-+#ifdef __linux__
- # include <asm/sgidefs.h>
- #elif defined(__rtems__)
- /*
--- 
-2.1.4
-
diff --git a/meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch b/meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch
deleted file mode 100644
index 61c9eb31d1..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-From 655e82c92d5c3875aee04322f1993d6b0774a7bf Mon Sep 17 00:00:00 2001
-From: Yousong Zhou <yszhou4tech@gmail.com>
-Date: Mon, 15 Aug 2016 15:00:13 +0800
-Subject: [PATCH] mips: fix MIPS softfloat build issue
-
-The patch for o32.S is taken from OpenWrt packages repo 3a7a4bf "libffi:
-fix MIPS softfloat build issue with current binutils"
-
-Signed-off-by: Felix Fietkau <nbd@openwrt.org>
-Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
----
-Upstream-Status: Backport [https://github.com/libffi/libffi/commit/2ded2a4f494165c93293afc14ab0be1243cf8c49]
- src/mips/n32.S | 17 +++++++++++++++++
- src/mips/o32.S | 17 +++++++++++++++++
- 2 files changed, 34 insertions(+)
-
-diff --git a/src/mips/n32.S b/src/mips/n32.S
-index c6985d3..8f25994 100644
---- a/src/mips/n32.S
-+++ b/src/mips/n32.S
-@@ -107,6 +107,16 @@ loadregs:
- 
- 	REG_L	t6, 3*FFI_SIZEOF_ARG($fp)  # load the flags word into t6.
- 
-+#ifdef __mips_soft_float
-+	REG_L	a0, 0*FFI_SIZEOF_ARG(t9)
-+	REG_L	a1, 1*FFI_SIZEOF_ARG(t9)
-+	REG_L	a2, 2*FFI_SIZEOF_ARG(t9)
-+	REG_L	a3, 3*FFI_SIZEOF_ARG(t9)
-+	REG_L	a4, 4*FFI_SIZEOF_ARG(t9)
-+	REG_L	a5, 5*FFI_SIZEOF_ARG(t9)
-+	REG_L	a6, 6*FFI_SIZEOF_ARG(t9)
-+	REG_L	a7, 7*FFI_SIZEOF_ARG(t9)
-+#else
- 	and	t4, t6, ((1<<FFI_FLAG_BITS)-1)
- 	REG_L	a0, 0*FFI_SIZEOF_ARG(t9)
- 	beqz	t4, arg1_next
-@@ -193,6 +203,7 @@ arg7_next:
- arg8_doublep:	
-  	l.d	$f19, 7*FFI_SIZEOF_ARG(t9)	
- arg8_next:	
-+#endif
- 
- callit:		
- 	# Load the function pointer
-@@ -214,6 +225,7 @@ retint:
- 	b	epilogue
- 
- retfloat:
-+#ifndef __mips_soft_float
- 	bne     t6, FFI_TYPE_FLOAT, retdouble
- 	jal	t9
- 	REG_L	t4, 4*FFI_SIZEOF_ARG($fp)
-@@ -272,6 +284,7 @@ retstruct_f_d:
- 	s.s	$f0, 0(t4)
- 	s.d	$f2, 8(t4)
- 	b	epilogue
-+#endif
- 
- retstruct_d_soft:
- 	bne	t6, FFI_TYPE_STRUCT_D_SOFT, retstruct_f_soft
-@@ -429,6 +442,7 @@ ffi_closure_N32:
- 	REG_S	a6, A6_OFF2($sp)
- 	REG_S	a7, A7_OFF2($sp)
- 
-+#ifndef __mips_soft_float
- 	# Store all possible float/double registers.
- 	s.d	$f12, F12_OFF2($sp)
- 	s.d	$f13, F13_OFF2($sp)
-@@ -438,6 +452,7 @@ ffi_closure_N32:
- 	s.d	$f17, F17_OFF2($sp)
- 	s.d	$f18, F18_OFF2($sp)
- 	s.d	$f19, F19_OFF2($sp)
-+#endif
- 
- 	# Call ffi_closure_mips_inner_N32 to do the real work.
- 	LA	t9, ffi_closure_mips_inner_N32
-@@ -458,6 +473,7 @@ cls_retint:
- 	b	cls_epilogue
- 
- cls_retfloat:
-+#ifndef __mips_soft_float
- 	bne     v0, FFI_TYPE_FLOAT, cls_retdouble
- 	l.s	$f0, V0_OFF2($sp)
- 	b	cls_epilogue
-@@ -500,6 +516,7 @@ cls_retstruct_f_d:
- 	l.s	$f0, V0_OFF2($sp)
- 	l.d	$f2, V1_OFF2($sp)
- 	b	cls_epilogue
-+#endif
- 	
- cls_retstruct_small2:	
- 	REG_L	v0, V0_OFF2($sp)
-diff --git a/src/mips/o32.S b/src/mips/o32.S
-index eb27981..429dd0a 100644
---- a/src/mips/o32.S
-+++ b/src/mips/o32.S
-@@ -82,13 +82,16 @@ sixteen:
- 		
- 	ADDU	$sp, 4 * FFI_SIZEOF_ARG		# adjust $sp to new args
- 
-+#ifndef __mips_soft_float
- 	bnez	t0, pass_d			# make it quick for int
-+#endif
- 	REG_L	a0, 0*FFI_SIZEOF_ARG($sp)	# just go ahead and load the
- 	REG_L	a1, 1*FFI_SIZEOF_ARG($sp)	# four regs.
- 	REG_L	a2, 2*FFI_SIZEOF_ARG($sp)
- 	REG_L	a3, 3*FFI_SIZEOF_ARG($sp)
- 	b	call_it
- 
-+#ifndef __mips_soft_float
- pass_d:
- 	bne	t0, FFI_ARGS_D, pass_f
- 	l.d	$f12, 0*FFI_SIZEOF_ARG($sp)	# load $fp regs from args
-@@ -130,6 +133,7 @@ pass_f_d:
-  #	bne	t0, FFI_ARGS_F_D, call_it
- 	l.s	$f12, 0*FFI_SIZEOF_ARG($sp)	# load $fp regs from args
- 	l.d	$f14, 2*FFI_SIZEOF_ARG($sp)	# passing double and float
-+#endif
- 
- call_it:	
- 	# Load the function pointer
-@@ -158,14 +162,23 @@ retfloat:
- 	bne     t2, FFI_TYPE_FLOAT, retdouble
- 	jalr	t9
- 	REG_L	t0, SIZEOF_FRAME + 4*FFI_SIZEOF_ARG($fp)
-+#ifndef __mips_soft_float
- 	s.s	$f0, 0(t0)
-+#else
-+	REG_S	v0, 0(t0)
-+#endif
- 	b	epilogue
- 
- retdouble:	
- 	bne	t2, FFI_TYPE_DOUBLE, noretval
- 	jalr	t9
- 	REG_L	t0, SIZEOF_FRAME + 4*FFI_SIZEOF_ARG($fp)
-+#ifndef __mips_soft_float
- 	s.d	$f0, 0(t0)
-+#else
-+	REG_S	v1, 4(t0)
-+	REG_S	v0, 0(t0)
-+#endif
- 	b	epilogue
- 	
- noretval:	
-@@ -261,9 +274,11 @@ $LCFI7:
- 	li	$13, 1		# FFI_O32
- 	bne	$16, $13, 1f	# Skip fp save if FFI_O32_SOFT_FLOAT
- 	
-+#ifndef __mips_soft_float
- 	# Store all possible float/double registers.
- 	s.d	$f12, FA_0_0_OFF2($fp)
- 	s.d	$f14, FA_1_0_OFF2($fp)
-+#endif
- 1:	
- 	# Call ffi_closure_mips_inner_O32 to do the work.
- 	la	t9, ffi_closure_mips_inner_O32
-@@ -281,6 +296,7 @@ $LCFI7:
- 	li	$13, 1		# FFI_O32
- 	bne	$16, $13, 1f	# Skip fp restore if FFI_O32_SOFT_FLOAT
- 
-+#ifndef __mips_soft_float
- 	li	$9, FFI_TYPE_FLOAT
- 	l.s	$f0, V0_OFF2($fp)
- 	beq	$8, $9, closure_done
-@@ -288,6 +304,7 @@ $LCFI7:
- 	li	$9, FFI_TYPE_DOUBLE
- 	l.d	$f0, V0_OFF2($fp)
- 	beq	$8, $9, closure_done
-+#endif
- 1:	
- 	REG_L	$3, V1_OFF2($fp)
- 	REG_L	$2, V0_OFF2($fp)
--- 
-2.9.3
-
diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 80c40a4742..86a7fc9e40 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -11,12 +11,10 @@ As this block is generally pointless, disable it.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-Index: libffi-3.2.1/configure.ac
-===================================================================
---- libffi-3.2.1.orig/configure.ac
-+++ libffi-3.2.1/configure.ac
-@@ -592,7 +592,7 @@ AC_ARG_ENABLE(purify-safety,
- 
+--- a/configure.ac
++++ b/configure.ac
+@@ -350,7 +350,7 @@ AC_ARG_ENABLE(multi-os-directory,
+                           
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
 -if test "x$GCC" = "xyes"; then
diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1+3.3-rc0.bb
similarity index 72%
rename from meta/recipes-support/libffi/libffi_3.2.1.bb
rename to meta/recipes-support/libffi/libffi_3.2.1+3.3-rc0.bb
index f2c684a7a6..7edf9ed80b 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1+3.3-rc0.bb
@@ -10,21 +10,18 @@ A layer must exist above `libffi' that handles type conversions for values passe
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 
-SRC_URI = "https://sourceware.org/pub/libffi/${BP}.tar.gz \
+SRC_URI = "https://github.com/libffi/libffi/releases/download/v3.3-rc0/libffi-3.3-rc0.tar.gz \
            file://not-win32.patch \
-           file://0001-mips-Use-compiler-internal-define-for-linux.patch \
-           file://0001-mips-fix-MIPS-softfloat-build-issue.patch \
-           file://0001-libffi-Support-musl-x32-build.patch \
-           file://0001-New-RISC-V-port-281.patch \
            "
-
-SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
-SRC_URI[sha256sum] = "d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37"
+SRC_URI[md5sum] = "8d2a82a78faf10a5e53c27d986e8f04e"
+SRC_URI[sha256sum] = "403d67aabf1c05157855ea2b1d9950263fb6316536c8c333f5b9ab1eb2f20ecf"
 
 EXTRA_OECONF += "--disable-builddir"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo
 
+S = "${WORKDIR}/${BPN}-3.3-rc0"
+
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
 
 # Doesn't compile in MIPS16e mode due to use of hand-written
-- 
2.22.0


