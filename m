Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D3DC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:09:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.56987.1699283381783596029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kP4bWD5W;
 spf=pass (domain: mvista.com, ip: 209.85.208.180, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5056059e0so66120631fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699283380; x=1699888180; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg6gi03bsv/DyWQOCSMClvV9jf9oqCPVSYHzoMq0K2g=;
        b=kP4bWD5Wi8Z58dq9YQF8s/bhNyLXeh+Qshlpjg7f+HUeK4r676y2PTVGT8+T82msFe
         RlynCHZ2Lh70G0mk2rPjGCZsVRgc9Jjg4TC9poiYNJf4YmXadYyEmpfy+5Tf2vCbPBDA
         mGESmflPv4sWbecMbkcezpB1EGicl9cBhSYfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283380; x=1699888180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pg6gi03bsv/DyWQOCSMClvV9jf9oqCPVSYHzoMq0K2g=;
        b=Y5ky/McYpBAGuFGwnEqum4RoZ/VcjdqUuCvdGfNBBrQEd99IgVLTvybRwjb9BwOkXZ
         O+vqdwO3lKgp6AN58OLbc3u0k4PY1WMdbA1TA0/Xyw5piy7jq91YFbwDnestrhDXzgXZ
         EqnpT9I+vx7hlBiZA5zr1vLWkRZhYRl49taP0t+SY47xHMKTxP11bKCROg9bxt7/XqMU
         c5/H/4eQO1+cmFCUKc+nUG7FF9kht7FAbQ+giSPv7G1gRTDuKtjPcbCy/6tyViKoHfyw
         xSd61rNfC1Gs9X7crIjnOPp2YFkFUgGF7K2YvRkcS3ebyil1ZfWtGsEc+nWsLDt8Eprc
         hbCQ==
X-Gm-Message-State: AOJu0Yw8gZTG6I6a0OhzkNp9CaHIsfcs+XcJJiUxl3mTemh4La+8rpNj
	8s45mVymFoum/yAdjuQfAiXYFrfuzusD1Yamj0RNwNrLCBdZJqnT
X-Google-Smtp-Source: AGHT+IFGX2TNmXdUz40ULvQRgNaw6tiOfXG4pdbxDhRIWczpPJzsIGSvK1xNQQh2K51nVG+xLQTIkyR97udjt6uxpBU=
X-Received: by 2002:a2e:3816:0:b0:2c5:8a0:b502 with SMTP id
 f22-20020a2e3816000000b002c508a0b502mr22432703lja.48.1699283379479; Mon, 06
 Nov 2023 07:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20231106054712.810105-1-vanusuri@mvista.com> <B059B3A2-2574-47B0-8DC9-99E7701917C6@arm.com>
In-Reply-To: <B059B3A2-2574-47B0-8DC9-99E7701917C6@arm.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 6 Nov 2023 20:39:27 +0530
Message-ID: <CANQUz19_U_Ztwf_TX7ZEdVFqTxKFiSW6c5LEY++5_ku0NUz+nA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] xserver-xorg: Fix for CVE-2023-5367
 CVE-2023-5380 and CVE-2023-5574
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003502e706097d3edb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190226

--0000000000003502e706097d3edb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure Ross.

Thanks & Regards,
Vijay

On Mon, Nov 6, 2023 at 4:08=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> wr=
ote:

> It would be much appreciated if you could submit to master first and then
> backport to the stable releases, as it makes tracking what releases have
> been fixed a lot easier.
>
> Ross
>
> > On 6 Nov 2023, at 05:47, Vijay Anusuri via lists.openembedded.org
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport
> > [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e7=
1855d93e492bc554719a
> > &
> >
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce96166204561=
02727acb8b0256b7bbd7
> > &
> >
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0f=
cce70f6ad3310b713d5f
> > &
> >
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e31=
1673511ce61aa2f7a81f
> > &
> >
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c=
7829b06bdba8a88bd586
> ]
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> > .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++
> > .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++
> > .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ++++++++++++++++++
> > .../xserver-xorg/CVE-2023-5574-2.patch        |  42 +++++++
> > .../xserver-xorg/CVE-2023-5574-3.patch        |  54 +++++++++
> > .../xorg-xserver/xserver-xorg_1.20.14.bb      |   5 +
> > 6 files changed, 400 insertions(+)
> > create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> > create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> > create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
> > create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
> > create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
> >
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> > new file mode 100644
> > index 0000000000..508588481e
> > --- /dev/null
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.pat=
ch
> > @@ -0,0 +1,84 @@
> > +From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Tue, 3 Oct 2023 11:53:05 +1000
> > +Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
> > +
> > +The handling of appending/prepending properties was incorrect, with at
> > +least two bugs: the property length was set to the length of the new
> > +part only, i.e. appending or prepending N elements to a property with =
P
> > +existing elements always resulted in the property having N elements
> > +instead of N + P.
> > +
> > +Second, when pre-pending a value to a property, the offset for the old
> > +values was incorrect, leaving the new property with potentially
> > +uninitalized values and/or resulting in OOB memory writes.
> > +For example, prepending a 3 element value to a 5 element property woul=
d
> > +result in this 8 value array:
> > +  [N, N, N, ?, ?, P, P, P ] P, P
> > +                            ^OOB write
> > +
> > +The XI2 code is a copy/paste of the RandR code, so the bug exists in
> > +both.
> > +
> > +CVE-2023-5367, ZDI-CAN-22153
> > +
> > +This vulnerability was discovered by:
> > +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e7=
1855d93e492bc554719a
> ]
> > +CVE: CVE-2023-5367
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + Xi/xiproperty.c    | 4 ++--
> > + randr/rrproperty.c | 4 ++--
> > + 2 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
> > +index 066ba21fba..d315f04d0e 100644
> > +--- a/Xi/xiproperty.c
> > ++++ b/Xi/xiproperty.c
> > +@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom
> property, Atom type,
> > +                 XIDestroyDeviceProperty(prop);
> > +             return BadAlloc;
> > +         }
> > +-        new_value.size =3D len;
> > ++        new_value.size =3D total_len;
> > +         new_value.type =3D type;
> > +         new_value.format =3D format;
> > +
> > +@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom
> property, Atom type,
> > +         case PropModePrepend:
> > +             new_data =3D new_value.data;
> > +             old_data =3D (void *) (((char *) new_value.data) +
> > +-                                  (prop_value->size * size_in_bytes))=
;
> > ++                                  (len * size_in_bytes));
> > +             break;
> > +         }
> > +         if (new_data)
> > +diff --git a/randr/rrproperty.c b/randr/rrproperty.c
> > +index c2fb9585c6..25469f57b2 100644
> > +--- a/randr/rrproperty.c
> > ++++ b/randr/rrproperty.c
> > +@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom
> property, Atom type,
> > +                 RRDestroyOutputProperty(prop);
> > +             return BadAlloc;
> > +         }
> > +-        new_value.size =3D len;
> > ++        new_value.size =3D total_len;
> > +         new_value.type =3D type;
> > +         new_value.format =3D format;
> > +
> > +@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom
> property, Atom type,
> > +         case PropModePrepend:
> > +             new_data =3D new_value.data;
> > +             old_data =3D (void *) (((char *) new_value.data) +
> > +-                                  (prop_value->size * size_in_bytes))=
;
> > ++                                  (len * size_in_bytes));
> > +             break;
> > +         }
> > +         if (new_data)
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> > new file mode 100644
> > index 0000000000..720340d83b
> > --- /dev/null
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.pat=
ch
> > @@ -0,0 +1,102 @@
> > +From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Thu, 5 Oct 2023 12:19:45 +1000
> > +Subject: [PATCH] mi: reset the PointerWindows reference on screen swit=
ch
> > +
> > +PointerWindows[] keeps a reference to the last window our sprite
> > +entered - changes are usually handled by CheckMotion().
> > +
> > +If we switch between screens via XWarpPointer our
> > +dev->spriteInfo->sprite->win is set to the new screen's root window.
> > +If there's another window at the cursor location CheckMotion() will
> > +trigger the right enter/leave events later. If there is not, it skips
> > +that process and we never trigger LeaveWindow() - PointerWindows[] for
> > +the device still refers to the previous window.
> > +
> > +If that window is destroyed we have a dangling reference that will
> > +eventually cause a use-after-free bug when checking the window hierarc=
hy
> > +later.
> > +
> > +To trigger this, we require:
> > +- two protocol screens
> > +- XWarpPointer to the other screen's root window
> > +- XDestroyWindow before entering any other window
> > +
> > +This is a niche bug so we hack around it by making sure we reset the
> > +PointerWindows[] entry so we cannot have a dangling pointer. This
> > +doesn't handle Enter/Leave events correctly but the previous code didn=
't
> > +either.
> > +
> > +CVE-2023-5380, ZDI-CAN-21608
> > +
> > +This vulnerability was discovered by:
> > +Sri working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Reviewed-by: Adam Jackson <ajax@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce96166204561=
02727acb8b0256b7bbd7
> ]
> > +CVE: CVE-2023-5380
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + dix/enterleave.h   |  2 --
> > + include/eventstr.h |  3 +++
> > + mi/mipointer.c     | 17 +++++++++++++++--
> > + 3 files changed, 18 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/dix/enterleave.h b/dix/enterleave.h
> > +index 4b833d8..e8af924 100644
> > +--- a/dix/enterleave.h
> > ++++ b/dix/enterleave.h
> > +@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,
> > +
> > + extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);
> > +
> > +-extern void LeaveWindow(DeviceIntPtr dev);
> > +-
> > + extern void CoreFocusEvent(DeviceIntPtr kbd,
> > +                            int type, int mode, int detail, WindowPtr
> pWin);
> > +
> > +diff --git a/include/eventstr.h b/include/eventstr.h
> > +index bf3b95f..2bae3b0 100644
> > +--- a/include/eventstr.h
> > ++++ b/include/eventstr.h
> > +@@ -296,4 +296,7 @@ union _InternalEvent {
> > + #endif
> > + };
> > +
> > ++extern void
> > ++LeaveWindow(DeviceIntPtr dev);
> > ++
> > + #endif
> > +diff --git a/mi/mipointer.c b/mi/mipointer.c
> > +index 75be1ae..b12ae9b 100644
> > +--- a/mi/mipointer.c
> > ++++ b/mi/mipointer.c
> > +@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr
> pScreen, int x, int y)
> > + #ifdef PANORAMIX
> > +         && noPanoramiXExtension
> > + #endif
> > +-        )
> > +-        UpdateSpriteForScreen(pDev, pScreen);
> > ++        ) {
> > ++            DeviceIntPtr master =3D GetMaster(pDev, MASTER_POINTER);
> > ++            /* Hack for CVE-2023-5380: if we're moving
> > ++             * screens PointerWindows[] keeps referring to the
> > ++             * old window. If that gets destroyed we have a UAF
> > ++             * bug later. Only happens when jumping from a window
> > ++             * to the root window on the other screen.
> > ++             * Enter/Leave events are incorrect for that case but
> > ++             * too niche to fix.
> > ++             */
> > ++            LeaveWindow(pDev);
> > ++            if (master)
> > ++                LeaveWindow(master);
> > ++            UpdateSpriteForScreen(pDev, pScreen);
> > ++    }
> > + }
> > +
> > + /**
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
> > new file mode 100644
> > index 0000000000..9a8e583e78
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
> > @@ -0,0 +1,113 @@
> > +From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Thu, 12 Oct 2023 12:44:13 +1000
> > +Subject: [PATCH] fb: properly wrap/unwrap CloseScreen
> > +
> > +fbCloseScreen assumes that it overrides miCloseScreen (which just
> > +calls FreePixmap(screen->devPrivates)) and emulates that instead of
> > +wrapping it.
> > +
> > +This is a wrong assumption, we may have ShmCloseScreen in the mix too,
> > +resulting in leaks (see below). Fix this by properly setting up the
> > +CloseScreen wrapper.
> > +
> > +This means we no longer need the manual DestroyPixmap call in
> > +vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303
> > +
> > +CVE-2023-5574, ZDI-CAN-21213
> > +
> > +This vulnerability was discovered by:
> > +Sri working with Trend Micro Zero Day Initiative
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Reviewed-by: Adam Jackson <ajax@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0f=
cce70f6ad3310b713d5f
> ]
> > +CVE: CVE-2023-5574
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + fb/fb.h             |  1 +
> > + fb/fbscreen.c       | 14 ++++++++++----
> > + hw/vfb/InitOutput.c |  7 -------
> > + 3 files changed, 11 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/fb/fb.h b/fb/fb.h
> > +index d157b6956d..cd7bd05d21 100644
> > +--- a/fb/fb.h
> > ++++ b/fb/fb.h
> > +@@ -410,6 +410,7 @@ typedef struct {
> > + #endif
> > +     DevPrivateKeyRec    gcPrivateKeyRec;
> > +     DevPrivateKeyRec    winPrivateKeyRec;
> > ++    CloseScreenProcPtr  CloseScreen;
> > + } FbScreenPrivRec, *FbScreenPrivPtr;
> > +
> > + #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \
> > +diff --git a/fb/fbscreen.c b/fb/fbscreen.c
> > +index 4ab807ab50..c481033f98 100644
> > +--- a/fb/fbscreen.c
> > ++++ b/fb/fbscreen.c
> > +@@ -29,6 +29,7 @@
> > + Bool
> > + fbCloseScreen(ScreenPtr pScreen)
> > + {
> > ++    FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pScreen);
> > +     int d;
> > +     DepthPtr depths =3D pScreen->allowedDepths;
> > +
> > +@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)
> > +         free(depths[d].vids);
> > +     free(depths);
> > +     free(pScreen->visuals);
> > +-    if (pScreen->devPrivate)
> > +-        FreePixmap((PixmapPtr)pScreen->devPrivate);
> > +-    return TRUE;
> > ++
> > ++    pScreen->CloseScreen =3D screen_priv->CloseScreen;
> > ++
> > ++    return pScreen->CloseScreen(pScreen);
> > + }
> > +
> > + Bool
> > +@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits,
> int xsize, int ysize,
> > +                    int dpix, int dpiy, int width, int bpp)
> > + #endif
> > + {
> > ++    FbScreenPrivPtr screen_priv;
> > +     VisualPtr visuals;
> > +     DepthPtr depths;
> > +     int nvisuals;
> > +@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits=
,
> int xsize, int ysize,
> > +                       rootdepth, ndepths, depths,
> > +                       defaultVisual, nvisuals, visuals))
> > +         return FALSE;
> > +-    /* overwrite miCloseScreen with our own */
> > ++
> > ++    screen_priv =3D fbGetScreenPrivate(pScreen);
> > ++    screen_priv->CloseScreen =3D pScreen->CloseScreen;
> > +     pScreen->CloseScreen =3D fbCloseScreen;
> > ++
> > +     return TRUE;
> > + }
> > +
> > +diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c
> > +index 48efb61b2f..076fb7defa 100644
> > +--- a/hw/vfb/InitOutput.c
> > ++++ b/hw/vfb/InitOutput.c
> > +@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)
> > +
> > +     pScreen->CloseScreen =3D pvfb->closeScreen;
> > +
> > +-    /*
> > +-     * fb overwrites miCloseScreen, so do this here
> > +-     */
> > +-    if (pScreen->devPrivate)
> > +-        (*pScreen->DestroyPixmap) (pScreen->devPrivate);
> > +-    pScreen->devPrivate =3D NULL;
> > +-
> > +     return pScreen->CloseScreen(pScreen);
> > + }
> > +
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
> > new file mode 100644
> > index 0000000000..4204be9bdd
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
> > @@ -0,0 +1,42 @@
> > +From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Thu, 12 Oct 2023 12:42:06 +1000
> > +Subject: [PATCH] mi: fix CloseScreen initialization order
> > +
> > +If SHM is enabled it will set the CloseScreen pointer, only to be
> > +overridden by the hardcoded miCloseScreen pointer. Do this the other w=
ay
> > +round, miCloseScreen is the bottom of our stack.
> > +
> > +Direct leak of 48 byte(s) in 2 object(s) allocated from:
> > +  #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId:
> d8f3addefe29e892d775c30eb364afd3c2484ca5))
> > +  #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213
> > +
> > +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > +Reviewed-by: Adam Jackson <ajax@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e31=
1673511ce61aa2f7a81f
> ]
> > +CVE: CVE-2023-5574
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + mi/miscrinit.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/mi/miscrinit.c b/mi/miscrinit.c
> > +index 264622d..907e46a 100644
> > +--- a/mi/miscrinit.c
> > ++++ b/mi/miscrinit.c
> > +@@ -242,10 +242,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /*
> pointer to screen bits */
> > +     pScreen->numVisuals =3D numVisuals;
> > +     pScreen->visuals =3D visuals;
> > +     if (width) {
> > ++        pScreen->CloseScreen =3D miCloseScreen;
> > + #ifdef MITSHM
> > +         ShmRegisterFbFuncs(pScreen);
> > + #endif
> > +-        pScreen->CloseScreen =3D miCloseScreen;
> > +     }
> > +     /* else CloseScreen */
> > +     /* QueryBestSize, SaveScreen, GetImage, GetSpans */
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
> > new file mode 100644
> > index 0000000000..47c247ef0c
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
> > @@ -0,0 +1,54 @@
> > +From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001
> > +From: Peter Hutterer <peter.hutterer@who-t.net>
> > +Date: Tue, 24 Oct 2023 12:09:36 +1000
> > +Subject: [PATCH] dix: always initialize pScreen->CloseScreen
> > +
> > +CloseScreen is wrapped by the various modules, many of which do not
> > +check if they're the last ones unwrapping. This is fine if the order o=
f
> > +those modules never changes but when it does we might get a NULL-point=
er
> > +dereference by some naive code doing a
> > +
> > +   pScreen->CloseScreen =3D priv->CloseScreen;
> > +   free(priv);
> > +   return (*pScreen->CloseScreen)(pScreen);
> > +
> > +To avoid this set it to a default function that just returns TRUE that=
's
> > +guaranteed to be the last one.
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c=
7829b06bdba8a88bd586
> ]
> > +CVE: CVE-2023-5574
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + dix/dispatch.c | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/dix/dispatch.c b/dix/dispatch.c
> > +index eaac39b7c9..cd092fd409 100644
> > +--- a/dix/dispatch.c
> > ++++ b/dix/dispatch.c
> > +@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {
> > +     3                           /* 64 bits per scanline pad unit */
> > + };
> > +
> > ++static Bool
> > ++DefaultCloseScreen(ScreenPtr screen)
> > ++{
> > ++    return TRUE;
> > ++}
> > ++
> > + /*
> > + grow the array of screenRecs if necessary.
> > + call the device-supplied initialization procedure
> > +@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i,
> Bool gpu)
> > +             PixmapWidthPaddingInfo[depth].notPower2 =3D 0;
> > +         }
> > +     }
> > ++
> > ++    pScreen->CloseScreen =3D DefaultCloseScreen;
> > ++
> > +     return 0;
> > + }
> > +
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> > index 5c604fa86e..deb5526902 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
> > @@ -16,6 +16,11 @@ SRC_URI +=3D
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
> >            file://CVE-2022-46344.patch \
> >            file://CVE-2023-0494.patch \
> >            file://CVE-2023-1393.patch \
> > +           file://CVE-2023-5367.patch \
> > +           file://CVE-2023-5380.patch \
> > +           file://CVE-2023-5574-1.patch \
> > +           file://CVE-2023-5574-2.patch \
> > +           file://CVE-2023-5574-3.patch \
> > "
> > SRC_URI[md5sum] =3D "453fc86aac8c629b3a5b77e8dcca30bf"
> > SRC_URI[sha256sum] =3D
> "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190195):
> https://lists.openembedded.org/g/openembedded-core/message/190195
> > Mute This Topic: https://lists.openembedded.org/mt/102415098/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000003502e706097d3edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure Ross.</div><div><br></div><div>Thanks &amp; Rega=
rds,</div><div>Vijay<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 6, 2023 at 4:08=E2=80=AFPM Ross B=
urton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It woul=
d be much appreciated if you could submit to master first and then backport=
 to the stable releases, as it makes tracking what releases have been fixed=
 a lot easier.<br>
<br>
Ross<br>
<br>
&gt; On 6 Nov 2023, at 05:47, Vijay Anusuri via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.org" tar=
get=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab=
2ecd41d4d8689e71855d93e492bc554719a" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e7185=
5d93e492bc554719a</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf=
2ce9616620456102727acb8b0256b7bbd7" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce961662045610272=
7acb8b0256b7bbd7</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f4=
60b9ad1a9cdf0fcce70f6ad3310b713d5f" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0fcce7=
0f6ad3310b713d5f</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f=
924aecac6d6e311673511ce61aa2f7a81f" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e311673=
511ce61aa2f7a81f</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58=
ba4719fc31c19c7829b06bdba8a88bd586" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c7829=
b06bdba8a88bd586</a>]<br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt; .../xserver-xorg/CVE-2023-5367.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 84 +++++++++++++<br>
&gt; .../xserver-xorg/CVE-2023-5380.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 102 ++++++++++++++++<br>
&gt; .../xserver-xorg/CVE-2023-5574-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11=
3 ++++++++++++++++++<br>
&gt; .../xserver-xorg/CVE-2023-5574-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 42 +++++++<br>
&gt; .../xserver-xorg/CVE-2023-5574-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 54 +++++++++<br>
&gt; .../xorg-xserver/<a href=3D"http://xserver-xorg_1.20.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">xserver-xorg_1.20.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +<br>
&gt; 6 files changed, 400 insertions(+)<br>
&gt; create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE=
-2023-5367.patch<br>
&gt; create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE=
-2023-5380.patch<br>
&gt; create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE=
-2023-5574-1.patch<br>
&gt; create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE=
-2023-5574-2.patch<br>
&gt; create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE=
-2023-5574-3.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-=
5367.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.=
patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..508588481e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.pa=
tch<br>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Tue, 3 Oct 2023 11:53:05 +1000<br>
&gt; +Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend<br>
&gt; +<br>
&gt; +The handling of appending/prepending properties was incorrect, with a=
t<br>
&gt; +least two bugs: the property length was set to the length of the new<=
br>
&gt; +part only, i.e. appending or prepending N elements to a property with=
 P<br>
&gt; +existing elements always resulted in the property having N elements<b=
r>
&gt; +instead of N + P.<br>
&gt; +<br>
&gt; +Second, when pre-pending a value to a property, the offset for the ol=
d<br>
&gt; +values was incorrect, leaving the new property with potentially<br>
&gt; +uninitalized values and/or resulting in OOB memory writes.<br>
&gt; +For example, prepending a 3 element value to a 5 element property wou=
ld<br>
&gt; +result in this 8 value array:<br>
&gt; +=C2=A0 [N, N, N, ?, ?, P, P, P ] P, P<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^OOB write<br>
&gt; +<br>
&gt; +The XI2 code is a copy/paste of the RandR code, so the bug exists in<=
br>
&gt; +both.<br>
&gt; +<br>
&gt; +CVE-2023-5367, ZDI-CAN-22153<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/541ab2ecd41d4d8689e71855d93e492bc554719a</a>]<br>
&gt; +CVE: CVE-2023-5367<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Xi/xiproperty.c=C2=A0 =C2=A0 | 4 ++--<br>
&gt; + randr/rrproperty.c | 4 ++--<br>
&gt; + 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c<br>
&gt; +index 066ba21fba..d315f04d0e 100644<br>
&gt; +--- a/Xi/xiproperty.c<br>
&gt; ++++ b/Xi/xiproperty.c<br>
&gt; +@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom pro=
perty, Atom type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XIDestr=
oyDeviceProperty(prop);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadAlloc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D len;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D total_len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.type =3D type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.format =3D format;<br>
&gt; + <br>
&gt; +@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom pro=
perty, Atom type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PropModePrepend:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_data =3D new_valu=
e.data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_data =3D (void *)=
 (((char *) new_value.data) +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prop_value-&gt;size *=
 size_in_bytes));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (len * size_in_bytes))=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_data)<br>
&gt; +diff --git a/randr/rrproperty.c b/randr/rrproperty.c<br>
&gt; +index c2fb9585c6..25469f57b2 100644<br>
&gt; +--- a/randr/rrproperty.c<br>
&gt; ++++ b/randr/rrproperty.c<br>
&gt; +@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom p=
roperty, Atom type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RRDestr=
oyOutputProperty(prop);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadAlloc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D len;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D total_len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.type =3D type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.format =3D format;<br>
&gt; + <br>
&gt; +@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom p=
roperty, Atom type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PropModePrepend:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_data =3D new_valu=
e.data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_data =3D (void *)=
 (((char *) new_value.data) +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prop_value-&gt;size *=
 size_in_bytes));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (len * size_in_bytes))=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_data)<br>
&gt; +-- <br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-=
5380.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.=
patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..720340d83b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.pa=
tch<br>
&gt; @@ -0,0 +1,102 @@<br>
&gt; +From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Thu, 5 Oct 2023 12:19:45 +1000<br>
&gt; +Subject: [PATCH] mi: reset the PointerWindows reference on screen swi=
tch<br>
&gt; +<br>
&gt; +PointerWindows[] keeps a reference to the last window our sprite<br>
&gt; +entered - changes are usually handled by CheckMotion().<br>
&gt; +<br>
&gt; +If we switch between screens via XWarpPointer our<br>
&gt; +dev-&gt;spriteInfo-&gt;sprite-&gt;win is set to the new screen&#39;s =
root window.<br>
&gt; +If there&#39;s another window at the cursor location CheckMotion() wi=
ll<br>
&gt; +trigger the right enter/leave events later. If there is not, it skips=
<br>
&gt; +that process and we never trigger LeaveWindow() - PointerWindows[] fo=
r<br>
&gt; +the device still refers to the previous window.<br>
&gt; +<br>
&gt; +If that window is destroyed we have a dangling reference that will<br=
>
&gt; +eventually cause a use-after-free bug when checking the window hierar=
chy<br>
&gt; +later.<br>
&gt; +<br>
&gt; +To trigger this, we require:<br>
&gt; +- two protocol screens<br>
&gt; +- XWarpPointer to the other screen&#39;s root window<br>
&gt; +- XDestroyWindow before entering any other window<br>
&gt; +<br>
&gt; +This is a niche bug so we hack around it by making sure we reset the<=
br>
&gt; +PointerWindows[] entry so we cannot have a dangling pointer. This<br>
&gt; +doesn&#39;t handle Enter/Leave events correctly but the previous code=
 didn&#39;t<br>
&gt; +either.<br>
&gt; +<br>
&gt; +CVE-2023-5380, ZDI-CAN-21608<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Sri working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" targ=
et=3D"_blank">ajax@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/564ccf2ce9616620456102727acb8b0256b7bbd7</a>]<br>
&gt; +CVE: CVE-2023-5380<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + dix/enterleave.h=C2=A0 =C2=A0|=C2=A0 2 --<br>
&gt; + include/eventstr.h |=C2=A0 3 +++<br>
&gt; + mi/mipointer.c=C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++--<br>
&gt; + 3 files changed, 18 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/dix/enterleave.h b/dix/enterleave.h<br>
&gt; +index 4b833d8..e8af924 100644<br>
&gt; +--- a/dix/enterleave.h<br>
&gt; ++++ b/dix/enterleave.h<br>
&gt; +@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,<br>
&gt; + <br>
&gt; + extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);<=
br>
&gt; + <br>
&gt; +-extern void LeaveWindow(DeviceIntPtr dev);<br>
&gt; +-<br>
&gt; + extern void CoreFocusEvent(DeviceIntPtr kbd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int type, int mode, int detail, WindowPtr pWin=
);<br>
&gt; + <br>
&gt; +diff --git a/include/eventstr.h b/include/eventstr.h<br>
&gt; +index bf3b95f..2bae3b0 100644<br>
&gt; +--- a/include/eventstr.h<br>
&gt; ++++ b/include/eventstr.h<br>
&gt; +@@ -296,4 +296,7 @@ union _InternalEvent {<br>
&gt; + #endif<br>
&gt; + };<br>
&gt; + <br>
&gt; ++extern void<br>
&gt; ++LeaveWindow(DeviceIntPtr dev);<br>
&gt; ++<br>
&gt; + #endif<br>
&gt; +diff --git a/mi/mipointer.c b/mi/mipointer.c<br>
&gt; +index 75be1ae..b12ae9b 100644<br>
&gt; +--- a/mi/mipointer.c<br>
&gt; ++++ b/mi/mipointer.c<br>
&gt; +@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr=
 pScreen, int x, int y)<br>
&gt; + #ifdef PANORAMIX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; noPanoramiXExtension<br>
&gt; + #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 UpdateSpriteForScreen(pDev, pScreen);<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceIntPtr master =3D Ge=
tMaster(pDev, MASTER_POINTER);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Hack for CVE-2023-5380:=
 if we&#39;re moving<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* screens PointerWin=
dows[] keeps referring to the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* old window. If tha=
t gets destroyed we have a UAF<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* bug later. Only ha=
ppens when jumping from a window<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to the root window=
 on the other screen.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Enter/Leave events=
 are incorrect for that case but<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* too niche to fix.<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LeaveWindow(pDev);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (master)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LeaveWindow(=
master);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UpdateSpriteForScreen(pDev=
, pScreen);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; + }<br>
&gt; + <br>
&gt; + /**<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-=
5574-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9a8e583e78<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.=
patch<br>
&gt; @@ -0,0 +1,113 @@<br>
&gt; +From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Thu, 12 Oct 2023 12:44:13 +1000<br>
&gt; +Subject: [PATCH] fb: properly wrap/unwrap CloseScreen<br>
&gt; +<br>
&gt; +fbCloseScreen assumes that it overrides miCloseScreen (which just<br>
&gt; +calls FreePixmap(screen-&gt;devPrivates)) and emulates that instead o=
f<br>
&gt; +wrapping it.<br>
&gt; +<br>
&gt; +This is a wrong assumption, we may have ShmCloseScreen in the mix too=
,<br>
&gt; +resulting in leaks (see below). Fix this by properly setting up the<b=
r>
&gt; +CloseScreen wrapper.<br>
&gt; +<br>
&gt; +This means we no longer need the manual DestroyPixmap call in<br>
&gt; +vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303<br=
>
&gt; +<br>
&gt; +CVE-2023-5574, ZDI-CAN-21213<br>
&gt; +<br>
&gt; +This vulnerability was discovered by:<br>
&gt; +Sri working with Trend Micro Zero Day Initiative<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" targ=
et=3D"_blank">ajax@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f</a>]<br>
&gt; +CVE: CVE-2023-5574<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + fb/fb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
&gt; + fb/fbscreen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++----<br>
&gt; + hw/vfb/InitOutput.c |=C2=A0 7 -------<br>
&gt; + 3 files changed, 11 insertions(+), 11 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/fb/fb.h b/fb/fb.h<br>
&gt; +index d157b6956d..cd7bd05d21 100644<br>
&gt; +--- a/fb/fb.h<br>
&gt; ++++ b/fb/fb.h<br>
&gt; +@@ -410,6 +410,7 @@ typedef struct {<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DevPrivateKeyRec=C2=A0 =C2=A0 gcPrivateKeyRec;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0DevPrivateKeyRec=C2=A0 =C2=A0 winPrivateKeyRec;<b=
r>
&gt; ++=C2=A0 =C2=A0 CloseScreenProcPtr=C2=A0 CloseScreen;<br>
&gt; + } FbScreenPrivRec, *FbScreenPrivPtr;<br>
&gt; + <br>
&gt; + #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \<br>
&gt; +diff --git a/fb/fbscreen.c b/fb/fbscreen.c<br>
&gt; +index 4ab807ab50..c481033f98 100644<br>
&gt; +--- a/fb/fbscreen.c<br>
&gt; ++++ b/fb/fbscreen.c<br>
&gt; +@@ -29,6 +29,7 @@<br>
&gt; + Bool<br>
&gt; + fbCloseScreen(ScreenPtr pScreen)<br>
&gt; + {<br>
&gt; ++=C2=A0 =C2=A0 FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pSc=
reen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int d;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DepthPtr depths =3D pScreen-&gt;allowedDepths;<br=
>
&gt; + <br>
&gt; +@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(depths[d].vids);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0free(depths);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0free(pScreen-&gt;visuals);<br>
&gt; +-=C2=A0 =C2=A0 if (pScreen-&gt;devPrivate)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FreePixmap((PixmapPtr)pScreen-&gt;devPri=
vate);<br>
&gt; +-=C2=A0 =C2=A0 return TRUE;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D screen_priv-&gt;CloseScree=
n;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 return pScreen-&gt;CloseScreen(pScreen);<br>
&gt; + }<br>
&gt; + <br>
&gt; + Bool<br>
&gt; +@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits=
, int xsize, int ysize,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int dpix, int dpiy, int width, int bpp)<br>
&gt; + #endif<br>
&gt; + {<br>
&gt; ++=C2=A0 =C2=A0 FbScreenPrivPtr screen_priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VisualPtr visuals;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DepthPtr depths;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int nvisuals;<br>
&gt; +@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbit=
s, int xsize, int ysize,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rootdepth, ndepths, depths,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0defaultVisual, nvisuals, visuals))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt; +-=C2=A0 =C2=A0 /* overwrite miCloseScreen with our own */<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 screen_priv =3D fbGetScreenPrivate(pScreen);<br>
&gt; ++=C2=A0 =C2=A0 screen_priv-&gt;CloseScreen =3D pScreen-&gt;CloseScree=
n;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pScreen-&gt;CloseScreen =3D fbCloseScreen;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
&gt; + }<br>
&gt; + <br>
&gt; +diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c<br>
&gt; +index 48efb61b2f..076fb7defa 100644<br>
&gt; +--- a/hw/vfb/InitOutput.c<br>
&gt; ++++ b/hw/vfb/InitOutput.c<br>
&gt; +@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0pScreen-&gt;CloseScreen =3D pvfb-&gt;closeScreen;=
<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 /*<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* fb overwrites miCloseScreen, so do this here<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +-=C2=A0 =C2=A0 if (pScreen-&gt;devPrivate)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*pScreen-&gt;DestroyPixmap) (pScreen-&g=
t;devPrivate);<br>
&gt; +-=C2=A0 =C2=A0 pScreen-&gt;devPrivate =3D NULL;<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return pScreen-&gt;CloseScreen(pScreen);<br>
&gt; + }<br>
&gt; + <br>
&gt; +-- <br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-=
5574-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4204be9bdd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.=
patch<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Thu, 12 Oct 2023 12:42:06 +1000<br>
&gt; +Subject: [PATCH] mi: fix CloseScreen initialization order<br>
&gt; +<br>
&gt; +If SHM is enabled it will set the CloseScreen pointer, only to be<br>
&gt; +overridden by the hardcoded miCloseScreen pointer. Do this the other =
way<br>
&gt; +round, miCloseScreen is the bottom of our stack.<br>
&gt; +<br>
&gt; +Direct leak of 48 byte(s) in 2 object(s) allocated from:<br>
&gt; +=C2=A0 #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (Bui=
ldId: d8f3addefe29e892d775c30eb364afd3c2484ca5))<br>
&gt; +=C2=A0 #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213<br>
&gt; +<br>
&gt; +Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@wh=
o-t.net" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" targ=
et=3D"_blank">ajax@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f</a>]<br>
&gt; +CVE: CVE-2023-5574<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + mi/miscrinit.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/mi/miscrinit.c b/mi/miscrinit.c<br>
&gt; +index 264622d..907e46a 100644<br>
&gt; +--- a/mi/miscrinit.c<br>
&gt; ++++ b/mi/miscrinit.c<br>
&gt; +@@ -242,10 +242,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,=C2=
=A0 /* pointer to screen bits */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pScreen-&gt;numVisuals =3D numVisuals;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pScreen-&gt;visuals =3D visuals;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (width) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D miCloseScree=
n;<br>
&gt; + #ifdef MITSHM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ShmRegisterFbFuncs(pScreen);<br>
&gt; + #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D miCloseScree=
n;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* else CloseScreen */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* QueryBestSize, SaveScreen, GetImage, GetSpans =
*/<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-=
5574-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..47c247ef0c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.=
patch<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; +Date: Tue, 24 Oct 2023 12:09:36 +1000<br>
&gt; +Subject: [PATCH] dix: always initialize pScreen-&gt;CloseScreen<br>
&gt; +<br>
&gt; +CloseScreen is wrapped by the various modules, many of which do not<b=
r>
&gt; +check if they&#39;re the last ones unwrapping. This is fine if the or=
der of<br>
&gt; +those modules never changes but when it does we might get a NULL-poin=
ter<br>
&gt; +dereference by some naive code doing a<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0pScreen-&gt;CloseScreen =3D priv-&gt;CloseScreen;<br>
&gt; +=C2=A0 =C2=A0free(priv);<br>
&gt; +=C2=A0 =C2=A0return (*pScreen-&gt;CloseScreen)(pScreen);<br>
&gt; +<br>
&gt; +To avoid this set it to a default function that just returns TRUE tha=
t&#39;s<br>
&gt; +guaranteed to be the last one.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/com=
mit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586</a>]<br>
&gt; +CVE: CVE-2023-5574<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + dix/dispatch.c | 9 +++++++++<br>
&gt; + 1 file changed, 9 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/dix/dispatch.c b/dix/dispatch.c<br>
&gt; +index eaac39b7c9..cd092fd409 100644<br>
&gt; +--- a/dix/dispatch.c<br>
&gt; ++++ b/dix/dispatch.c<br>
&gt; +@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 64 bits per scanline pa=
d unit */<br>
&gt; + };<br>
&gt; + <br>
&gt; ++static Bool<br>
&gt; ++DefaultCloseScreen(ScreenPtr screen)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 return TRUE;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /*<br>
&gt; + grow the array of screenRecs if necessary.<br>
&gt; + call the device-supplied initialization procedure<br>
&gt; +@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i=
, Bool gpu)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PixmapWidthPaddingInf=
o[depth].notPower2 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D DefaultCloseScreen;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; + }<br>
&gt; + <br>
&gt; +-- <br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xser=
ver-xorg_1.20.14.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20=
.14.bb</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_1.20.14.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.14.b=
b</a><br>
&gt; index 5c604fa86e..deb5526902 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_1.20.14.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.14.bb<=
/a><br>
&gt; +++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xor=
g_1.20.14.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_1.20.14.bb<=
/a><br>
&gt; @@ -16,6 +16,11 @@ SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Int=
el-ddx-only-for-pre-gen4-hardwar.pat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-46344.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-0494.patch \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-1393.patch \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5367.patch \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5380.patch \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5574-1.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5574-2.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5574-3.patch=
 \<br>
&gt; &quot;<br>
&gt; SRC_URI[md5sum] =3D &quot;453fc86aac8c629b3a5b77e8dcca30bf&quot;<br>
&gt; SRC_URI[sha256sum] =3D &quot;54b199c9280ff8bf0f73a54a759645bd0eeeda725=
5d1c99310d5b7595f3ac066&quot;<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#190195): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/190195" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/190195</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10241509=
8/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102415098/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000003502e706097d3edb--

