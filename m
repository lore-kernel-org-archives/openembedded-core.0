Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84C2C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 08:15:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.7647.1675152922250756394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 00:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VvRchiJD;
 spf=pass (domain: mvista.com, ip: 209.85.167.52, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f52.google.com with SMTP id x40so22973035lfu.12
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 00:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks74C4VD9YLCsmMrtL+efS88OJGaMyCToGesCIq5Wl8=;
        b=VvRchiJDMkXqb+xCgEcid5lPcrPoOolBK6+tiobVD3c51H7g8lMM4UhW1WysjzXi4M
         +ZTKggNkymMzl6MWo3WZsD//zEkzZWmzLo76QfJe7ssgq5+uCQ6Ufyf5sqog5XKCFEWj
         1p1Xz9VyGmguIrqTDFnNBRJTiSVRKAsGtEqPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ks74C4VD9YLCsmMrtL+efS88OJGaMyCToGesCIq5Wl8=;
        b=Or5sBhKcyl7ex+Buw+4Il2Y0/K2Z3Mq6rZYNwZrLj7WwCIyts3EsTrfQZbMjBEya9O
         ZcrS7KMKbwhqAGWNnIwwSBmBbEmyxy4U8w8uYHDntG9Go2+vR1s4HY7VUAmAwWX80b0i
         wP7imdLWr+gJFUSdJjLHOmTDshSunWdKtOqZIfHhEH4jQnsUtNhRPhJCMJoS3sarexhd
         D+26Q4+w60Xpki3POLSdTWOXmjBUGbaYUR3+4cexi8tpseQdcZ3f04n2RGnbcryJDxIR
         WaFYY/EIHauWKOrg1ELzlvkW9+D+xaU/HiOTRhtPAdHlCYv38x1Eh57/RrIW7BSGdA99
         4u2w==
X-Gm-Message-State: AFqh2krM7/jaNaRN2xmNdnhfVNOeqpvbOoM6fvdrBu72fBw3I0CNdcbD
	1cnrpB7toVCBbRit4sh2VBynOgZriEyV17nkBlGOzSBD5ge7erkQ
X-Google-Smtp-Source: AMrXdXu3RqxwornllSBePfEyH2jgNU8jdnt4B4bSa/yDP46SML/7SELxf20b3+DJ92+vWX7DE9jUatUJ1JWP/NMZLqw=
X-Received: by 2002:a05:6512:3a88:b0:4a2:4b43:9aad with SMTP id
 q8-20020a0565123a8800b004a24b439aadmr5622682lfu.213.1675152920257; Tue, 31
 Jan 2023 00:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20230125115503.1726935-1-vkumbhar@mvista.com> <CAOSpxdZsCpsP786L2-7T1mFOxKX1H32yDroWELLtJ7Pd+o4BKg@mail.gmail.com>
In-Reply-To: <CAOSpxdZsCpsP786L2-7T1mFOxKX1H32yDroWELLtJ7Pd+o4BKg@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Tue, 31 Jan 2023 13:45:08 +0530
Message-ID: <CAPun1rFYkE-+9Nie8kVpogtmGDiKa5SkOfNY57Mh7LpL9pW3uA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xorg-x11-server: fix multiple
 xorg-x11-server bugs.
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c1bf5805f38aee14"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 08:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176510

--000000000000c1bf5805f38aee14
Content-Type: text/plain; charset="UTF-8"

Thanks for the information. Okay, will modify the patch accordingly.

-Thanks,
Vivek

On Mon, Jan 30, 2023 at 11:17 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Wed, Jan 25, 2023 at 1:55 AM vkumbhar <vkumbhar@mvista.com> wrote:
> >
> > From: Vivek Kumbhar <vkumbhar@mvista.com>
> >
> > Fixed Below CVE:
> > CVE-2022-4283
> > CVE-2022-46340
> > CVE-2022-46341
> > CVE-2022-46342
> > CVE-2022-46343
> > CVE-2022-46344
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  .../xserver-xorg/CVE-2022-4283.patch          | 39 +++++++++
> >  .../xserver-xorg/CVE-2022-46340.patch         | 55 ++++++++++++
> >  .../xserver-xorg/CVE-2022-46341.patch         | 86 +++++++++++++++++++
> >  .../xserver-xorg/CVE-2022-46342.patch         | 78 +++++++++++++++++
> >  .../xserver-xorg/CVE-2022-46343.patch         | 51 +++++++++++
> >  .../xserver-xorg/CVE-2022-46344.patch         | 75 ++++++++++++++++
> >  .../xorg-xserver/xserver-xorg_21.1.4.bb       |  6 ++
>
> We've done a version bump to 21.1.6 in kirkstone, so you'll need to
> rework this patch (if it is still necessary)
>
> Thanks!
>
> Steve
>
> >  7 files changed, 390 insertions(+)
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
> >  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
> >
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
> > new file mode 100644
> > index 0000000000..ce642843ab
> > --- /dev/null
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
> > @@ -0,0 +1,39 @@
> > +From ccdd431cd8f1cabae9d744f0514b6533c438908c Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Mon, 5 Dec 2022 15:55:54 +1000
> > +Subject: [PATCH] xkb: reset the radio_groups pointer to NULL after
> freeing it
> > +
> > +Unlike other elements of the keymap, this pointer was freed but not
> > +reset. On a subsequent XkbGetKbdByName request, the server may access
> > +already freed memory.
> > +
> > +CVE-2022-4283, ZDI-CAN-19530
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ccdd431cd8f1cabae9d744f0514b6533c438908c
> ]
> > +CVE: CVE-2022-4283
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + xkb/xkbUtils.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/xkb/xkbUtils.c b/xkb/xkbUtils.c
> > +index dd089c204..3f5791a18 100644
> > +--- a/xkb/xkbUtils.c
> > ++++ b/xkb/xkbUtils.c
> > +@@ -1326,6 +1326,7 @@ _XkbCopyNames(XkbDescPtr src, XkbDescPtr dst)
> > +         }
> > +         else {
> > +             free(dst->names->radio_groups);
> > ++            dst->names->radio_groups = NULL;
> > +         }
> > +         dst->names->num_rg = src->names->num_rg;
> > +
> > +--
> > +2.30.2
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
> > new file mode 100644
> > index 0000000000..9bdcdfa76e
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
> > @@ -0,0 +1,55 @@
> > +From b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63 Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Tue, 29 Nov 2022 12:55:45 +1000
> > +Subject: [PATCH] Xtest: disallow GenericEvents in XTestSwapFakeInput
> > +
> > +XTestSwapFakeInput assumes all events in this request are
> > +sizeof(xEvent) and iterates through these in 32-byte increments.
> > +However, a GenericEvent may be of arbitrary length longer than 32 bytes,
> > +so any GenericEvent in this list would result in subsequent events to be
> > +misparsed.
> > +
> > +Additional, the swapped event is written into a stack-allocated struct
> > +xEvent (size 32 bytes). For any GenericEvent longer than 32 bytes,
> > +swapping the event may thus smash the stack like an avocado on toast.
> > +
> > +Catch this case early and return BadValue for any GenericEvent.
> > +Which is what would happen in unswapped setups anyway since XTest
> > +doesn't support GenericEvent.
> > +
> > +CVE-2022-46340, ZDI-CAN 19265
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63
> ]
> > +CVE: CVE-2022-46340
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + Xext/xtest.c | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Xext/xtest.c b/Xext/xtest.c
> > +index bf27eb590..2985a4ce6 100644
> > +--- a/Xext/xtest.c
> > ++++ b/Xext/xtest.c
> > +@@ -502,10 +502,11 @@ XTestSwapFakeInput(ClientPtr client, xReq * req)
> > +
> > +     nev = ((req->length << 2) - sizeof(xReq)) / sizeof(xEvent);
> > +     for (ev = (xEvent *) &req[1]; --nev >= 0; ev++) {
> > ++        int evtype = ev->u.u.type & 0x177;
> > +         /* Swap event */
> > +-        proc = EventSwapVector[ev->u.u.type & 0177];
> > ++        proc = EventSwapVector[evtype];
> > +         /* no swapping proc; invalid event type? */
> > +-        if (!proc || proc == NotImplemented) {
> > ++        if (!proc || proc == NotImplemented || evtype == GenericEvent)
> {
> > +             client->errorValue = ev->u.u.type;
> > +             return BadValue;
> > +         }
> > +--
> > +2.30.2
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
> > new file mode 100644
> > index 0000000000..669792a5e7
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
> > @@ -0,0 +1,86 @@
> > +From 51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Tue, 29 Nov 2022 13:55:32 +1000
> > +Subject: [PATCH] Xi: disallow passive grabs with a detail > 255
> > +
> > +The XKB protocol effectively prevents us from ever using keycodes above
> > +255. For buttons it's theoretically possible but realistically too niche
> > +to worry about. For all other passive grabs, the detail must be zero
> > +anyway.
> > +
> > +This fixes an OOB write:
> > +
> > +ProcXIPassiveUngrabDevice() calls DeletePassiveGrabFromList with a
> > +temporary grab struct which contains tempGrab->detail.exact =
> stuff->detail.
> > +For matching existing grabs, DeleteDetailFromMask is called with the
> > +stuff->detail value. This function creates a new mask with the one bit
> > +representing stuff->detail cleared.
> > +
> > +However, the array size for the new mask is 8 * sizeof(CARD32) bits,
> > +thus any detail above 255 results in an OOB array write.
> > +
> > +CVE-2022-46341, ZDI-CAN 19381
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b
> ]
> > +CVE: CVE-2022-46341
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + Xi/xipassivegrab.c | 22 ++++++++++++++--------
> > + 1 file changed, 14 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
> > +index 2769fb7c9..c9ac2f855 100644
> > +--- a/Xi/xipassivegrab.c
> > ++++ b/Xi/xipassivegrab.c
> > +@@ -137,6 +137,12 @@ ProcXIPassiveGrabDevice(ClientPtr client)
> > +         return BadValue;
> > +     }
> > +
> > ++    /* XI2 allows 32-bit keycodes but thanks to XKB we can never
> > ++     * implement this. Just return an error for all keycodes that
> > ++     * cannot work anyway, same for buttons > 255. */
> > ++    if (stuff->detail > 255)
> > ++        return XIAlreadyGrabbed;
> > ++
> > +     if (XICheckInvalidMaskBits(client, (unsigned char *) &stuff[1],
> > +                                stuff->mask_len * 4) != Success)
> > +         return BadValue;
> > +@@ -207,14 +213,8 @@ ProcXIPassiveGrabDevice(ClientPtr client)
> > +                                 &param, XI2, &mask);
> > +             break;
> > +         case XIGrabtypeKeycode:
> > +-            /* XI2 allows 32-bit keycodes but thanks to XKB we can
> never
> > +-             * implement this. Just return an error for all keycodes
> that
> > +-             * cannot work anyway */
> > +-            if (stuff->detail > 255)
> > +-                status = XIAlreadyGrabbed;
> > +-            else
> > +-                status = GrabKey(client, dev, mod_dev, stuff->detail,
> > +-                                 &param, XI2, &mask);
> > ++            status = GrabKey(client, dev, mod_dev, stuff->detail,
> > ++                             &param, XI2, &mask);
> > +             break;
> > +         case XIGrabtypeEnter:
> > +         case XIGrabtypeFocusIn:
> > +@@ -334,6 +334,12 @@ ProcXIPassiveUngrabDevice(ClientPtr client)
> > +         return BadValue;
> > +     }
> > +
> > ++    /* We don't allow passive grabs for details > 255 anyway */
> > ++    if (stuff->detail > 255) {
> > ++        client->errorValue = stuff->detail;
> > ++        return BadValue;
> > ++    }
> > ++
> > +     rc = dixLookupWindow(&win, stuff->grab_window, client,
> DixSetAttrAccess);
> > +     if (rc != Success)
> > +         return rc;
> > +--
> > +2.30.2
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
> > new file mode 100644
> > index 0000000000..6c17b105a0
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
> > @@ -0,0 +1,78 @@
> > +From b79f32b57cc0c1186b2899bce7cf89f7b325161b Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Wed, 30 Nov 2022 11:20:40 +1000
> > +Subject: [PATCH] Xext: free the XvRTVideoNotify when turning off from
> the same
> > + client
> > +
> > +This fixes a use-after-free bug:
> > +
> > +When a client first calls XvdiSelectVideoNotify() on a drawable with a
> > +TRUE onoff argument, a struct XvVideoNotifyRec is allocated. This struct
> > +is added twice to the resources:
> > +  - as the drawable's XvRTVideoNotifyList. This happens only once per
> > +    drawable, subsequent calls append to this list.
> > +  - as the client's XvRTVideoNotify. This happens for every client.
> > +
> > +The struct keeps the ClientPtr around once it has been added for a
> > +client. The idea, presumably, is that if the client disconnects we can
> remove
> > +all structs from the drawable's list that match the client (by resetting
> > +the ClientPtr to NULL), but if the drawable is destroyed we can remove
> > +and free the whole list.
> > +
> > +However, if the same client then calls XvdiSelectVideoNotify() on the
> > +same drawable with a FALSE onoff argument, only the ClientPtr on the
> > +existing struct was set to NULL. The struct itself remained in the
> > +client's resources.
> > +
> > +If the drawable is now destroyed, the resource system invokes
> > +XvdiDestroyVideoNotifyList which frees the whole list for this drawable
> > +- including our struct. This function however does not free the resource
> > +for the client since our ClientPtr is NULL.
> > +
> > +Later, when the client is destroyed and the resource system invokes
> > +XvdiDestroyVideoNotify, we unconditionally set the ClientPtr to NULL. On
> > +a struct that has been freed previously. This is generally frowned upon.
> > +
> > +Fix this by calling FreeResource() on the second call instead of merely
> > +setting the ClientPtr to NULL. This removes the struct from the client
> > +resources (but not from the list), ensuring that it won't be accessed
> > +again when the client quits.
> > +
> > +Note that the assignment tpn->client = NULL; is superfluous since the
> > +XvdiDestroyVideoNotify function will do this anyway. But it's left for
> > +clarity and to match a similar invocation in XvdiSelectPortNotify.
> > +
> > +CVE-2022-46342, ZDI-CAN 19400
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b79f32b57cc0c1186b2899bce7cf89f7b325161b
> ]
> > +CVE: CVE-2022-46342
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + Xext/xvmain.c | 4 +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Xext/xvmain.c b/Xext/xvmain.c
> > +index f62747193..2a08f8744 100644
> > +--- a/Xext/xvmain.c
> > ++++ b/Xext/xvmain.c
> > +@@ -811,8 +811,10 @@ XvdiSelectVideoNotify(ClientPtr client,
> DrawablePtr pDraw, BOOL onoff)
> > +         tpn = pn;
> > +         while (tpn) {
> > +             if (tpn->client == client) {
> > +-                if (!onoff)
> > ++                if (!onoff) {
> > +                     tpn->client = NULL;
> > ++                    FreeResource(tpn->id, XvRTVideoNotify);
> > ++                }
> > +                 return Success;
> > +             }
> > +             if (!tpn->client)
> > +--
> > +2.30.2
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
> > new file mode 100644
> > index 0000000000..11507c3247
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
> > @@ -0,0 +1,51 @@
> > +From 842ca3ccef100ce010d1d8f5f6d6cc1915055900 Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Tue, 29 Nov 2022 14:53:07 +1000
> > +Subject: [PATCH] Xext: free the screen saver resource when replacing it
> > +
> > +This fixes a use-after-free bug:
> > +
> > +When a client first calls ScreenSaverSetAttributes(), a struct
> > +ScreenSaverAttrRec is allocated and added to the client's
> > +resources.
> > +
> > +When the same client calls ScreenSaverSetAttributes() again, a new
> > +struct ScreenSaverAttrRec is allocated, replacing the old struct. The
> > +old struct was freed but not removed from the clients resources.
> > +
> > +Later, when the client is destroyed the resource system invokes
> > +ScreenSaverFreeAttr and attempts to clean up the already freed struct.
> > +
> > +Fix this by letting the resource system free the old attrs instead.
> > +
> > +CVE-2022-46343, ZDI-CAN 19404
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/842ca3ccef100ce010d1d8f5f6d6cc1915055900
> ]
> > +CVE: CVE-2022-46343
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + Xext/saver.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Xext/saver.c b/Xext/saver.c
> > +index f813ba08d..fd6153c31 100644
> > +--- a/Xext/saver.c
> > ++++ b/Xext/saver.c
> > +@@ -1051,7 +1051,7 @@ ScreenSaverSetAttributes(ClientPtr client)
> > +         pVlist++;
> > +     }
> > +     if (pPriv->attr)
> > +-        FreeScreenAttr(pPriv->attr);
> > ++        FreeResource(pPriv->attr->resource, AttrType);
> > +     pPriv->attr = pAttr;
> > +     pAttr->resource = FakeClientID(client->index);
> > +     if (!AddResource(pAttr->resource, AttrType, (void *) pAttr))
> > +--
> > +2.30.2
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
> > new file mode 100644
> > index 0000000000..92f65569ef
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
> > @@ -0,0 +1,75 @@
> > +From 8f454b793e1f13c99872c15f0eed1d7f3b823fe8 Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Tue, 29 Nov 2022 13:26:57 +1000
> > +Subject: [PATCH] Xi: avoid integer truncation in length check of
> > + ProcXIChangeProperty
> > +
> > +This fixes an OOB read and the resulting information disclosure.
> > +
> > +Length calculation for the request was clipped to a 32-bit integer. With
> > +the correct stuff->num_items value the expected request size was
> > +truncated, passing the REQUEST_FIXED_SIZE check.
> > +
> > +The server then proceeded with reading at least stuff->num_items bytes
> > +(depending on stuff->format) from the request and stuffing whatever it
> > +finds into the property. In the process it would also allocate at least
> > +stuff->num_items bytes, i.e. 4GB.
> > +
> > +The same bug exists in ProcChangeProperty and ProcXChangeDeviceProperty,
> > +so let's fix that too.
> > +
> > +CVE-2022-46344, ZDI-CAN 19405
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/8f454b793e1f13c99872c15f0eed1d7f3b823fe8
> ]
> > +CVE: CVE-2022-46344
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + Xi/xiproperty.c | 4 ++--
> > + dix/property.c  | 3 ++-
> > + 2 files changed, 4 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
> > +index 68c362c62..066ba21fb 100644
> > +--- a/Xi/xiproperty.c
> > ++++ b/Xi/xiproperty.c
> > +@@ -890,7 +890,7 @@ ProcXChangeDeviceProperty(ClientPtr client)
> > +     REQUEST(xChangeDevicePropertyReq);
> > +     DeviceIntPtr dev;
> > +     unsigned long len;
> > +-    int totalSize;
> > ++    uint64_t totalSize;
> > +     int rc;
> > +
> > +     REQUEST_AT_LEAST_SIZE(xChangeDevicePropertyReq);
> > +@@ -1130,7 +1130,7 @@ ProcXIChangeProperty(ClientPtr client)
> > + {
> > +     int rc;
> > +     DeviceIntPtr dev;
> > +-    int totalSize;
> > ++    uint64_t totalSize;
> > +     unsigned long len;
> > +
> > +     REQUEST(xXIChangePropertyReq);
> > +diff --git a/dix/property.c b/dix/property.c
> > +index 94ef5a0ec..acce94b2c 100644
> > +--- a/dix/property.c
> > ++++ b/dix/property.c
> > +@@ -205,7 +205,8 @@ ProcChangeProperty(ClientPtr client)
> > +     WindowPtr pWin;
> > +     char format, mode;
> > +     unsigned long len;
> > +-    int sizeInBytes, totalSize, err;
> > ++    int sizeInBytes, err;
> > ++    uint64_t totalSize;
> > +
> > +     REQUEST(xChangePropertyReq);
> > +
> > +--
> > +2.30.2
> > +
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > index aba09afec3..744bd3e2aa 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > @@ -4,6 +4,12 @@ SRC_URI +=
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
> >             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> >
>  file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch \
> >
>  file://0001-xkb-proof-GetCountedString-against-request-length-at.patch \
> > +           file://CVE-2022-4283.patch \
> > +           file://CVE-2022-46340.patch \
> > +           file://CVE-2022-46341.patch \
> > +           file://CVE-2022-46342.patch \
> > +           file://CVE-2022-46343.patch \
> > +           file://CVE-2022-46344.patch \
> >             "
> >  SRC_URI[sha256sum] =
> "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
> >
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176345):
> https://lists.openembedded.org/g/openembedded-core/message/176345
> > Mute This Topic: https://lists.openembedded.org/mt/96518750/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000c1bf5805f38aee14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the information. Okay, will modify the pat=
ch accordingly.<br></div><div><br></div><div>-Thanks,</div><div>Vivek</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Jan 30, 2023 at 11:17 PM Steve Sakoman &lt;<a href=3D"mailto:steve@=
sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Wed, Jan 25, 2023 at 1:55 AM vkumbhar &lt;=
<a href=3D"mailto:vkumbhar@mvista.com" target=3D"_blank">vkumbhar@mvista.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=
=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Fixed Below CVE:<br>
&gt; CVE-2022-4283<br>
&gt; CVE-2022-46340<br>
&gt; CVE-2022-46341<br>
&gt; CVE-2022-46342<br>
&gt; CVE-2022-46343<br>
&gt; CVE-2022-46344<br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2022-4283.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 39 +++++++++<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2022-46340.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 55 ++++++++++++<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2022-46341.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 86 +++++++++++++++++++<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2022-46342.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 78 +++++++++++++++++<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2022-46343.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 51 +++++++++++<br>
&gt;=C2=A0 .../xserver-xorg/CVE-2022-46344.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 75 ++++++++++++++++<br>
&gt;=C2=A0 .../xorg-xserver/<a href=3D"http://xserver-xorg_21.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 6 ++<br>
<br>
We&#39;ve done a version bump to 21.1.6 in kirkstone, so you&#39;ll need to=
<br>
rework this patch (if it is still necessary)<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt;=C2=A0 7 files changed, 390 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2022-4283.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2022-46340.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2022-46341.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2022-46342.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2022-46343.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xo=
rg/CVE-2022-46344.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-=
4283.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.=
patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ce642843ab<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.pa=
tch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From ccdd431cd8f1cabae9d744f0514b6533c438908c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Mon, 5 Dec 2022 15:55:54 +1000<br>
&gt; +Subject: [PATCH] xkb: reset the radio_groups pointer to NULL after fr=
eeing it<br>
&gt; +<br>
&gt; +Unlike other elements of the keymap, this pointer was freed but not<b=
r>
&gt; +reset. On a subsequent XkbGetKbdByName request, the server may access=
<br>
&gt; +already freed memory.<br>
&gt; +<br>
&gt; +CVE-2022-4283, ZDI-CAN-19530<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/ccdd431cd8f1cabae9d744f0514b6533c438908c" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/ccdd431cd8f1cabae9d744f0514b6533c438908c</a>]<br>
&gt; +CVE: CVE-2022-4283<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + xkb/xkbUtils.c | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/xkb/xkbUtils.c b/xkb/xkbUtils.c<br>
&gt; +index dd089c204..3f5791a18 100644<br>
&gt; +--- a/xkb/xkbUtils.c<br>
&gt; ++++ b/xkb/xkbUtils.c<br>
&gt; +@@ -1326,6 +1326,7 @@ _XkbCopyNames(XkbDescPtr src, XkbDescPtr dst)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(dst-&gt;names-&g=
t;radio_groups);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst-&gt;names-&gt;radio_gr=
oups =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst-&gt;names-&gt;num_rg =3D src-&g=
t;names-&gt;num_rg;<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-=
46340.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4634=
0.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9bdcdfa76e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.p=
atch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Tue, 29 Nov 2022 12:55:45 +1000<br>
&gt; +Subject: [PATCH] Xtest: disallow GenericEvents in XTestSwapFakeInput<=
br>
&gt; +<br>
&gt; +XTestSwapFakeInput assumes all events in this request are<br>
&gt; +sizeof(xEvent) and iterates through these in 32-byte increments.<br>
&gt; +However, a GenericEvent may be of arbitrary length longer than 32 byt=
es,<br>
&gt; +so any GenericEvent in this list would result in subsequent events to=
 be<br>
&gt; +misparsed.<br>
&gt; +<br>
&gt; +Additional, the swapped event is written into a stack-allocated struc=
t<br>
&gt; +xEvent (size 32 bytes). For any GenericEvent longer than 32 bytes,<br=
>
&gt; +swapping the event may thus smash the stack like an avocado on toast.=
<br>
&gt; +<br>
&gt; +Catch this case early and return BadValue for any GenericEvent.<br>
&gt; +Which is what would happen in unswapped setups anyway since XTest<br>
&gt; +doesn&#39;t support GenericEvent.<br>
&gt; +<br>
&gt; +CVE-2022-46340, ZDI-CAN 19265<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/b320ca0ffe4c0c872eeb3a93d9bde21f765c7c63</a>]<br>
&gt; +CVE: CVE-2022-46340<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Xext/xtest.c | 5 +++--<br>
&gt; + 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Xext/xtest.c b/Xext/xtest.c<br>
&gt; +index bf27eb590..2985a4ce6 100644<br>
&gt; +--- a/Xext/xtest.c<br>
&gt; ++++ b/Xext/xtest.c<br>
&gt; +@@ -502,10 +502,11 @@ XTestSwapFakeInput(ClientPtr client, xReq * req=
)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nev =3D ((req-&gt;length &lt;&lt; 2) - sizeof(xRe=
q)) / sizeof(xEvent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (ev =3D (xEvent *) &amp;req[1]; --nev &gt;=3D=
 0; ev++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int evtype =3D ev-&gt;u.u.type &amp; 0x1=
77;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Swap event */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc =3D EventSwapVector[ev-&gt;u.u.type=
 &amp; 0177];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc =3D EventSwapVector[evtype];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no swapping proc; invalid event =
type? */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!proc || proc =3D=3D NotImplemented)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!proc || proc =3D=3D NotImplemented =
|| evtype =3D=3D GenericEvent) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0client-&gt;errorValue=
 =3D ev-&gt;u.u.type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadValue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-=
46341.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4634=
1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..669792a5e7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.p=
atch<br>
&gt; @@ -0,0 +1,86 @@<br>
&gt; +From 51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Tue, 29 Nov 2022 13:55:32 +1000<br>
&gt; +Subject: [PATCH] Xi: disallow passive grabs with a detail &gt; 255<br=
>
&gt; +<br>
&gt; +The XKB protocol effectively prevents us from ever using keycodes abo=
ve<br>
&gt; +255. For buttons it&#39;s theoretically possible but realistically to=
o niche<br>
&gt; +to worry about. For all other passive grabs, the detail must be zero<=
br>
&gt; +anyway.<br>
&gt; +<br>
&gt; +This fixes an OOB write:<br>
&gt; +<br>
&gt; +ProcXIPassiveUngrabDevice() calls DeletePassiveGrabFromList with a<br=
>
&gt; +temporary grab struct which contains tempGrab-&gt;detail.exact =3D st=
uff-&gt;detail.<br>
&gt; +For matching existing grabs, DeleteDetailFromMask is called with the<=
br>
&gt; +stuff-&gt;detail value. This function creates a new mask with the one=
 bit<br>
&gt; +representing stuff-&gt;detail cleared.<br>
&gt; +<br>
&gt; +However, the array size for the new mask is 8 * sizeof(CARD32) bits,<=
br>
&gt; +thus any detail above 255 results in an OOB array write.<br>
&gt; +<br>
&gt; +CVE-2022-46341, ZDI-CAN 19381<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/51eb63b0ee1509c6c6b8922b0e4aa037faa6f78b</a>]<br>
&gt; +CVE: CVE-2022-46341<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Xi/xipassivegrab.c | 22 ++++++++++++++--------<br>
&gt; + 1 file changed, 14 insertions(+), 8 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c<br>
&gt; +index 2769fb7c9..c9ac2f855 100644<br>
&gt; +--- a/Xi/xipassivegrab.c<br>
&gt; ++++ b/Xi/xipassivegrab.c<br>
&gt; +@@ -137,6 +137,12 @@ ProcXIPassiveGrabDevice(ClientPtr client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadValue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 /* XI2 allows 32-bit keycodes but thanks to XKB we can=
 never<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* implement this. Just return an error for all k=
eycodes that<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* cannot work anyway, same for buttons &gt; 255.=
 */<br>
&gt; ++=C2=A0 =C2=A0 if (stuff-&gt;detail &gt; 255)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return XIAlreadyGrabbed;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (XICheckInvalidMaskBits(client, (unsigned char=
 *) &amp;stuff[1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stuff-&gt;mask_len * 4) !=3D Suc=
cess)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadValue;<br>
&gt; +@@ -207,14 +213,8 @@ ProcXIPassiveGrabDevice(ClientPtr client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;param, XI2, &amp;mask=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case XIGrabtypeKeycode:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XI2 allows 32-bit keyco=
des but thanks to XKB we can never<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* implement this. Ju=
st return an error for all keycodes that<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cannot work anyway=
 */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stuff-&gt;detail &gt; =
255)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D X=
IAlreadyGrabbed;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D G=
rabKey(client, dev, mod_dev, stuff-&gt;detail,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;param, XI2, &amp;m=
ask);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D GrabKey(client,=
 dev, mod_dev, stuff-&gt;detail,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;param, XI2, &amp;mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case XIGrabtypeEnter:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case XIGrabtypeFocusIn:<br>
&gt; +@@ -334,6 +334,12 @@ ProcXIPassiveUngrabDevice(ClientPtr client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadValue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 /* We don&#39;t allow passive grabs for details &gt; 2=
55 anyway */<br>
&gt; ++=C2=A0 =C2=A0 if (stuff-&gt;detail &gt; 255) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt;errorValue =3D stuff-&gt;deta=
il;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return BadValue;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc =3D dixLookupWindow(&amp;win, stuff-&gt;grab_w=
indow, client, DixSetAttrAccess);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rc !=3D Success)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-=
46342.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4634=
2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6c17b105a0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.p=
atch<br>
&gt; @@ -0,0 +1,78 @@<br>
&gt; +From b79f32b57cc0c1186b2899bce7cf89f7b325161b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Wed, 30 Nov 2022 11:20:40 +1000<br>
&gt; +Subject: [PATCH] Xext: free the XvRTVideoNotify when turning off from=
 the same<br>
&gt; + client<br>
&gt; +<br>
&gt; +This fixes a use-after-free bug:<br>
&gt; +<br>
&gt; +When a client first calls XvdiSelectVideoNotify() on a drawable with =
a<br>
&gt; +TRUE onoff argument, a struct XvVideoNotifyRec is allocated. This str=
uct<br>
&gt; +is added twice to the resources:<br>
&gt; +=C2=A0 - as the drawable&#39;s XvRTVideoNotifyList. This happens only=
 once per<br>
&gt; +=C2=A0 =C2=A0 drawable, subsequent calls append to this list.<br>
&gt; +=C2=A0 - as the client&#39;s XvRTVideoNotify. This happens for every =
client.<br>
&gt; +<br>
&gt; +The struct keeps the ClientPtr around once it has been added for a<br=
>
&gt; +client. The idea, presumably, is that if the client disconnects we ca=
n remove<br>
&gt; +all structs from the drawable&#39;s list that match the client (by re=
setting<br>
&gt; +the ClientPtr to NULL), but if the drawable is destroyed we can remov=
e<br>
&gt; +and free the whole list.<br>
&gt; +<br>
&gt; +However, if the same client then calls XvdiSelectVideoNotify() on the=
<br>
&gt; +same drawable with a FALSE onoff argument, only the ClientPtr on the<=
br>
&gt; +existing struct was set to NULL. The struct itself remained in the<br=
>
&gt; +client&#39;s resources.<br>
&gt; +<br>
&gt; +If the drawable is now destroyed, the resource system invokes<br>
&gt; +XvdiDestroyVideoNotifyList which frees the whole list for this drawab=
le<br>
&gt; +- including our struct. This function however does not free the resou=
rce<br>
&gt; +for the client since our ClientPtr is NULL.<br>
&gt; +<br>
&gt; +Later, when the client is destroyed and the resource system invokes<b=
r>
&gt; +XvdiDestroyVideoNotify, we unconditionally set the ClientPtr to NULL.=
 On<br>
&gt; +a struct that has been freed previously. This is generally frowned up=
on.<br>
&gt; +<br>
&gt; +Fix this by calling FreeResource() on the second call instead of mere=
ly<br>
&gt; +setting the ClientPtr to NULL. This removes the struct from the clien=
t<br>
&gt; +resources (but not from the list), ensuring that it won&#39;t be acce=
ssed<br>
&gt; +again when the client quits.<br>
&gt; +<br>
&gt; +Note that the assignment tpn-&gt;client =3D NULL; is superfluous sinc=
e the<br>
&gt; +XvdiDestroyVideoNotify function will do this anyway. But it&#39;s lef=
t for<br>
&gt; +clarity and to match a similar invocation in XvdiSelectPortNotify.<br=
>
&gt; +<br>
&gt; +CVE-2022-46342, ZDI-CAN 19400<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/b79f32b57cc0c1186b2899bce7cf89f7b325161b" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/b79f32b57cc0c1186b2899bce7cf89f7b325161b</a>]<br>
&gt; +CVE: CVE-2022-46342<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Xext/xvmain.c | 4 +++-<br>
&gt; + 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/Xext/xvmain.c b/Xext/xvmain.c<br>
&gt; +index f62747193..2a08f8744 100644<br>
&gt; +--- a/Xext/xvmain.c<br>
&gt; ++++ b/Xext/xvmain.c<br>
&gt; +@@ -811,8 +811,10 @@ XvdiSelectVideoNotify(ClientPtr client, Drawable=
Ptr pDraw, BOOL onoff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpn =3D pn;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (tpn) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tpn-&gt;client =
=3D=3D client) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!onoff)<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!onoff) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tpn-&gt;client =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 FreeResource(tpn-&gt;id, XvRTVideoNotify);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
Success;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tpn-&gt;client)<=
br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-=
46343.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4634=
3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..11507c3247<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.p=
atch<br>
&gt; @@ -0,0 +1,51 @@<br>
&gt; +From 842ca3ccef100ce010d1d8f5f6d6cc1915055900 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Tue, 29 Nov 2022 14:53:07 +1000<br>
&gt; +Subject: [PATCH] Xext: free the screen saver resource when replacing =
it<br>
&gt; +<br>
&gt; +This fixes a use-after-free bug:<br>
&gt; +<br>
&gt; +When a client first calls ScreenSaverSetAttributes(), a struct<br>
&gt; +ScreenSaverAttrRec is allocated and added to the client&#39;s<br>
&gt; +resources.<br>
&gt; +<br>
&gt; +When the same client calls ScreenSaverSetAttributes() again, a new<br=
>
&gt; +struct ScreenSaverAttrRec is allocated, replacing the old struct. The=
<br>
&gt; +old struct was freed but not removed from the clients resources.<br>
&gt; +<br>
&gt; +Later, when the client is destroyed the resource system invokes<br>
&gt; +ScreenSaverFreeAttr and attempts to clean up the already freed struct=
.<br>
&gt; +<br>
&gt; +Fix this by letting the resource system free the old attrs instead.<b=
r>
&gt; +<br>
&gt; +CVE-2022-46343, ZDI-CAN 19404<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/842ca3ccef100ce010d1d8f5f6d6cc1915055900" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/842ca3ccef100ce010d1d8f5f6d6cc1915055900</a>]<br>
&gt; +CVE: CVE-2022-46343<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Xext/saver.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/Xext/saver.c b/Xext/saver.c<br>
&gt; +index f813ba08d..fd6153c31 100644<br>
&gt; +--- a/Xext/saver.c<br>
&gt; ++++ b/Xext/saver.c<br>
&gt; +@@ -1051,7 +1051,7 @@ ScreenSaverSetAttributes(ClientPtr client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pVlist++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pPriv-&gt;attr)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FreeScreenAttr(pPriv-&gt;attr);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FreeResource(pPriv-&gt;attr-&gt;resource=
, AttrType);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pPriv-&gt;attr =3D pAttr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pAttr-&gt;resource =3D FakeClientID(client-&gt;in=
dex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!AddResource(pAttr-&gt;resource, AttrType, (v=
oid *) pAttr))<br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-=
46344.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4634=
4.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..92f65569ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.p=
atch<br>
&gt; @@ -0,0 +1,75 @@<br>
&gt; +From 8f454b793e1f13c99872c15f0eed1d7f3b823fe8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Tue, 29 Nov 2022 13:26:57 +1000<br>
&gt; +Subject: [PATCH] Xi: avoid integer truncation in length check of<br>
&gt; + ProcXIChangeProperty<br>
&gt; +<br>
&gt; +This fixes an OOB read and the resulting information disclosure.<br>
&gt; +<br>
&gt; +Length calculation for the request was clipped to a 32-bit integer. W=
ith<br>
&gt; +the correct stuff-&gt;num_items value the expected request size was<b=
r>
&gt; +truncated, passing the REQUEST_FIXED_SIZE check.<br>
&gt; +<br>
&gt; +The server then proceeded with reading at least stuff-&gt;num_items b=
ytes<br>
&gt; +(depending on stuff-&gt;format) from the request and stuffing whateve=
r it<br>
&gt; +finds into the property. In the process it would also allocate at lea=
st<br>
&gt; +stuff-&gt;num_items bytes, i.e. 4GB.<br>
&gt; +<br>
&gt; +The same bug exists in ProcChangeProperty and ProcXChangeDeviceProper=
ty,<br>
&gt; +so let&#39;s fix that too.<br>
&gt; +<br>
&gt; +CVE-2022-46344, ZDI-CAN 19405<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Acked-by: Olivier Fourdan &lt;<a href=3D"mailto:ofourdan@redhat.com" =
target=3D"_blank">ofourdan@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/8f454b793e1f13c99872c15f0eed1d7f3b823fe8" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/8f454b793e1f13c99872c15f0eed1d7f3b823fe8</a>]<br>
&gt; +CVE: CVE-2022-46344<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Xi/xiproperty.c | 4 ++--<br>
&gt; + dix/property.c=C2=A0 | 3 ++-<br>
&gt; + 2 files changed, 4 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c<br>
&gt; +index 68c362c62..066ba21fb 100644<br>
&gt; +--- a/Xi/xiproperty.c<br>
&gt; ++++ b/Xi/xiproperty.c<br>
&gt; +@@ -890,7 +890,7 @@ ProcXChangeDeviceProperty(ClientPtr client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0REQUEST(xChangeDevicePropertyReq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DeviceIntPtr dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long len;<br>
&gt; +-=C2=A0 =C2=A0 int totalSize;<br>
&gt; ++=C2=A0 =C2=A0 uint64_t totalSize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0REQUEST_AT_LEAST_SIZE(xChangeDevicePropertyReq);<=
br>
&gt; +@@ -1130,7 +1130,7 @@ ProcXIChangeProperty(ClientPtr client)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DeviceIntPtr dev;<br>
&gt; +-=C2=A0 =C2=A0 int totalSize;<br>
&gt; ++=C2=A0 =C2=A0 uint64_t totalSize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long len;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0REQUEST(xXIChangePropertyReq);<br>
&gt; +diff --git a/dix/property.c b/dix/property.c<br>
&gt; +index 94ef5a0ec..acce94b2c 100644<br>
&gt; +--- a/dix/property.c<br>
&gt; ++++ b/dix/property.c<br>
&gt; +@@ -205,7 +205,8 @@ ProcChangeProperty(ClientPtr client)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WindowPtr pWin;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char format, mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long len;<br>
&gt; +-=C2=A0 =C2=A0 int sizeInBytes, totalSize, err;<br>
&gt; ++=C2=A0 =C2=A0 int sizeInBytes, err;<br>
&gt; ++=C2=A0 =C2=A0 uint64_t totalSize;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0REQUEST(xChangePropertyReq);<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xser=
ver-xorg_21.1.4.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.=
4.bb</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_21.1.4.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.4.bb</a=
><br>
&gt; index aba09afec3..744bd3e2aa 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_21.1.4.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.4.bb</a=
><br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_21.1.4.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.4.bb</a=
><br>
&gt; @@ -4,6 +4,12 @@ SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel=
-ddx-only-for-pre-gen4-hardwar.pat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-dupli=
cate-definitions-of-IOPortBase.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-xkb-fix-som=
e-possible-memleaks-in-XkbGetKbdByName.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-xkb-proof-G=
etCountedString-against-request-length-at.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-4283.patch \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-46340.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-46341.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-46342.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-46343.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-46344.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;5cc4be8ee47edb58d4a90e603a59d56b402=
91ad38371b0bd2471fc3cbee1c587&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#176345): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/176345" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/176345</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96518750=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/96518750/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000c1bf5805f38aee14--

