Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id BDF0F74ECF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:55 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id v63-v6so8383131pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6PS2l+37LPc7sKzNN6GGfyefg2zpxnz9g5l3fxV4Bic=;
	b=YA3xMYMisYDZ2JhXTTWFjvV2KTD1NMqrdnl6uNZxU+cV+FJ1b2XfARtW86VIZb9ipt
	dApkJz1jpmlteAoYVdW/es1qv+K4Ocy0vgfTcrqdr1TleAlapAdppLLI3NGgJekeuKgR
	eLWhGWiJynUu3vVB7TQPnKIUhRCTL+SD7+85b6pXUmpGOQqAyUP5uBZ53NAEa+HwW9O+
	o47ruC8BJp77aUtpvmy5wLuaYbLD90ws+5q6gYbUmpsh3PNJczqU0+q7Ns7oe4Q8DMIJ
	DsfNfFtJ80SKcf3odRRsbz7VrQQ7RGKSBlPFRERpxAjCk8SrnfMA4ONerzD51z/T1Qxt
	Zafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6PS2l+37LPc7sKzNN6GGfyefg2zpxnz9g5l3fxV4Bic=;
	b=EJOwRjgUpGT0NvKgqffxD7z/6XskmMGSOcIh/QDKfu/SoE+tkxB4SIAkcxM525AkTU
	b3jzjU/j/uoe6uzDHyuDvLl0RTjpWLmlaH8DR7O2f0qklRkD+d1rXTJCtSR4dYBq6O5Q
	BplUQXB8x7tvEGsgRChgDAl2i7PCj73LeHEgyRK6+ShRJGJA32DrZZP31GYi8WcBu0RY
	4ZrQMnr7YrtBjehvxJsy1Y0tt9jbnBajVl44X0yr7J3aT4hKk1Pv/qqvB8sclgskrpJJ
	iWYl6h21WNIWu4F4MvomsQO91KWynVk2kTOQI0xwWrUE4ee2U8Anq5TvrrrZnrNZcEN+
	BbBQ==
X-Gm-Message-State: ALKqPwdBgSIkcjy6lKcts+2ItjHUIrn/Il0vAJs7qm6v9FSrUEZlziiT
	1dxoi5PW8k+HMsDRzgi9554Cxw==
X-Google-Smtp-Source: ADUXVKLTDJQRmoUimZPKhO5toECTinIugE1pP4msKDoaSjsemFOM9PzkrHXqVpQnEuojQKQyF1s20g==
X-Received: by 2002:a63:3c4c:: with SMTP id
	i12-v6mr1010188pgn.309.1527656696187; 
	Tue, 29 May 2018 22:04:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	l71-v6sm24952157pge.8.2018.05.29.22.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:50 -0700
Message-Id: <6afb7f4089b542b2a93c1768107073a5e3e92b33.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] gcc-8: Disable libssp for non mingw targets
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
X-List-Received-Date: Wed, 30 May 2018 05:04:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index ecc1ceff99..2b176ac98d 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -87,10 +87,12 @@ FORTRAN = ""
 JAVA = ""
 
 LTO = "--enable-lto"
+SSP ?= "--disable-libssp"
+SSP_mingw32 = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
     ${LTO} \
-    --enable-libssp \
+    ${SSP} \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
@@ -114,7 +116,7 @@ EXTRA_OECONF_INITIAL = "\
     --disable-plugin \
     --enable-decimal-float=no \
     --without-isl \
-    gcc_cv_libc_provides_ssp=yes \
+    --disable-libssp \
 "
 
 EXTRA_OECONF_PATHS = "\
-- 
2.17.0


