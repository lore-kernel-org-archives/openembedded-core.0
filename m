Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A777FC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.2672.1648607328953802592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=awbPEGuk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id m18so14382553plx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TJ68ZrBK2Q0n42+ntMquK2qmqGqTXdg/IFqIJRgqIC0=;
        b=awbPEGuklyrrVW4XjKTHppDzpymNgYMI8iz7/jD0LrR9YuJ19X5UYeuQ2MmmN10JZQ
         W5QfETycc/YUQm4MVDYr+ouia+h5z3p5C3d1gpZvuDKL3WIp9YXERfi9klav672RuWZb
         ksT5qO7nex6ACwX/bGMhjuWkHdWjZVeqeMCIULHUk9GL0e310TMEmbxk5O280+NO50LI
         PBmRpbndkmZBK5coKhVbLfjhfOVRa0S0DqtxfHbFQBsbk3pBL6BQ7K4S8A7rzF8pBSdP
         ElnHiNs9W/wBXqMElrEkFtzxH993OnBNENc3Bfu2nOJEoiaVxVziAiZWTTs8w0m/7qbJ
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJ68ZrBK2Q0n42+ntMquK2qmqGqTXdg/IFqIJRgqIC0=;
        b=qvhOnVEhBcUFMKOHkwnz2Wbttes54f9OPpLoWEDJDP5cQ16R1x5MDKvMd+SZ4mrnpQ
         SJghgdYHAfwBhPxfhEhNdtxtDjfyMEOQwfOEJLdGEh06czn19meKlOqSQjPLGQPzyxdb
         oVq+9F/kscEvgD2VNORZi/0YXlGrS+8WlLLyXVUoo635NPNw4zXJoOdq5CQHhLVXWtuS
         j0mHvJUKuppIO8hNwh6iQqD693j+c8U3oFe9pzpJIVXpFNE3+rBoRzKjdFMEJ3dmIXlZ
         ahBk7HLwkbqqzeDt7JOm1L2pQ14aOtbxYnOGUb5LIUMw3fgbRZPKMuaTcfxRp/xg81DR
         itvA==
X-Gm-Message-State: AOAM532tSbaSoQ6Tg1YnRbSrtKM2n9vY8rL7m6+XM3EYpgiJ4kF4ec9y
	SSGdDC8HxTICjB4tspevZ9BqDWa3fmX+auCvsZA=
X-Google-Smtp-Source: 
 ABdhPJzXijL2HAxedeo9yGhDOfIZahoNpVmNhcsUbRWZ3e0jLQCTYlW3rYj9fnK0EY5lKJsgOyYcjA==
X-Received: by 2002:a17:90b:33c8:b0:1c7:443:3fcc with SMTP id
 lk8-20020a17090b33c800b001c704433fccmr2379798pjb.109.1648607327573;
        Tue, 29 Mar 2022 19:28:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] xserver-xorg: update to 1.20.9
Date: Tue, 29 Mar 2022 16:27:54 -1000
Message-Id: 
 <9fba10e19c8de5df1361e222bf255c0d9dad949f.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163765

Remove CVE patches contained in this release.

Stable branch update:

afb77415e (tag: xorg-server-1.20.9) xserver 1.20.9
705d72139 Fix XRecordRegisterClients() Integer underflow
5b384e767 Fix XkbSelectEvents() integer underflow
eff3f6cdd Fix XIChangeHierarchy() integer underflow
1d3a1092c Correct bounds checking in XkbSetNames()
249a12c54 linux: Fix platform device probe for DT-based PCI
5c96eb5f4 linux: Fix platform device PCI detection for complex bus topologies
74b7427c4 linux: Make platform device probe less fragile
4979ac8f0 fix for ZDI-11426
2720b8715 xfree86: add drm modes on non-GTF panels
7da8e7bab present: Check valid region in window mode flips
4a65b6617 xwayland: Handle NULL xwl_seat in xwl_seat_can_emulate_pointer_warp
10cabe0b9 xwayland: Propagate damage x1/y1 coordinates in xwl_present_flip
3b51978b9 doc: Update URLs in Xserver-DTrace.xml
6cbd6a09b xwayland: Use a fixed DPI value for core protocol
d4e8c4622 xwayland: only use linux-dmabuf if format/modifier was advertised
c726ceacc hw/xfree86: Avoid cursor use after free
0679d4660 Update URL's in man pages
3059a2e62 xwayland: Disable the MIT-SCREEN-SAVER extension when rootless
23c55ec32 xwayland: Hold a pixmap reference in struct xwl_present_event
1179938c1 randr: Check rrPrivKey in RRHasScanoutPixmap()
4912f693e modesetting: Fix front_bo leak at drmmode_xf86crtc_resize on XRandR rotation
ccbcf083d xwayland: Store xwl_tablet_pad in its own private key
cc3613559 xwayland: Initialise values in xwlVidModeGetGamma()
533cc6ca0 xwayland: Fix crashes when there is no pointer
3aa31823d xwayland: Clear private on device removal
22c0808ac xwayland: Free all remaining events in xwl_present_cleanup
37779d7f4 xwayland: Always use xwl_present_free_event for freeing Present events
ba52e5eb0 present/wnmd: Free flip_queue entries in present_wnmd_clear_window_flip
b3310ed50 present/wnmd: Keep pixmap pointer in present_wnmd_clear_window_flip
fc297c87d xwayland: import DMA-BUFs with GBM_BO_USE_RENDERING only
0430d13c1 xwayland: Fix infinite loop at startup
b8b10e293 modesetting: Disable pageflipping when using a swcursor
271934db9 dix: do not send focus event when grab actually does not change

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2020-14345.patch         | 182 ------------------
 .../xserver-xorg/CVE-2020-14346.patch         |  36 ----
 .../xserver-xorg/CVE-2020-14347.patch         |  38 ----
 .../xserver-xorg/CVE-2020-14361.patch         |  36 ----
 .../xserver-xorg/CVE-2020-14362.patch         |  70 -------
 ...-xorg_1.20.8.bb => xserver-xorg_1.20.9.bb} |   9 +-
 6 files changed, 2 insertions(+), 369 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.8.bb => xserver-xorg_1.20.9.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
deleted file mode 100644
index fb3a37c474..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From f7cd1276bbd4fe3a9700096dec33b52b8440788d Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Tue, 18 Aug 2020 14:46:32 +0200
-Subject: [PATCH] Correct bounds checking in XkbSetNames()
-
-CVE-2020-14345 / ZDI 11428
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport
-CVE: CVE-2020-14345
-Affects < 1.20.9
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- xkb/xkb.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 48 insertions(+)
-
-Index: xorg-server-1.20.8/xkb/xkb.c
-===================================================================
---- xorg-server-1.20.8.orig/xkb/xkb.c
-+++ xorg-server-1.20.8/xkb/xkb.c
-@@ -152,6 +152,19 @@ static RESTYPE RT_XKBCLIENT;
- #define	CHK_REQ_KEY_RANGE(err,first,num,r)  \
- 	CHK_REQ_KEY_RANGE2(err,first,num,r,client->errorValue,BadValue)
- 
-+static Bool
-+_XkbCheckRequestBounds(ClientPtr client, void *stuff, void *from, void *to) {
-+    char *cstuff = (char *)stuff;
-+    char *cfrom = (char *)from;
-+    char *cto = (char *)to;
-+
-+    return cfrom < cto &&
-+           cfrom >= cstuff &&
-+           cfrom < cstuff + ((size_t)client->req_len << 2) &&
-+           cto >= cstuff &&
-+           cto <= cstuff + ((size_t)client->req_len << 2);
-+}
-+
- /***====================================================================***/
- 
- int
-@@ -4045,6 +4058,8 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-             client->errorValue = _XkbErrCode2(0x04, stuff->firstType);
-             return BadAccess;
-         }
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + stuff->nTypes))
-+            return BadLength;
-         old = tmp;
-         tmp = _XkbCheckAtoms(tmp, stuff->nTypes, client->swapped, &bad);
-         if (!tmp) {
-@@ -4074,6 +4089,8 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-         }
-         width = (CARD8 *) tmp;
-         tmp = (CARD32 *) (((char *) tmp) + XkbPaddedSize(stuff->nKTLevels));
-+        if (!_XkbCheckRequestBounds(client, stuff, width, tmp))
-+            return BadLength;
-         type = &xkb->map->types[stuff->firstKTLevel];
-         for (i = 0; i < stuff->nKTLevels; i++, type++) {
-             if (width[i] == 0)
-@@ -4083,6 +4100,8 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-                                                   type->num_levels, width[i]);
-                 return BadMatch;
-             }
-+            if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + width[i]))
-+                return BadLength;
-             tmp = _XkbCheckAtoms(tmp, width[i], client->swapped, &bad);
-             if (!tmp) {
-                 client->errorValue = bad;
-@@ -4095,6 +4114,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-             client->errorValue = 0x08;
-             return BadMatch;
-         }
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp,
-+                                    tmp + Ones(stuff->indicators)))
-+            return BadLength;
-         tmp = _XkbCheckMaskedAtoms(tmp, XkbNumIndicators, stuff->indicators,
-                                    client->swapped, &bad);
-         if (!tmp) {
-@@ -4107,6 +4129,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-             client->errorValue = 0x09;
-             return BadMatch;
-         }
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp,
-+                                    tmp + Ones(stuff->virtualMods)))
-+            return BadLength;
-         tmp = _XkbCheckMaskedAtoms(tmp, XkbNumVirtualMods,
-                                    (CARD32) stuff->virtualMods,
-                                    client->swapped, &bad);
-@@ -4120,6 +4145,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-             client->errorValue = 0x0a;
-             return BadMatch;
-         }
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp,
-+                                    tmp + Ones(stuff->groupNames)))
-+            return BadLength;
-         tmp = _XkbCheckMaskedAtoms(tmp, XkbNumKbdGroups,
-                                    (CARD32) stuff->groupNames,
-                                    client->swapped, &bad);
-@@ -4141,9 +4169,14 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-                              stuff->nKeys);
-             return BadValue;
-         }
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + stuff->nKeys))
-+            return BadLength;
-         tmp += stuff->nKeys;
-     }
-     if ((stuff->which & XkbKeyAliasesMask) && (stuff->nKeyAliases > 0)) {
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp,
-+                                    tmp + (stuff->nKeyAliases * 2)))
-+            return BadLength;
-         tmp += stuff->nKeyAliases * 2;
-     }
-     if (stuff->which & XkbRGNamesMask) {
-@@ -4151,6 +4184,9 @@ _XkbSetNamesCheck(ClientPtr client, Devi
-             client->errorValue = _XkbErrCode2(0x0d, stuff->nRadioGroups);
-             return BadValue;
-         }
-+        if (!_XkbCheckRequestBounds(client, stuff, tmp,
-+                                    tmp + stuff->nRadioGroups))
-+            return BadLength;
-         tmp = _XkbCheckAtoms(tmp, stuff->nRadioGroups, client->swapped, &bad);
-         if (!tmp) {
-             client->errorValue = bad;
-@@ -4344,6 +4380,8 @@ ProcXkbSetNames(ClientPtr client)
-     /* check device-independent stuff */
-     tmp = (CARD32 *) &stuff[1];
- 
-+    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
-+        return BadLength;
-     if (stuff->which & XkbKeycodesNameMask) {
-         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
-         if (!tmp) {
-@@ -4351,6 +4389,8 @@ ProcXkbSetNames(ClientPtr client)
-             return BadAtom;
-         }
-     }
-+    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
-+        return BadLength;
-     if (stuff->which & XkbGeometryNameMask) {
-         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
-         if (!tmp) {
-@@ -4358,6 +4398,8 @@ ProcXkbSetNames(ClientPtr client)
-             return BadAtom;
-         }
-     }
-+    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
-+        return BadLength;
-     if (stuff->which & XkbSymbolsNameMask) {
-         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
-         if (!tmp) {
-@@ -4365,6 +4407,8 @@ ProcXkbSetNames(ClientPtr client)
-             return BadAtom;
-         }
-     }
-+    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
-+        return BadLength;
-     if (stuff->which & XkbPhysSymbolsNameMask) {
-         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
-         if (!tmp) {
-@@ -4372,6 +4416,8 @@ ProcXkbSetNames(ClientPtr client)
-             return BadAtom;
-         }
-     }
-+    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
-+        return BadLength;
-     if (stuff->which & XkbTypesNameMask) {
-         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
-         if (!tmp) {
-@@ -4379,6 +4425,8 @@ ProcXkbSetNames(ClientPtr client)
-             return BadAtom;
-         }
-     }
-+    if (!_XkbCheckRequestBounds(client, stuff, tmp, tmp + 1))
-+        return BadLength;
-     if (stuff->which & XkbCompatNameMask) {
-         tmp = _XkbCheckAtoms(tmp, 1, client->swapped, &bad);
-         if (!tmp) {
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
deleted file mode 100644
index 4994a21d33..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c940cc8b6c0a2983c1ec974f1b3f019795dd4cff Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Tue, 18 Aug 2020 14:49:04 +0200
-Subject: [PATCH] Fix XIChangeHierarchy() integer underflow
-
-CVE-2020-14346 / ZDI-CAN-11429
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport
-[https://gitlab.freedesktop.org/xorg/xserver/-/commit/c940cc8b6c0a2983c1ec974f1b3f019795dd4cff]
-CVE: CVE-2020-14346
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- Xi/xichangehierarchy.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
-index cbdd91258..504defe56 100644
---- a/Xi/xichangehierarchy.c
-+++ b/Xi/xichangehierarchy.c
-@@ -423,7 +423,7 @@ ProcXIChangeHierarchy(ClientPtr client)
-     if (!stuff->num_changes)
-         return rc;
- 
--    len = ((size_t)stuff->length << 2) - sizeof(xXIChangeHierarchyReq);
-+    len = ((size_t)client->req_len << 2) - sizeof(xXIChangeHierarchyReq);
- 
-     any = (xXIAnyHierarchyChangeInfo *) &stuff[1];
-     while (stuff->num_changes--) {
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
deleted file mode 100644
index cf3f5f9417..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From aac28e162e5108510065ad4c323affd6deffd816 Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Sat, 25 Jul 2020 19:33:50 +0200
-Subject: [PATCH] fix for ZDI-11426
-
-Avoid leaking un-initalized memory to clients by zeroing the
-whole pixmap on initial allocation.
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/aac28e162e5108510065ad4c323affd6deffd816]
-CVE: CVE-2020-14347
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- dix/pixmap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dix/pixmap.c b/dix/pixmap.c
-index 1186d7dbbf..5a0146bbb6 100644
---- a/dix/pixmap.c
-+++ b/dix/pixmap.c
-@@ -116,7 +116,7 @@ AllocatePixmap(ScreenPtr pScreen, int pixDataSize)
-     if (pScreen->totalPixmapSize > ((size_t) - 1) - pixDataSize)
-         return NullPixmap;
- 
--    pPixmap = malloc(pScreen->totalPixmapSize + pixDataSize);
-+    pPixmap = calloc(1, pScreen->totalPixmapSize + pixDataSize);
-     if (!pPixmap)
-         return NullPixmap;
- 
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
deleted file mode 100644
index 710cc3873c..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 144849ea27230962227e62a943b399e2ab304787 Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Tue, 18 Aug 2020 14:52:29 +0200
-Subject: [PATCH] Fix XkbSelectEvents() integer underflow
-
-CVE-2020-14361 ZDI-CAN 11573
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport
-[https://gitlab.freedesktop.org/xorg/xserver/-/commit/144849ea27230962227e62a943b399e2ab304787]
-CVE: CVE-2020-14361
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- xkb/xkbSwap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xkb/xkbSwap.c b/xkb/xkbSwap.c
-index 1c1ed5ff4..50cabb90e 100644
---- a/xkb/xkbSwap.c
-+++ b/xkb/xkbSwap.c
-@@ -76,7 +76,7 @@ SProcXkbSelectEvents(ClientPtr client)
-         register unsigned bit, ndx, maskLeft, dataLeft, size;
- 
-         from.c8 = (CARD8 *) &stuff[1];
--        dataLeft = (stuff->length * 4) - SIZEOF(xkbSelectEventsReq);
-+        dataLeft = (client->req_len * 4) - SIZEOF(xkbSelectEventsReq);
-         maskLeft = (stuff->affectWhich & (~XkbMapNotifyMask));
-         for (ndx = 0, bit = 1; (maskLeft != 0); ndx++, bit <<= 1) {
-             if (((bit & maskLeft) == 0) || (ndx == XkbMapNotify))
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
deleted file mode 100644
index 2103e9c198..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 2902b78535ecc6821cc027351818b28a5c7fdbdc Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Tue, 18 Aug 2020 14:55:01 +0200
-Subject: [PATCH] Fix XRecordRegisterClients() Integer underflow
-
-CVE-2020-14362 ZDI-CAN-11574
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-
-Upstream-Status: Backport
-[https://gitlab.freedesktop.org/xorg/xserver/-/commit/2902b78535ecc6821cc027351818b28a5c7fdbdc]
-CVE: CVE-2020-14362
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- record/record.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/record/record.c b/record/record.c
-index f2d38c877..be154525d 100644
---- a/record/record.c
-+++ b/record/record.c
-@@ -2500,7 +2500,7 @@ SProcRecordQueryVersion(ClientPtr client)
- }                               /* SProcRecordQueryVersion */
- 
- static int _X_COLD
--SwapCreateRegister(xRecordRegisterClientsReq * stuff)
-+SwapCreateRegister(ClientPtr client, xRecordRegisterClientsReq * stuff)
- {
-     int i;
-     XID *pClientID;
-@@ -2510,13 +2510,13 @@ SwapCreateRegister(xRecordRegisterClientsReq * stuff)
-     swapl(&stuff->nRanges);
-     pClientID = (XID *) &stuff[1];
-     if (stuff->nClients >
--        stuff->length - bytes_to_int32(sz_xRecordRegisterClientsReq))
-+        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq))
-         return BadLength;
-     for (i = 0; i < stuff->nClients; i++, pClientID++) {
-         swapl(pClientID);
-     }
-     if (stuff->nRanges >
--        stuff->length - bytes_to_int32(sz_xRecordRegisterClientsReq)
-+        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq)
-         - stuff->nClients)
-         return BadLength;
-     RecordSwapRanges((xRecordRange *) pClientID, stuff->nRanges);
-@@ -2531,7 +2531,7 @@ SProcRecordCreateContext(ClientPtr client)
- 
-     swaps(&stuff->length);
-     REQUEST_AT_LEAST_SIZE(xRecordCreateContextReq);
--    if ((status = SwapCreateRegister((void *) stuff)) != Success)
-+    if ((status = SwapCreateRegister(client, (void *) stuff)) != Success)
-         return status;
-     return ProcRecordCreateContext(client);
- }                               /* SProcRecordCreateContext */
-@@ -2544,7 +2544,7 @@ SProcRecordRegisterClients(ClientPtr client)
- 
-     swaps(&stuff->length);
-     REQUEST_AT_LEAST_SIZE(xRecordRegisterClientsReq);
--    if ((status = SwapCreateRegister((void *) stuff)) != Success)
-+    if ((status = SwapCreateRegister(client, (void *) stuff)) != Success)
-         return status;
-     return ProcRecordRegisterClients(client);
- }                               /* SProcRecordRegisterClients */
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
index 8c77c3756b..4f001c2d3d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
@@ -5,16 +5,11 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-test-xtest-Initialize-array-with-braces.patch \
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
-           file://CVE-2020-14347.patch \
-           file://CVE-2020-14346.patch \
-           file://CVE-2020-14361.patch \
-           file://CVE-2020-14362.patch \
-           file://CVE-2020-14345.patch \
            file://CVE-2020-14360.patch \
            file://CVE-2020-25712.patch \
            "
-SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
-SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
+SRC_URI[md5sum] = "afcae2f46d47c33863cab7fd9db7279a"
+SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1


