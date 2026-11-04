Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3450.1793750807734291127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 16:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CUT5Z6Wn;
 spf=pass (domain: konsulko.com, ip: 209.85.214.181, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987b4a710so6891065ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 16:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793750807; x=1794355607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tjvmJUpqPcMh6D8tR2G+c6dV01mUh6m6gPvVBe58Pc=;
        b=CUT5Z6WnaMm/mSJPqkaFGW3zlVGFVHcsIf4/8za9Tg6CjEZWXvcACqipzN6k+N3LXs
         60JtxHbX9AlZ15rk5eQdJMdjEj88ocGlydJPMSSWpmcFvUsMCb5pnlBr73UpAj5CJk3h
         3YAacLzxydKLgdoPxuNeDEf9dNF5jDgMgrGcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750807; x=1794355607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tjvmJUpqPcMh6D8tR2G+c6dV01mUh6m6gPvVBe58Pc=;
        b=Ke2UNtbIRRL3ax2vexkwHCnwoO3XbdXwPZc5TVS40Mss4WAEFcZoxBLI0aAVHif4pF
         /IDZGvPOyNaBLcr/ETk9XnG/EEh3RQ7LNgQp4HRGCXHllzN8+Y/q02jgqNMa6X3uf++j
         7GXYEkfbD3l9dY0mzGnvIt+sn2y7sMgi8Ve2leDyOS7YDOGvOQlvDuaMx9TpdIp6b9Js
         MyPLoQkaZjkKAF/GJyuua1lDNpZnirgH47+aD1ckrLRkfcHweS8EVWZgOcEBPgippJsd
         IIIL64rx1kw/z6OvY9vsSdaz1ic77qfT2JgmTBH7UMKkaHZ/sQfuwmN7GkEnhvFeJAuf
         QNvQ==
X-Gm-Message-State: APuU4Z+fdLf6H+rXgm+ykjzzv+xV9prailrBttTm8NnKXAKwVhAYghKi
	3T1mcT40DDNQWLeMDP+IlJeZe7r9IoiqZgoF7BCWCgxvyVCmMDw3IszODRvJZY/XhnUQOpSIsAv
	5BDcl
X-Gm-Gg: AYBFou1I0W76PtOWxRO9OroY/XL/NW1Ee85kp8H5ja9Ad+RvlQMl9JNbPzfA4Vxsu3q
	Smdz5sv5UROIB0iT8KykmOUA2KKR+egM/1MWS8ME7umxKlW5x43IO3RTRK802WsAivH5FASYt4W
	u7E0tk0R/kWluFQkujKB9XEMgyikXr9LI33WF+83358wNUMeJRwlP7eTb0fsEdF7Mz0u/uJSv3L
	7O3XCIC096D48/QGIzd54E+8DPSoJVz/ZMAkdLASyh/xd7GJmo7wIe1/tGRfLJW3zerN4HttoQi
	2udm0oa1ntn+l5tzFo6Nd18SA7CNbLCIi6G0qJWoKGaHrY352H0zCcg3kABQ/63D0OFiIzc8pDW
	Ahz/vX2bFYdgjYYPsOdcFMNHVkqKajwQkVcg+dVzjhyj6WBOfAVnHNbwUuAxtrIi3EHAyJhtSt3
	ufo5VK0Xl1KZKNNvYlwsvMtMmnACIffuIRvIiDg0a4orpv/JS1MRxdLAp0WGmsNFLI2Gs66GTOA
	LJZnkDNE8bCx6WD+M6fQXLflcnLP6LpnDbpw9zLwWkZTUTnc6rDIJ/2Mp9k7rFXPVKTaK7CsLgp
	IZPgigyrC+qySPgdRnZti6CEx1alHEL5z2MhiCj6QKDTsARwDXhTzwUbmLTovYiJ880fS7494Wb
	ApJMescIKxWcVCrC7pBhNNtC3+jc=
X-Received: by 2002:a17:902:d2cd:b0:2e9:5d1f:dfee with SMTP id d9443c01a7336-2eb364d1483mr96737025ad.25.1793750807075;
        Tue, 03 Nov 2026 16:06:47 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed088a624esm588985ad.0.2026.11.03.16.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:06:46 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 5/5] python3-websockets: upgrade 17.1 -> 17.4
Date: Tue,  3 Nov 2026 16:06:29 -0800
Message-ID: <20261104000629.3345377-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104000629.3345377-1-tim.orling@konsulko.com>
References: <20261103193829.1806542-2-tim.orling@konsulko.com>
 <20261104000629.3345377-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 00:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249313
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
Changes in v3: none

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

