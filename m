Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.603.1794930407214915954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 07:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AGo7OOZV;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2600741a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794930406; x=1795535206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCvu6B8MqWiy14hJGpLbuk3yIvITUHfo1UrfNTFhgR4=;
        b=AGo7OOZV/H1EoeD+L7ftgN1d58IhhMCx6cw7prhRAUnPsx3QZ8u5L2tFFkF24MNyVf
         Y/xubOmd8Sig35cAXimHka+iotADfjeOYswqXo3WXJfz4aSyY/5+Oy4ZwfuB2GKXdb98
         Bf7nNiRxy4j0ntWAlKTsrY891Qers68vHGlMGPAwMZ2iRCErmAE7I533nyIFGzrkDYGt
         H8aUbTg4tkY9fcVrtVQa6AfuI1pJZg5fWao69NrdJfgpjA/eK3pNlUcxUbFgaJ+D7uIx
         nlbo68L6rqe2Ndnxdm+zWwGudo/ULtzuVJIuVMGcJPqG06laxOxedragLyT0FTjw2909
         fmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930406; x=1795535206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCvu6B8MqWiy14hJGpLbuk3yIvITUHfo1UrfNTFhgR4=;
        b=d96K//tgsLWHWhos2ztre+lavOJXx71fyWTTpUNPIKy0gbai6twGgutUBuPIWes71e
         4AAzUwXKZJMBZW42CjOfFil8pJGoyQwMOWKKqiiUHShXexS5NfaoaWWOT4iH0Ecu0EvZ
         tQInZjR6CYoXJcEQRlDRzlGKlkH5ecLIKj5ber3c3B/ACkGY+rOshYEew7gHrMwDxBm0
         JqSP7zrzx4t/5re1YRiIpfU2MoJ3exl4J9gdi6y/MRe1dBaGuNN/J5g0Kz79L0VYTtgM
         S8sPg9ZBFQYZq3xXBh9RP30Busn6h5yX7h8IR4WGHH4HeOdBw46aiXMj/uxvo/tONovx
         LjyQ==
X-Gm-Message-State: APuU4Z/PPnpysSCLpuPGecbNc2XcCWp6Y7myEco0IpMwPUZljCMb2e9t
	YCmEXZ9pGZS3wbOE6pSPJgn+4TjWUG8T+oMFXemQ06y34DDgR+ZxRB3d5iO11Etn
X-Gm-Gg: AZFdTZezPPpcJdD6UkFlX+4N98gD4jiZ4y4SofC/wOyxh3lvSMvZRkCytmk5jZ56kQa
	i7TAWqANLOiW9EALeQb0vJ/ZIrBmckSDHGMKiz9nuOVKbH6Q+L3EOGl4IQQ2Z7TU3NFxJ2gbMrE
	HBMT6EuxdqwTZe7LZBgqQzpvozUdqMhX8Lmwg0I3OQgOLfPolpvjAPYX0AA/S9Ivhurn2it6Jru
	tSQtQCwZJgnfzpE0MEUegzZm1cpTo6z7KOOVeqOMGjlIlgbcrxpJZeXb4GeNJLWgRTFbRM3EvYN
	KRMGKZsKJBgTCXL7KmgT5cJ0sOAenH2Wv/D+v0AydWX3UMkf9f9uyltB8uJ3YwSxhDC+0YnLHmw
	6wVIC3moGdJG5O0U7P2nMyInLFtKpmWqAyoGgIE1KivFeKTwSZL5o5jT644TlWkXYVaEDvU5CZk
	/RI7Zo915C29f8pMCcl0KZNfLmBFpayJ3xM9Kfxvfxptm/KU580PnppIt9TlOvan5MsFkums3eH
	CK4obsuaDRMrJJfQy8iVOfSooirgzCTy9zDdGTmXNqQJc6sDfBIGsUBzQ2aMmVthNlSASYOi5fs
	rCba354X9abf5YAAInxzmqUjaBKP+FJeEGpSUXnwxCrijemMin/DdpMz0+xaI+oCT2RdjxdqBxv
	jgaSjlo/41NTwK/F0Gy9/0C2WQqNL3ZvG6RL4fL3rFhF6DpKntML3R03U0nlYHO5AF+8cxkq8wt
	1GLC5o7jOtiXZma6ugMP48YkQafFduv/qrHTdcwLMQuZjPIxPmiA1whxCDJEowQVlje/Vv7tBLw
	wCgAM+8CozdMIYxfCzXW6TO2WfUl3oMga3enV5iIsXguIAl1Q9EqCjhA+YB21QhxEC0UkAtLek0
	cjR3
X-Received: by 2002:a17:90b:3b82:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b1b0815b3fmr14985634a91.8.1794930406349;
        Tue, 17 Nov 2026 07:46:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm4565511a91.11.2026.11.17.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:46:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] python3: Package _interpreters modules with concurrent.interpreters
Date: Tue, 17 Nov 2026 07:46:42 -0800
Message-ID: <20261117154642.2896989-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 15:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250460
Content-Type: text/plain; charset="utf-8"

concurrent/interpreters is packaged in python3-asyncio, but the
_interpreters, _interpchannels and _interpqueues extension modules it
imports land in python3-misc, so "from concurrent import interpreters"
fails with "No module named '_interpreters'" unless python3-misc is
installed. concurrent.futures.InterpreterPoolExecutor needs them too.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 50fdf5d0ea..71ca052d91 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -117,7 +117,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpchannels.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpqueues.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.so"
         ],
         "cached": []
     },
