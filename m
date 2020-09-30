Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.6488.1601503941187833490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n5ieUjBP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id x22so2315695pfo.12
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/zklk5n6yQkdt2afCCOi608QaXJqHVuH8K5lAmo/Zts=;
        b=n5ieUjBPMzuLRTTOO8/H5UmMQw63r3cmYQB0s782B+D0MGKNZI6hutCkhOhxYf0hHJ
         BLpmKp6+S+FX6r1HEPB9TU7OqtQQS2FjE3d5fqKqb3JNtw09ZjZCyiURTaEoVTd1kP7y
         i4DAOqIRYaUykyzhbFrPT6XzC2RCH9cE+iRVyz5xHDBo82YxPckZk1jsymdmKvbg8P9F
         c3f/U5Qg64snWfNuyYA/gbI8akVfImGYbuBADAGoUqEj3cGyUTjmak3ScXKbktTzBA+9
         4KrvzgfAtTCait30ZcpqQKjFJtCwa9nEENUVzK+TMYKvD0kEvsZv5SobrwCgQPX3J4KV
         a+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/zklk5n6yQkdt2afCCOi608QaXJqHVuH8K5lAmo/Zts=;
        b=RrWjxf3Ma0elALPXtGboHvhYGysVlpLuKQpkcVGU3grkn1HNNcT2AT+ARFbEXSVmn3
         OnI3L7hwaLArsbm8CATtBXhU5+L8idbomSPI7PwkGNryMlxlukpdWfF3ot/NS8jIY0DR
         zgok8x4vUTnIKiMYOhdB3qpogCBKDUXRobC3HUDkzGmjd5r0xOo1KovcENPg5fgSzSF6
         0cDDgPIEUHxEaVzp9pQ1QYK5UzmGt4qazKfQaDNGGn7cjjp6vs+w8kYgSP4CiVLgeTzs
         XqvM5605rhI736Vdq00gAEVll5pVQNW1OrgmoVlGf5tLD0ZRtaweXiHIaVOYK+oLPYC9
         DBKA==
X-Gm-Message-State: AOAM530k7zp2IxtgpwNHlI0TrEZyUT2Jf1koxrTdRPx3tVPjlfFY670i
	zuypX/kanLtj2nk7YwFRitC3scDqXMgkhp7LVEQ=
X-Google-Smtp-Source: ABdhPJzLU7dmV1iNaDf2Ja5IbKFZ0L7TDfj5vFRywh/YlMK6KUZ6/fuDULRT4z+Y8/6ZNcsP2GcRVA==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id m184-20020a6226c10000b0290142250135efmr4274728pfm.79.1601503939983;
        Wed, 30 Sep 2020 15:12:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/41] xserver-xorg: fix CVE-2020-14346/14361/14362
Date: Wed, 30 Sep 2020 12:11:09 -1000
Message-Id: <d485870543fbc111832735ae713b2ec405ce78fa.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

fix :
CVE-2020-14346
https://gitlab.freedesktop.org/xorg/xserver/-/commit/c940cc8b6c0a2983c1ec974f1b3f019795dd4cff

CVE-2020-14361
https://gitlab.freedesktop.org/xorg/xserver/-/commit/144849ea27230962227e62a943b399e2ab304787

CVE-2020-14362
https://gitlab.freedesktop.org/xorg/xserver/-/commit/2902b78535ecc6821cc027351818b28a5c7fdbdc

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2020-14346.patch         | 36 ++++++++++
 .../xserver-xorg/CVE-2020-14361.patch         | 36 ++++++++++
 .../xserver-xorg/CVE-2020-14362.patch         | 70 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |  3 +
 4 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
new file mode 100644
index 0000000000..4994a21d33
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
@@ -0,0 +1,36 @@
+From c940cc8b6c0a2983c1ec974f1b3f019795dd4cff Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:49:04 +0200
+Subject: [PATCH] Fix XIChangeHierarchy() integer underflow
+
+CVE-2020-14346 / ZDI-CAN-11429
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/c940cc8b6c0a2983c1ec974f1b3f019795dd4cff]
+CVE: CVE-2020-14346
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ Xi/xichangehierarchy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Xi/xichangehierarchy.c b/Xi/xichangehierarchy.c
+index cbdd91258..504defe56 100644
+--- a/Xi/xichangehierarchy.c
++++ b/Xi/xichangehierarchy.c
+@@ -423,7 +423,7 @@ ProcXIChangeHierarchy(ClientPtr client)
+     if (!stuff->num_changes)
+         return rc;
+ 
+-    len = ((size_t)stuff->length << 2) - sizeof(xXIChangeHierarchyReq);
++    len = ((size_t)client->req_len << 2) - sizeof(xXIChangeHierarchyReq);
+ 
+     any = (xXIAnyHierarchyChangeInfo *) &stuff[1];
+     while (stuff->num_changes--) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
new file mode 100644
index 0000000000..710cc3873c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
@@ -0,0 +1,36 @@
+From 144849ea27230962227e62a943b399e2ab304787 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:52:29 +0200
+Subject: [PATCH] Fix XkbSelectEvents() integer underflow
+
+CVE-2020-14361 ZDI-CAN 11573
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/144849ea27230962227e62a943b399e2ab304787]
+CVE: CVE-2020-14361
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ xkb/xkbSwap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xkb/xkbSwap.c b/xkb/xkbSwap.c
+index 1c1ed5ff4..50cabb90e 100644
+--- a/xkb/xkbSwap.c
++++ b/xkb/xkbSwap.c
+@@ -76,7 +76,7 @@ SProcXkbSelectEvents(ClientPtr client)
+         register unsigned bit, ndx, maskLeft, dataLeft, size;
+ 
+         from.c8 = (CARD8 *) &stuff[1];
+-        dataLeft = (stuff->length * 4) - SIZEOF(xkbSelectEventsReq);
++        dataLeft = (client->req_len * 4) - SIZEOF(xkbSelectEventsReq);
+         maskLeft = (stuff->affectWhich & (~XkbMapNotifyMask));
+         for (ndx = 0, bit = 1; (maskLeft != 0); ndx++, bit <<= 1) {
+             if (((bit & maskLeft) == 0) || (ndx == XkbMapNotify))
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
new file mode 100644
index 0000000000..2103e9c198
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
@@ -0,0 +1,70 @@
+From 2902b78535ecc6821cc027351818b28a5c7fdbdc Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 18 Aug 2020 14:55:01 +0200
+Subject: [PATCH] Fix XRecordRegisterClients() Integer underflow
+
+CVE-2020-14362 ZDI-CAN-11574
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/2902b78535ecc6821cc027351818b28a5c7fdbdc]
+CVE: CVE-2020-14362
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ record/record.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/record/record.c b/record/record.c
+index f2d38c877..be154525d 100644
+--- a/record/record.c
++++ b/record/record.c
+@@ -2500,7 +2500,7 @@ SProcRecordQueryVersion(ClientPtr client)
+ }                               /* SProcRecordQueryVersion */
+ 
+ static int _X_COLD
+-SwapCreateRegister(xRecordRegisterClientsReq * stuff)
++SwapCreateRegister(ClientPtr client, xRecordRegisterClientsReq * stuff)
+ {
+     int i;
+     XID *pClientID;
+@@ -2510,13 +2510,13 @@ SwapCreateRegister(xRecordRegisterClientsReq * stuff)
+     swapl(&stuff->nRanges);
+     pClientID = (XID *) &stuff[1];
+     if (stuff->nClients >
+-        stuff->length - bytes_to_int32(sz_xRecordRegisterClientsReq))
++        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq))
+         return BadLength;
+     for (i = 0; i < stuff->nClients; i++, pClientID++) {
+         swapl(pClientID);
+     }
+     if (stuff->nRanges >
+-        stuff->length - bytes_to_int32(sz_xRecordRegisterClientsReq)
++        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq)
+         - stuff->nClients)
+         return BadLength;
+     RecordSwapRanges((xRecordRange *) pClientID, stuff->nRanges);
+@@ -2531,7 +2531,7 @@ SProcRecordCreateContext(ClientPtr client)
+ 
+     swaps(&stuff->length);
+     REQUEST_AT_LEAST_SIZE(xRecordCreateContextReq);
+-    if ((status = SwapCreateRegister((void *) stuff)) != Success)
++    if ((status = SwapCreateRegister(client, (void *) stuff)) != Success)
+         return status;
+     return ProcRecordCreateContext(client);
+ }                               /* SProcRecordCreateContext */
+@@ -2544,7 +2544,7 @@ SProcRecordRegisterClients(ClientPtr client)
+ 
+     swaps(&stuff->length);
+     REQUEST_AT_LEAST_SIZE(xRecordRegisterClientsReq);
+-    if ((status = SwapCreateRegister((void *) stuff)) != Success)
++    if ((status = SwapCreateRegister(client, (void *) stuff)) != Success)
+         return status;
+     return ProcRecordRegisterClients(client);
+ }                               /* SProcRecordRegisterClients */
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 5101134538..51d959f86c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -6,6 +6,9 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://CVE-2020-14347.patch \
+           file://CVE-2020-14346.patch \
+           file://CVE-2020-14361.patch \
+           file://CVE-2020-14362.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.17.1

