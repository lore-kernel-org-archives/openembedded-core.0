Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.3406.1611009504999388380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zWC/7dnf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id be12so9402603plb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=12Bi/bqWkjVYeM/AgaV4JWA7o8Os4v2iEoklO54+Ri0=;
        b=zWC/7dnfhouzsYJhTR4aQnkWoHqylt83W2ldfErlJVtEYrjd7pSq/KkWZTfkCvmqF+
         Db7/rC5/d7H5XTP1E/t6UD8v3p/vNGGRYjif2aKmTcnHIyAasQxtHSyrUiM7I+uV/ifP
         jO4ys0d3wXc+GpTLACKnZpwEUDAlQQ0N85fWpUUPLFBpP0FH9ESs5boDiXhVogFnQ1Ia
         yJwOdm5sF8QmNj5pNd53qxCbt84F1BDQaRKroUC0cQj8rUjTaJdczpRYNI+rnovfBZIp
         ULuahGIuDeSQQBIxOr8uHzhZxELs8n8Jmg5GDyUlwt01ZGAi1GfYuRC/zjz5SMC26BkB
         XE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=12Bi/bqWkjVYeM/AgaV4JWA7o8Os4v2iEoklO54+Ri0=;
        b=KDwj4aKsPwMPzxB9iGTPdzZQQQUsV/90d6N5lAhwmUVcP0LR1JCscwShsYyqaOVeH8
         ZR65uuDpHHSBoB6K9q56VOTdrlNqIw5n0SA0meK6+jQCKPs0SoUsUrmZkgkGuBepmCUv
         rAj4URKy77YLZOnH4/zgqPe7VmWmkJ3b3Yu5ZtAydXhsYytvT5IDMwYfjlaUx1WS+Kaq
         mqxFX6ix5fDv6ZiuSBKeNgD9wIeMTAQ8rw9/dUsnH4SmgocVMB32uOkeJSNLwfHAJtfs
         CNq8Mtd4/piBYiQ2l3RaloCQuWa/m1s0sfNXn9D3FnGy4qPOAUjk0BftyHYcUdzV5qFz
         P6og==
X-Gm-Message-State: AOAM531QG1QXjr3tsY9VsHL294jnV99QNQQlv5+C07n+lmr+qESh3aYU
	kFzBdhARLyhUrlpZLJ94iMO+4KBT3KoNcAcaYhM=
X-Google-Smtp-Source: ABdhPJwmZwCFij1z2Fd8E1JJdq0lKQEt6t08QTH6vxMovTF2ryJg3A5xba9MN+rA6sSW03UesqhTFQ==
X-Received: by 2002:a17:902:26a:b029:da:af47:77c7 with SMTP id 97-20020a170902026ab02900daaf4777c7mr1640740plc.10.1611009503922;
        Mon, 18 Jan 2021 14:38:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:38:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/19] xorg: Security fix for CVE-2020-14345
Date: Mon, 18 Jan 2021 12:36:23 -1000
Message-Id: <212ac89db81df64b9a0b428ded422fef9f4c0e61.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Armin Kuster <akuster@mvista.com>

Source: freedesktop.org
MR: 105894
Type: Security Fix
Disposition: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/f7cd1276bbd4fe3a9700096dec33b52b8440788d
ChangeID: 2c6b7553d8e5bc152258ad1794d95cb7d8b215eb
Description:

CVE-2020-14345 fix

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2020-14345.patch         | 182 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
new file mode 100644
index 0000000000..fb3a37c474
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
@@ -0,0 +1,182 @@
+From f7cd1276bbd4fe3a9700096dec33b52b8440788d Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:46:32 +0200
+Subject: [PATCH] Correct bounds checking in XkbSetNames()
+
+CVE-2020-14345 / ZDI 11428
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+CVE: CVE-2020-14345
+Affects < 1.20.9
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ xkb/xkb.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 48 insertions(+)
+
+Index: xorg-server-1.20.8/xkb/xkb.c
+===================================================================
+--- xorg-server-1.20.8.orig/xkb/xkb.c
++++ xorg-server-1.20.8/xkb/xkb.c
+@@ -152,6 +152,19 @@ static RESTYPE RT_XKBCLIENT;
+ #define	CHK_REQ_KEY_RANGE(err,first,num,r)  \
+ 	CHK_REQ_KEY_RANGE2(err,first,num,r,client->errorValue,BadValue)
+ 
++static Bool
++_XkbCheckRequestBounds(ClientPtr client, void *stuff, void *from, void *to) {
++    char *cstuff = (char *)stuff;
++    char *cfrom = (char *)from;
++    char *cto = (char *)to;
++
++    return cfrom < cto &&
++           cfrom >= cstuff &&
++           cfrom < cstuff + ((size_t)client->req_len << 2) &&
++           cto >= cstuff &&
++           cto <= cstuff + ((size_t)client->req_len << 2);
++}
++
+ /***====================================================================***/
+ 
+ int
+@@ -4045,6 +4058,8 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+             client->errorValue = _XkbErrCode2(0x04, stuff->firstType);
+             return BadAccess;
+         }
++        if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + stuff->nTypes))
++            return BadLength;
+         old = tmp;
+         tmp = _XkbCheckAtoms(tmp, stuff->nTypes, client->swapped, &bad);
+         if (!tmp) {
+@@ -4074,6 +4089,8 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+         }
+         width = (CARD8 *) tmp;
+         tmp = (CARD32 *) (((char *) tmp) + XkbPaddedSize(stuff->nKTLevels));
++        if (!_XkbCheckRequestBounds(client, stuff, width, tmp))
++            return BadLength;
+         type = &xkb->map->types[stuff->firstKTLevel];
+         for (i = 0; i < stuff->nKTLevels; i++, type++) {
+             if (width[i] == 0)
+@@ -4083,6 +4100,8 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+                                                   type->num_levels, width[i]);
+                 return BadMatch;
+             }
++            if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + width[i]))
++                return BadLength;
+             tmp = _XkbCheckAtoms(tmp, width[i], client->swapped, &bad);
+             if (!tmp) {
+                 client->errorValue = bad;
+@@ -4095,6 +4114,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+             client->errorValue = 0x08;
+             return BadMatch;
+         }
++        if (!_XkbCheckRequestBounds(client, stuff, tmp,
++                                    tmp + Ones(stuff->indicators)))
++            return BadLength;
+         tmp = _XkbCheckMaskedAtoms(tmp, XkbNumIndicators, stuff->indicators,
+                                    client->swapped, &bad);
+         if (!tmp) {
+@@ -4107,6 +4129,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+             client->errorValue = 0x09;
+             return BadMatch;
+         }
++        if (!_XkbCheckRequestBounds(client, stuff, tmp,
++                                    tmp + Ones(stuff->virtualMods)))
++            return BadLength;
+         tmp = _XkbCheckMaskedAtoms(tmp, XkbNumVirtualMods,
+                                    (CARD32) stuff->virtualMods,
+                                    client->swapped, &bad);
+@@ -4120,6 +4145,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+             client->errorValue = 0x0a;
+             return BadMatch;
+         }
++        if (!_XkbCheckRequestBounds(client, stuff, tmp,
++                                    tmp + Ones(stuff->groupNames)))
++            return BadLength;
+         tmp = _XkbCheckMaskedAtoms(tmp, XkbNumKbdGroups,
+                                    (CARD32) stuff->groupNames,
+                                    client->swapped, &bad);
+@@ -4141,9 +4169,14 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+                              stuff->nKeys);
+             return BadValue;
+         }
++        if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + stuff->nKeys))
++            return BadLength;
+         tmp += stuff->nKeys;
+     }
+     if ((stuff->which & XkbKeyAliasesMask) && (stuff->nKeyAliases > 0)) {
++        if (!_XkbCheckRequestBounds(client, stuff, tmp,
++                                    tmp + (stuff->nKeyAliases * 2)))
++            return BadLength;
+         tmp += stuff->nKeyAliases * 2;
+     }
+     if (stuff->which & XkbRGNamesMask) {
+@@ -4151,6 +4184,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
+             client->errorValue = _XkbErrCode2(0x0d, stuff->nRadioGroups);
+             return BadValue;
+         }
++        if (!_XkbCheckRequestBounds(client, stuff, tmp,
++                                    tmp + stuff->nRadioGroups))
++            return BadLength;
+         tmp = _XkbCheckAtoms(tmp, stuff->nRadioGroups, client->swapped, &bad);
+         if (!tmp) {
+             client->errorValue = bad;
+@@ -4344,6 +4380,8 @@ ProcXkbSetNames(ClientPtr client)
+     /* check device-independent stuff */
+     tmp = (CARD32 *) &stuff[1];
+ 
++    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
++        return BadLength;
+     if (stuff->which & XkbKeycodesNameMask) {
+         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
+         if (!tmp) {
+@@ -4351,6 +4389,8 @@ ProcXkbSetNames(ClientPtr client)
+             return BadAtom;
+         }
+     }
++    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
++        return BadLength;
+     if (stuff->which & XkbGeometryNameMask) {
+         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
+         if (!tmp) {
+@@ -4358,6 +4398,8 @@ ProcXkbSetNames(ClientPtr client)
+             return BadAtom;
+         }
+     }
++    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
++        return BadLength;
+     if (stuff->which & XkbSymbolsNameMask) {
+         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
+         if (!tmp) {
+@@ -4365,6 +4407,8 @@ ProcXkbSetNames(ClientPtr client)
+             return BadAtom;
+         }
+     }
++    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
++        return BadLength;
+     if (stuff->which & XkbPhysSymbolsNameMask) {
+         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
+         if (!tmp) {
+@@ -4372,6 +4416,8 @@ ProcXkbSetNames(ClientPtr client)
+             return BadAtom;
+         }
+     }
++    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
++        return BadLength;
+     if (stuff->which & XkbTypesNameMask) {
+         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
+         if (!tmp) {
+@@ -4379,6 +4425,8 @@ ProcXkbSetNames(ClientPtr client)
+             return BadAtom;
+         }
+     }
++    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
++        return BadLength;
+     if (stuff->which & XkbCompatNameMask) {
+         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
+         if (!tmp) {
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 51d959f86c..2af1b6f307 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2020-14346.patch \
            file://CVE-2020-14361.patch \
            file://CVE-2020-14362.patch \
+           file://CVE-2020-14345.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.17.1

