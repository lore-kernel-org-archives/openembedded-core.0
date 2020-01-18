Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id A3A187FBB5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:41:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id ay11so11342515plb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4BuszGw2qXjCKO25tRCfp0PsCoCYbGpVG2abDOL5dkE=;
	b=GfjXG2/phq9MnnhbuPQrePk61tsxJHi3c9MopaWeNdt3de5bTy2k0QfXHpEkzR6HuL
	niQoxQkrQfkF4fhAu4HNJ7KYl7iFWdZllU/r81oE0t86FTpnxSbNQq6wK/VhsfMc30E0
	hUWnq3hXw49P7rVnSyU3DCM3fgxfOMfDTEnTf5e3bAkfvu1l0iufduFC2bF/IfBaY17D
	ss9I7PmGXujulGFCgqkzedoBx/yHdzUvZORG+0iVrWFMx9rcj1UONNDjTu+FZ+kkpmpB
	LrxBmePYoLA9CDuugbTL8P89p57aKMTj5+eaZ9y6wGlpFjDr7RSWsiZteRYw7mLD2wAC
	m7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4BuszGw2qXjCKO25tRCfp0PsCoCYbGpVG2abDOL5dkE=;
	b=LSAbpJJcVQafJ05yxSt6Ns84VFmaivlqqJn65DFZI7lmxCBh6H9SM/G+BJYdOetqXv
	Y2kOlcsF8b7d9Iy7wGiDRRqBsGz7+Wu1QLQ0uj+HG7ydOHm+85a7oDphT2roWsFnoy8a
	ZGiVR8SM7TE+8CVBFgaQnxFVNIROy1ynexU2epAlmDjCdBAU2+tg5igm++syNXA8NvCn
	e19p+lvARIGf1LVyilrp1JRPWQ/Vs2f5VOouZ7LcExIGt+y1HBBs4YDqYuPiTjViJv1J
	FQL61q2t4qHjGFhodZ/h2d7O0ivmbc0Cp9X1XkOVw4JJX5GAfQglnivq/amNCiHjqcox
	bzDg==
X-Gm-Message-State: APjAAAVY60isCuszs5OSlF4yAClaVmCVZrqO4Eq1Y3KpmOWazNNdNUr3
	hVhGNUgLbN97nL6Y+oNbrsMzeI5u2JU=
X-Google-Smtp-Source: APXvYqzXVMqxyYyCpbYShVjyM7WT7VOiROzLyM/O5dOz5bMcYkpefZHGeQ+1yruihmMqGR0MKZU/1w==
X-Received: by 2002:a17:90a:23ad:: with SMTP id
	g42mr13593397pje.105.1579376486370; 
	Sat, 18 Jan 2020 11:41:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id l8sm751610pjy.24.2020.01.18.11.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 11:41:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:41:22 -0800
Message-Id: <3e88cf3c49717c5c10b266be49d72242c9fb713a.1579376298.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579376298.git.raj.khem@gmail.com>
References: <cover.1579376298.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] ghostscript: Add powerpc64 LE specific objarch.h
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
X-List-Received-Date: Sat, 18 Jan 2020 19:41:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ghostscript/powerpc64le/objarch.h         | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h

diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
new file mode 100644
index 0000000000..a05de29def
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
-- 
2.25.0


