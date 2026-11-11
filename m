Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5582.1794387809556795451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IO6skw1H;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19843795e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387808; x=1794992608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TBH1M5bT0jW4uIx3NJq5bAKSfphFvAvmA713AKE/Ilw=;
        b=IO6skw1HQQlAsn3JBYnvDgQ+ber3dtAl/RUziQAVYxBNAsVu3l4wGl0wuzu7B1ibT4
         X998Gd9nung45OFimUlVm8jbiyHuHIeyMRq3RoSQRhq/0JPr8oHbwkpFNDNOSF25oqFR
         Ci1hW2+0zSdNpKQbvfsOz4w9KjEO0eCatro4uT3mx0K4I1rVLRik9+VVpHzgTXE8WATC
         XIZWpwF3O5M2Vv+06q0GZw+6fHW7f1+wTc7N1j7SDCUwyEslqY1RlPgOyPNa9+DxK7yP
         rJtF8isq17vMQTzLYLZFpmssDxPzIPWeCip8ObtDSChJJ0iA3a1jC3iu7dRQukD71yYk
         oEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387808; x=1794992608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TBH1M5bT0jW4uIx3NJq5bAKSfphFvAvmA713AKE/Ilw=;
        b=crsxEHOsqPaWJibJV6UQZJUPa2qYUz19QN4Vrehrh115jZ+zMh31QwFss4opBAe8aR
         6Wv+PaS95fDU/fsK5a8PKxlHKz0BThvZ7AXtYI5kd34YY7yyGhBp1FJUKSmw8WwZN6/M
         lnaM1PIXgmp1Rho4VEPgFdq07v1XHJoNKpjyzCusmgGU9xdQVN1SYHqw/4Dqco9zBF4m
         K4yc2O+QEybyfNEUhDsoqyNNPMRsXZudUT0eTSImqHUEsWEBg/dxIecmeXBUL0SLCpcy
         76NWH4wnaD1FhWlY56p5JXZ++OSuV8yBdY4caqPepzJhesjg0dpD7H/glV9Sauecogyx
         PlaQ==
X-Gm-Message-State: APuU4Z+DsYQiqThljhOO8Z8K/66miRsIFQDYgSx6QptG6fvOfWW8iu1U
	MDODuENQMx1kp1jz8WnCkx8RnyNelgy9TXqqoGCDWKVuFyIePuyA+NoswhVmMykGYDnx8MK8mgj
	a6VjMXi4=
X-Gm-Gg: AYBFou3P5UeG/pV68KSVDS0z/I+7GhnJlj/ZoG04gehtQ7tHQjP/yDBOJ0ELX80xIa3
	O4tI1fe4h9i4uMtYKqZ/0l15OIMNEUN538ll2laZ7AK0OD3qG4PY7Wvn5AyhrraTg3g+y9d1j1E
	yrQndAU1HUyIbx3eaIxTX1GEstsAslENzCskPZjcnfcqqQ9RDghJU17wOZK4C1fvMgT9zX9Shl3
	wFUR/7iAtzt9Txhd+GbviUJ8ZCEbHoQEzFm+ijiLeH7X2PeEgcdPDGJayKTWbs/HnHzsa3J38PL
	Aym74HNXmHTvImuwShzbfVTJUa9if8iBcq9rV0OwbRIb5OIs3BKoQYZtTKmzl0yeo81hSUnZH5s
	qP2Lu4KM3zvtiVLlx9GZCHwaonXkx8+Wx6rCTs4WarqIg59phf6Ngmwd6L4qm2FC+8cfoOPMtoJ
	lxTj5Jeilus7fn2FpC1+zXLADCnbto83340hgeJmRhiJArg9rsB/1G5orRu06w5Un+wHBCXN2kw
	X5rhwb+3hPp3RUvogUAfnkv9mCb9v+9+or41azKprViJ7PHTSdIHtq2XrAxSWxc7A7/mnvBXoIT
	fwlNnOP42NkzamDnIwSX0O1HX7A3PBt2NjLySvW5rWA/Lce25J17J2Y8gsM+AlykDgaA8r3TSDh
	6+YVwjcTcETsSuqB5kDr2FCLhbEy3
X-Received: by 2002:a05:600c:19d0:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ba093ab25dmr27840065e9.16.1794387807744;
        Wed, 11 Nov 2026 01:03:27 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/35] python3-pyelftools: add missing runtime dependencies
Date: Wed, 11 Nov 2026 10:02:37 +0100
Message-ID: <120383a88934ad5a5653d9400da395d1d5873415.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249983
Content-Type: text/plain; charset="utf-8"

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

python3-asyncio and python3-json are needed as runtime dependencies of
python3-pyelftools else the readelf.py script run into the following errors :

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 87, in <module>
    import asyncio
ModuleNotFoundError: No module named 'asyncio'
```

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 77, in <module>
    import json
ModuleNotFoundError: No module named 'json'
```

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Wahid ESSID <wahid.essid@se.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0dc1a2f9df58cf2dd1418426e38e95372aecdcde)
Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 7e50cef2488..76cf22266bc 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -12,4 +12,10 @@ inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
+RDEPENDS:${PN} += " \
+    python3-debugger \
+    python3-pprint \
+    python3-logging \
+    python3-asyncio \
+    python3-json \
+"
