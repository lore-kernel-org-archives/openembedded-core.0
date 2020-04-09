Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.737.1586394522257576352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 18:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ciUueGu+;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id p8so742406pgi.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 18:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z+mSX0GUE6e+cHhu+3uGH13NKG1AXHpGbTrChiS6k28=;
        b=ciUueGu+6w3Fw00LrtwikQ6r1s290zbwEyj+GpnKKsHji6/wbJy0uC7s2CDEjfRla2
         p9A7lkM1ZvJPmwsaYRTwYmIw//X9mYJxEO2vzhl8IP4GH6ljxw2nZqw+6qXJWtZRNWv2
         frJh5reEqFZEsXwA1NAjBqRjrXJYzE9I+OwYspcZLabcKAfDc8+Y1ABeYGPzz9+J8muT
         9/KCeR6toRAyb7fMINjFk0B+fwv3xXK2P9WIOdwehSdQkUVMg3lGliG47+vfw74T1sTh
         88XawIRMF0wBB9CDwqwgT0izr3I61y+2405ulddrzFe/Z4dqoB4JywktUnbG9txvo4VL
         XXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z+mSX0GUE6e+cHhu+3uGH13NKG1AXHpGbTrChiS6k28=;
        b=ZjA8vlKmyrAQUUJu2UPC4mN2OfR9/g6GAWvZCWnjDPAU+wNKX9wgZO3dPXkgyjoutf
         K4GeaWGhyH0/vmVLf01jWLTBK/CHkkzPMKSRS0gJLZaXHcqm+WNaMRBfc8UuZtsgD/mV
         Y4q0ufiqPFRRV+Zl+iU5ISlQpYPyAUm9SGS6sAL4rOSdjwLgetuKIdQlyFKQgQPEGLzW
         ivyIoMrH2tWxJ/R/KnkZ7xzYkRz90BtQIaRj5Vc/T0e+BAQnR8D4FwXBg71DlW/kTDNa
         y6aexANLnmeEQoHoMVzWAHJPD5k2pfa8I2FfgJ8wNh6AeP6Az+PCaqPDbeLIzUpHU2fk
         E+NA==
X-Gm-Message-State: AGi0PuYJy70Vd+oFkslq56GEjMBFG8OSydCAK+NK/28wVAlNEIXqhKtt
	wZGTPcK+XsmGpvzg5lUzthcu0dfenFI=
X-Google-Smtp-Source: APiQypI7p/5pfN9ipJjQe2yqJWoUqqqrLM16JAjLmYonWWISV8Avx1QbhrAmNY8an4UwKmKXQmUZ6g==
X-Received: by 2002:a05:6a00:d2:: with SMTP id e18mr6300882pfj.305.1586394520593;
        Wed, 08 Apr 2020 18:08:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6fb4])
        by smtp.gmail.com with ESMTPSA id q71sm706635pjb.5.2020.04.08.18.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 18:08:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] multilib: Enable multilib headers for musl
Date: Wed,  8 Apr 2020 18:08:53 -0700
Message-Id: <20200409010853.3775270-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is no longer needed as we can build multilibbed images with musl
now

[YOCTO #13122]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/multilib_header.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..48f231eed0 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,13 +6,6 @@ inherit siteinfo
 # all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
-
-	case ${HOST_OS} in
-	*-musl*)
-		return
-		;;
-	*)
-	esac
         # For MIPS: "n32" is a special case, which needs to be
         # distinct from both 64-bit and 32-bit.
         case ${TARGET_ARCH} in
-- 
2.26.0

