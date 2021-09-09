Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.2376.1631231724819289402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 16:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jY96xj5b;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id n18so137724pgm.12
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vr6lGg7SMm6mJewAe3qPzNK/ftaggnCv3eA3siji03M=;
        b=jY96xj5bkBfUR8FkjDakplC+51RtlmjhKxHYu14RGfWlt703tOUfxKRTTprVyxZOfl
         mpbGnvYRaFhZcUhUUkeRmV0NJclZDci7Qsc+Bc2sroLOqh8mnQOQmSZRWGa5di3BUaxA
         8y0Ui5tAA07vjBMkibxlyVrmhpZIzRons8bLI+LKaSwbMjJpsXzOQwNcGTnuhADD8FAJ
         +Z3VwBRXOAwdb18Zfeu8bC4/SKNIIHbJ4UYMq2K1cvKExI8cBIsPuDrR2g57wcMeydy8
         aOSstX7oBJgTZjfxlmTUUp4mhZdk+i3/LVC1tNzsVN26JY0feoak89arvqUlXDw8ME9R
         BMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vr6lGg7SMm6mJewAe3qPzNK/ftaggnCv3eA3siji03M=;
        b=K5/WR5GCbkhIGVBLpBH2EyQZtdiIg26JhsqAMTlkXRORIhv4JbumXYIcnbc3e5dqSd
         4vNd8r7mDjQNEzBTKanhKvQOuYd4HFWSxIZLbXdvl7toFha8HYz27aGlyTjs6rSG6KrQ
         a324zeiWuwSA5RmQB/mroZ+pyGAA+fWy92XpX+Mr7KjESufxF2XRc798Z5AnkGV+qk5H
         375TNIMAQcm9VbR3WZN2JAklnkj59mBlhuoosn57fMdO4zoC91FCUmyw/bnf46Xrfs7d
         OCJSd4jCte9mLolzZAo4XoT4vKYjBkKURgZUulDhuG4lybxgu1EW/JbY/gURUBteL6VU
         1Hug==
X-Gm-Message-State: AOAM5325NxHEWbM40CtLEuSk2kmpbaYn8auG94coXDeLrhHOdxDLG+WY
	IwGV9wYgSqJm2OQf7jFUw9d4RRvO8hU=
X-Google-Smtp-Source: ABdhPJxC8qSouZEutnJHj2DIn/Q5WbwnzdStMQfHESiAS34wBe1yFsny71mCiZ0yrZA6CJNdKG5rSQ==
X-Received: by 2002:a62:403:0:b0:433:9582:d449 with SMTP id 3-20020a620403000000b004339582d449mr1186761pfe.15.1631231723812;
        Thu, 09 Sep 2021 16:55:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:9fd1:b728:fff3:766f])
        by smtp.gmail.com with ESMTPSA id r2sm3813435pgn.8.2021.09.09.16.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 16:55:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH 1/2] xserver-xorg: Security fix for CVE-2020-14360/-25712
Date: Thu,  9 Sep 2021 16:55:20 -0700
Message-Id: <20210909235521.2421637-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://gitlab.freedesktop.org/xorg/xserver
MR: 108223,
Type: Security Fix
Disposition: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/446ff2d3177087b8173fa779fa5b77a2a128988b and https://gitlab.freedesktop.org/xorg/xserver/-/commit/87c64fc5b0db9f62f4e361444f4b60501ebf67b9
ChangeID: 496c2a2d80e4f8fff9b0d3148fca70c090cec31e
Description:

affects < 1.20.10
Fixes CVE-2020-14360 and  CVE-2020-25712

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xserver-xorg/CVE-2020-14360.patch         | 132 ++++++++++++++++++
 .../xserver-xorg/CVE-2020-25712.patch         | 102 ++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   2 +
 3 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
new file mode 100644
index 0000000000..e9ab42742e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
@@ -0,0 +1,132 @@
+From 446ff2d3177087b8173fa779fa5b77a2a128988b Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Thu, 12 Nov 2020 19:15:07 +0100
+Subject: [PATCH] Check SetMap request length carefully.
+
+Avoid out of bounds memory accesses on too short request.
+
+ZDI-CAN 11572 /  CVE-2020-14360
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport 
+https://gitlab.freedesktop.org/xorg/xserver/-/commit/446ff2d3177087b8173fa779fa5b77a2a128988b
+CVE: CVE-2020-14360
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ xkb/xkb.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 92 insertions(+)
+
+Index: xorg-server-1.20.8/xkb/xkb.c
+===================================================================
+--- xorg-server-1.20.8.orig/xkb/xkb.c
++++ xorg-server-1.20.8/xkb/xkb.c
+@@ -2382,6 +2382,93 @@ SetVirtualModMap(XkbSrvInfoPtr xkbi,
+     return (char *) wire;
+ }
+ 
++#define _add_check_len(new) \
++    if (len > UINT32_MAX - (new) || len > req_len - (new)) goto bad; \
++    else len += new
++
++/**
++ * Check the length of the SetMap request
++ */
++static int
++_XkbSetMapCheckLength(xkbSetMapReq *req)
++{
++    size_t len = sz_xkbSetMapReq, req_len = req->length << 2;
++    xkbKeyTypeWireDesc *keytype;
++    xkbSymMapWireDesc *symmap;
++    BOOL preserve;
++    int i, map_count, nSyms;
++
++    if (req_len < len)
++        goto bad;
++    /* types */
++    if (req->present & XkbKeyTypesMask) {
++        keytype = (xkbKeyTypeWireDesc *)(req + 1);
++        for (i = 0; i < req->nTypes; i++) {
++            _add_check_len(XkbPaddedSize(sz_xkbKeyTypeWireDesc));
++            if (req->flags & XkbSetMapResizeTypes) {
++                _add_check_len(keytype->nMapEntries
++                               * sz_xkbKTSetMapEntryWireDesc);
++                preserve = keytype->preserve;
++                map_count = keytype->nMapEntries;
++                if (preserve) {
++                    _add_check_len(map_count * sz_xkbModsWireDesc);
++                }
++                keytype += 1;
++                keytype = (xkbKeyTypeWireDesc *)
++                          ((xkbKTSetMapEntryWireDesc *)keytype + map_count);
++                if (preserve)
++                    keytype = (xkbKeyTypeWireDesc *)
++                              ((xkbModsWireDesc *)keytype + map_count);
++            }
++        }
++    }
++    /* syms */
++    if (req->present & XkbKeySymsMask) {
++        symmap = (xkbSymMapWireDesc *)((char *)req + len);
++        for (i = 0; i < req->nKeySyms; i++) {
++            _add_check_len(sz_xkbSymMapWireDesc);
++            nSyms = symmap->nSyms;
++            _add_check_len(nSyms*sizeof(CARD32));
++            symmap += 1;
++            symmap = (xkbSymMapWireDesc *)((CARD32 *)symmap + nSyms);
++        }
++    }
++    /* actions */
++    if (req->present & XkbKeyActionsMask) {
++        _add_check_len(req->totalActs * sz_xkbActionWireDesc 
++                       + XkbPaddedSize(req->nKeyActs));
++    }
++    /* behaviours */
++    if (req->present & XkbKeyBehaviorsMask) {
++        _add_check_len(req->totalKeyBehaviors * sz_xkbBehaviorWireDesc);
++    }
++    /* vmods */
++    if (req->present & XkbVirtualModsMask) {
++        _add_check_len(XkbPaddedSize(Ones(req->virtualMods)));
++    }
++    /* explicit */
++    if (req->present & XkbExplicitComponentsMask) {
++        /* two bytes per non-zero explicit componen */
++        _add_check_len(XkbPaddedSize(req->totalKeyExplicit * sizeof(CARD16)));
++    }
++    /* modmap */
++    if (req->present & XkbModifierMapMask) {
++         /* two bytes per non-zero modmap component */
++        _add_check_len(XkbPaddedSize(req->totalModMapKeys * sizeof(CARD16)));
++    }
++    /* vmodmap */
++    if (req->present & XkbVirtualModMapMask) {
++        _add_check_len(req->totalVModMapKeys * sz_xkbVModMapWireDesc);
++    }
++    if (len == req_len)
++        return Success;
++bad:
++    ErrorF("[xkb] BOGUS LENGTH in SetMap: expected %ld got %ld\n",
++           len, req_len);
++    return BadLength;
++}
++
++
+ /**
+  * Check if the given request can be applied to the given device but don't
+  * actually do anything..
+@@ -2639,6 +2726,11 @@ ProcXkbSetMap(ClientPtr client)
+     CHK_KBD_DEVICE(dev, stuff->deviceSpec, client, DixManageAccess);
+     CHK_MASK_LEGAL(0x01, stuff->present, XkbAllMapComponentsMask);
+ 
++    /* first verify the request length carefully */
++    rc = _XkbSetMapCheckLength(stuff);
++    if (rc != Success)
++        return rc;
++
+     tmp = (char *) &stuff[1];
+ 
+     /* Check if we can to the SetMap on the requested device. If this
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
new file mode 100644
index 0000000000..f39f6b32b1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
@@ -0,0 +1,102 @@
+From 87c64fc5b0db9f62f4e361444f4b60501ebf67b9 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Sun, 11 Oct 2020 17:05:09 +0200
+Subject: [PATCH] Fix XkbSetDeviceInfo() and SetDeviceIndicators() heap
+ overflows
+
+ZDI-CAN 11389 / CVE-2020-25712
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+https://gitlab.freedesktop.org/xorg/xserver/-/commit/87c64fc5b0db9f62f4e361444f4b60501ebf67b9
+CVE: CVE-2020-25712
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ xkb/xkb.c | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+Index: xorg-server-1.20.8/xkb/xkb.c
+===================================================================
+--- xorg-server-1.20.8.orig/xkb/xkb.c
++++ xorg-server-1.20.8/xkb/xkb.c
+@@ -6625,7 +6625,9 @@ SetDeviceIndicators(char *wire,
+                     unsigned changed,
+                     int num,
+                     int *status_rtrn,
+-                    ClientPtr client, xkbExtensionDeviceNotify * ev)
++                    ClientPtr client,
++                    xkbExtensionDeviceNotify * ev,
++                    xkbSetDeviceInfoReq * stuff)
+ {
+     xkbDeviceLedsWireDesc *ledWire;
+     int i;
+@@ -6646,6 +6648,11 @@ SetDeviceIndicators(char *wire,
+         xkbIndicatorMapWireDesc *mapWire;
+         XkbSrvLedInfoPtr sli;
+ 
++        if (!_XkbCheckRequestBounds(client, stuff, ledWire, ledWire + 1)) {
++            *status_rtrn = BadLength;
++            return (char *) ledWire;
++        }
++
+         namec = mapc = statec = 0;
+         sli = XkbFindSrvLedInfo(dev, ledWire->ledClass, ledWire->ledID,
+                                 XkbXI_IndicatorMapsMask);
+@@ -6664,6 +6671,10 @@ SetDeviceIndicators(char *wire,
+             memset((char *) sli->names, 0, XkbNumIndicators * sizeof(Atom));
+             for (n = 0, bit = 1; n < XkbNumIndicators; n++, bit <<= 1) {
+                 if (ledWire->namesPresent & bit) {
++                    if (!_XkbCheckRequestBounds(client, stuff, atomWire, atomWire + 1)) {
++                        *status_rtrn = BadLength;
++                        return (char *) atomWire;
++                    }
+                     sli->names[n] = (Atom) *atomWire;
+                     if (sli->names[n] == None)
+                         ledWire->namesPresent &= ~bit;
+@@ -6681,6 +6692,10 @@ SetDeviceIndicators(char *wire,
+         if (ledWire->mapsPresent) {
+             for (n = 0, bit = 1; n < XkbNumIndicators; n++, bit <<= 1) {
+                 if (ledWire->mapsPresent & bit) {
++                    if (!_XkbCheckRequestBounds(client, stuff, mapWire, mapWire + 1)) {
++                        *status_rtrn = BadLength;
++                        return (char *) mapWire;
++                    }
+                     sli->maps[n].flags = mapWire->flags;
+                     sli->maps[n].which_groups = mapWire->whichGroups;
+                     sli->maps[n].groups = mapWire->groups;
+@@ -6760,7 +6775,7 @@ _XkbSetDeviceInfoCheck(ClientPtr client,
+     ed.deviceID = dev->id;
+     wire = (char *) &stuff[1];
+     if (stuff->change & XkbXI_ButtonActionsMask) {
+-        int nBtns, sz, i;
++	int nBtns, sz, i;
+         XkbAction *acts;
+         DeviceIntPtr kbd;
+ 
+@@ -6772,7 +6787,11 @@ _XkbSetDeviceInfoCheck(ClientPtr client,
+                 return BadAlloc;
+             dev->button->xkb_acts = acts;
+         }
++        if (stuff->firstBtn + stuff->nBtns > nBtns)
++            return BadValue;
+         sz = stuff->nBtns * SIZEOF(xkbActionWireDesc);
++        if (!_XkbCheckRequestBounds(client, stuff, wire, (char *) wire + sz))
++            return BadLength;
+         memcpy((char *) &acts[stuff->firstBtn], (char *) wire, sz);
+         wire += sz;
+         ed.reason |= XkbXI_ButtonActionsMask;
+@@ -6793,7 +6812,8 @@ _XkbSetDeviceInfoCheck(ClientPtr client,
+         int status = Success;
+ 
+         wire = SetDeviceIndicators(wire, dev, stuff->change,
+-                                   stuff->nDeviceLedFBs, &status, client, &ed);
++                                   stuff->nDeviceLedFBs, &status, client, &ed,
++                                   stuff);
+         if (status != Success)
+             return status;
+     }
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 2af1b6f307..8c77c3756b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -10,6 +10,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2020-14361.patch \
            file://CVE-2020-14362.patch \
            file://CVE-2020-14345.patch \
+           file://CVE-2020-14360.patch \
+           file://CVE-2020-25712.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.25.1

