Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40818C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:02:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.56064.1699282934855479016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LmKfzu3x;
 spf=pass (domain: mvista.com, ip: 209.85.208.171, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so61123421fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699282933; x=1699887733; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Do2XnvEIthyOAgAsxEiyfejMci9N623YwpRRgLpbOI=;
        b=LmKfzu3xzsKS6BBUQ6565G4YwrSyMN4OOfk1k4EIMlXS0kLF0lsEKd92QUfok8E4so
         nXoGf/OxFiTDGm9Wey4F6QZUmjdHGE4NmuP7PJRkFGrF+nLNeHSr8kMMSnvef+Gg+Zv1
         FDhkNolJ/LZJjwIIQWbuBCEHT7d39cNlLxFEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699282933; x=1699887733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Do2XnvEIthyOAgAsxEiyfejMci9N623YwpRRgLpbOI=;
        b=q0wbrMz9uoearNX95ImX9nnhHeG5RwwZRxq4Ni9jKday3/seL2ulI2EW8D4aRdP67U
         QK13qMZSya3064NnT8TGOZtgSqCXAxKE2LOgG7YBJCcjxv9Gim2jiPEzbJI8jUJQAe1s
         7Pw+QRPBqh2Smwz+muB0sv1F8T+se0DuMrEvYStu8IhCp40hXTBPrhEyo/+X9w3LpAXQ
         nRpuH+YuaKVDPrKqJ1hFAzczi+6fxCCf/GzAjuVn1TfjZC1KULe3UCV2JUoZfyjgJemz
         +fh2Y+V3xvUbSh+ChJH5DGNJFSlV+dRmQ9h1+Ei6uxHBUmU4nJ2Qd7zbYmEnWxssuqpi
         WWFQ==
X-Gm-Message-State: AOJu0YyiTkZvyBxLIwNs4LN4EWfTKPV/fvsjNt5Xxk+Kh0EpS+L/ywXG
	AW1S5ZQ8MF7jNQs3w0khwLiE7XKEnECvH/DH+cIvFA==
X-Google-Smtp-Source: AGHT+IF5N32XK2Q5h2OHfgxLLxZP1zcnsuojsi+4cbZglxmXEvDqmD75RPYJ75fecZQ6DJg6T2CIZNvdKLgPCc0LghY=
X-Received: by 2002:a2e:90c1:0:b0:2c7:fa5:6db9 with SMTP id
 o1-20020a2e90c1000000b002c70fa56db9mr5008358ljg.48.1699282932575; Mon, 06 Nov
 2023 07:02:12 -0800 (PST)
MIME-Version: 1.0
References: <179504CADB8F6451.12603@lists.openembedded.org>
In-Reply-To: <179504CADB8F6451.12603@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 6 Nov 2023 20:32:01 +0530
Message-ID: <CANQUz1_8SRKv-prdz9QbF3v77hvoqr3yBvP7G+Ddii4fTpUABw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xserver-xorg: Fix for CVE-2023-5367
 CVE-2023-5380 and CVE-2023-5574
To: vanusuri@mvista.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091c53b06097d230a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190224

--00000000000091c53b06097d230a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Xserver-xorg version is the same for both mickledore and kirkstone. Could
you please merge this patch to mickledore along with kirkstone.

Thanks & Regards,
Vijay

On Mon, Nov 6, 2023 at 4:51=E2=80=AFPM Vijay Anusuri via lists.openembedded=
.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport
> [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e7=
1855d93e492bc554719a
> &
> <https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e=
71855d93e492bc554719a&>
>
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce96166204561=
02727acb8b0256b7bbd7
> &
> <https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456=
102727acb8b0256b7bbd7&>
>
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0f=
cce70f6ad3310b713d5f
> &
> <https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0=
fcce70f6ad3310b713d5f&>
>
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e31=
1673511ce61aa2f7a81f
> &
> <https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e3=
11673511ce61aa2f7a81f&>
>
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c=
7829b06bdba8a88bd586
> ]
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++
>  .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++
>  .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ++++++++++++++++++
>  .../xserver-xorg/CVE-2023-5574-2.patch        |  42 +++++++
>  .../xserver-xorg/CVE-2023-5574-3.patch        |  54 +++++++++
>  .../xorg-xserver/xserver-xorg_21.1.8.bb       |   5 +
>  6 files changed, 400 insertions(+)
>  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
>  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
>  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
>  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
>  create mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
>
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> new file mode 100644
> index 0000000000..508588481e
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
> @@ -0,0 +1,84 @@
> +From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 3 Oct 2023 11:53:05 +1000
> +Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
> +
> +The handling of appending/prepending properties was incorrect, with at
> +least two bugs: the property length was set to the length of the new
> +part only, i.e. appending or prepending N elements to a property with P
> +existing elements always resulted in the property having N elements
> +instead of N + P.
> +
> +Second, when pre-pending a value to a property, the offset for the old
> +values was incorrect, leaving the new property with potentially
> +uninitalized values and/or resulting in OOB memory writes.
> +For example, prepending a 3 element value to a 5 element property would
> +result in this 8 value array:
> +  [N, N, N, ?, ?, P, P, P ] P, P
> +                            ^OOB write
> +
> +The XI2 code is a copy/paste of the RandR code, so the bug exists in
> +both.
> +
> +CVE-2023-5367, ZDI-CAN-22153
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e7=
1855d93e492bc554719a
> ]
> +CVE: CVE-2023-5367
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + Xi/xiproperty.c    | 4 ++--
> + randr/rrproperty.c | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
> +index 066ba21fba..d315f04d0e 100644
> +--- a/Xi/xiproperty.c
> ++++ b/Xi/xiproperty.c
> +@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom
> property, Atom type,
> +                 XIDestroyDeviceProperty(prop);
> +             return BadAlloc;
> +         }
> +-        new_value.size =3D len;
> ++        new_value.size =3D total_len;
> +         new_value.type =3D type;
> +         new_value.format =3D format;
> +
> +@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom
> property, Atom type,
> +         case PropModePrepend:
> +             new_data =3D new_value.data;
> +             old_data =3D (void *) (((char *) new_value.data) +
> +-                                  (prop_value->size * size_in_bytes));
> ++                                  (len * size_in_bytes));
> +             break;
> +         }
> +         if (new_data)
> +diff --git a/randr/rrproperty.c b/randr/rrproperty.c
> +index c2fb9585c6..25469f57b2 100644
> +--- a/randr/rrproperty.c
> ++++ b/randr/rrproperty.c
> +@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom
> property, Atom type,
> +                 RRDestroyOutputProperty(prop);
> +             return BadAlloc;
> +         }
> +-        new_value.size =3D len;
> ++        new_value.size =3D total_len;
> +         new_value.type =3D type;
> +         new_value.format =3D format;
> +
> +@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom
> property, Atom type,
> +         case PropModePrepend:
> +             new_data =3D new_value.data;
> +             old_data =3D (void *) (((char *) new_value.data) +
> +-                                  (prop_value->size * size_in_bytes));
> ++                                  (len * size_in_bytes));
> +             break;
> +         }
> +         if (new_data)
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> new file mode 100644
> index 0000000000..57e2a5abdf
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
> @@ -0,0 +1,102 @@
> +From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Thu, 5 Oct 2023 12:19:45 +1000
> +Subject: [PATCH] mi: reset the PointerWindows reference on screen switch
> +
> +PointerWindows[] keeps a reference to the last window our sprite
> +entered - changes are usually handled by CheckMotion().
> +
> +If we switch between screens via XWarpPointer our
> +dev->spriteInfo->sprite->win is set to the new screen's root window.
> +If there's another window at the cursor location CheckMotion() will
> +trigger the right enter/leave events later. If there is not, it skips
> +that process and we never trigger LeaveWindow() - PointerWindows[] for
> +the device still refers to the previous window.
> +
> +If that window is destroyed we have a dangling reference that will
> +eventually cause a use-after-free bug when checking the window hierarchy
> +later.
> +
> +To trigger this, we require:
> +- two protocol screens
> +- XWarpPointer to the other screen's root window
> +- XDestroyWindow before entering any other window
> +
> +This is a niche bug so we hack around it by making sure we reset the
> +PointerWindows[] entry so we cannot have a dangling pointer. This
> +doesn't handle Enter/Leave events correctly but the previous code didn't
> +either.
> +
> +CVE-2023-5380, ZDI-CAN-21608
> +
> +This vulnerability was discovered by:
> +Sri working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce96166204561=
02727acb8b0256b7bbd7
> ]
> +CVE: CVE-2023-5380
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + dix/enterleave.h   |  2 --
> + include/eventstr.h |  3 +++
> + mi/mipointer.c     | 17 +++++++++++++++--
> + 3 files changed, 18 insertions(+), 4 deletions(-)
> +
> +diff --git a/dix/enterleave.h b/dix/enterleave.h
> +index 4b833d8a3b..e8af924c68 100644
> +--- a/dix/enterleave.h
> ++++ b/dix/enterleave.h
> +@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,
> +
> + extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);
> +
> +-extern void LeaveWindow(DeviceIntPtr dev);
> +-
> + extern void CoreFocusEvent(DeviceIntPtr kbd,
> +                            int type, int mode, int detail, WindowPtr
> pWin);
> +
> +diff --git a/include/eventstr.h b/include/eventstr.h
> +index 93308f9b24..a9926eaeef 100644
> +--- a/include/eventstr.h
> ++++ b/include/eventstr.h
> +@@ -335,4 +335,7 @@ union _InternalEvent {
> +     GestureEvent gesture_event;
> + };
> +
> ++extern void
> ++LeaveWindow(DeviceIntPtr dev);
> ++
> + #endif
> +diff --git a/mi/mipointer.c b/mi/mipointer.c
> +index a638f25d4a..8cf0035140 100644
> +--- a/mi/mipointer.c
> ++++ b/mi/mipointer.c
> +@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr
> pScreen, int x, int y)
> + #ifdef PANORAMIX
> +         && noPanoramiXExtension
> + #endif
> +-        )
> +-        UpdateSpriteForScreen(pDev, pScreen);
> ++        ) {
> ++            DeviceIntPtr master =3D GetMaster(pDev, MASTER_POINTER);
> ++            /* Hack for CVE-2023-5380: if we're moving
> ++             * screens PointerWindows[] keeps referring to the
> ++             * old window. If that gets destroyed we have a UAF
> ++             * bug later. Only happens when jumping from a window
> ++             * to the root window on the other screen.
> ++             * Enter/Leave events are incorrect for that case but
> ++             * too niche to fix.
> ++             */
> ++            LeaveWindow(pDev);
> ++            if (master)
> ++                LeaveWindow(master);
> ++            UpdateSpriteForScreen(pDev, pScreen);
> ++    }
> + }
> +
> + /**
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
> new file mode 100644
> index 0000000000..9a8e583e78
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.pat=
ch
> @@ -0,0 +1,113 @@
> +From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Thu, 12 Oct 2023 12:44:13 +1000
> +Subject: [PATCH] fb: properly wrap/unwrap CloseScreen
> +
> +fbCloseScreen assumes that it overrides miCloseScreen (which just
> +calls FreePixmap(screen->devPrivates)) and emulates that instead of
> +wrapping it.
> +
> +This is a wrong assumption, we may have ShmCloseScreen in the mix too,
> +resulting in leaks (see below). Fix this by properly setting up the
> +CloseScreen wrapper.
> +
> +This means we no longer need the manual DestroyPixmap call in
> +vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303
> +
> +CVE-2023-5574, ZDI-CAN-21213
> +
> +This vulnerability was discovered by:
> +Sri working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0f=
cce70f6ad3310b713d5f
> ]
> +CVE: CVE-2023-5574
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + fb/fb.h             |  1 +
> + fb/fbscreen.c       | 14 ++++++++++----
> + hw/vfb/InitOutput.c |  7 -------
> + 3 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/fb/fb.h b/fb/fb.h
> +index d157b6956d..cd7bd05d21 100644
> +--- a/fb/fb.h
> ++++ b/fb/fb.h
> +@@ -410,6 +410,7 @@ typedef struct {
> + #endif
> +     DevPrivateKeyRec    gcPrivateKeyRec;
> +     DevPrivateKeyRec    winPrivateKeyRec;
> ++    CloseScreenProcPtr  CloseScreen;
> + } FbScreenPrivRec, *FbScreenPrivPtr;
> +
> + #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \
> +diff --git a/fb/fbscreen.c b/fb/fbscreen.c
> +index 4ab807ab50..c481033f98 100644
> +--- a/fb/fbscreen.c
> ++++ b/fb/fbscreen.c
> +@@ -29,6 +29,7 @@
> + Bool
> + fbCloseScreen(ScreenPtr pScreen)
> + {
> ++    FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pScreen);
> +     int d;
> +     DepthPtr depths =3D pScreen->allowedDepths;
> +
> +@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)
> +         free(depths[d].vids);
> +     free(depths);
> +     free(pScreen->visuals);
> +-    if (pScreen->devPrivate)
> +-        FreePixmap((PixmapPtr)pScreen->devPrivate);
> +-    return TRUE;
> ++
> ++    pScreen->CloseScreen =3D screen_priv->CloseScreen;
> ++
> ++    return pScreen->CloseScreen(pScreen);
> + }
> +
> + Bool
> +@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits,
> int xsize, int ysize,
> +                    int dpix, int dpiy, int width, int bpp)
> + #endif
> + {
> ++    FbScreenPrivPtr screen_priv;
> +     VisualPtr visuals;
> +     DepthPtr depths;
> +     int nvisuals;
> +@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits,
> int xsize, int ysize,
> +                       rootdepth, ndepths, depths,
> +                       defaultVisual, nvisuals, visuals))
> +         return FALSE;
> +-    /* overwrite miCloseScreen with our own */
> ++
> ++    screen_priv =3D fbGetScreenPrivate(pScreen);
> ++    screen_priv->CloseScreen =3D pScreen->CloseScreen;
> +     pScreen->CloseScreen =3D fbCloseScreen;
> ++
> +     return TRUE;
> + }
> +
> +diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c
> +index 48efb61b2f..076fb7defa 100644
> +--- a/hw/vfb/InitOutput.c
> ++++ b/hw/vfb/InitOutput.c
> +@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)
> +
> +     pScreen->CloseScreen =3D pvfb->closeScreen;
> +
> +-    /*
> +-     * fb overwrites miCloseScreen, so do this here
> +-     */
> +-    if (pScreen->devPrivate)
> +-        (*pScreen->DestroyPixmap) (pScreen->devPrivate);
> +-    pScreen->devPrivate =3D NULL;
> +-
> +     return pScreen->CloseScreen(pScreen);
> + }
> +
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
> new file mode 100644
> index 0000000000..2cdef752c7
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.pat=
ch
> @@ -0,0 +1,42 @@
> +From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Thu, 12 Oct 2023 12:42:06 +1000
> +Subject: [PATCH] mi: fix CloseScreen initialization order
> +
> +If SHM is enabled it will set the CloseScreen pointer, only to be
> +overridden by the hardcoded miCloseScreen pointer. Do this the other way
> +round, miCloseScreen is the bottom of our stack.
> +
> +Direct leak of 48 byte(s) in 2 object(s) allocated from:
> +  #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId:
> d8f3addefe29e892d775c30eb364afd3c2484ca5))
> +  #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e31=
1673511ce61aa2f7a81f
> ]
> +CVE: CVE-2023-5574
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + mi/miscrinit.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mi/miscrinit.c b/mi/miscrinit.c
> +index 3bb52b1bc6..b88938c9ae 100644
> +--- a/mi/miscrinit.c
> ++++ b/mi/miscrinit.c
> +@@ -249,10 +249,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /*
> pointer to screen bits */
> +     pScreen->numVisuals =3D numVisuals;
> +     pScreen->visuals =3D visuals;
> +     if (width) {
> ++        pScreen->CloseScreen =3D miCloseScreen;
> + #ifdef MITSHM
> +         ShmRegisterFbFuncs(pScreen);
> + #endif
> +-        pScreen->CloseScreen =3D miCloseScreen;
> +     }
> +     /* else CloseScreen */
> +     /* QueryBestSize */
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
> new file mode 100644
> index 0000000000..47c247ef0c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.pat=
ch
> @@ -0,0 +1,54 @@
> +From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Tue, 24 Oct 2023 12:09:36 +1000
> +Subject: [PATCH] dix: always initialize pScreen->CloseScreen
> +
> +CloseScreen is wrapped by the various modules, many of which do not
> +check if they're the last ones unwrapping. This is fine if the order of
> +those modules never changes but when it does we might get a NULL-pointer
> +dereference by some naive code doing a
> +
> +   pScreen->CloseScreen =3D priv->CloseScreen;
> +   free(priv);
> +   return (*pScreen->CloseScreen)(pScreen);
> +
> +To avoid this set it to a default function that just returns TRUE that's
> +guaranteed to be the last one.
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c=
7829b06bdba8a88bd586
> ]
> +CVE: CVE-2023-5574
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + dix/dispatch.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/dix/dispatch.c b/dix/dispatch.c
> +index eaac39b7c9..cd092fd409 100644
> +--- a/dix/dispatch.c
> ++++ b/dix/dispatch.c
> +@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {
> +     3                           /* 64 bits per scanline pad unit */
> + };
> +
> ++static Bool
> ++DefaultCloseScreen(ScreenPtr screen)
> ++{
> ++    return TRUE;
> ++}
> ++
> + /*
> +       grow the array of screenRecs if necessary.
> +       call the device-supplied initialization procedure
> +@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i,
> Bool gpu)
> +             PixmapWidthPaddingInfo[depth].notPower2 =3D 0;
> +         }
> +     }
> ++
> ++    pScreen->CloseScreen =3D DefaultCloseScreen;
> ++
> +     return 0;
> + }
> +
> +--
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
> index 19db7ea434..a0f905f83b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
> @@ -2,6 +2,11 @@ require xserver-xorg.inc
>
>  SRC_URI +=3D
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> +           file://CVE-2023-5367.patch \
> +           file://CVE-2023-5380.patch \
> +           file://CVE-2023-5574-1.patch \
> +           file://CVE-2023-5574-2.patch \
> +           file://CVE-2023-5574-3.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190205):
> https://lists.openembedded.org/g/openembedded-core/message/190205
> Mute This Topic: https://lists.openembedded.org/mt/102417729/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000091c53b06097d230a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>Xserver-xorg versi=
on is the same for both mickledore and kirkstone. Could you please merge th=
is patch to mickledore along with kirkstone.</div><div><br></div><div>Thank=
s &amp; Regards,</div><div>Vijay<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 6, 2023 at 4:51=E2=80=
=AFPM Vijay Anusuri via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openemb=
edded.org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=
=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&g=
t;<br>
<br>
Upstream-Status: Backport<br>
[<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd4=
1d4d8689e71855d93e492bc554719a&amp;" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e7185=
5d93e492bc554719a<br>
&amp;</a><br>
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce96=
16620456102727acb8b0256b7bbd7&amp;" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce961662045610272=
7acb8b0256b7bbd7<br>
&amp;</a><br>
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9a=
d1a9cdf0fcce70f6ad3310b713d5f&amp;" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0fcce7=
0f6ad3310b713d5f<br>
&amp;</a><br>
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924ae=
cac6d6e311673511ce61aa2f7a81f&amp;" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e311673=
511ce61aa2f7a81f<br>
&amp;</a><br>
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba471=
9fc31c19c7829b06bdba8a88bd586" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c7829b06bd=
ba8a88bd586</a>]<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../xserver-xorg/CVE-2023-5367.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 84 +++++++++++++<br>
=C2=A0.../xserver-xorg/CVE-2023-5380.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 102 ++++++++++++++++<br>
=C2=A0.../xserver-xorg/CVE-2023-5574-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
13 ++++++++++++++++++<br>
=C2=A0.../xserver-xorg/CVE-2023-5574-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 42 +++++++<br>
=C2=A0.../xserver-xorg/CVE-2023-5574-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 54 +++++++++<br>
=C2=A0.../xorg-xserver/<a href=3D"http://xserver-xorg_21.1.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">xserver-xorg_21.1.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A06 files changed, 400 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CV=
E-2023-5367.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CV=
E-2023-5380.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CV=
E-2023-5574-1.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CV=
E-2023-5574-2.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CV=
E-2023-5574-3.patch<br>
<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.=
patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch=
<br>
new file mode 100644<br>
index 0000000000..508588481e<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch<b=
r>
@@ -0,0 +1,84 @@<br>
+From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001<br>
+From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" targe=
t=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Date: Tue, 3 Oct 2023 11:53:05 +1000<br>
+Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend<br>
+<br>
+The handling of appending/prepending properties was incorrect, with at<br>
+least two bugs: the property length was set to the length of the new<br>
+part only, i.e. appending or prepending N elements to a property with P<br=
>
+existing elements always resulted in the property having N elements<br>
+instead of N + P.<br>
+<br>
+Second, when pre-pending a value to a property, the offset for the old<br>
+values was incorrect, leaving the new property with potentially<br>
+uninitalized values and/or resulting in OOB memory writes.<br>
+For example, prepending a 3 element value to a 5 element property would<br=
>
+result in this 8 value array:<br>
+=C2=A0 [N, N, N, ?, ?, P, P, P ] P, P<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^OOB write<br>
+<br>
+The XI2 code is a copy/paste of the RandR code, so the bug exists in<br>
+both.<br>
+<br>
+CVE-2023-5367, ZDI-CAN-22153<br>
+<br>
+This vulnerability was discovered by:<br>
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative<br>
+<br>
+Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.n=
et" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg/=
xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/commit/5=
41ab2ecd41d4d8689e71855d93e492bc554719a</a>]<br>
+CVE: CVE-2023-5367<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ Xi/xiproperty.c=C2=A0 =C2=A0 | 4 ++--<br>
+ randr/rrproperty.c | 4 ++--<br>
+ 2 files changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c<br>
+index 066ba21fba..d315f04d0e 100644<br>
+--- a/Xi/xiproperty.c<br>
++++ b/Xi/xiproperty.c<br>
+@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property=
, Atom type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XIDestroyDev=
iceProperty(prop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadAlloc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D total_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.type =3D type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.format =3D format;<br>
+ <br>
+@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property=
, Atom type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PropModePrepend:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_data =3D new_value.dat=
a;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_data =3D (void *) (((c=
har *) new_value.data) +<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prop_value-&gt;size * size_i=
n_bytes));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (len * size_in_bytes));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_data)<br>
+diff --git a/randr/rrproperty.c b/randr/rrproperty.c<br>
+index c2fb9585c6..25469f57b2 100644<br>
+--- a/randr/rrproperty.c<br>
++++ b/randr/rrproperty.c<br>
+@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom proper=
ty, Atom type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RRDestroyOut=
putProperty(prop);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return BadAlloc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_value.size =3D total_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.type =3D type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value.format =3D format;<br>
+ <br>
+@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom proper=
ty, Atom type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case PropModePrepend:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_data =3D new_value.dat=
a;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_data =3D (void *) (((c=
har *) new_value.data) +<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prop_value-&gt;size * size_i=
n_bytes));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (len * size_in_bytes));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_data)<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.=
patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch=
<br>
new file mode 100644<br>
index 0000000000..57e2a5abdf<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch<b=
r>
@@ -0,0 +1,102 @@<br>
+From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001<br>
+From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" targe=
t=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Date: Thu, 5 Oct 2023 12:19:45 +1000<br>
+Subject: [PATCH] mi: reset the PointerWindows reference on screen switch<b=
r>
+<br>
+PointerWindows[] keeps a reference to the last window our sprite<br>
+entered - changes are usually handled by CheckMotion().<br>
+<br>
+If we switch between screens via XWarpPointer our<br>
+dev-&gt;spriteInfo-&gt;sprite-&gt;win is set to the new screen&#39;s root =
window.<br>
+If there&#39;s another window at the cursor location CheckMotion() will<br=
>
+trigger the right enter/leave events later. If there is not, it skips<br>
+that process and we never trigger LeaveWindow() - PointerWindows[] for<br>
+the device still refers to the previous window.<br>
+<br>
+If that window is destroyed we have a dangling reference that will<br>
+eventually cause a use-after-free bug when checking the window hierarchy<b=
r>
+later.<br>
+<br>
+To trigger this, we require:<br>
+- two protocol screens<br>
+- XWarpPointer to the other screen&#39;s root window<br>
+- XDestroyWindow before entering any other window<br>
+<br>
+This is a niche bug so we hack around it by making sure we reset the<br>
+PointerWindows[] entry so we cannot have a dangling pointer. This<br>
+doesn&#39;t handle Enter/Leave events correctly but the previous code didn=
&#39;t<br>
+either.<br>
+<br>
+CVE-2023-5380, ZDI-CAN-21608<br>
+<br>
+This vulnerability was discovered by:<br>
+Sri working with Trend Micro Zero Day Initiative<br>
+<br>
+Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.n=
et" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" target=3D=
"_blank">ajax@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg/=
xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/commit/5=
64ccf2ce9616620456102727acb8b0256b7bbd7</a>]<br>
+CVE: CVE-2023-5380<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ dix/enterleave.h=C2=A0 =C2=A0|=C2=A0 2 --<br>
+ include/eventstr.h |=C2=A0 3 +++<br>
+ mi/mipointer.c=C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++--<br>
+ 3 files changed, 18 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/dix/enterleave.h b/dix/enterleave.h<br>
+index 4b833d8a3b..e8af924c68 100644<br>
+--- a/dix/enterleave.h<br>
++++ b/dix/enterleave.h<br>
+@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,<br>
+ <br>
+ extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);<br>
+ <br>
+-extern void LeaveWindow(DeviceIntPtr dev);<br>
+-<br>
+ extern void CoreFocusEvent(DeviceIntPtr kbd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int type, int mode, int detail, WindowPtr pWin);<b=
r>
+ <br>
+diff --git a/include/eventstr.h b/include/eventstr.h<br>
+index 93308f9b24..a9926eaeef 100644<br>
+--- a/include/eventstr.h<br>
++++ b/include/eventstr.h<br>
+@@ -335,4 +335,7 @@ union _InternalEvent {<br>
+=C2=A0 =C2=A0 =C2=A0GestureEvent gesture_event;<br>
+ };<br>
+ <br>
++extern void<br>
++LeaveWindow(DeviceIntPtr dev);<br>
++<br>
+ #endif<br>
+diff --git a/mi/mipointer.c b/mi/mipointer.c<br>
+index a638f25d4a..8cf0035140 100644<br>
+--- a/mi/mipointer.c<br>
++++ b/mi/mipointer.c<br>
+@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr pScr=
een, int x, int y)<br>
+ #ifdef PANORAMIX<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; noPanoramiXExtension<br>
+ #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 UpdateSpriteForScreen(pDev, pScreen);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceIntPtr master =3D GetMast=
er(pDev, MASTER_POINTER);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Hack for CVE-2023-5380: if w=
e&#39;re moving<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* screens PointerWindows[=
] keeps referring to the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* old window. If that get=
s destroyed we have a UAF<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* bug later. Only happens=
 when jumping from a window<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to the root window on t=
he other screen.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Enter/Leave events are =
incorrect for that case but<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* too niche to fix.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LeaveWindow(pDev);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (master)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LeaveWindow(maste=
r);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UpdateSpriteForScreen(pDev, pSc=
reen);<br>
++=C2=A0 =C2=A0 }<br>
+ }<br>
+ <br>
+ /**<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-=
1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.p=
atch<br>
new file mode 100644<br>
index 0000000000..9a8e583e78<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch=
<br>
@@ -0,0 +1,113 @@<br>
+From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001<br>
+From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" targe=
t=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Date: Thu, 12 Oct 2023 12:44:13 +1000<br>
+Subject: [PATCH] fb: properly wrap/unwrap CloseScreen<br>
+<br>
+fbCloseScreen assumes that it overrides miCloseScreen (which just<br>
+calls FreePixmap(screen-&gt;devPrivates)) and emulates that instead of<br>
+wrapping it.<br>
+<br>
+This is a wrong assumption, we may have ShmCloseScreen in the mix too,<br>
+resulting in leaks (see below). Fix this by properly setting up the<br>
+CloseScreen wrapper.<br>
+<br>
+This means we no longer need the manual DestroyPixmap call in<br>
+vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303<br>
+<br>
+CVE-2023-5574, ZDI-CAN-21213<br>
+<br>
+This vulnerability was discovered by:<br>
+Sri working with Trend Micro Zero Day Initiative<br>
+<br>
+Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.n=
et" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" target=3D=
"_blank">ajax@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg/=
xserver/-/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/commit/1=
953f460b9ad1a9cdf0fcce70f6ad3310b713d5f</a>]<br>
+CVE: CVE-2023-5574<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ fb/fb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ fb/fbscreen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++----<br>
+ hw/vfb/InitOutput.c |=C2=A0 7 -------<br>
+ 3 files changed, 11 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/fb/fb.h b/fb/fb.h<br>
+index d157b6956d..cd7bd05d21 100644<br>
+--- a/fb/fb.h<br>
++++ b/fb/fb.h<br>
+@@ -410,6 +410,7 @@ typedef struct {<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0DevPrivateKeyRec=C2=A0 =C2=A0 gcPrivateKeyRec;<br>
+=C2=A0 =C2=A0 =C2=A0DevPrivateKeyRec=C2=A0 =C2=A0 winPrivateKeyRec;<br>
++=C2=A0 =C2=A0 CloseScreenProcPtr=C2=A0 CloseScreen;<br>
+ } FbScreenPrivRec, *FbScreenPrivPtr;<br>
+ <br>
+ #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \<br>
+diff --git a/fb/fbscreen.c b/fb/fbscreen.c<br>
+index 4ab807ab50..c481033f98 100644<br>
+--- a/fb/fbscreen.c<br>
++++ b/fb/fbscreen.c<br>
+@@ -29,6 +29,7 @@<br>
+ Bool<br>
+ fbCloseScreen(ScreenPtr pScreen)<br>
+ {<br>
++=C2=A0 =C2=A0 FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pScreen)=
;<br>
+=C2=A0 =C2=A0 =C2=A0int d;<br>
+=C2=A0 =C2=A0 =C2=A0DepthPtr depths =3D pScreen-&gt;allowedDepths;<br>
+ <br>
+@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(depths[d].vids);<br>
+=C2=A0 =C2=A0 =C2=A0free(depths);<br>
+=C2=A0 =C2=A0 =C2=A0free(pScreen-&gt;visuals);<br>
+-=C2=A0 =C2=A0 if (pScreen-&gt;devPrivate)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FreePixmap((PixmapPtr)pScreen-&gt;devPrivate)=
;<br>
+-=C2=A0 =C2=A0 return TRUE;<br>
++<br>
++=C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D screen_priv-&gt;CloseScreen;<br=
>
++<br>
++=C2=A0 =C2=A0 return pScreen-&gt;CloseScreen(pScreen);<br>
+ }<br>
+ <br>
+ Bool<br>
+@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, int=
 xsize, int ysize,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =
dpix, int dpiy, int width, int bpp)<br>
+ #endif<br>
+ {<br>
++=C2=A0 =C2=A0 FbScreenPrivPtr screen_priv;<br>
+=C2=A0 =C2=A0 =C2=A0VisualPtr visuals;<br>
+=C2=A0 =C2=A0 =C2=A0DepthPtr depths;<br>
+=C2=A0 =C2=A0 =C2=A0int nvisuals;<br>
+@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, in=
t xsize, int ysize,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rootdepth, ndepths, depths,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0defaultVisual, nvisuals, visuals))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
+-=C2=A0 =C2=A0 /* overwrite miCloseScreen with our own */<br>
++<br>
++=C2=A0 =C2=A0 screen_priv =3D fbGetScreenPrivate(pScreen);<br>
++=C2=A0 =C2=A0 screen_priv-&gt;CloseScreen =3D pScreen-&gt;CloseScreen;<br=
>
+=C2=A0 =C2=A0 =C2=A0pScreen-&gt;CloseScreen =3D fbCloseScreen;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
+ }<br>
+ <br>
+diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c<br>
+index 48efb61b2f..076fb7defa 100644<br>
+--- a/hw/vfb/InitOutput.c<br>
++++ b/hw/vfb/InitOutput.c<br>
+@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0pScreen-&gt;CloseScreen =3D pvfb-&gt;closeScreen;<br>
+ <br>
+-=C2=A0 =C2=A0 /*<br>
+-=C2=A0 =C2=A0 =C2=A0* fb overwrites miCloseScreen, so do this here<br>
+-=C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 if (pScreen-&gt;devPrivate)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*pScreen-&gt;DestroyPixmap) (pScreen-&gt;dev=
Private);<br>
+-=C2=A0 =C2=A0 pScreen-&gt;devPrivate =3D NULL;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0return pScreen-&gt;CloseScreen(pScreen);<br>
+ }<br>
+ <br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-=
2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.p=
atch<br>
new file mode 100644<br>
index 0000000000..2cdef752c7<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch=
<br>
@@ -0,0 +1,42 @@<br>
+From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001<br>
+From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" targe=
t=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Date: Thu, 12 Oct 2023 12:42:06 +1000<br>
+Subject: [PATCH] mi: fix CloseScreen initialization order<br>
+<br>
+If SHM is enabled it will set the CloseScreen pointer, only to be<br>
+overridden by the hardcoded miCloseScreen pointer. Do this the other way<b=
r>
+round, miCloseScreen is the bottom of our stack.<br>
+<br>
+Direct leak of 48 byte(s) in 2 object(s) allocated from:<br>
+=C2=A0 #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId:=
 d8f3addefe29e892d775c30eb364afd3c2484ca5))<br>
+=C2=A0 #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213<br>
+<br>
+Signed-off-by: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.n=
et" target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" target=3D=
"_blank">ajax@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg/=
xserver/-/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/commit/b=
6fe3f924aecac6d6e311673511ce61aa2f7a81f</a>]<br>
+CVE: CVE-2023-5574<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ mi/miscrinit.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/mi/miscrinit.c b/mi/miscrinit.c<br>
+index 3bb52b1bc6..b88938c9ae 100644<br>
+--- a/mi/miscrinit.c<br>
++++ b/mi/miscrinit.c<br>
+@@ -249,10 +249,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,=C2=A0 /=
* pointer to screen bits */<br>
+=C2=A0 =C2=A0 =C2=A0pScreen-&gt;numVisuals =3D numVisuals;<br>
+=C2=A0 =C2=A0 =C2=A0pScreen-&gt;visuals =3D visuals;<br>
+=C2=A0 =C2=A0 =C2=A0if (width) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D miCloseScreen;<br=
>
+ #ifdef MITSHM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ShmRegisterFbFuncs(pScreen);<br>
+ #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D miCloseScreen;<br=
>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0/* else CloseScreen */<br>
+=C2=A0 =C2=A0 =C2=A0/* QueryBestSize */<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-=
3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.p=
atch<br>
new file mode 100644<br>
index 0000000000..47c247ef0c<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch=
<br>
@@ -0,0 +1,54 @@<br>
+From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001<br>
+From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" targe=
t=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
+Date: Tue, 24 Oct 2023 12:09:36 +1000<br>
+Subject: [PATCH] dix: always initialize pScreen-&gt;CloseScreen<br>
+<br>
+CloseScreen is wrapped by the various modules, many of which do not<br>
+check if they&#39;re the last ones unwrapping. This is fine if the order o=
f<br>
+those modules never changes but when it does we might get a NULL-pointer<b=
r>
+dereference by some naive code doing a<br>
+<br>
+=C2=A0 =C2=A0pScreen-&gt;CloseScreen =3D priv-&gt;CloseScreen;<br>
+=C2=A0 =C2=A0free(priv);<br>
+=C2=A0 =C2=A0return (*pScreen-&gt;CloseScreen)(pScreen);<br>
+<br>
+To avoid this set it to a default function that just returns TRUE that&#39=
;s<br>
+guaranteed to be the last one.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/xorg/=
xserver/-/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/xorg/xserver/-/commit/a=
b2c58ba4719fc31c19c7829b06bdba8a88bd586</a>]<br>
+CVE: CVE-2023-5574<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ dix/dispatch.c | 9 +++++++++<br>
+ 1 file changed, 9 insertions(+)<br>
+<br>
+diff --git a/dix/dispatch.c b/dix/dispatch.c<br>
+index eaac39b7c9..cd092fd409 100644<br>
+--- a/dix/dispatch.c<br>
++++ b/dix/dispatch.c<br>
+@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {<br>
+=C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 64 bits per scanline pad un=
it */<br>
+ };<br>
+ <br>
++static Bool<br>
++DefaultCloseScreen(ScreenPtr screen)<br>
++{<br>
++=C2=A0 =C2=A0 return TRUE;<br>
++}<br>
++<br>
+ /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0grow the array of screenRecs if necessary.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call the device-supplied initialization procedu=
re<br>
+@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i, Boo=
l gpu)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PixmapWidthPaddingInfo[dep=
th].notPower2 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 pScreen-&gt;CloseScreen =3D DefaultCloseScreen;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_21.1.8.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.8.bb<=
/a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.8.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.8.bb</a><br>
index 19db7ea434..a0f905f83b 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.8.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.8.bb</a><br>
+++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.8.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.8.bb</a><br>
@@ -2,6 +2,11 @@ require xserver-xorg.inc<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pr=
e-gen4-hardwar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-duplicate-defin=
itions-of-IOPortBase.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5367.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5380.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5574-1.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5574-2.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-5574-3.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;38aadb735650c8024ee25211c190bf8aad844c5f=
59632761ab1ef4c4d5aeb152&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190205): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190205" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190205</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102417729/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102417729/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000091c53b06097d230a--

