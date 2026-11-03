Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3011.1793734910975327223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 11:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ecOwsW2G;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5fb79ce82so30047595ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793734910; x=1794339710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxYJVeyen7gHFPNAcTuvhYQnXwEVIszNV0/ajp957Kw=;
        b=ecOwsW2G8bk44kDzsJXfA6s+yYgxd61SxmmPkrDnssVvoCCX0UI9kKrnKzGBEdz7jt
         w5SVNpp/++vo7j40TuFxMPypSQOhsRt6QOOGcrrBJs02QAapDO2clz4aI19zCq2pZCus
         BE/eX43xrtilmLEholK6+PzSNPG6YnLKz/uMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734910; x=1794339710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxYJVeyen7gHFPNAcTuvhYQnXwEVIszNV0/ajp957Kw=;
        b=OIuqeVpS4SAZsHNEeDKDRbuOdc3M4wSy/BoY/rtjwt3/MGQU8t0NIzMVEBGgQx/8aY
         fErsJgfsvIx0kL04ydqWptIPyMlogI+C7JGAR3E+3GnGqfPl4SV0mJTBk9Rh0ZDU18OS
         dGSvNCGeMDnRZuSa9DXFnxTnQzT3T+YE82wULfIJJSCIH7SkOIodsqPVNWdkwTYSpd61
         Ecd7ASxx6p3IKTQYmYc2+oD3ooda2K6Q6ANK39iH+dC2OjT2+6X6jAGRKl3/U+p8lOkL
         opji/W+B6taOusE5mCv/5G/sAI3uk3zqUl/Kk/Kx7pilk0tW8glT1UuCawaoCJrkeOnl
         ZWJA==
X-Gm-Message-State: APuU4Z92pCdd7aEEPELz9vsPxBuvVPf8lWovbQeVLHBRNne4CYnbTKbw
	uGTuSU6aWbMjKcBZrQ1He9xL8GnuPd1GxMVakbSZjfJao8xdwi+Cg1oz83j4crgB8tLG5l/SKC0
	ymZq+
X-Gm-Gg: AYBFou2To89BiTJVaOaugj5PdqnFocsMNzOWfwTic2gOECBEg33GpehwKOithpCAMaL
	xs3DaawMFgenmzwtWtEtmd/Cd65vuApJhUv+gZaiUVfrPLfF5Bo2mXrBcho72CgMAdQ5Ohj2ehG
	CLi/wfSiIk7IxJN1cO66F60BW3Uq5bgkmPeF0UIkyQEAI2z612PHL8GpviiBbjLJcDzF8j8vGUl
	ssQ1C61uZ/rQ3E7ocTqMXYvlQHflRFZXAWrz5sksyJM9HrHb1kf3YaSACB/VQVMb/NAxRPY45J0
	OyV+i2TUm6P6M5mNj3rY7slCnb5b9MiPwdpTcUYfckVsV4FZEzUgzF3KIMnlUBuezcVVn/rXzLU
	lbNZ6l3SdxiyeTfHlAOJj63sHTggDzK7oQMW6ZsffWjq97Niq98pouYETDHUlE9auzhdCNaYeyI
	3FhV+Z05u5YSCZKfmUByd4ood0dO4ZiVydcWTLgrnh3r9UdTLM109dWq5/6H5KdZZ6C9kXcGXes
	i+oQrvsyZBl1JAhsLcLH6IZ9C7OgisnsppjextSxOo+4wQHVYlx+/hDY9K1EEIrSfzrN1Ky3TDf
	M0ie5G2a0el0idhr+nQspNCVRFBo1DTtvxNTCGJ1W0LwGdWcwLcZB99ibJPW+sG643j12DHvlB8
	ZpTy4GJVKQ6qc0k9bx9mVq+V7QtA=
X-Received: by 2002:a17:902:f54a:b0:2e4:adb3:c776 with SMTP id d9443c01a7336-2eb364b8234mr132945455ad.24.1793734910344;
        Tue, 03 Nov 2026 11:41:50 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm44562375ad.6.2026.11.03.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:41:49 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 5/5] python3-websockets: upgrade 17.1 -> 17.4
Date: Tue,  3 Nov 2026 11:38:34 -0800
Message-ID: <20261103193829.1806542-10-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 19:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249296
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

17.4 fixes a denial of service by memory exhaustion: recv() now rejects
fragmented messages split into more than 4096 frames (tunable via
WEBSOCKETS_MAX_FRAGMENTS). 17.2 and 17.3 are bug fix releases.

17.3 added uvloop variants of the asyncio tests, so add python3-uvloop
to the ptest dependencies.

https://websockets.readthedocs.io/en/stable/project/changelog.html
https://github.com/python-websockets/websockets/compare/17.1...17.4

Tested with core-image-ptest-python3-websockets on qemux86-64 and
qemuriscv64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
- Drop the test counts from the commit message

 .../{python3-websockets_17.1.bb => python3-websockets_17.4.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.1.bb => python3-websockets_17.4.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-websockets_17.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.4.bb
index d1bec373e0..a2357ebee6 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "\
     git://github.com/python-websockets/websockets;branch=main;protocol=https;tag=${PV} \
     file://run-ptest \
 "
-SRCREV = "e87ea9be0373edd5065b5e94dfa714cfde23023b"
+SRCREV = "625a59ed613ac60e60d577dd64b8641d59ecb2b1"
 
 CVE_PRODUCT = "websockets_project:websockets"
 
@@ -23,4 +23,5 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest += "\
     python3-misc \
+    python3-uvloop \
 "
-- 
2.47.3

