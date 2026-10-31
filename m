Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3738.1793405756422161222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jQx3X+/E;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so16511585e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405755; x=1794010555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KpjrTlL0tGUsVt/Qk7sQ22nNeHP+z/jz0lZxweFvlIY=;
        b=jQx3X+/EUW7KKt8qm+iN/keC2jwx32Nxv1djxOGm8lvjfCuvOuz1aG/S0qTolYneR1
         0EqAyQnEeauyeR/OB2EIFnGnNeORzcYLMgoRodjkOpvp/DEYKknZY8TXKqt1B8Gu7Ra7
         w5R6zhZ3Bs5fgaNcC2qAB40PtX/w4OWcWsOpwYgSALjTdL1FYAX4FKUrWWFct9grOSga
         muIOVZOu3mbdUeOGr05iQ5+77JU2XVjH80SHCo/mxpiZ9KeXYey3jXWpOfe6KDIY6Bvd
         QbiUjpWHunl/Vf1HWfaX7EebTuyzdcmnr6ewZEDb6QTIGCqVx4BjwclEtmjG8dwgn/mz
         B51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405755; x=1794010555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KpjrTlL0tGUsVt/Qk7sQ22nNeHP+z/jz0lZxweFvlIY=;
        b=OcdOiRw7A/5wcYJRkvVMhytY3MKFJ2soJOG/x0YRzgLcJvQNTKzCHnl27qJK2W7OLs
         ILqohIJmjjM0S1adWSxnB3jBp+CmAwIOzWzITCHgNTkKjsqbTkctZyTBtPOgrDIl0dMf
         uWgNs+NDBqjLEctiFFPcR7sNtmwFoKf/osvjUzZFjZjEpnmT3s4hevHATHatS9YaWs8Y
         zZmiK/UQupyBeB1KUMLXS9knryyd8Qr0zMIfoUWFiNhpLBBdLQR7zK1O9fOrNET0FTUz
         Zrazeve5qJYvFECOP+4Eory3jy+D/nwcMMNtvpC++SrZbtUDvEIe4wg9BmWUnipEKooQ
         WDNg==
X-Gm-Message-State: AFq9FYL77aabAcFyV/kSbnp00yQDKyZwP6QRp8/VD7ALeY6cAMWkbR6r
	vIP99n2y4Jt/ts79KxOFZ0E4C6w4zUtkCZs2muzpU7bMCc4a848RzFUvFpqv6cw2zd0ZVVIPMmp
	YK9nUVVA=
X-Gm-Gg: AYBFou2qRBRy0XAUCuX3yAAxpDQg6umGO36u15xcZjuNqxdsXTzI/21IiQxf90CYRox
	7b/s+NXav0wyTq9l9NxIkRd3x+WAZBZduOz5+yDtev0LneSjcF0yxkIT7+QiQqZqdwDLks6li0I
	nwWMyADKvuipc2DZoShxS2wqCZJRhnkSZWN8EYY4CSFr4jKalpYvR3ssatogwNDLlJU2DY/oMk3
	k2DJ9qvKG2nlroVIUtJ/XypbCwfSZeIoVSTdL0K1/XxKAqkmAJvIGnWw1VVFaS3vmdOqWwaXyYM
	43EZKsh8PHDYXiOmZ0anjclVNZyLghfoXSL8mUpiCt2hpFHT+isvBPBHk0bJ83SW0QPRxbG9Iy/
	vi2+pNUGayJFFoF5zOeQeslLvGUtzwJtqQIjooXKwT13nKXrsA4uvRc/JvdrdxIoiYJQw25yQ23
	an3E4DE3Nel/eCa4m8pnBBb+Dpqk7U1HR48JdamOPmINQf8Gb0pDhiuOkzCnZo8aZVlAhTJCvlx
	RWUwElAnMudEisDzXMdMf1GW3ZZGHW7Mu94ZTTHS66TwkDAPslh1LztcnMz+wqDLGOoXA8Rfy5o
	rTtJcMS1Vo3eN5kCDQR+PTDfc2E2YmN8cj2JSGSqGPAXut4lwFBjz/HOcXVZsE41aO8QDRocnLk
	FjrbxT7SIWkSOt5d88V5pThd3n9Ba
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr91933265e9.8.1793405754707;
        Fri, 30 Oct 2026 17:15:54 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/55] python3-pyelftools: add python3-logging to RDEPENDS
Date: Sat, 31 Oct 2026 01:14:41 +0100
Message-ID: <4b2e21065095076846b1667c1ec875bb912021b2.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249095
Content-Type: text/plain; charset="utf-8"

From: Theo GAIGE <tgaige.opensource@witekio.com>

python3-logging is needed as a runtime dependency of python3-pyelftools
else the readelf.py script run into the following error :

```
Traceback (most recent call last):
  File "/usr/bin/readelf.py", line 31, in <module>
    from elftools.elf.elffile import ELFFile
  File "/usr/lib/python3.12/site-packages/elftools/elf/elffile.py", line 29, in <module>
    from ..dwarf.dwarfinfo import DWARFInfo, DebugSectionDescriptor, DwarfConfig
  File "/usr/lib/python3.12/site-packages/elftools/dwarf/dwarfinfo.py", line 17, in <module>
    from .structs import DWARFStructs
  File "/usr/lib/python3.12/site-packages/elftools/dwarf/structs.py", line 10, in <module>
    from logging.config import valid_ident
ModuleNotFoundError: No module named 'logging'
```

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
Reviewed-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 9b956f6b5a345bd3022a9e64fa70a0365bfac502)
Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pyelftools_0.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
index 837edb71653..b799f5acf8a 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint"
+RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
