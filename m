Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.5960.1610648115942626987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pchRVWu0;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id my11so4241570pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lyGwTneF+cDYiMQ6nNulbPFQQcuMJbEcEJKuFKrPbBI=;
        b=pchRVWu0x6gwssZwC98SfoJq+Zl10RsSW/rvQMPo7IK51nckvN8ra0nOFeHMQzucuu
         ZHbpDQmPZ01mLb2q/x/4ATxrWrRpoWrylFoR1X5QWehPaL5MMq7NPXi6LW6eFiTB7N8t
         CZqhWDSQKdtacjRKQ7fpQ0X2Epn/3ugiKUBgTXRyHFOI0VYEORfEH7twGPxNV5KeA/e2
         27i5DqRYbZe3jBGWyCUN4uY1tP0dgM4yhN/4JUMVFnWNedGE4YnwDtgGKcRIwgtx2sbk
         sV82Nahg56r+v7bsVu0w0Uy6IUczkpT+yG6bMPjPIfFt7ENQdVM14PWiWfRPFTKq4Spx
         SOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lyGwTneF+cDYiMQ6nNulbPFQQcuMJbEcEJKuFKrPbBI=;
        b=Qq3qyOrZLnezA7OksIjAN5SBUZ4ikF0FOrVdhs/H+FjM0sXX3Clj0Ii1uGIvvfq7v/
         Ne6+u6Ah0ZZeepWmSuT/T5BT0qPQt+b5qxYUIQXQpDshguQo1er/aixdFNC25MlJWkNb
         EzQpzTv22w6pxp3VxlnKujaRMCbi4r4HbGTjKCL7M8y7vVnSRfRhDIe2Efvzxa1WU23d
         NK5Btx6gsQgMwS9Ln3rq+Tx5k846W5OIi9n2gmqbVi/9dtZ9CDpcRbX0GdcjyHEhjmgY
         DXaaupodiifjwqsiGawz85tvY9B3ljkp4zo83uA6OfUticI7DkVRMDK2EHyM8+PSQTMu
         qaJQ==
X-Gm-Message-State: AOAM533T8YNALy5oY0325c/UZB5/8I2TceV2b5psKJtgirD1SOo8QMa1
	LZVb44n4LD7Kwo541USW/UE4tdBao9YE4g==
X-Google-Smtp-Source: ABdhPJxuEk1+XIg9fqow8sA9rRfwBM7aISLIzhnuVoXiJrKA1klgkBoT7dvcHHPK9dk/WFDAY2VIUw==
X-Received: by 2002:a17:902:bf06:b029:dc:1f:ac61 with SMTP id bi6-20020a170902bf06b02900dc001fac61mr8767079plb.16.1610648115165;
        Thu, 14 Jan 2021 10:15:15 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:19ce:8609:7a34:860])
        by smtp.gmail.com with ESMTPSA id x1sm6166884pfj.95.2021.01.14.10.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 10:15:14 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] xorg: Security fix for CVE-2020-14345
Date: Thu, 14 Jan 2021 10:15:12 -0800
Message-Id: <20210114181512.4033-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: freedesktop.org
MR: 105894
Type: Security Fix
Disposition: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/f7cd1276bbd4fe3a9700096dec33b52b8440788d
ChangeID: 2c6b7553d8e5bc152258ad1794d95cb7d8b215eb
Description:

CVE-2020-14345 fix

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xserver-xorg/CVE-2020-14345.patch         | 182 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
new file mode 100644
index 00000000000..fb3a37c4748
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
index 51d959f86c2..2af1b6f3072 100644
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

