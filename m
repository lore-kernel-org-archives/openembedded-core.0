Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web09.9670.1631282906988138123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0Jjvfl17;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id bd1so3072125oib.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j4gqhOa+tPttZH5wnsbARCUHQyPVM7lPXxFc+dMV+3g=;
        b=0Jjvfl17fwCuxTfLcHtfujWjsj1uIYGYKD0fgdx7N2PBuz2RQttsaLxh9ZpgmVGW2D
         YBfKjrULf9t0SyAZ+x6Cr/vuE7Bt8OTJ8F70GcixEF8grL+Yj8yIAVTgcE0CBKFdWrd8
         IWdxwzCnF/wU9Ma09w5x1FiL0y3s2pOOIhJSNxi+z7HY9xoY9L/Jgku9Pf7nhnCw+ka3
         MYMNgvD5eNtfntlwQh0UO18r/Llii8GDM5WkCK+AYoQOSxEXHnvPLfgUhxtCl32ufWHt
         D3KIKveAADtgcgfY4CP38V3sGO4zh6zngc+Psb0Oga4maq2hLOn6xlecZXY9Y1+wMMnM
         +Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j4gqhOa+tPttZH5wnsbARCUHQyPVM7lPXxFc+dMV+3g=;
        b=b1eI57y1YFSOFuMULjx34zaAWkt0Gi46saL1z8VPxIcbKNoh0diimyuMBfs4Bh+1I6
         OSbF4gsBGlKvbxiHtqnPKpLyvmX1s9bfKaxnJ0MIKguTP31w7KnDdDA7eNZRpnNLHorP
         S4nOD0i9wNWX5QTWbgMrkfyHj6NpaBpSsk8/CEuqXrTFzspBZ3BNJq2FN5UpKkPtGtv4
         6pf62oLFnPSJzDIeUUaCaaKrBHnJ/HqYU8eBrI1HHrjy5VCLM83+ItvI0RMqmpYRqL2I
         un7AaT8VL3jnk7nU6XXVIWvLyvfSoHKKkOFqUTQ8QsaWYSFwPxmAnPj9i2+XUfJioFJQ
         jXnw==
X-Gm-Message-State: AOAM5333m/3vi4GmZ/+64fMQK/jaUGZsfj/mGR/vkBiIkc5Sr6Vo2vwO
	0qrsMoVLwqeVTqmVMQ0olKlr0UDcYSOD6giJ
X-Google-Smtp-Source: ABdhPJw3HVcrkNl/f/pPR5VGUgr8kgNa+ukJ1kiQWahHl0Q5FGp0ikbaH5/Kl5AQ7oQMlHWZS7yCGQ==
X-Received: by 2002:a05:6808:150c:: with SMTP id u12mr4254579oiw.136.1631282905137;
        Fri, 10 Sep 2021 07:08:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] xserver-xorg: Security fix for CVE-2020-14360/-25712
Date: Fri, 10 Sep 2021 04:07:19 -1000
Message-Id: <4e0feebbb7e2ba69115a2036d9aaeaa087c50984.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

