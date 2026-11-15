Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4367.1794732532014522822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bq4MGuT5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2749992f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732530; x=1795337330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvJlynGnWWoT8SaOwiitnm2zwS8mu77Rhhykk8x7x7s=;
        b=bq4MGuT5/eC32RUv86SQJZsVUnLS8aMJUCuJxySsjlaUEtNXRD+OnBY2FS3C5aKT2i
         wWQCcN16v7Obo8LtYf/Icbl7kov0Lcle096p0ysctIdd7G12MB+1smbFWEPaQN6eS2lp
         YjNZpgVeQeTarHAODfxb6TLpPSfoonvdAkjnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732530; x=1795337330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WvJlynGnWWoT8SaOwiitnm2zwS8mu77Rhhykk8x7x7s=;
        b=C7MNar8ywYDjXodZenbhfbIGW2hP0drrI4Sk3iNfMhps8qVPRZmeh90oiRAjwjncks
         ao85wrts3ziWMELKRnRUzqfWPO75QbZHol+C147Xgu2ttGP1A4Q1ZkUBnSvbJldUyxds
         L3HSmEes8jxeeN0sW/AXoooOq/zvMvi2kEQnY6Qb3OYR6t7W2mUtfu6GztKeR1+N3aP/
         j9k/VGCodZyGauw2dSxWq1OuF6eQ26sy53mrVYUDuTEkabkfjY3vZVylBuSMmL+CthXf
         6jdXELjhNg6mfpvUcO/fNZys1YX1CKp1lnth/1XJpauleO6zF0hfIR4sptJ88BLeAFIx
         EPpg==
X-Gm-Message-State: APuU4Z+DQeyZBvG6h+0NJCjy+hNbWRbCVDS+SzfiCPnNHax4+WRtsKw0
	IVrbtmlu4P7/PSg0ngOfnSH9wfywvftVnonIfz7c66/rF6JDINq2W5pIekpfSqJ5NV0fKuo2Rfz
	W4hhHmsY=
X-Gm-Gg: AYBFou35Gh7BeHSLQH1ejpUKrTyN6IwaE0hDWSKxiuDM9o48uV0RLgW314XocMAPqoO
	D80nxfj6aSAcWGmEqn5R+bQ7GoPSy6Y82ZLQaK5Jzjwp2Bt+PsMQ6nI7TasP+vpPKDxZ0UYdpWL
	9Zy6rsTLqJHh86rNdXdSwiqGU+T9+3jjxmFE7//TEOUUXbZEyu/XeoiIIKFbaUbJSR6NHc56lye
	s5izTympzbZzmPSFGMhGLOOCYSU03QvCEBjcqJ7dD+GHbVo4ZNUUf/3hWIZSjvwHMwnYX8/e4fq
	0L5fldfbCPcU4eCNNEdZHXrtgIWY5xox6dopQkfaGLoRkegP4yEhWK88fQN5S8H0SJmWPkOpw9W
	uV2S7ZgHFEidPwQzhgjTB6WpHxA13LFidyi0quW2AEiYauZGumUI3HbiwsxXsnKnJka0ePta85g
	jYkUex5W0hKi8LF7PZ+pQyCF6+KvSuh3j7hzq+ipKdkx0GsGEQY41k+5NPQHuwP9Vup8j3J7gx9
	sYivOq8OnF92WiAz2EXfB0/vWt491mpmDGiT2MF4xfLgLjOdp8DHw9BaI1kvVc6fUCEMVlCsart
	qU8upajK7lVf10z8rRqtmvKVDgP1nPbAVCKdvd0i43MCfUVCmkYZZZDNcg==
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr10833893f8f.11.1794732529802;
        Sun, 15 Nov 2026 00:48:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/41] oeqa/loader: Drop code for pre python 3.5
Date: Sun, 15 Nov 2026 08:48:04 +0000
Message-ID: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250232
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
