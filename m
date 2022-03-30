Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93865C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.2625.1648607330908831618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xm/ioksu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id m18so14382595plx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vJBGB4EIIIkE5Wr5kSoNGALwqUt9Dz2XSDP3jG0DodQ=;
        b=Xm/ioksun+BTa8RYbRBKLLdQdcE6bJxUA66LBmMXD2fKRot5gSctkasYp0D0asdoci
         P+08M/Rh6KwQEs261degUUvp0y0XZW6DqZGhUD2A7KZK0ZKTBAwTJbk2P6RE3Ez6I793
         xmGSXyQVjuUEpBlSiyW5StCP3FzFc2kkchTOs3wIGFOrRLbZ9O8d6LDYg3i6L5bghDpu
         kzDqV3r+Sq1SkTOs35i4eI1EM8kMLXHtwREBcV28ITARm23UuzSw7BU/x5fuuzZfgr6Q
         7essU4MtlSofomHXEt6wuaajqpjFRbdnWNu6Frzfoe3BZWwTjok5PyTVMb8XwdOu7EaY
         E5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJBGB4EIIIkE5Wr5kSoNGALwqUt9Dz2XSDP3jG0DodQ=;
        b=siPPapFECQHU0//1cXOjKGkTIY6Fhv2OPuBsw17P5uD5Q4KjYKyvkPMFn5qr7MUE2V
         EDw+BVZgmt9xSouMF9RheEZsgmpmt423S+FBbmpp9n4IGLvRhEOpXONhKQw3wYjfU97g
         ceCAmxqSs4Xj6paUpcvuISko/l+tHqSxnZvmc+YxgVqzmEnmE0znnhhaPLCM2y3mzoth
         A1RPkkJgpWNwgebRd5LvV6URj4Ez36GjqtSEzk4M4GcOaYp/ruU0iZlzXSJlRrn9Tzod
         MGFsCz9pNkksF1mXIGF44V8S7/oA3OL5KU8WoINbnwokGawS+WM/ORt15SUzmd1D/Wwu
         mUeA==
X-Gm-Message-State: AOAM533b8GMomKMZTFMbyV1AwI3njp2FJrBuVHzdq91/03QKF1DMB2iq
	Q2Qqm+VwRFkcl4KIGXLR5ASVS6XjiOrV3X3qug4=
X-Google-Smtp-Source: 
 ABdhPJwyp1JYeiaRZrG9veYdURdC3BMNfzIuucj1E8AdfdDTxyHnR4vTLMPTdDVXholzSWEbKxJg9Q==
X-Received: by 2002:a17:902:d4c6:b0:156:78c:8486 with SMTP id
 o6-20020a170902d4c600b00156078c8486mr13934801plg.85.1648607329763;
        Tue, 29 Mar 2022 19:28:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] xserver-xorg: update to 1.20.10
Date: Tue, 29 Mar 2022 16:27:55 -1000
Message-Id: 
 <ac86083917380ca8398307f0e59b7bb73c727b4f.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163766

Remove CVE patches contained in this release.

Stable branch update:

bc111a2e6 (tag: xorg-server-1.20.10) xserver 1.20.10
06d1a032e Check SetMap request length carefully.
7ccb3b0ea Fix XkbSetDeviceInfo() and SetDeviceIndicators() heap overflows
440ed5948 present/wnmd: Translate update region to screen space
54f9af1c6 modesetting: keep going if a modeset fails on EnterVT
bd0f53725 modesetting: check the kms state on EnterVT
5c400cae1 configure: Build hashtable for Xres and glvnd
253569a3d xwayland: Create an xwl_window for toplevel only
0811a9ff7 xwayland: non-rootless requires the wl_shell protocol
b3ae038c3 glamor: Update pixmap's devKind when making it exportable
d6c389cb8 os: Fix instruction pointer written in xorg_backtrace
c3e4c1a0f present/wnmd: Execute copies at target_msc-1 already
96ef31e0f present/wnmd: Move up present_wnmd_queue_vblank
669e40390 present: Add present_vblank::exec_msc field
dae234efd present: Move flip target_msc adjustment out of present_vblank_create
1930ed233 xwayland: Remove pending stream reference when freeing
1ac389dda xwayland: use drmGetNodeTypeFromFd for checking if a node is a render one
d108c2c82 xwayland: Do not discard frame callbacks on allow commits
174cb91d8 present/wnmd: Remove dead check from present_wnmd_check_flip
51ee6e5ce xwayland: Check window pixmap in xwl_present_check_flip2
f4006d795 present/wnmd: Can't use page flipping for windows clipped by children
1e84fda20 xfree86: Take second reference for SavedCursor in xf86CursorSetCursor
8c3c8bda2 glamor: Fix glamor_poly_fill_rect_gl xRectangle::width/height handling
b28c88288 include: Increase the number of max. input devices to 256.
af4c84ce8 Revert "linux: Make platform device probe less fragile"
39cb95e95 Revert "linux: Fix platform device PCI detection for complex bus topologies"
4b6fce597 Revert "linux: Fix platform device probe for DT-based PCI"

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2020-14360.patch         | 132 ------------------
 .../xserver-xorg/CVE-2020-25712.patch         | 102 --------------
 ...xorg_1.20.9.bb => xserver-xorg_1.20.10.bb} |   6 +-
 3 files changed, 2 insertions(+), 238 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.9.bb => xserver-xorg_1.20.10.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
deleted file mode 100644
index e9ab42742e..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 446ff2d3177087b8173fa779fa5b77a2a128988b Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Thu, 12 Nov 2020 19:15:07 +0100
-Subject: [PATCH] Check SetMap request length carefully.
-
-Avoid out of bounds memory accesses on too short request.
-
-ZDI-CAN 11572 /  CVE-2020-14360
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport 
-https://gitlab.freedesktop.org/xorg/xserver/-/commit/446ff2d3177087b8173fa779fa5b77a2a128988b
-CVE: CVE-2020-14360
-Signed-off-by: Armin Kuster <akuster@mvista.com>
----
- xkb/xkb.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 92 insertions(+)
-
-Index: xorg-server-1.20.8/xkb/xkb.c
-===================================================================
---- xorg-server-1.20.8.orig/xkb/xkb.c
-+++ xorg-server-1.20.8/xkb/xkb.c
-@@ -2382,6 +2382,93 @@ SetVirtualModMap(XkbSrvInfoPtr xkbi,
-     return (char *) wire;
- }
- 
-+#define _add_check_len(new) \
-+    if (len > UINT32_MAX - (new) || len > req_len - (new)) goto bad; \
-+    else len += new
-+
-+/**
-+ * Check the length of the SetMap request
-+ */
-+static int
-+_XkbSetMapCheckLength(xkbSetMapReq *req)
-+{
-+    size_t len = sz_xkbSetMapReq, req_len = req->length << 2;
-+    xkbKeyTypeWireDesc *keytype;
-+    xkbSymMapWireDesc *symmap;
-+    BOOL preserve;
-+    int i, map_count, nSyms;
-+
-+    if (req_len < len)
-+        goto bad;
-+    /* types */
-+    if (req->present & XkbKeyTypesMask) {
-+        keytype = (xkbKeyTypeWireDesc *)(req + 1);
-+        for (i = 0; i < req->nTypes; i++) {
-+            _add_check_len(XkbPaddedSize(sz_xkbKeyTypeWireDesc));
-+            if (req->flags & XkbSetMapResizeTypes) {
-+                _add_check_len(keytype->nMapEntries
-+                               * sz_xkbKTSetMapEntryWireDesc);
-+                preserve = keytype->preserve;
-+                map_count = keytype->nMapEntries;
-+                if (preserve) {
-+                    _add_check_len(map_count * sz_xkbModsWireDesc);
-+                }
-+                keytype += 1;
-+                keytype = (xkbKeyTypeWireDesc *)
-+                          ((xkbKTSetMapEntryWireDesc *)keytype + map_count);
-+                if (preserve)
-+                    keytype = (xkbKeyTypeWireDesc *)
-+                              ((xkbModsWireDesc *)keytype + map_count);
-+            }
-+        }
-+    }
-+    /* syms */
-+    if (req->present & XkbKeySymsMask) {
-+        symmap = (xkbSymMapWireDesc *)((char *)req + len);
-+        for (i = 0; i < req->nKeySyms; i++) {
-+            _add_check_len(sz_xkbSymMapWireDesc);
-+            nSyms = symmap->nSyms;
-+            _add_check_len(nSyms*sizeof(CARD32));
-+            symmap += 1;
-+            symmap = (xkbSymMapWireDesc *)((CARD32 *)symmap + nSyms);
-+        }
-+    }
-+    /* actions */
-+    if (req->present & XkbKeyActionsMask) {
-+        _add_check_len(req->totalActs * sz_xkbActionWireDesc 
-+                       + XkbPaddedSize(req->nKeyActs));
-+    }
-+    /* behaviours */
-+    if (req->present & XkbKeyBehaviorsMask) {
-+        _add_check_len(req->totalKeyBehaviors * sz_xkbBehaviorWireDesc);
-+    }
-+    /* vmods */
-+    if (req->present & XkbVirtualModsMask) {
-+        _add_check_len(XkbPaddedSize(Ones(req->virtualMods)));
-+    }
-+    /* explicit */
-+    if (req->present & XkbExplicitComponentsMask) {
-+        /* two bytes per non-zero explicit componen */
-+        _add_check_len(XkbPaddedSize(req->totalKeyExplicit * sizeof(CARD16)));
-+    }
-+    /* modmap */
-+    if (req->present & XkbModifierMapMask) {
-+         /* two bytes per non-zero modmap component */
-+        _add_check_len(XkbPaddedSize(req->totalModMapKeys * sizeof(CARD16)));
-+    }
-+    /* vmodmap */
-+    if (req->present & XkbVirtualModMapMask) {
-+        _add_check_len(req->totalVModMapKeys * sz_xkbVModMapWireDesc);
-+    }
-+    if (len == req_len)
-+        return Success;
-+bad:
-+    ErrorF("[xkb] BOGUS LENGTH in SetMap: expected %ld got %ld\n",
-+           len, req_len);
-+    return BadLength;
-+}
-+
-+
- /**
-  * Check if the given request can be applied to the given device but don't
-  * actually do anything..
-@@ -2639,6 +2726,11 @@ ProcXkbSetMap(ClientPtr client)
-     CHK_KBD_DEVICE(dev, stuff->deviceSpec, client, DixManageAccess);
-     CHK_MASK_LEGAL(0x01, stuff->present, XkbAllMapComponentsMask);
- 
-+    /* first verify the request length carefully */
-+    rc = _XkbSetMapCheckLength(stuff);
-+    if (rc != Success)
-+        return rc;
-+
-     tmp = (char *) &stuff[1];
- 
-     /* Check if we can to the SetMap on the requested device. If this
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
deleted file mode 100644
index f39f6b32b1..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 87c64fc5b0db9f62f4e361444f4b60501ebf67b9 Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Sun, 11 Oct 2020 17:05:09 +0200
-Subject: [PATCH] Fix XkbSetDeviceInfo() and SetDeviceIndicators() heap
- overflows
-
-ZDI-CAN 11389 / CVE-2020-25712
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport
-https://gitlab.freedesktop.org/xorg/xserver/-/commit/87c64fc5b0db9f62f4e361444f4b60501ebf67b9
-CVE: CVE-2020-25712
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- xkb/xkb.c | 26 +++++++++++++++++++++++---
- 1 file changed, 23 insertions(+), 3 deletions(-)
-
-Index: xorg-server-1.20.8/xkb/xkb.c
-===================================================================
---- xorg-server-1.20.8.orig/xkb/xkb.c
-+++ xorg-server-1.20.8/xkb/xkb.c
-@@ -6625,7 +6625,9 @@ SetDeviceIndicators(char *wire,
-                     unsigned changed,
-                     int num,
-                     int *status_rtrn,
--                    ClientPtr client, xkbExtensionDeviceNotify * ev)
-+                    ClientPtr client,
-+                    xkbExtensionDeviceNotify * ev,
-+                    xkbSetDeviceInfoReq * stuff)
- {
-     xkbDeviceLedsWireDesc *ledWire;
-     int i;
-@@ -6646,6 +6648,11 @@ SetDeviceIndicators(char *wire,
-         xkbIndicatorMapWireDesc *mapWire;
-         XkbSrvLedInfoPtr sli;
- 
-+        if (!_XkbCheckRequestBounds(client, stuff, ledWire, ledWire + 1)) {
-+            *status_rtrn = BadLength;
-+            return (char *) ledWire;
-+        }
-+
-         namec = mapc = statec = 0;
-         sli = XkbFindSrvLedInfo(dev, ledWire->ledClass, ledWire->ledID,
-                                 XkbXI_IndicatorMapsMask);
-@@ -6664,6 +6671,10 @@ SetDeviceIndicators(char *wire,
-             memset((char *) sli->names, 0, XkbNumIndicators * sizeof(Atom));
-             for (n = 0, bit = 1; n < XkbNumIndicators; n++, bit <<= 1) {
-                 if (ledWire->namesPresent & bit) {
-+                    if (!_XkbCheckRequestBounds(client, stuff, atomWire, atomWire + 1)) {
-+                        *status_rtrn = BadLength;
-+                        return (char *) atomWire;
-+                    }
-                     sli->names[n] = (Atom) *atomWire;
-                     if (sli->names[n] == None)
-                         ledWire->namesPresent &= ~bit;
-@@ -6681,6 +6692,10 @@ SetDeviceIndicators(char *wire,
-         if (ledWire->mapsPresent) {
-             for (n = 0, bit = 1; n < XkbNumIndicators; n++, bit <<= 1) {
-                 if (ledWire->mapsPresent & bit) {
-+                    if (!_XkbCheckRequestBounds(client, stuff, mapWire, mapWire + 1)) {
-+                        *status_rtrn = BadLength;
-+                        return (char *) mapWire;
-+                    }
-                     sli->maps[n].flags = mapWire->flags;
-                     sli->maps[n].which_groups = mapWire->whichGroups;
-                     sli->maps[n].groups = mapWire->groups;
-@@ -6760,7 +6775,7 @@ _XkbSetDeviceInfoCheck(ClientPtr client,
-     ed.deviceID = dev->id;
-     wire = (char *) &stuff[1];
-     if (stuff->change & XkbXI_ButtonActionsMask) {
--        int nBtns, sz, i;
-+	int nBtns, sz, i;
-         XkbAction *acts;
-         DeviceIntPtr kbd;
- 
-@@ -6772,7 +6787,11 @@ _XkbSetDeviceInfoCheck(ClientPtr client,
-                 return BadAlloc;
-             dev->button->xkb_acts = acts;
-         }
-+        if (stuff->firstBtn + stuff->nBtns > nBtns)
-+            return BadValue;
-         sz = stuff->nBtns * SIZEOF(xkbActionWireDesc);
-+        if (!_XkbCheckRequestBounds(client, stuff, wire, (char *) wire + sz))
-+            return BadLength;
-         memcpy((char *) &acts[stuff->firstBtn], (char *) wire, sz);
-         wire += sz;
-         ed.reason |= XkbXI_ButtonActionsMask;
-@@ -6793,7 +6812,8 @@ _XkbSetDeviceInfoCheck(ClientPtr client,
-         int status = Success;
- 
-         wire = SetDeviceIndicators(wire, dev, stuff->change,
--                                   stuff->nDeviceLedFBs, &status, client, &ed);
-+                                   stuff->nDeviceLedFBs, &status, client, &ed,
-+                                   stuff);
-         if (status != Success)
-             return status;
-     }
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 4f001c2d3d..4d368a8b5a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -5,11 +5,9 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-test-xtest-Initialize-array-with-braces.patch \
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
-           file://CVE-2020-14360.patch \
-           file://CVE-2020-25712.patch \
            "
-SRC_URI[md5sum] = "afcae2f46d47c33863cab7fd9db7279a"
-SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
+SRC_URI[md5sum] = "8cf8bd1f33e3736bc8dd279b20a32399"
+SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1


