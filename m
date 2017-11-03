Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 78E107835C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:59 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id b85so2916476pfj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eNghAkzU+NX59yatumAppP4GZuDPLZOHYJi5mv+VtR4=;
	b=D58YQ+UzpC0gJM3XztGRMmltubSgAgq/JtVY9khwuxxhMj9Zp/Z1qjDBgNnIhZiKJp
	c2dYkCuMSs/0B5zOUfakuKMQL2LERoKenIkMSl+hCh0RyMOz6dV1a4/o/GmmdyhwBP2n
	lmSapRyqDhm3TSb7DFlneEpfghKYNFStgzyqxMy5QRdS7ooaaSwcgjF7cgSs1dcJql0C
	B7qzNCxjDUX9NSD2E85Q2TqObg0QDcFvL/t/pL1KMAiQzsRl8+WeMYEFnZ2aFYjHdWzS
	lJ727m9OzrOZfkzuUEHNDrUj/BLFWGWlcOmZF2b8RkYdx+cW52C+ebpIlkreKRHjkwnu
	7nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eNghAkzU+NX59yatumAppP4GZuDPLZOHYJi5mv+VtR4=;
	b=qlnBdICOKjjDqpFCU2Bclst+49xJfHSE33VicAEhjq0EuL9pUcRh3K3r8RclAH+rsf
	FrfbNDBzkCEJy6OSFLzj4sZKtSid1SJVhM6v3LvAPuOqyZ5YVVwR3rH+asAoZTIagkYu
	MdeSdliPoUI4S+HvRgx671lTHs//OqcHLdBTO0+pLcu4JrCGVRJkxEx5VY+8M14sZXVC
	GFaMPhD7pkFV8QS6mMrYtmCPUFIgA3rcYyxdOyO64IZ1FZRZiLUOvc8ZBLcznkax0YGY
	XYluydUsRsaZf2S1XoBEOroCVdgERRgYIjqpBw7G1AWWVKNHAn64iR3KDJFHlRB5+wLU
	ZWkA==
X-Gm-Message-State: AMCzsaVVAPKM65dPlEqVZ99346rhPuoeSK0ekDlbLQSbSFxM62J3EbZr
	egjPxMkiK1h8J5YWt3LBR/4=
X-Google-Smtp-Source: ABhQp+TzyxkW/pL7BeyID3FkODBdabKbf6T7haZMw241PiDIc1Ytet+YqFRJrl7Bn5+LJ3iya9OVhA==
X-Received: by 10.99.55.77 with SMTP id g13mr8188409pgn.209.1509738900595;
	Fri, 03 Nov 2017 12:55:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:42 -0700
Message-Id: <d67cc43e21386cc2acea39cb5733643742d673b1.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 08/15] xorg-xserver: update to 1.19.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Nov 2017 19:54:59 -0000

Remove patches that are included in 1.19.4

[ANNOUNCE] xorg-server 1.19.4
https://lists.x.org/archives/xorg-devel/2017-October/054839.html

xkb: Handle xkb formated string output safely (CVE-2017-13723)
Xext/shm: Validate shmseg resource id (CVE-2017-13721)

[ANNOUNCE] xorg-server 1.19.5
https://lists.x.org/archives/xorg-announce/2017-October/002814.html
One regression fix since 1.19.4 (mea culpa), and fixes for CVEs 2017-
12176 through 2017-12187. C is a terrible language, please stop writing
code in it.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xserver-xorg/CVE-2017-10971-1.patch            | 76 ----------------------
 .../xserver-xorg/CVE-2017-10971-2.patch            | 55 ----------------
 .../xserver-xorg/CVE-2017-10971-3.patch            | 50 --------------
 ...erver-xorg_1.19.3.bb => xserver-xorg_1.19.5.bb} |  7 +-
 4 files changed, 2 insertions(+), 186 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.3.bb => xserver-xorg_1.19.5.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
deleted file mode 100644
index 23c8049..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 215f894965df5fb0bb45b107d84524e700d2073c Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:40 +0300
-Subject: [PATCH] dix: Disallow GenericEvent in SendEvent request.
-
-The SendEvent request holds xEvent which is exactly 32 bytes long, no more,
-no less. Both ProcSendEvent and SProcSendEvent verify that the received data
-exactly match the request size. However nothing stops the client from passing
-in event with xEvent::type = GenericEvent and any value of
-xGenericEvent::length.
-
-In the case of ProcSendEvent, the event will be eventually passed to
-WriteEventsToClient which will see that it is Generic event and copy the
-arbitrary length from the receive buffer (and possibly past it) and send it to
-the other client. This allows clients to copy unitialized heap memory out of X
-server or to crash it.
-
-In case of SProcSendEvent, it will attempt to swap the incoming event by
-calling a swapping function from the EventSwapVector array. The swapped event
-is written to target buffer, which in this case is local xEvent variable. The
-xEvent variable is 32 bytes long, but the swapping functions for GenericEvents
-expect that the target buffer has size matching the size of the source
-GenericEvent. This allows clients to cause stack buffer overflows.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-CVE: CVE-2017-10971
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=215f894965df5fb0bb45b107d84524e700d2073c]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- dix/events.c  |    6 ++++++
- dix/swapreq.c |    7 +++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/dix/events.c b/dix/events.c
-index 3e3a01e..d3a33ea 100644
---- a/dix/events.c
-+++ b/dix/events.c
-@@ -5366,6 +5366,12 @@ ProcSendEvent(ClientPtr client)
-         client->errorValue = stuff->event.u.u.type;
-         return BadValue;
-     }
-+    /* Generic events can have variable size, but SendEvent request holds
-+       exactly 32B of event data. */
-+    if (stuff->event.u.u.type == GenericEvent) {
-+        client->errorValue = stuff->event.u.u.type;
-+        return BadValue;
-+    }
-     if (stuff->event.u.u.type == ClientMessage &&
-         stuff->event.u.u.detail != 8 &&
-         stuff->event.u.u.detail != 16 && stuff->event.u.u.detail != 32) {
-diff --git a/dix/swapreq.c b/dix/swapreq.c
-index 719e9b8..6785059 100644
---- a/dix/swapreq.c
-+++ b/dix/swapreq.c
-@@ -292,6 +292,13 @@ SProcSendEvent(ClientPtr client)
-     swapl(&stuff->destination);
-     swapl(&stuff->eventMask);
- 
-+    /* Generic events can have variable size, but SendEvent request holds
-+       exactly 32B of event data. */
-+    if (stuff->event.u.u.type == GenericEvent) {
-+        client->errorValue = stuff->event.u.u.type;
-+        return BadValue;
-+    }
-+
-     /* Swap event */
-     proc = EventSwapVector[stuff->event.u.u.type & 0177];
-     if (!proc || proc == NotImplemented)        /* no swapping proc; invalid event type? */
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
deleted file mode 100644
index 5c9887a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 8caed4df36b1f802b4992edcfd282cbeeec35d9d Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:41 +0300
-Subject: [PATCH] Xi: Verify all events in ProcXSendExtensionEvent.
-
-The requirement is that events have type in range
-EXTENSION_EVENT_BASE..lastEvent, but it was tested
-only for first event of all.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-CVE: CVE-2017-10971
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=8caed4df36b1f802b4992edcfd282cbeeec35d9d]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Xi/sendexev.c |   12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 1cf118a..5e63bfc 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -117,7 +117,7 @@ SProcXSendExtensionEvent(ClientPtr client)
- int
- ProcXSendExtensionEvent(ClientPtr client)
- {
--    int ret;
-+    int ret, i;
-     DeviceIntPtr dev;
-     xEvent *first;
-     XEventClass *list;
-@@ -141,10 +141,12 @@ ProcXSendExtensionEvent(ClientPtr client)
-     /* The client's event type must be one defined by an extension. */
- 
-     first = ((xEvent *) &stuff[1]);
--    if (!((EXTENSION_EVENT_BASE <= first->u.u.type) &&
--          (first->u.u.type < lastEvent))) {
--        client->errorValue = first->u.u.type;
--        return BadValue;
-+    for (i = 0; i < stuff->num_events; i++) {
-+        if (!((EXTENSION_EVENT_BASE <= first[i].u.u.type) &&
-+            (first[i].u.u.type < lastEvent))) {
-+            client->errorValue = first[i].u.u.type;
-+            return BadValue;
-+        }
-     }
- 
-     list = (XEventClass *) (first + stuff->num_events);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch
deleted file mode 100644
index 54ba481..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ba336b24052122b136486961c82deac76bbde455 Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:42 +0300
-Subject: [PATCH] Xi: Do not try to swap GenericEvent.
-
-The SProcXSendExtensionEvent must not attempt to swap GenericEvent because
-it is assuming that the event has fixed size and gives the swapping function
-xEvent-sized buffer.
-
-A GenericEvent would be later rejected by ProcXSendExtensionEvent anyway.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-CVE: CVE-2017-10971
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=ba336b24052122b136486961c82deac76bbde455]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Xi/sendexev.c |   10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 5e63bfc..5c2e0fc 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -95,9 +95,17 @@ SProcXSendExtensionEvent(ClientPtr client)
- 
-     eventP = (xEvent *) &stuff[1];
-     for (i = 0; i < stuff->num_events; i++, eventP++) {
-+        if (eventP->u.u.type == GenericEvent) {
-+            client->errorValue = eventP->u.u.type;
-+            return BadValue;
-+        }
-+
-         proc = EventSwapVector[eventP->u.u.type & 0177];
--        if (proc == NotImplemented)     /* no swapping proc; invalid event type? */
-+        /* no swapping proc; invalid event type? */
-+        if (proc == NotImplemented) {
-+            client->errorValue = eventP->u.u.type;
-             return BadValue;
-+        }
-         (*proc) (eventP, &eventT);
-         *eventP = eventT;
-     }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
index 65ef6c6..c953031 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.5.bb
@@ -5,12 +5,9 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
-            file://CVE-2017-10971-1.patch \
-            file://CVE-2017-10971-2.patch \
-            file://CVE-2017-10971-3.patch \
             "
-SRC_URI[md5sum] = "015d2fc4b9f2bfe7a626edb63a62c65e"
-SRC_URI[sha256sum] = "677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98"
+SRC_URI[md5sum] = "4ac6feeae6790436ce9de879ca9a3bf8"
+SRC_URI[sha256sum] = "18fffa8eb93d06d2800d06321fc0df4d357684d8d714315a66d8dfa7df251447"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.7.4


