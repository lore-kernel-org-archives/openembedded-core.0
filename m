Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29799.1793868220328703694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=euZ8OwR6;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so320548f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868218; x=1794473018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oPCo+69L3GYSfOAo1ArHi8b7phpyYCQJoVbbGX7fbyU=;
        b=euZ8OwR6r0MdXtW0xl9PfgAC9B26Qv/ubzsKFSuygQJwYeHW02wrRRkXe8j6AhM50Z
         Odqo3pvSa7CrOUQ7eS1e8BNPasoABG13MYmNDWeINzi85jrPTS9cKMLmd/T1Grp2ckCo
         YTSzwE7PNn3IrnaXNzkkRyvtoD5G+IJ89fQA6D9WgEP72biDlmgAnnwAcEa/1PXN/71K
         bwN5YVUrSfMe8bKnHMFaopn/vhfnHAogPqilho/dH7KP7GrsVt6BjA6h2pt71pvpdGvW
         QwLgHfWWOzvvmaXMJ7OBWDA6E0gL7TJkNNNQru5Sr4XETddBOabES96D7yDcGaKKWQgF
         w9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868218; x=1794473018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oPCo+69L3GYSfOAo1ArHi8b7phpyYCQJoVbbGX7fbyU=;
        b=rChBry+S7I7mYDxDzS40f8fQT8crvq339k0CZo/mfPyl2Sc0ehKJgu+O0vcl4TEOXk
         /1Zck6vLb8TzIEnhnqkhGk14wQRILL7b+XnUwqUdjU9ayCCTHzF7oNXzNgTcW2zTUgGS
         RAiwCnq9e02nmNxan6v/YbBNy3LYbZiaUEifkUf5ie6Slz9WG/FftWE9COZXdmT30rQn
         eSVhGq66xw+zBlE9MIKBtgp8nlPB2LnwvticgPnuFAueoxTcPW8JgZwVApmg60dXAs9J
         nM5FH13PYEl65rLvQP9pGdipbQXMYBLQYjKQO4qYDeTk9f9ViBey0K54J/q6EhCJ8uN5
         OzvA==
X-Gm-Message-State: APuU4Z+iw6t4fn7gpvbay21Bt/2ruE9a+qtlaWwht5pnQKNtX2oZdSqA
	95JBtYVscPfTvRn9LU649jMbVJ50NHJGLKdYInBw7w1O8rsA1LAPFwUwrl8ftWNv3RVXdSPrOZr
	UEOyC7Jo=
X-Gm-Gg: AYBFou0maX+uG/N16iYafVdqfvSGvj7eVkswbpBjTWIgcIGCJnus5DoLi7xX3s4SlK1
	wHLGTFh2XTu8voRsL8IK64D67ty3Rkh7bgUhbpNHjKmHxCAFhLlyEkzSkf9Zg1SgoBrMuH9ZM5h
	Q7TNesKqf8CG8qicmc0xgmQYSTzouynuqUSNyZEHJa9LFBj9MG8rIJRvg++MCoQQI5hOgX5zUnG
	jwrDHUuiBKoE43Hfu06eDPb0Q/6JsNVjRbIM1tgTxcwG8wMba73RQXVz7/nsi2MLyReKj21LeCv
	pu5dFFeh+qiSQfLQfCS4ZytcHE3ay/oaCiKdRDNRp9q78HioL9Si5DhOS/oh7QHGRcQ5MAsLhHI
	llUhvTjfL2l6IXeR8pog2M29/0JWWFmjjIC+m0cAaXrbEtn0E5LnCHR6ItU/RAU6BrQZnSMfupn
	dRxHNcksAggCPx8T2NZP9daVByI+9dSpdATsDXLcL4/6P1KxxcsS5KsvAsiNvfgJDJjk8N+JnnS
	aoRijf/Cy3KKfxn2Dme+ZARvNPIl/6KwRvXHLrXg9n6DlwemVVwHOuaSb5W2PpKtln2mfeUie7g
	Hgu5XY2ABT+BPIp0wnL7wrhwmSj1NroUT5TSwT7rsUu9xhcNsp9NHPqLuiG6890TwfUVUYCbeVK
	UCmtcA7nUKCJ4mvdu/uupo0jUkL4GKpnJ/GSv1D5QHOK09N0bNQ==
X-Received: by 2002:a05:6000:1882:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-49114d4329emr3097350f8f.4.1793868218138;
        Thu, 05 Nov 2026 00:43:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 02/60] python3-pyelftools: add missing runtime dependencies
Date: Thu,  5 Nov 2026 09:42:21 +0100
Message-ID: <57ef674372a3d5afc9b4305a8bd2cc341e7ab9e5.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249461
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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pyelftools_0.33.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.33.bb b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
index 8a696407dba..724d5afd4be 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
@@ -10,4 +10,10 @@ inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
+RDEPENDS:${PN} += " \
+    python3-debugger \
+    python3-pprint \
+    python3-logging \
+    python3-asyncio \
+    python3-json \
+"
