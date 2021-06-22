Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.10136.1624372255040306385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 07:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pKwar8h6;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.44, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f44.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso2401625wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ym5dCaEsuj25U17Z7LmD61UTo1TbNJVtX1ptrjTnLfI=;
        b=pKwar8h6Tv16PY6cij/4wGwjT6mfryLovx4qaD/iK0TjRXL/cLSUG3wDdHyFKLl++K
         0BPkXpNpsLIAtE2fEEc8qiOaTkjIa+ftGZF0SFBfvKATepbjkb2iDkx9zxILbbY1vrAS
         P3GUy4G0gNvcdYmtN3cysgs8vB+OVwMVKVfqTRDS3FrAcHf5DctfeAWqlUh3WKEJSaPY
         Pnq8TWfc9d23+SZ/ENqmBep/iofXFp4NlJm2iMULoOlovm8zw3Vtwmoiu8kZsE9t6hkw
         Dl2G2SfBlzEBTrTMRWVpTMqAbJBtZkkUpqGzop/FXRD8vVHJ+vu0MGi7jGvxyNLLwky9
         sd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ym5dCaEsuj25U17Z7LmD61UTo1TbNJVtX1ptrjTnLfI=;
        b=s4ZFTf0kakdmgwl5Z2RJ6dKSbmto7AHvCLnBFykMRR3bU3C994kPuUpliAAty5nuyq
         KDs9k7T14+MRDCEm49aTSRecOJM4Ds8/auh5z12rTPRSH+nmgHh6Kd62Hdf95FNdoylN
         Z/auKRH+WWQV8Hs8pm30kD63ybd8XsJnYGhHCpdEHiuac21LhLggDn2qXIulQMlJmUl/
         cLbQzwdCQJJrJnP/PDC1areU8dkSO/jaj6ZIRByGU1oPVrLlR/DYxGM79Wy7plXDMZIB
         1NEOsKjfS6w7ajn4VFntdUPjABk3tbvngXK5IeT4MHF9UHR7kEpQIBb2jaJQ2Ftqm8wg
         Actg==
X-Gm-Message-State: AOAM531wBYnVPaIOjc5WXeVB+G7aKpVxlwgwocbeORg8Ab4J0UN0f+hf
	Cv8fiCqNBl6UJqiGHNEMASVZuB8hfbmfzBXViY2ziw==
X-Google-Smtp-Source: ABdhPJxc/Sho1tPq3VAVNiEHiceqpdD+tAfj4bi+5+AUKEyX6JXijWyXpasxrJzhqlcZn217VO+hMUE2ifVTDnWdq0A=
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr4874071wmk.3.1624372253439;
 Tue, 22 Jun 2021 07:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210622120847.111023-1-jasper@fancydomain.eu>
In-Reply-To: <20210622120847.111023-1-jasper@fancydomain.eu>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 22 Jun 2021 04:30:40 -1000
Message-ID: <CAOSpxdYhREHqXZsUY0dwP1biwMgXiwwZQrxPgSg-nuw8Y9tTKw@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH v2] libx11: Fix CVE-2021-31535
To: jasper@fancydomain.eu
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 22, 2021 at 2:09 AM Jasper Orschulko via
lists.openembedded.org <jasper=fancydomain.eu@lists.openembedded.org>
wrote:
>
> https://lists.x.org/archives/xorg-announce/2021-May/003088.html
>
> XLookupColor() and other X libraries function lack proper validation
> of the length of their string parameters. If those parameters can be
> controlled by an external application (for instance a color name that
> can be emitted via a terminal control sequence) it can lead to the
> emission of extra X protocol requests to the X server.
>
> Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8d2e02ae650f00c4a53deb625211a0527126c605]
> CVE: CVE-2021-31535
> Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>

These three lines should be in the patch file itself.  See the "Patch
name convention and commit message" section at
https://wiki.yoctoproject.org/wiki/Security for details.

Thanks!

Steve

> ---
>  .../xorg-lib/libx11/CVE-2021-31535.patch      | 322 ++++++++++++++++++
>  .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
>  2 files changed, 323 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
> new file mode 100644
> index 0000000000..1112320acf
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
> @@ -0,0 +1,322 @@
> +From 5c539ee6aba5872fcc73aa3d46a4e9a33dc030db Mon Sep 17 00:00:00 2001
> +From: Matthieu Herrb <matthieu@herrb.eu>
> +Date: Fri, 19 Feb 2021 15:30:39 +0100
> +Subject: [PATCH] Reject string longer than USHRT_MAX before sending them on
> + the wire
> +
> +The X protocol uses CARD16 values to represent the length so
> +this would overflow.
> +
> +CVE-2021-31535
> +
> +Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
> +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> +---
> + src/Font.c      | 6 ++++--
> + src/FontInfo.c  | 3 +++
> + src/FontNames.c | 3 +++
> + src/GetColor.c  | 4 ++++
> + src/LoadFont.c  | 4 ++++
> + src/LookupCol.c | 6 ++++--
> + src/ParseCol.c  | 5 ++++-
> + src/QuExt.c     | 5 +++++
> + src/SetFPath.c  | 8 +++++++-
> + src/SetHints.c  | 7 +++++++
> + src/StNColor.c  | 3 +++
> + src/StName.c    | 7 ++++++-
> + 12 files changed, 54 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/Font.c b/src/Font.c
> +index 09d2ae91..3f468e4b 100644
> +--- a/src/Font.c
> ++++ b/src/Font.c
> +@@ -102,6 +102,8 @@ XFontStruct *XLoadQueryFont(
> +     XF86BigfontCodes *extcodes = _XF86BigfontCodes(dpy);
> + #endif
> +
> ++    if (strlen(name) >= USHRT_MAX)
> ++        return NULL;
> +     if (_XF86LoadQueryLocaleFont(dpy, name, &font_result, (Font *)0))
> +       return font_result;
> +     LockDisplay(dpy);
> +@@ -662,8 +664,8 @@ int _XF86LoadQueryLocaleFont(
> +
> +     if (!name)
> +       return 0;
> +-    l = strlen(name);
> +-    if (l < 2 || name[l - 1] != '*' || name[l - 2] != '-')
> ++    l = (int) strlen(name);
> ++    if (l < 2 || name[l - 1] != '*' || name[l - 2] != '-' || l >= USHRT_MAX)
> +       return 0;
> +     charset = NULL;
> +     /* next three lines stolen from _XkbGetCharset() */
> +diff --git a/src/FontInfo.c b/src/FontInfo.c
> +index f870e431..51b48e29 100644
> +--- a/src/FontInfo.c
> ++++ b/src/FontInfo.c
> +@@ -58,6 +58,9 @@ XFontStruct **info)  /* RETURN */
> +     register xListFontsReq *req;
> +     int j;
> +
> ++    if (strlen(pattern) >= USHRT_MAX)
> ++        return NULL;
> ++
> +     LockDisplay(dpy);
> +     GetReq(ListFontsWithInfo, req);
> +     req->maxNames = maxNames;
> +diff --git a/src/FontNames.c b/src/FontNames.c
> +index b78792d6..4dac4916 100644
> +--- a/src/FontNames.c
> ++++ b/src/FontNames.c
> +@@ -51,6 +51,9 @@ int *actualCount)    /* RETURN */
> +     register xListFontsReq *req;
> +     unsigned long rlen = 0;
> +
> ++    if (strlen(pattern) >= USHRT_MAX)
> ++        return NULL;
> ++
> +     LockDisplay(dpy);
> +     GetReq(ListFonts, req);
> +     req->maxNames = maxNames;
> +diff --git a/src/GetColor.c b/src/GetColor.c
> +index cd0eb9f6..512ac308 100644
> +--- a/src/GetColor.c
> ++++ b/src/GetColor.c
> +@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include <stdio.h>
> + #include "Xlibint.h"
> + #include "Xcmsint.h"
> +@@ -48,6 +49,9 @@ XColor *exact_def) /* RETURN */
> +     XcmsColor cmsColor_exact;
> +     Status ret;
> +
> ++    if (strlen(colorname) >= USHRT_MAX)
> ++        return (0);
> ++
> + #ifdef XCMS
> +     /*
> +      * Let's Attempt to use Xcms and i18n approach to Parse Color
> +diff --git a/src/LoadFont.c b/src/LoadFont.c
> +index f547976b..85735249 100644
> +--- a/src/LoadFont.c
> ++++ b/src/LoadFont.c
> +@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include "Xlibint.h"
> +
> + Font
> +@@ -38,6 +39,9 @@ XLoadFont (
> +     Font fid;
> +     register xOpenFontReq *req;
> +
> ++    if (strlen(name) >= USHRT_MAX)
> ++        return (0);
> ++
> +     if (_XF86LoadQueryLocaleFont(dpy, name, (XFontStruct **)0, &fid))
> +       return fid;
> +
> +diff --git a/src/LookupCol.c b/src/LookupCol.c
> +index f7f969f5..cd9b1368 100644
> +--- a/src/LookupCol.c
> ++++ b/src/LookupCol.c
> +@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include <stdio.h>
> + #include "Xlibint.h"
> + #include "Xcmsint.h"
> +@@ -46,6 +47,9 @@ XLookupColor (
> +       XcmsCCC ccc;
> +       XcmsColor cmsColor_exact;
> +
> ++      n = (int) strlen (spec);
> ++      if (n >= USHRT_MAX)
> ++            return 0;
> + #ifdef XCMS
> +       /*
> +        * Let's Attempt to use Xcms and i18n approach to Parse Color
> +@@ -77,8 +81,6 @@ XLookupColor (
> +        * Xcms and i18n methods failed, so lets pass it to the server
> +        * for parsing.
> +        */
> +-
> +-      n = strlen (spec);
> +       LockDisplay(dpy);
> +       GetReq (LookupColor, req);
> +       req->cmap = cmap;
> +diff --git a/src/ParseCol.c b/src/ParseCol.c
> +index e997b1b8..180132dd 100644
> +--- a/src/ParseCol.c
> ++++ b/src/ParseCol.c
> +@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include <stdio.h>
> + #include "Xlibint.h"
> + #include "Xcmsint.h"
> +@@ -46,7 +47,9 @@ XParseColor (
> +       XcmsColor cmsColor;
> +
> +         if (!spec) return(0);
> +-      n = strlen (spec);
> ++      n = (int) strlen (spec);
> ++      if (n >= USHRT_MAX)
> ++            return(0);
> +       if (*spec == '#') {
> +           /*
> +            * RGB
> +diff --git a/src/QuExt.c b/src/QuExt.c
> +index 4e230e77..d38a1572 100644
> +--- a/src/QuExt.c
> ++++ b/src/QuExt.c
> +@@ -27,6 +27,8 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> ++#include <stdbool.h>
> + #include "Xlibint.h"
> +
> + Bool
> +@@ -40,6 +42,9 @@ XQueryExtension(
> +     xQueryExtensionReply rep;
> +     register xQueryExtensionReq *req;
> +
> ++    if (strlen(name) >= USHRT_MAX)
> ++        return false;
> ++
> +     LockDisplay(dpy);
> +     GetReq(QueryExtension, req);
> +     req->nbytes = name ? strlen(name) : 0;
> +diff --git a/src/SetFPath.c b/src/SetFPath.c
> +index 60aaef01..3d8c50cb 100644
> +--- a/src/SetFPath.c
> ++++ b/src/SetFPath.c
> +@@ -26,6 +26,7 @@ in this Software without prior written authorization from The Open Group.
> +
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> ++#include <limits.h>
> + #endif
> + #include "Xlibint.h"
> +
> +@@ -48,7 +49,12 @@ XSetFontPath (
> +       GetReq (SetFontPath, req);
> +       req->nFonts = ndirs;
> +       for (i = 0; i < ndirs; i++) {
> +-              n += safestrlen (directories[i]) + 1;
> ++              n = (int) ((size_t) n + (safestrlen (directories[i]) + 1));
> ++              if (n >= USHRT_MAX) {
> ++                      UnlockDisplay(dpy);
> ++                      SyncHandle();
> ++                      return 0;
> ++              }
> +       }
> +       nbytes = (n + 3) & ~3;
> +       req->length += nbytes >> 2;
> +diff --git a/src/SetHints.c b/src/SetHints.c
> +index bc46498a..f3d727ec 100644
> +--- a/src/SetHints.c
> ++++ b/src/SetHints.c
> +@@ -49,6 +49,7 @@ SOFTWARE.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include <X11/Xlibint.h>
> + #include <X11/Xutil.h>
> + #include "Xatomtype.h"
> +@@ -214,6 +215,8 @@ XSetCommand (
> +       register char *buf, *bp;
> +       for (i = 0, nbytes = 0; i < argc; i++) {
> +               nbytes += safestrlen(argv[i]) + 1;
> ++              if (nbytes >= USHRT_MAX)
> ++                    return 1;
> +       }
> +       if ((bp = buf = Xmalloc(nbytes))) {
> +           /* copy arguments into single buffer */
> +@@ -256,6 +259,8 @@ XSetStandardProperties (
> +
> +       if (name != NULL) XStoreName (dpy, w, name);
> +
> ++        if (safestrlen(icon_string) >= USHRT_MAX)
> ++            return 1;
> +       if (icon_string != NULL) {
> +           XChangeProperty (dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
> +                              PropModeReplace,
> +@@ -298,6 +303,8 @@ XSetClassHint(
> +
> +       len_nm = safestrlen(classhint->res_name);
> +       len_cl = safestrlen(classhint->res_class);
> ++        if (len_nm + len_cl >= USHRT_MAX)
> ++            return 1;
> +       if ((class_string = s = Xmalloc(len_nm + len_cl + 2))) {
> +           if (len_nm) {
> +               strcpy(s, classhint->res_name);
> +diff --git a/src/StNColor.c b/src/StNColor.c
> +index 8b821c3e..ba021958 100644
> +--- a/src/StNColor.c
> ++++ b/src/StNColor.c
> +@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include <stdio.h>
> + #include "Xlibint.h"
> + #include "Xcmsint.h"
> +@@ -46,6 +47,8 @@ int flags)  /* DoRed, DoGreen, DoBlue */
> +     XcmsColor cmsColor_exact;
> +     XColor scr_def;
> +
> ++    if (strlen(name) >= USHRT_MAX)
> ++        return 0;
> + #ifdef XCMS
> +     /*
> +      * Let's Attempt to use Xcms approach to Parse Color
> +diff --git a/src/StName.c b/src/StName.c
> +index b4048bff..5a632d0c 100644
> +--- a/src/StName.c
> ++++ b/src/StName.c
> +@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> + #endif
> ++#include <limits.h>
> + #include <X11/Xlibint.h>
> + #include <X11/Xatom.h>
> +
> +@@ -36,7 +37,9 @@ XStoreName (
> +     Window w,
> +     _Xconst char *name)
> + {
> +-    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING,
> ++    if (strlen(name) >= USHRT_MAX)
> ++        return 0;
> ++    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING, /*  */
> +                          8, PropModeReplace, (_Xconst unsigned char *)name,
> +                          name ? strlen(name) : 0);
> + }
> +@@ -47,6 +50,8 @@ XSetIconName (
> +     Window w,
> +     _Xconst char *icon_name)
> + {
> ++    if (strlen(icon_name) >= USHRT_MAX)
> ++        return 0;
> +     return XChangeProperty(dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
> +                            PropModeReplace, (_Xconst unsigned char *)icon_name,
> +                          icon_name ? strlen(icon_name) : 0);
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
> index ebd2640743..ff2a6f7265 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
> @@ -15,6 +15,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
>              file://libx11-whitespace.patch \
>              file://CVE-2020-14344.patch \
>              file://CVE-2020-14363.patch \
> +            file://CVE-2021-31535.patch \
>  "
>
>  SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
> --
> 2.32.0
>
>
> 
>
