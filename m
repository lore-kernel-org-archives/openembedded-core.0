Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21639.1795285845246367802
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 10:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vua0u4UG;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so2844791c88.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285844; x=1795890644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGhV3w6VGm89MLWSKLmVLx4eIxX9WEem7+7EGoxdqTw=;
        b=vua0u4UG8YZMd6SZSBPLA2BhBvzEPr86xEvX/THRNCnMSwIeBY8PsJMgIRVvAWS6Uo
         VMcSrPN9nRJSU2gRaRwPeLtju9xU4CaJwCwA4kCxZDgQav0YDUQHKF+5/l9qsfdaaaXz
         7WWIGnZlVjxwgFEiEt23RvZy8SoI4nHA0BSJ1A+Gmvq0J9x+eu4+cjmOhDi1Vpv1XBVI
         epGEHZdCFKGQEXIIc8+Z7JXvJXCgTTbiHOlZ9aE72zXxtPDvySQdRyOLSgfIquBTcmVi
         GgCSHRQKQteqNZqvA60AhynbTKK4HvUn+3xl+7BbW5EwrftkJbJC2YCYUIfJMyNbrsuA
         iXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285844; x=1795890644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGhV3w6VGm89MLWSKLmVLx4eIxX9WEem7+7EGoxdqTw=;
        b=XHML5lx4k6u8t3S6QQnPo7r8qDUSOxvN2von4cOutBkyR5ECVU8j2YXrRKSdPGzZn4
         rMgnO4kDMcS9I+o8E7Qb9mf9QWXmvsqGXWxaJyROxY9O82Ferx4/6dtkvOCfnTqDF8zt
         g4mS3NG8Sh5NCowMlG6oRXL3LbOet5tz4CW3XwHqo3snO3DU9FlVtcHHNHrhQc05vRT9
         phLJ7Y+TLUpGJRD54p1zbrnY4T8J/LoPjADJzUgsDn9gRFtoL0p42N72PQyXG8kIIKXD
         zzFWMueY/McMqeG0guwd0Z7mZUHfKN38Nsnx6z+CZ2njFDCcfp8p3GM5go9RlIHxx2/M
         5w8w==
X-Gm-Message-State: APuU4Z8nHH3mIqJCOhah2xtm18hmyc1DmlHqLnvlTmFuO0dx45+RXtPq
	JAsAeUuhE4gyaFJgnj5CfjRlMzesGXfInm6cQSxbM82DkO+zI8YqkFPMeS5AlrWd
X-Gm-Gg: AZFdTZd9PuhoAHJ+RHa8EE7m8h0RkbXpGeGQqBLkulZoehniIUhXYDUBH6CZGuGFsgF
	Jn3vlucl7OiRTrtA5T0a6/0T9CwrkJHDKD0kKJKe0FGEG2DWSQy0oAMKHc0Fjihb/VOuSonut+U
	qidW4M1sJkXv/kjhjlnsOWz9yO4g6sOGVaIawwW5wiGCYiqwdPoQQeWgToS+3tAdlwHKlBvT4oF
	aV0vEKJBdT1w3CO9pw8DH+SFbaEhbg9CJr60lZ6/NCOrDcazEeu+JPJbPJouf2ucplbkiZLbHPh
	uX0jvVuWKh5G+OXtrVkZ/fQNvxiuRWCxswFhlXKSIFI4fqiNXr9JB5/JabrKztmbajpoyxCJdKL
	2keHGNap8+foyncMqjzvQ37LjCF/UU4cOr1YhWKI0j63lg296XSnBoC1eTJuICnmSZa4WJMBw/j
	JkMPTjKSoiA/Rc6PefHtxWqpiDpXahBdsP8CA58DxzXTMr6TpDIVMBCxcd6tvavJ6MEHQl9GIDR
	wfN3tQ6ln50vTbtIusPLJ9agMeD2oWs9ZF+wsdUZzbzuRU+HWV/PSXqb0scGfPTy59N0st5nm+g
	z5Jp4qKO1p6IzzbSCf6XoOFQKxMoPPNnLlXQZ2ZPuSn1ZQ7OgEF+IacpyGsKRnb9jf+uKmWEM9U
	OzgIhD19FHTLwZsk4EGBa7Zsw4OqhJi4B+MdMhhHpIH7fyz5AZ8BuHfjaD+Kz/FdoCRJRe9B5r1
	Dxcbva4/d9qn6cUEDph+ubffkVj8S2XNo7/dR1YRw/8HkhaO3071TYHnIDbHfLhgpw+abaWkIlD
	Bkf5vMU7fETZhhH0eRb03CfPNcsBZM3VmGsOjwx8GjaVKuqty3GjLU596jfL3mVUFZjY8sDL51E
	oQeWobwlLJUHHmGFWGRz8gSE2w==
X-Received: by 2002:a05:7300:8807:b0:369:5583:bf4c with SMTP id 5a478bee46e88-3856ff5bb62mr6984466eec.28.1795285844188;
        Sat, 21 Nov 2026 10:30:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm18439671eec.16.2026.11.21.10.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:30:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] musl: Upgrade to latest master
Date: Sat, 21 Nov 2026 10:30:41 -0800
Message-ID: <20261121183041.1446195-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 18:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250853
Content-Type: text/plain; charset="utf-8"

Brings in these changes from c4e1bb3994c1..7813e9119eb5:

- floatscan: fix an out-of-bounds store at index -1 in the mantissa
  buffer on wrap (seen with 80-bit and quad long double archs)
- strtod: fix the underflow detection logic so ERANGE is reported for
  every inexact denormal result
- regex: avoid int overflows in regcomp
- fnmatch: fix bracket ranges with a multibyte endpoint, stop matching
  reversed ranges such as [z-a], and stop treating an invalid byte as
  end-of-string, which caused false matches
- newlocale: use C locale values for categories not in the mask when
  the base is (locale_t)0
- wcwidth: fix an off-by-one for the last character of the tag and
  variation selector ranges
- swprintf: set errno to EOVERFLOW when output is truncated
- SIGEV_THREAD timers: fix a deadlock when the timer_create syscall
  fails
- fcntl.h: add the new fallocate operation flags from Linux 7.2

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 59364b1f91..cbdb7178f9 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader multilib_header
 
-SRCREV = "c4e1bb3994c14ed5112c894d15a451bf00f0d501"
+SRCREV = "7813e9119eb5fe681b6750b8a033a0490bca0941"
 
 BASEVER = "1.2.6"
 
