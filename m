Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10057.1794573894514710854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 04:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=guuQrunb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5985675e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794573892; x=1795178692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvJlynGnWWoT8SaOwiitnm2zwS8mu77Rhhykk8x7x7s=;
        b=guuQrunbkbxrhs53XRr0AbAoe/+Fsv2pm/mznxnSHgA5ALRJlhXAemaDV11h9UQ4O3
         K1GTu+UMz9wZC0F4q5TNwf3GM11JIshZfcQEn19PjkjxJ2mLujJoIbj2/jf7vuX6cBD7
         Oq8Npey4woVL5AS7Ztiz2oW+b/PU6K+vCQKXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573892; x=1795178692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WvJlynGnWWoT8SaOwiitnm2zwS8mu77Rhhykk8x7x7s=;
        b=gOdZbmTUvuLM/uBFIw6OIaCv8UITI0IBh88mHj9z5wVESb2K6STPCnr5BA2VSywLmJ
         +/CtLNPt3oAfQwq7VtxJdXuXyXF52/DtQeardjes8sO9eOVKITI9CdszFHyLnSW4lcPc
         gTDBT4f8krlp+ktD/s8RVF4CLmPZ3IlKR8xu85L11KP+cGpM2TRJm7nV4/FZVCbQ5FBH
         YyB+qEoitg93H3nIsetVjWHb5dpa2TWhnZ/K+7XwCEH2hIEbmvjkBYWtfdVVrIY4VFBE
         MVB4+wFGQcmYYZM47tPEEm/5ZUM9XDRj7mqVPPXO3ryHJvUc3FDY67kaBvW3QMQ6hq7S
         QpRA==
X-Gm-Message-State: APuU4Z9ZPhaKPELb+1u7e69aBZENZHti+yW0EU3lJJf3ZWB3RxEj3xKu
	mugg6cPCm1kr6Vd37M9rcFe80KIO7BUt/foy+2yCFWA4e2OZofD1BaAI9lCLZ+hIvsgvwd9YhfL
	YZjjkeg0=
X-Gm-Gg: AYBFou3x8PoGsFUXwyKHF9LOBEiMGlY/I79MNit1zQEX4aZvBDn2ch9oU5AwbI9A+3L
	/x7YNcmSWqzbVs2HxJe9BXnN14SEeEvHVGZi+Sl8Qbj9yRNX4ezEBxLA+i9NRWYXQPs5uipCHGS
	PiV1WiCKqgwWXurnt4x+kCduWiMp/Dk2CkIAIDIwNxVJiO/1nr1OGNgyLs3s8FkJdmb6RcbLbiT
	Z6AydYHo74SIv2xSWoZeHRyl6GEj85aONIqZOb8BqBVYI9pppJsCs3b6yd/OgbFPOm3Oy3N+N+V
	+A/lbnekOoAqq9sjuBvwq02xG+f7u/J4oNwbMa0ACK0gzg8ZUKYuSFUiQHhBiqcNYWsMagchPq5
	6j2K2RFZtQpQabZRCRqrxvPD6fne0dq+kydZyyHqmbXXAw1bsRA3Cyu31rCtzDJgrjK/2ToZZgq
	vmWE36KtKUEXyznuVicDAtSvZHQXYDZCEfs6yJSG2JQJMyiF/Iyh/4M/noKdqo9uxGOuuc9lMJh
	ECgf7SPKZNcr7gOpqopJAhgeB5xAD7BTrsHCuh4sa78zY5BO4aVluIjnkGH8CfcstZzlLzivsiP
	Uc1OIq8BYbur7UI00+XXB1Y1RhyuwGnDmEQaW1yAm1xslBeaymcOy26j4g==
X-Received: by 2002:a05:600c:1c02:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4bb559f329bmr59783455e9.2.1794573892312;
        Fri, 13 Nov 2026 04:44:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1d86:400b:8b66:ddaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm257836095e9.1.2026.11.13.04.44.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:44:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/loader: Drop code for pre python 3.5
Date: Fri, 13 Nov 2026 12:44:50 +0000
Message-ID: <20261113124450.259295-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 12:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250168
Content-Type: text/plain; charset="utf-8"

We require python 3.9+ now so drop this dead code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py | 37 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index d12d5a055cc..84448325804 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -322,29 +322,14 @@ class OETestLoader(unittest.TestLoader):
         return (load_module, load_underscore)
 
 
-    # XXX After Python 3.5, remove backward compatibility hacks for
-    # use_load_tests deprecation via *args and **kws.  See issue 16662.
-    if sys.version_info >= (3,5):
-        def loadTestsFromModule(self, module, *args, pattern=None, **kws):
-            """
-                Returns a suite of all tests cases contained in module.
-            """
-            load_module, load_underscore = self._filterModule(module)
-
-            if load_module or load_underscore:
-                return super(OETestLoader, self).loadTestsFromModule(
-                        module, *args, pattern=pattern, **kws)
-            else:
-                return self.suiteClass()
-    else:
-        def loadTestsFromModule(self, module, use_load_tests=True):
-            """
-                Returns a suite of all tests cases contained in module.
-            """
-            load_module, load_underscore = self._filterModule(module)
-
-            if load_module or load_underscore:
-                return super(OETestLoader, self).loadTestsFromModule(
-                        module, use_load_tests)
-            else:
-                return self.suiteClass()
+    def loadTestsFromModule(self, module, *args, pattern=None, **kws):
+        """
+            Returns a suite of all tests cases contained in module.
+        """
+        load_module, load_underscore = self._filterModule(module)
+
+        if load_module or load_underscore:
+            return super(OETestLoader, self).loadTestsFromModule(
+                    module, *args, pattern=pattern, **kws)
+        else:
+            return self.suiteClass()
