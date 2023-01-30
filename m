Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54487C636D3
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 17:48:07 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.607.1675100877797730639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 09:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=D9/IarX0;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id mc11so11594417ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 09:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ygT8Kt7E6GX4gMyK9MV5m9oyPpYzUVS8ub5h1RT/82w=;
        b=D9/IarX0AQfrsKe4K3/9UZrEMbCKGLwZAjqDRJZSJNm1J26RSzg/oU7Ixgk3GkWS1O
         tu0cFSeK09wQWptX89uBVyJAX+qKoERX9e1XvUBL0iDIw1Ten8v4bwhTnyQyJmqpAMTA
         PvHQ9QlG86ALjyw4NAFNmpLOWof6MwEUAhO1aHJP3gu91snq6G1pkSfTeKIuT5EphDwk
         5QQqZsPB37hgp9HZ29Zc8sfRLrNaf+mHxxUOvKLXJwxmn7vpo8EprR2Sc1isG0w+nYv5
         LxWTH+a0ieiKsqcAK6QWPnf5mHVaJ3FPmYKRz0lllSCqj381X7rGdB+LWD9xPbfCfCBQ
         CVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygT8Kt7E6GX4gMyK9MV5m9oyPpYzUVS8ub5h1RT/82w=;
        b=NBs9sCU7k9yNLv4959ndeMPPSXg2jxLXaAHFdu7XcBxSKTF2dMRBDa8liSoImkRzX5
         0jcMadNjeAKFCiK6MRo0ujoL1+lHz0qCcLvUhqrmkkQcUtOeD9xQSRlvytvSpkfUsZ19
         yYMwsYCz3d+xdild3HbBHWzCyCRfmIOu14NGCynKYg+0xOzxU2rNpMr1ZBdEh3FgaOn1
         fAk2r+rglHPO1Mp5HK1aWDBA0ezlCvTHVAjMPU3a8ud7kZnScpGyvRvBuieOSzQvLxGx
         A6BPRerV4RJ7ttnvFTEx1EApYfXTiwiwwIIb08gDe9THzA/wJv/xrUMdfzVwofVBRYU9
         B5LA==
X-Gm-Message-State: AFqh2koQbpKTFjTsDULyOTcVsjf36+j0My3I1ath7yr7dAvHdUDtg2+3
	EdfbEIyL0FB2qG3M2ETz/h5vDwVEyQ6ned7jyut6Zw==
X-Google-Smtp-Source: AMrXdXsjirRDgu7/dKWirLwpRdAn2GES5ocL7QzcQ+ePHgZhrvHOVEAQ25RKHchogQdgfaxQqtTAn53PMAMexR52Z+Y=
X-Received: by 2002:a17:907:9888:b0:850:2768:735e with SMTP id
 ja8-20020a170907988800b008502768735emr9440456ejc.64.1675100875696; Mon, 30
 Jan 2023 09:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20230125115503.1726935-1-vkumbhar@mvista.com>
In-Reply-To: <20230125115503.1726935-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 Jan 2023 07:47:44 -1000
Message-ID: <CAOSpxdZsCpsP786L2-7T1mFOxKX1H32yDroWELLtJ7Pd+o4BKg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xorg-x11-server: fix multiple
 xorg-x11-server bugs.
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 17:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176498

On Wed, Jan 25, 2023 at 1:55 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Fixed Below CVE:
> CVE-2022-4283
> CVE-2022-46340
> CVE-2022-46341
> CVE-2022-46342
> CVE-2022-46343
> CVE-2022-46344
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../xserver-xorg/CVE-2022-4283.patch          | 39 +++++++++
>  .../xserver-xorg/CVE-2022-46340.patch         | 55 ++++++++++++
>  .../xserver-xorg/CVE-2022-46341.patch         | 86 +++++++++++++++++++
>  .../xserver-xorg/CVE-2022-46342.patch         | 78 +++++++++++++++++
>  .../xserver-xorg/CVE-2022-46343.patch         | 51 +++++++++++
>  .../xserver-xorg/CVE-2022-46344.patch         | 75 ++++++++++++++++
>  .../xorg-xserver/xserver-xorg_21.1.4.bb       |  6 ++

We've done a version bump to 21.1.6 in kirkstone, so you'll need to
rework this patch (if it is still necessary)

Thanks!

Steve

>  7 files changed, 390 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
> new file mode 100644
> index 0000000000..ce642843ab
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
> @@ -0,0 +1,39 @@
> +From ccdd431cd8f1cabae9d744f0514b6533c438908c Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Mon, 5 Dec 2022 15:55:54 +1000
> +Subject: [PATCH] xkb: reset the radio_groups pointer to NULL after freeing it
> +
> +Unlike other elements of the keymap, this pointer was freed but not
> +reset. On a subsequent XkbGetKbdByName request, the server may access
> +already freed memory.
> +
> +CVE-2022-4283, ZDI-CAN-19530
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ccdd431cd8f1cabae9d744f0514b6533c438908c]
> +CVE: CVE-2022-4283
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + xkb/xkbUtils.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/xkb/xkbUtils.c b/xkb/xkbUtils.c
> +index dd089c204..3f5791a18 100644
> +--- a/xkb/xkbUtils.c
> ++++ b/xkb/xkbUtils.c
> +@@ -1326,6 +1326,7 @@ _XkbCopyNames(XkbDescPtr src, XkbDescPtr dst)
> +         }
> +         else {
> +             free(dst->names->radio_groups);
> ++            dst->names->radio_groups = NULL;
> +         }
> +         dst->names->num_rg = src->names->num_rg;
> +
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
> new file mode 100644
> index 0000000000..9bdcdfa76e
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
> @@ -0,0 +1,55 @@
> +From b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 29 Nov 2022 12:55:45 +1000
> +Subject: [PATCH] Xtest: disallow GenericEvents in XTestSwapFakeInput
> +
> +XTestSwapFakeInput assumes all events in this request are
> +sizeof(xEvent) and iterates through these in 32-byte increments.
> +However, a GenericEvent may be of arbitrary length longer than 32 bytes,
> +so any GenericEvent in this list would result in subsequent events to be
> +misparsed.
> +
> +Additional, the swapped event is written into a stack-allocated struct
> +xEvent (size 32 bytes). For any GenericEvent longer than 32 bytes,
> +swapping the event may thus smash the stack like an avocado on toast.
> +
> +Catch this case early and return BadValue for any GenericEvent.
> +Which is what would happen in unswapped setups anyway since XTest
> +doesn't support GenericEvent.
> +
> +CVE-2022-46340, ZDI-CAN 19265
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63]
> +CVE: CVE-2022-46340
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + Xext/xtest.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/Xext/xtest.c b/Xext/xtest.c
> +index bf27eb590..2985a4ce6 100644
> +--- a/Xext/xtest.c
> ++++ b/Xext/xtest.c
> +@@ -502,10 +502,11 @@ XTestSwapFakeInput(ClientPtr client, xReq * req)
> +
> +     nev = ((req->length << 2) - sizeof(xReq)) / sizeof(xEvent);
> +     for (ev = (xEvent *) &req[1]; --nev >= 0; ev++) {
> ++        int evtype = ev->u.u.type & 0x177;
> +         /* Swap event */
> +-        proc = EventSwapVector[ev->u.u.type & 0177];
> ++        proc = EventSwapVector[evtype];
> +         /* no swapping proc; invalid event type? */
> +-        if (!proc || proc == NotImplemented) {
> ++        if (!proc || proc == NotImplemented || evtype == GenericEvent) {
> +             client->errorValue = ev->u.u.type;
> +             return BadValue;
> +         }
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
> new file mode 100644
> index 0000000000..669792a5e7
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
> @@ -0,0 +1,86 @@
> +From 51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 29 Nov 2022 13:55:32 +1000
> +Subject: [PATCH] Xi: disallow passive grabs with a detail > 255
> +
> +The XKB protocol effectively prevents us from ever using keycodes above
> +255. For buttons it's theoretically possible but realistically too niche
> +to worry about. For all other passive grabs, the detail must be zero
> +anyway.
> +
> +This fixes an OOB write:
> +
> +ProcXIPassiveUngrabDevice() calls DeletePassiveGrabFromList with a
> +temporary grab struct which contains tempGrab->detail.exact = stuff->detail.
> +For matching existing grabs, DeleteDetailFromMask is called with the
> +stuff->detail value. This function creates a new mask with the one bit
> +representing stuff->detail cleared.
> +
> +However, the array size for the new mask is 8 * sizeof(CARD32) bits,
> +thus any detail above 255 results in an OOB array write.
> +
> +CVE-2022-46341, ZDI-CAN 19381
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b]
> +CVE: CVE-2022-46341
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + Xi/xipassivegrab.c | 22 ++++++++++++++--------
> + 1 file changed, 14 insertions(+), 8 deletions(-)
> +
> +diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
> +index 2769fb7c9..c9ac2f855 100644
> +--- a/Xi/xipassivegrab.c
> ++++ b/Xi/xipassivegrab.c
> +@@ -137,6 +137,12 @@ ProcXIPassiveGrabDevice(ClientPtr client)
> +         return BadValue;
> +     }
> +
> ++    /* XI2 allows 32-bit keycodes but thanks to XKB we can never
> ++     * implement this. Just return an error for all keycodes that
> ++     * cannot work anyway, same for buttons > 255. */
> ++    if (stuff->detail > 255)
> ++        return XIAlreadyGrabbed;
> ++
> +     if (XICheckInvalidMaskBits(client, (unsigned char *) &stuff[1],
> +                                stuff->mask_len * 4) != Success)
> +         return BadValue;
> +@@ -207,14 +213,8 @@ ProcXIPassiveGrabDevice(ClientPtr client)
> +                                 &param, XI2, &mask);
> +             break;
> +         case XIGrabtypeKeycode:
> +-            /* XI2 allows 32-bit keycodes but thanks to XKB we can never
> +-             * implement this. Just return an error for all keycodes that
> +-             * cannot work anyway */
> +-            if (stuff->detail > 255)
> +-                status = XIAlreadyGrabbed;
> +-            else
> +-                status = GrabKey(client, dev, mod_dev, stuff->detail,
> +-                                 &param, XI2, &mask);
> ++            status = GrabKey(client, dev, mod_dev, stuff->detail,
> ++                             &param, XI2, &mask);
> +             break;
> +         case XIGrabtypeEnter:
> +         case XIGrabtypeFocusIn:
> +@@ -334,6 +334,12 @@ ProcXIPassiveUngrabDevice(ClientPtr client)
> +         return BadValue;
> +     }
> +
> ++    /* We don't allow passive grabs for details > 255 anyway */
> ++    if (stuff->detail > 255) {
> ++        client->errorValue = stuff->detail;
> ++        return BadValue;
> ++    }
> ++
> +     rc = dixLookupWindow(&win, stuff->grab_window, client, DixSetAttrAccess);
> +     if (rc != Success)
> +         return rc;
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
> new file mode 100644
> index 0000000000..6c17b105a0
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
> @@ -0,0 +1,78 @@
> +From b79f32b57cc0c1186b2899bce7cf89f7b325161b Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Wed, 30 Nov 2022 11:20:40 +1000
> +Subject: [PATCH] Xext: free the XvRTVideoNotify when turning off from the same
> + client
> +
> +This fixes a use-after-free bug:
> +
> +When a client first calls XvdiSelectVideoNotify() on a drawable with a
> +TRUE onoff argument, a struct XvVideoNotifyRec is allocated. This struct
> +is added twice to the resources:
> +  - as the drawable's XvRTVideoNotifyList. This happens only once per
> +    drawable, subsequent calls append to this list.
> +  - as the client's XvRTVideoNotify. This happens for every client.
> +
> +The struct keeps the ClientPtr around once it has been added for a
> +client. The idea, presumably, is that if the client disconnects we can remove
> +all structs from the drawable's list that match the client (by resetting
> +the ClientPtr to NULL), but if the drawable is destroyed we can remove
> +and free the whole list.
> +
> +However, if the same client then calls XvdiSelectVideoNotify() on the
> +same drawable with a FALSE onoff argument, only the ClientPtr on the
> +existing struct was set to NULL. The struct itself remained in the
> +client's resources.
> +
> +If the drawable is now destroyed, the resource system invokes
> +XvdiDestroyVideoNotifyList which frees the whole list for this drawable
> +- including our struct. This function however does not free the resource
> +for the client since our ClientPtr is NULL.
> +
> +Later, when the client is destroyed and the resource system invokes
> +XvdiDestroyVideoNotify, we unconditionally set the ClientPtr to NULL. On
> +a struct that has been freed previously. This is generally frowned upon.
> +
> +Fix this by calling FreeResource() on the second call instead of merely
> +setting the ClientPtr to NULL. This removes the struct from the client
> +resources (but not from the list), ensuring that it won't be accessed
> +again when the client quits.
> +
> +Note that the assignment tpn->client = NULL; is superfluous since the
> +XvdiDestroyVideoNotify function will do this anyway. But it's left for
> +clarity and to match a similar invocation in XvdiSelectPortNotify.
> +
> +CVE-2022-46342, ZDI-CAN 19400
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b79f32b57cc0c1186b2899bce7cf89f7b325161b]
> +CVE: CVE-2022-46342
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + Xext/xvmain.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Xext/xvmain.c b/Xext/xvmain.c
> +index f62747193..2a08f8744 100644
> +--- a/Xext/xvmain.c
> ++++ b/Xext/xvmain.c
> +@@ -811,8 +811,10 @@ XvdiSelectVideoNotify(ClientPtr client, DrawablePtr pDraw, BOOL onoff)
> +         tpn = pn;
> +         while (tpn) {
> +             if (tpn->client == client) {
> +-                if (!onoff)
> ++                if (!onoff) {
> +                     tpn->client = NULL;
> ++                    FreeResource(tpn->id, XvRTVideoNotify);
> ++                }
> +                 return Success;
> +             }
> +             if (!tpn->client)
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
> new file mode 100644
> index 0000000000..11507c3247
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
> @@ -0,0 +1,51 @@
> +From 842ca3ccef100ce010d1d8f5f6d6cc1915055900 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 29 Nov 2022 14:53:07 +1000
> +Subject: [PATCH] Xext: free the screen saver resource when replacing it
> +
> +This fixes a use-after-free bug:
> +
> +When a client first calls ScreenSaverSetAttributes(), a struct
> +ScreenSaverAttrRec is allocated and added to the client's
> +resources.
> +
> +When the same client calls ScreenSaverSetAttributes() again, a new
> +struct ScreenSaverAttrRec is allocated, replacing the old struct. The
> +old struct was freed but not removed from the clients resources.
> +
> +Later, when the client is destroyed the resource system invokes
> +ScreenSaverFreeAttr and attempts to clean up the already freed struct.
> +
> +Fix this by letting the resource system free the old attrs instead.
> +
> +CVE-2022-46343, ZDI-CAN 19404
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/842ca3ccef100ce010d1d8f5f6d6cc1915055900]
> +CVE: CVE-2022-46343
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + Xext/saver.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Xext/saver.c b/Xext/saver.c
> +index f813ba08d..fd6153c31 100644
> +--- a/Xext/saver.c
> ++++ b/Xext/saver.c
> +@@ -1051,7 +1051,7 @@ ScreenSaverSetAttributes(ClientPtr client)
> +         pVlist++;
> +     }
> +     if (pPriv->attr)
> +-        FreeScreenAttr(pPriv->attr);
> ++        FreeResource(pPriv->attr->resource, AttrType);
> +     pPriv->attr = pAttr;
> +     pAttr->resource = FakeClientID(client->index);
> +     if (!AddResource(pAttr->resource, AttrType, (void *) pAttr))
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
> new file mode 100644
> index 0000000000..92f65569ef
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
> @@ -0,0 +1,75 @@
> +From 8f454b793e1f13c99872c15f0eed1d7f3b823fe8 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 29 Nov 2022 13:26:57 +1000
> +Subject: [PATCH] Xi: avoid integer truncation in length check of
> + ProcXIChangeProperty
> +
> +This fixes an OOB read and the resulting information disclosure.
> +
> +Length calculation for the request was clipped to a 32-bit integer. With
> +the correct stuff->num_items value the expected request size was
> +truncated, passing the REQUEST_FIXED_SIZE check.
> +
> +The server then proceeded with reading at least stuff->num_items bytes
> +(depending on stuff->format) from the request and stuffing whatever it
> +finds into the property. In the process it would also allocate at least
> +stuff->num_items bytes, i.e. 4GB.
> +
> +The same bug exists in ProcChangeProperty and ProcXChangeDeviceProperty,
> +so let's fix that too.
> +
> +CVE-2022-46344, ZDI-CAN 19405
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/8f454b793e1f13c99872c15f0eed1d7f3b823fe8]
> +CVE: CVE-2022-46344
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + Xi/xiproperty.c | 4 ++--
> + dix/property.c  | 3 ++-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
> +index 68c362c62..066ba21fb 100644
> +--- a/Xi/xiproperty.c
> ++++ b/Xi/xiproperty.c
> +@@ -890,7 +890,7 @@ ProcXChangeDeviceProperty(ClientPtr client)
> +     REQUEST(xChangeDevicePropertyReq);
> +     DeviceIntPtr dev;
> +     unsigned long len;
> +-    int totalSize;
> ++    uint64_t totalSize;
> +     int rc;
> +
> +     REQUEST_AT_LEAST_SIZE(xChangeDevicePropertyReq);
> +@@ -1130,7 +1130,7 @@ ProcXIChangeProperty(ClientPtr client)
> + {
> +     int rc;
> +     DeviceIntPtr dev;
> +-    int totalSize;
> ++    uint64_t totalSize;
> +     unsigned long len;
> +
> +     REQUEST(xXIChangePropertyReq);
> +diff --git a/dix/property.c b/dix/property.c
> +index 94ef5a0ec..acce94b2c 100644
> +--- a/dix/property.c
> ++++ b/dix/property.c
> +@@ -205,7 +205,8 @@ ProcChangeProperty(ClientPtr client)
> +     WindowPtr pWin;
> +     char format, mode;
> +     unsigned long len;
> +-    int sizeInBytes, totalSize, err;
> ++    int sizeInBytes, err;
> ++    uint64_t totalSize;
> +
> +     REQUEST(xChangePropertyReq);
> +
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> index aba09afec3..744bd3e2aa 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> @@ -4,6 +4,12 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
>             file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch \
>             file://0001-xkb-proof-GetCountedString-against-request-length-at.patch \
> +           file://CVE-2022-4283.patch \
> +           file://CVE-2022-46340.patch \
> +           file://CVE-2022-46341.patch \
> +           file://CVE-2022-46342.patch \
> +           file://CVE-2022-46343.patch \
> +           file://CVE-2022-46344.patch \
>             "
>  SRC_URI[sha256sum] = "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176345): https://lists.openembedded.org/g/openembedded-core/message/176345
> Mute This Topic: https://lists.openembedded.org/mt/96518750/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

