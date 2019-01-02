Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E997F6BDB2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 19:21:21 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c123so15589090pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xblh5L1YIiQ/az5mw7XjGXMu5bxepklJGkyDptX9088=;
	b=s5ns/fvlB5QNBNk7Zk1nqGD7RbFwfyvi1RGo5KvRX53Vl54cb9M1y+LO6PkfEJwiNn
	zqLoDFV+SkIRxGBK95E3zXIx4mgK/g7Bw4We5akF33l66jFVXJvFcFWFnSdgWyDjr47D
	TswappS1KZz1+e8cn+Au4aC57F+qB2TKUiuPlrZCwT33kMmZ3a53yXiJNETgfb0cXFy6
	+TofOpnyLaar0w8o/M+6N2ih8pIxSfW0TNxffXt2BeESsQPlSlSKQZHeu+GlgBUawfdd
	Gin7CY+guFM5QkHYT79D1JLCj12i9QVlGJmE/m8GsYIVA+9l3I0NKJz58vh5Wqwy8uZJ
	76YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xblh5L1YIiQ/az5mw7XjGXMu5bxepklJGkyDptX9088=;
	b=AIzft7UM1cfjBG9c1S5p/776LcDEsNwq8MZGoj630THQdDcRyXL6ApRS87aVCXvgwh
	Pz5rkEOPaPhGJFkCE7H4gE8DTTegMqozx74QDdwjuYbKoQULFfgWCKyZLPEAOIkqSDvf
	CDszkAfM0rYHmN/dgXoXjPTfFOlzqz9uukNx7HQ/ycUxpdC5imaUiyNK4oDP4mKue4zz
	vGY5jD18WgNdDTkZUSQ/MwT1RRI/GM+cQnNXejqQcnKXXRLKuU3EcZCPJlxqR8Cwy7+7
	QZQJAr0pzChr8a6cyEcq9zsChUdjFCxEolAvvuqob1oXNhQGFKFVNaaax4YIJT8H71+v
	KLIA==
X-Gm-Message-State: AJcUukcWVw0CbLuHM4gE62MexlMlSJI7Wt+I7SW6HID7q2CddQXFH0Mp
	tP3T5X+qmvcidfNjGmJm1C9ovBQn3dc=
X-Google-Smtp-Source: ALg8bN6oPrJRtQcOraIf8Vn8Mf2A0Xa21PpuCuBnRUQjJIV5crJV4IpthiON7jSQ1txai3FfICzU4g==
X-Received: by 2002:a63:cd4c:: with SMTP id a12mr14838875pgj.252.1546456881945;
	Wed, 02 Jan 2019 11:21:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	o189sm87556966pfg.117.2019.01.02.11.21.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 11:21:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 11:21:10 -0800
Message-Id: <20190102192111.33587-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Wed, 02 Jan 2019 19:21:22 -0000
Content-Transfer-Encoding: 8bit

From: pino-kim <sungwon.pino@gmail.com>

This fixes RISC-V gdb-cross-canadian cross compile configure failure on missing bison.

Signed-off-by: pino-kim <sungwon.pino@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 475e4f08ef..e54766bbb2 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -6,7 +6,8 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk \
+           virtual/nativesdk-libc bison-native"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
-- 
2.20.1


