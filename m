Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [116.202.209.171])
 by mx.groups.io with SMTP id smtpd.web11.10171.1624373148738094496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 07:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@fancydomain.eu header.s=mail header.b=Bku18EpC;
 spf=pass (domain: fancydomain.eu, ip: 116.202.209.171, mailfrom: jasper@fancydomain.eu)
Date: Tue, 22 Jun 2021 16:45:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1624373145;
	bh=a10i50ni7G489H82R5o0Rs4g6/M0RI5vVmynsbRQgfc=;
	h=In-Reply-To:References:Subject:To:CC:From;
	b=Bku18EpCk4COu1LyXclCwF1fPukQ7I2HUeurjD1OcBqd0VZft7dI1c6EFqVwW3m6X
	 5o/nIbcvwvoaAOc1MscoNXvOJYp5JflWaJg2l3u5HkSY2Kdoihq7f9VU8EoqBmytEe
	 fiD0VFIvOwNRH36QjNagRc/mYQjKNnM6VBnkr5r+Ncc932PEKSVCQ1yT6M5LFALvrf
	 gpbDVeI8ttS/GpUhwxGScWWiDubcJYtBBVTAt9VvZA/0potAVhWWcCPkTD7a7TliGq
	 I7lbHWgMh/Hdiebtz2/47i5lL28vshai4t5pLeJNKU+J3+GK10bHzUkvdyh6lmu6os
	 VNVRw74/+0rhw==
In-Reply-To: <CAOSpxdYhREHqXZsUY0dwP1biwMgXiwwZQrxPgSg-nuw8Y9tTKw@mail.gmail.com>
References: <20210622120847.111023-1-jasper@fancydomain.eu> <CAOSpxdYhREHqXZsUY0dwP1biwMgXiwwZQrxPgSg-nuw8Y9tTKw@mail.gmail.com>
Mime-Version: 1.0
Subject: Re: [oe-core][dunfell][PATCH v2] libx11: Fix CVE-2021-31535
To: openembedded-core@lists.openembedded.org,Steve Sakoman <steve@sakoman.com>
CC: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
From: "Jasper Orschulko" <jasper@fancydomain.eu>
Message-ID: <A032403E-67E2-430F-874D-39CA0EC34680@fancydomain.eu>
Content-Type: multipart/alternative; boundary="----RTDSVV4G6BX7ZX462XK7QDO7CNNMUT"
Content-Transfer-Encoding: 7bit

------RTDSVV4G6BX7ZX462XK7QDO7CNNMUT
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Obviously, patch files in patch files still confuse me=2E=2E=2E :D v3 on it=
's way!

On 22 June 2021 16:30:40 CEST, Steve Sakoman <steve@sakoman=2Ecom> wrote:
>On Tue, Jun 22, 2021 at 2:09 AM Jasper Orschulko via
>lists=2Eopenembedded=2Eorg <jasper=3Dfancydomain=2Eeu@lists=2Eopenembedde=
d=2Eorg>
>wrote:
>>
>> https://lists=2Ex=2Eorg/archives/xorg-announce/2021-May/003088=2Ehtml
>>
>> XLookupColor() and other X libraries function lack proper validation
>> of the length of their string parameters=2E If those parameters can be
>> controlled by an external application (for instance a color name that
>> can be emitted via a terminal control sequence) it can lead to the
>> emission of extra X protocol requests to the X server=2E
>>
>> Upstream-Status: Backport
>[https://gitlab=2Efreedesktop=2Eorg/xorg/lib/libx11/-/commit/8d2e02ae650f=
00c4a53deb625211a0527126c605]
>> CVE: CVE-2021-31535
>> Signed-off-by: Jasper Orschulko <jasper@fancydomain=2Eeu>
>
>These three lines should be in the patch file itself=2E  See the "Patch
>name convention and commit message" section at
>https://wiki=2Eyoctoproject=2Eorg/wiki/Security for details=2E
>
>Thanks!
>
>Steve
>
>> ---
>>  =2E=2E=2E/xorg-lib/libx11/CVE-2021-31535=2Epatch      | 322
>++++++++++++++++++
>>  =2E=2E=2E/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb |   1 +
>>  2 files changed, 323 insertions(+)
>>  create mode 100644
>meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535=2Epatch
>>
>> diff --git
>a/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535=2Epatch
>b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535=2Epatch
>> new file mode 100644
>> index 0000000000=2E=2E1112320acf
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535=2Epatch
>> @@ -0,0 +1,322 @@
>> +From 5c539ee6aba5872fcc73aa3d46a4e9a33dc030db Mon Sep 17 00:00:00
>2001
>> +From: Matthieu Herrb <matthieu@herrb=2Eeu>
>> +Date: Fri, 19 Feb 2021 15:30:39 +0100
>> +Subject: [PATCH] Reject string longer than USHRT_MAX before sending
>them on
>> + the wire
>> +
>> +The X protocol uses CARD16 values to represent the length so
>> +this would overflow=2E
>> +
>> +CVE-2021-31535
>> +
>> +Signed-off-by: Matthieu Herrb <matthieu@herrb=2Eeu>
>> +Signed-off-by: Jasper Orschulko <Jasper=2EOrschulko@iris-sensing=2Ecom=
>
>> +---
>> + src/Font=2Ec      | 6 ++++--
>> + src/FontInfo=2Ec  | 3 +++
>> + src/FontNames=2Ec | 3 +++
>> + src/GetColor=2Ec  | 4 ++++
>> + src/LoadFont=2Ec  | 4 ++++
>> + src/LookupCol=2Ec | 6 ++++--
>> + src/ParseCol=2Ec  | 5 ++++-
>> + src/QuExt=2Ec     | 5 +++++
>> + src/SetFPath=2Ec  | 8 +++++++-
>> + src/SetHints=2Ec  | 7 +++++++
>> + src/StNColor=2Ec  | 3 +++
>> + src/StName=2Ec    | 7 ++++++-
>> + 12 files changed, 54 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/src/Font=2Ec b/src/Font=2Ec
>> +index 09d2ae91=2E=2E3f468e4b 100644
>> +--- a/src/Font=2Ec
>> ++++ b/src/Font=2Ec
>> +@@ -102,6 +102,8 @@ XFontStruct *XLoadQueryFont(
>> +     XF86BigfontCodes *extcodes =3D _XF86BigfontCodes(dpy);
>> + #endif
>> +
>> ++    if (strlen(name) >=3D USHRT_MAX)
>> ++        return NULL;
>> +     if (_XF86LoadQueryLocaleFont(dpy, name, &font_result, (Font
>*)0))
>> +       return font_result;
>> +     LockDisplay(dpy);
>> +@@ -662,8 +664,8 @@ int _XF86LoadQueryLocaleFont(
>> +
>> +     if (!name)
>> +       return 0;
>> +-    l =3D strlen(name);
>> +-    if (l < 2 || name[l - 1] !=3D '*' || name[l - 2] !=3D '-')
>> ++    l =3D (int) strlen(name);
>> ++    if (l < 2 || name[l - 1] !=3D '*' || name[l - 2] !=3D '-' || l >=
=3D
>USHRT_MAX)
>> +       return 0;
>> +     charset =3D NULL;
>> +     /* next three lines stolen from _XkbGetCharset() */
>> +diff --git a/src/FontInfo=2Ec b/src/FontInfo=2Ec
>> +index f870e431=2E=2E51b48e29 100644
>> +--- a/src/FontInfo=2Ec
>> ++++ b/src/FontInfo=2Ec
>> +@@ -58,6 +58,9 @@ XFontStruct **info)  /* RETURN */
>> +     register xListFontsReq *req;
>> +     int j;
>> +
>> ++    if (strlen(pattern) >=3D USHRT_MAX)
>> ++        return NULL;
>> ++
>> +     LockDisplay(dpy);
>> +     GetReq(ListFontsWithInfo, req);
>> +     req->maxNames =3D maxNames;
>> +diff --git a/src/FontNames=2Ec b/src/FontNames=2Ec
>> +index b78792d6=2E=2E4dac4916 100644
>> +--- a/src/FontNames=2Ec
>> ++++ b/src/FontNames=2Ec
>> +@@ -51,6 +51,9 @@ int *actualCount)    /* RETURN */
>> +     register xListFontsReq *req;
>> +     unsigned long rlen =3D 0;
>> +
>> ++    if (strlen(pattern) >=3D USHRT_MAX)
>> ++        return NULL;
>> ++
>> +     LockDisplay(dpy);
>> +     GetReq(ListFonts, req);
>> +     req->maxNames =3D maxNames;
>> +diff --git a/src/GetColor=2Ec b/src/GetColor=2Ec
>> +index cd0eb9f6=2E=2E512ac308 100644
>> +--- a/src/GetColor=2Ec
>> ++++ b/src/GetColor=2Ec
>> +@@ -27,6 +27,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include <stdio=2Eh>
>> + #include "Xlibint=2Eh"
>> + #include "Xcmsint=2Eh"
>> +@@ -48,6 +49,9 @@ XColor *exact_def) /* RETURN */
>> +     XcmsColor cmsColor_exact;
>> +     Status ret;
>> +
>> ++    if (strlen(colorname) >=3D USHRT_MAX)
>> ++        return (0);
>> ++
>> + #ifdef XCMS
>> +     /*
>> +      * Let's Attempt to use Xcms and i18n approach to Parse Color
>> +diff --git a/src/LoadFont=2Ec b/src/LoadFont=2Ec
>> +index f547976b=2E=2E85735249 100644
>> +--- a/src/LoadFont=2Ec
>> ++++ b/src/LoadFont=2Ec
>> +@@ -27,6 +27,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include "Xlibint=2Eh"
>> +
>> + Font
>> +@@ -38,6 +39,9 @@ XLoadFont (
>> +     Font fid;
>> +     register xOpenFontReq *req;
>> +
>> ++    if (strlen(name) >=3D USHRT_MAX)
>> ++        return (0);
>> ++
>> +     if (_XF86LoadQueryLocaleFont(dpy, name, (XFontStruct **)0,
>&fid))
>> +       return fid;
>> +
>> +diff --git a/src/LookupCol=2Ec b/src/LookupCol=2Ec
>> +index f7f969f5=2E=2Ecd9b1368 100644
>> +--- a/src/LookupCol=2Ec
>> ++++ b/src/LookupCol=2Ec
>> +@@ -27,6 +27,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include <stdio=2Eh>
>> + #include "Xlibint=2Eh"
>> + #include "Xcmsint=2Eh"
>> +@@ -46,6 +47,9 @@ XLookupColor (
>> +       XcmsCCC ccc;
>> +       XcmsColor cmsColor_exact;
>> +
>> ++      n =3D (int) strlen (spec);
>> ++      if (n >=3D USHRT_MAX)
>> ++            return 0;
>> + #ifdef XCMS
>> +       /*
>> +        * Let's Attempt to use Xcms and i18n approach to Parse Color
>> +@@ -77,8 +81,6 @@ XLookupColor (
>> +        * Xcms and i18n methods failed, so lets pass it to the
>server
>> +        * for parsing=2E
>> +        */
>> +-
>> +-      n =3D strlen (spec);
>> +       LockDisplay(dpy);
>> +       GetReq (LookupColor, req);
>> +       req->cmap =3D cmap;
>> +diff --git a/src/ParseCol=2Ec b/src/ParseCol=2Ec
>> +index e997b1b8=2E=2E180132dd 100644
>> +--- a/src/ParseCol=2Ec
>> ++++ b/src/ParseCol=2Ec
>> +@@ -27,6 +27,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include <stdio=2Eh>
>> + #include "Xlibint=2Eh"
>> + #include "Xcmsint=2Eh"
>> +@@ -46,7 +47,9 @@ XParseColor (
>> +       XcmsColor cmsColor;
>> +
>> +         if (!spec) return(0);
>> +-      n =3D strlen (spec);
>> ++      n =3D (int) strlen (spec);
>> ++      if (n >=3D USHRT_MAX)
>> ++            return(0);
>> +       if (*spec =3D=3D '#') {
>> +           /*
>> +            * RGB
>> +diff --git a/src/QuExt=2Ec b/src/QuExt=2Ec
>> +index 4e230e77=2E=2Ed38a1572 100644
>> +--- a/src/QuExt=2Ec
>> ++++ b/src/QuExt=2Ec
>> +@@ -27,6 +27,8 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> ++#include <stdbool=2Eh>
>> + #include "Xlibint=2Eh"
>> +
>> + Bool
>> +@@ -40,6 +42,9 @@ XQueryExtension(
>> +     xQueryExtensionReply rep;
>> +     register xQueryExtensionReq *req;
>> +
>> ++    if (strlen(name) >=3D USHRT_MAX)
>> ++        return false;
>> ++
>> +     LockDisplay(dpy);
>> +     GetReq(QueryExtension, req);
>> +     req->nbytes =3D name ? strlen(name) : 0;
>> +diff --git a/src/SetFPath=2Ec b/src/SetFPath=2Ec
>> +index 60aaef01=2E=2E3d8c50cb 100644
>> +--- a/src/SetFPath=2Ec
>> ++++ b/src/SetFPath=2Ec
>> +@@ -26,6 +26,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> +
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> ++#include <limits=2Eh>
>> + #endif
>> + #include "Xlibint=2Eh"
>> +
>> +@@ -48,7 +49,12 @@ XSetFontPath (
>> +       GetReq (SetFontPath, req);
>> +       req->nFonts =3D ndirs;
>> +       for (i =3D 0; i < ndirs; i++) {
>> +-              n +=3D safestrlen (directories[i]) + 1;
>> ++              n =3D (int) ((size_t) n + (safestrlen (directories[i])
>+ 1));
>> ++              if (n >=3D USHRT_MAX) {
>> ++                      UnlockDisplay(dpy);
>> ++                      SyncHandle();
>> ++                      return 0;
>> ++              }
>> +       }
>> +       nbytes =3D (n + 3) & ~3;
>> +       req->length +=3D nbytes >> 2;
>> +diff --git a/src/SetHints=2Ec b/src/SetHints=2Ec
>> +index bc46498a=2E=2Ef3d727ec 100644
>> +--- a/src/SetHints=2Ec
>> ++++ b/src/SetHints=2Ec
>> +@@ -49,6 +49,7 @@ SOFTWARE=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include <X11/Xlibint=2Eh>
>> + #include <X11/Xutil=2Eh>
>> + #include "Xatomtype=2Eh"
>> +@@ -214,6 +215,8 @@ XSetCommand (
>> +       register char *buf, *bp;
>> +       for (i =3D 0, nbytes =3D 0; i < argc; i++) {
>> +               nbytes +=3D safestrlen(argv[i]) + 1;
>> ++              if (nbytes >=3D USHRT_MAX)
>> ++                    return 1;
>> +       }
>> +       if ((bp =3D buf =3D Xmalloc(nbytes))) {
>> +           /* copy arguments into single buffer */
>> +@@ -256,6 +259,8 @@ XSetStandardProperties (
>> +
>> +       if (name !=3D NULL) XStoreName (dpy, w, name);
>> +
>> ++        if (safestrlen(icon_string) >=3D USHRT_MAX)
>> ++            return 1;
>> +       if (icon_string !=3D NULL) {
>> +           XChangeProperty (dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
>> +                              PropModeReplace,
>> +@@ -298,6 +303,8 @@ XSetClassHint(
>> +
>> +       len_nm =3D safestrlen(classhint->res_name);
>> +       len_cl =3D safestrlen(classhint->res_class);
>> ++        if (len_nm + len_cl >=3D USHRT_MAX)
>> ++            return 1;
>> +       if ((class_string =3D s =3D Xmalloc(len_nm + len_cl + 2))) {
>> +           if (len_nm) {
>> +               strcpy(s, classhint->res_name);
>> +diff --git a/src/StNColor=2Ec b/src/StNColor=2Ec
>> +index 8b821c3e=2E=2Eba021958 100644
>> +--- a/src/StNColor=2Ec
>> ++++ b/src/StNColor=2Ec
>> +@@ -27,6 +27,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include <stdio=2Eh>
>> + #include "Xlibint=2Eh"
>> + #include "Xcmsint=2Eh"
>> +@@ -46,6 +47,8 @@ int flags)  /* DoRed, DoGreen, DoBlue */
>> +     XcmsColor cmsColor_exact;
>> +     XColor scr_def;
>> +
>> ++    if (strlen(name) >=3D USHRT_MAX)
>> ++        return 0;
>> + #ifdef XCMS
>> +     /*
>> +      * Let's Attempt to use Xcms approach to Parse Color
>> +diff --git a/src/StName=2Ec b/src/StName=2Ec
>> +index b4048bff=2E=2E5a632d0c 100644
>> +--- a/src/StName=2Ec
>> ++++ b/src/StName=2Ec
>> +@@ -27,6 +27,7 @@ in this Software without prior written
>authorization from The Open Group=2E
>> + #ifdef HAVE_CONFIG_H
>> + #include <config=2Eh>
>> + #endif
>> ++#include <limits=2Eh>
>> + #include <X11/Xlibint=2Eh>
>> + #include <X11/Xatom=2Eh>
>> +
>> +@@ -36,7 +37,9 @@ XStoreName (
>> +     Window w,
>> +     _Xconst char *name)
>> + {
>> +-    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING,
>> ++    if (strlen(name) >=3D USHRT_MAX)
>> ++        return 0;
>> ++    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING, /*  */
>> +                          8, PropModeReplace, (_Xconst unsigned char
>*)name,
>> +                          name ? strlen(name) : 0);
>> + }
>> +@@ -47,6 +50,8 @@ XSetIconName (
>> +     Window w,
>> +     _Xconst char *icon_name)
>> + {
>> ++    if (strlen(icon_name) >=3D USHRT_MAX)
>> ++        return 0;
>> +     return XChangeProperty(dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
>> +                            PropModeReplace, (_Xconst unsigned char
>*)icon_name,
>> +                          icon_name ? strlen(icon_name) : 0);
>> +--
>> +2=2E32=2E0
>> +
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb
>b/meta/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb
>> index ebd2640743=2E=2Eff2a6f7265 100644
>> --- a/meta/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb
>> +++ b/meta/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb
>> @@ -15,6 +15,7 @@ SRC_URI +=3D
>"file://Fix-hanging-issue-in-_XReply=2Epatch \
>>              file://libx11-whitespace=2Epatch \
>>              file://CVE-2020-14344=2Epatch \
>>              file://CVE-2020-14363=2Epatch \
>> +            file://CVE-2021-31535=2Epatch \
>>  "
>>
>>  SRC_URI[md5sum] =3D "55adbfb6d4370ecac5e70598c4e7eed2"
>> --
>> 2=2E32=2E0
>>
>>
>>=20
>>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

------RTDSVV4G6BX7ZX462XK7QDO7CNNMUT
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Obviously, patch files in patch files still confus=
e me=2E=2E=2E :D v3 on it's way!<br><br><div class=3D"gmail_quote">On 22 Ju=
ne 2021 16:30:40 CEST, Steve Sakoman &lt;steve@sakoman=2Ecom&gt; wrote:<blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-=
left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">On Tue, Jun 22, 2021 at 2:09 AM Jasper Orschulko via=
<br>lists=2Eopenembedded=2Eorg &lt;jasper=3Dfancydomain=2Eeu@lists=2Eopenem=
bedded=2Eorg&gt;<br>wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1e=
x;"><br> <a href=3D"https://lists=2Ex=2Eorg/archives/xorg-announce/2021-May=
/003088=2Ehtml">https://lists=2Ex=2Eorg/archives/xorg-announce/2021-May/003=
088=2Ehtml</a><br><br> XLookupColor() and other X libraries function lack p=
roper validation<br> of the length of their string parameters=2E If those p=
arameters can be<br> controlled by an external application (for instance a =
color name that<br> can be emitted via a terminal control sequence) it can =
lead to the<br> emission of extra X protocol requests to the X server=2E<br=
><br> Upstream-Status: Backport [https://gitlab=2Efreedesktop=2Eorg/xorg/li=
b/libx11/-/commit/8d2e02ae650f00c4a53deb625211a0527126c605]<br> CVE: CVE-20=
21-31535<br> Signed-off-by: Jasper Orschulko &lt;jasper@fancydomain=2Eeu&gt=
;<br></blockquote><br>These three lines should be in the patch file itself=
=2E  See the "Patch<br>name convention and commit message" section at<br><a=
 href=3D"https://wiki=2Eyoctoproject=2Eorg/wiki/Security">https://wiki=2Eyo=
ctoproject=2Eorg/wiki/Security</a> for details=2E<br><br>Thanks!<br><br>Ste=
ve<br><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=
=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><hr>  =2E=2E=2E=
/xorg-lib/libx11/CVE-2021-31535=2Epatch      | 322 ++++++++++++++++++<br>  =
=2E=2E=2E/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb |   1 +<br>  2 fi=
les changed, 323 insertions(+)<br>  create mode 100644 meta/recipes-graphic=
s/xorg-lib/libx11/CVE-2021-31535=2Epatch<br><br> diff --git a/meta/recipes-=
graphics/xorg-lib/libx11/CVE-2021-31535=2Epatch b/meta/recipes-graphics/xor=
g-lib/libx11/CVE-2021-31535=2Epatch<br> new file mode 100644<br> index 0000=
000000=2E=2E1112320acf<br> --- /dev/null<br> +++ b/meta/recipes-graphics/xo=
rg-lib/libx11/CVE-2021-31535=2Epatch<br> @@ -0,0 +1,322 @@<br> +From 5c539e=
e6aba5872fcc73aa3d46a4e9a33dc030db Mon Sep 17 00:00:00 2001<br> +From: Matt=
hieu Herrb &lt;matthieu@herrb=2Eeu&gt;<br> +Date: Fri, 19 Feb 2021 15:30:39=
 +0100<br> +Subject: [PATCH] Reject string longer than USHRT_MAX before sen=
ding them on<br> + the wire<br> +<br> +The X protocol uses CARD16 values to=
 represent the length so<br> +this would overflow=2E<br> +<br> +CVE-2021-31=
535<br> +<br> +Signed-off-by: Matthieu Herrb &lt;matthieu@herrb=2Eeu&gt;<br=
> +Signed-off-by: Jasper Orschulko &lt;Jasper=2EOrschulko@iris-sensing=2Eco=
m&gt;<br> +---<br> + src/Font=2Ec      | 6 ++++--<br> + src/FontInfo=2Ec  |=
 3 +++<br> + src/FontNames=2Ec | 3 +++<br> + src/GetColor=2Ec  | 4 ++++<br>=
 + src/LoadFont=2Ec  | 4 ++++<br> + src/LookupCol=2Ec | 6 ++++--<br> + src/=
ParseCol=2Ec  | 5 ++++-<br> + src/QuExt=2Ec     | 5 +++++<br> + src/SetFPat=
h=2Ec  | 8 +++++++-<br> + src/SetHints=2Ec  | 7 +++++++<br> + src/StNColor=
=2Ec  | 3 +++<br> + src/StName=2Ec    | 7 ++++++-<br> + 12 files changed, 5=
4 insertions(+), 7 deletions(-)<br> +<br> +diff --git a/src/Font=2Ec b/src/=
Font=2Ec<br> +index 09d2ae91=2E=2E3f468e4b 100644<br> +--- a/src/Font=2Ec<b=
r> ++++ b/src/Font=2Ec<br> +@@ -102,6 +102,8 @@ XFontStruct *XLoadQueryFont=
(<br> +     XF86BigfontCodes *extcodes =3D _XF86BigfontCodes(dpy);<br> + #e=
ndif<br> +<br> ++    if (strlen(name) &gt;=3D USHRT_MAX)<br> ++        retu=
rn NULL;<br> +     if (_XF86LoadQueryLocaleFont(dpy, name, &amp;font_result=
, (Font *)0))<br> +       return font_result;<br> +     LockDisplay(dpy);<b=
r> +@@ -662,8 +664,8 @@ int _XF86LoadQueryLocaleFont(<br> +<br> +     if (!=
name)<br> +       return 0;<br> +-    l =3D strlen(name);<br> +-    if (l &=
lt; 2 || name[l - 1] !=3D '*' || name[l - 2] !=3D '-')<br> ++    l =3D (int=
) strlen(name);<br> ++    if (l &lt; 2 || name[l - 1] !=3D '*' || name[l - =
2] !=3D '-' || l &gt;=3D USHRT_MAX)<br> +       return 0;<br> +     charset=
 =3D NULL;<br> +     /* next three lines stolen from _XkbGetCharset() */<br=
> +diff --git a/src/FontInfo=2Ec b/src/FontInfo=2Ec<br> +index f870e431=2E=
=2E51b48e29 100644<br> +--- a/src/FontInfo=2Ec<br> ++++ b/src/FontInfo=2Ec<=
br> +@@ -58,6 +58,9 @@ XFontStruct **info)  /* RETURN */<br> +     register=
 xListFontsReq *req;<br> +     int j;<br> +<br> ++    if (strlen(pattern) &=
gt;=3D USHRT_MAX)<br> ++        return NULL;<br> ++<br> +     LockDisplay(d=
py);<br> +     GetReq(ListFontsWithInfo, req);<br> +     req-&gt;maxNames =
=3D maxNames;<br> +diff --git a/src/FontNames=2Ec b/src/FontNames=2Ec<br> +=
index b78792d6=2E=2E4dac4916 100644<br> +--- a/src/FontNames=2Ec<br> ++++ b=
/src/FontNames=2Ec<br> +@@ -51,6 +51,9 @@ int *actualCount)    /* RETURN */=
<br> +     register xListFontsReq *req;<br> +     unsigned long rlen =3D 0;=
<br> +<br> ++    if (strlen(pattern) &gt;=3D USHRT_MAX)<br> ++        retur=
n NULL;<br> ++<br> +     LockDisplay(dpy);<br> +     GetReq(ListFonts, req)=
;<br> +     req-&gt;maxNames =3D maxNames;<br> +diff --git a/src/GetColor=
=2Ec b/src/GetColor=2Ec<br> +index cd0eb9f6=2E=2E512ac308 100644<br> +--- a=
/src/GetColor=2Ec<br> ++++ b/src/GetColor=2Ec<br> +@@ -27,6 +27,7 @@ in thi=
s Software without prior written authorization from The Open Group=2E<br> +=
 #ifdef HAVE_CONFIG_H<br> + #include &lt;config=2Eh&gt;<br> + #endif<br> ++=
#include &lt;limits=2Eh&gt;<br> + #include &lt;stdio=2Eh&gt;<br> + #include=
 "Xlibint=2Eh"<br> + #include "Xcmsint=2Eh"<br> +@@ -48,6 +49,9 @@ XColor *=
exact_def) /* RETURN */<br> +     XcmsColor cmsColor_exact;<br> +     Statu=
s ret;<br> +<br> ++    if (strlen(colorname) &gt;=3D USHRT_MAX)<br> ++     =
   return (0);<br> ++<br> + #ifdef XCMS<br> +     /*<br> +      * Let's Att=
empt to use Xcms and i18n approach to Parse Color<br> +diff --git a/src/Loa=
dFont=2Ec b/src/LoadFont=2Ec<br> +index f547976b=2E=2E85735249 100644<br> +=
--- a/src/LoadFont=2Ec<br> ++++ b/src/LoadFont=2Ec<br> +@@ -27,6 +27,7 @@ i=
n this Software without prior written authorization from The Open Group=2E<=
br> + #ifdef HAVE_CONFIG_H<br> + #include &lt;config=2Eh&gt;<br> + #endif<b=
r> ++#include &lt;limits=2Eh&gt;<br> + #include "Xlibint=2Eh"<br> +<br> + F=
ont<br> +@@ -38,6 +39,9 @@ XLoadFont (<br> +     Font fid;<br> +     regist=
er xOpenFontReq *req;<br> +<br> ++    if (strlen(name) &gt;=3D USHRT_MAX)<b=
r> ++        return (0);<br> ++<br> +     if (_XF86LoadQueryLocaleFont(dpy,=
 name, (XFontStruct **)0, &amp;fid))<br> +       return fid;<br> +<br> +dif=
f --git a/src/LookupCol=2Ec b/src/LookupCol=2Ec<br> +index f7f969f5=2E=2Ecd=
9b1368 100644<br> +--- a/src/LookupCol=2Ec<br> ++++ b/src/LookupCol=2Ec<br>=
 +@@ -27,6 +27,7 @@ in this Software without prior written authorization fr=
om The Open Group=2E<br> + #ifdef HAVE_CONFIG_H<br> + #include &lt;config=
=2Eh&gt;<br> + #endif<br> ++#include &lt;limits=2Eh&gt;<br> + #include &lt;=
stdio=2Eh&gt;<br> + #include "Xlibint=2Eh"<br> + #include "Xcmsint=2Eh"<br>=
 +@@ -46,6 +47,9 @@ XLookupColor (<br> +       XcmsCCC ccc;<br> +       Xcm=
sColor cmsColor_exact;<br> +<br> ++      n =3D (int) strlen (spec);<br> ++ =
     if (n &gt;=3D USHRT_MAX)<br> ++            return 0;<br> + #ifdef XCMS=
<br> +       /*<br> +        * Let's Attempt to use Xcms and i18n approach =
to Parse Color<br> +@@ -77,8 +81,6 @@ XLookupColor (<br> +        * Xcms an=
d i18n methods failed, so lets pass it to the server<br> +        * for par=
sing=2E<br> +        */<br> +-<br> +-      n =3D strlen (spec);<br> +      =
 LockDisplay(dpy);<br> +       GetReq (LookupColor, req);<br> +       req-&=
gt;cmap =3D cmap;<br> +diff --git a/src/ParseCol=2Ec b/src/ParseCol=2Ec<br>=
 +index e997b1b8=2E=2E180132dd 100644<br> +--- a/src/ParseCol=2Ec<br> ++++ =
b/src/ParseCol=2Ec<br> +@@ -27,6 +27,7 @@ in this Software without prior wr=
itten authorization from The Open Group=2E<br> + #ifdef HAVE_CONFIG_H<br> +=
 #include &lt;config=2Eh&gt;<br> + #endif<br> ++#include &lt;limits=2Eh&gt;=
<br> + #include &lt;stdio=2Eh&gt;<br> + #include "Xlibint=2Eh"<br> + #inclu=
de "Xcmsint=2Eh"<br> +@@ -46,7 +47,9 @@ XParseColor (<br> +       XcmsColor=
 cmsColor;<br> +<br> +         if (!spec) return(0);<br> +-      n =3D strl=
en (spec);<br> ++      n =3D (int) strlen (spec);<br> ++      if (n &gt;=3D=
 USHRT_MAX)<br> ++            return(0);<br> +       if (*spec =3D=3D '#') =
{<br> +           /*<br> +            * RGB<br> +diff --git a/src/QuExt=2Ec=
 b/src/QuExt=2Ec<br> +index 4e230e77=2E=2Ed38a1572 100644<br> +--- a/src/Qu=
Ext=2Ec<br> ++++ b/src/QuExt=2Ec<br> +@@ -27,6 +27,8 @@ in this Software wi=
thout prior written authorization from The Open Group=2E<br> + #ifdef HAVE_=
CONFIG_H<br> + #include &lt;config=2Eh&gt;<br> + #endif<br> ++#include &lt;=
limits=2Eh&gt;<br> ++#include &lt;stdbool=2Eh&gt;<br> + #include "Xlibint=
=2Eh"<br> +<br> + Bool<br> +@@ -40,6 +42,9 @@ XQueryExtension(<br> +     xQ=
ueryExtensionReply rep;<br> +     register xQueryExtensionReq *req;<br> +<b=
r> ++    if (strlen(name) &gt;=3D USHRT_MAX)<br> ++        return false;<br=
> ++<br> +     LockDisplay(dpy);<br> +     GetReq(QueryExtension, req);<br>=
 +     req-&gt;nbytes =3D name ? strlen(name) : 0;<br> +diff --git a/src/Se=
tFPath=2Ec b/src/SetFPath=2Ec<br> +index 60aaef01=2E=2E3d8c50cb 100644<br> =
+--- a/src/SetFPath=2Ec<br> ++++ b/src/SetFPath=2Ec<br> +@@ -26,6 +26,7 @@ =
in this Software without prior written authorization from The Open Group=2E=
<br> +<br> + #ifdef HAVE_CONFIG_H<br> + #include &lt;config=2Eh&gt;<br> ++#=
include &lt;limits=2Eh&gt;<br> + #endif<br> + #include "Xlibint=2Eh"<br> +<=
br> +@@ -48,7 +49,12 @@ XSetFontPath (<br> +       GetReq (SetFontPath, req=
);<br> +       req-&gt;nFonts =3D ndirs;<br> +       for (i =3D 0; i &lt; n=
dirs; i++) {<br> +-              n +=3D safestrlen (directories[i]) + 1;<br=
> ++              n =3D (int) ((size_t) n + (safestrlen (directories[i]) + =
1));<br> ++              if (n &gt;=3D USHRT_MAX) {<br> ++                 =
     UnlockDisplay(dpy);<br> ++                      SyncHandle();<br> ++  =
                    return 0;<br> ++              }<br> +       }<br> +    =
   nbytes =3D (n + 3) &amp; ~3;<br> +       req-&gt;length +=3D nbytes &gt;=
&gt; 2;<br> +diff --git a/src/SetHints=2Ec b/src/SetHints=2Ec<br> +index bc=
46498a=2E=2Ef3d727ec 100644<br> +--- a/src/SetHints=2Ec<br> ++++ b/src/SetH=
ints=2Ec<br> +@@ -49,6 +49,7 @@ SOFTWARE=2E<br> + #ifdef HAVE_CONFIG_H<br> =
+ #include &lt;config=2Eh&gt;<br> + #endif<br> ++#include &lt;limits=2Eh&gt=
;<br> + #include &lt;X11/Xlibint=2Eh&gt;<br> + #include &lt;X11/Xutil=2Eh&g=
t;<br> + #include "Xatomtype=2Eh"<br> +@@ -214,6 +215,8 @@ XSetCommand (<br=
> +       register char *buf, *bp;<br> +       for (i =3D 0, nbytes =3D 0; =
i &lt; argc; i++) {<br> +               nbytes +=3D safestrlen(argv[i]) + 1=
;<br> ++              if (nbytes &gt;=3D USHRT_MAX)<br> ++                 =
   return 1;<br> +       }<br> +       if ((bp =3D buf =3D Xmalloc(nbytes))=
) {<br> +           /* copy arguments into single buffer */<br> +@@ -256,6 =
+259,8 @@ XSetStandardProperties (<br> +<br> +       if (name !=3D NULL) XS=
toreName (dpy, w, name);<br> +<br> ++        if (safestrlen(icon_string) &g=
t;=3D USHRT_MAX)<br> ++            return 1;<br> +       if (icon_string !=
=3D NULL) {<br> +           XChangeProperty (dpy, w, XA_WM_ICON_NAME, XA_ST=
RING, 8,<br> +                              PropModeReplace,<br> +@@ -298,6=
 +303,8 @@ XSetClassHint(<br> +<br> +       len_nm =3D safestrlen(classhint=
-&gt;res_name);<br> +       len_cl =3D safestrlen(classhint-&gt;res_class);=
<br> ++        if (len_nm + len_cl &gt;=3D USHRT_MAX)<br> ++            ret=
urn 1;<br> +       if ((class_string =3D s =3D Xmalloc(len_nm + len_cl + 2)=
)) {<br> +           if (len_nm) {<br> +               strcpy(s, classhint-=
&gt;res_name);<br> +diff --git a/src/StNColor=2Ec b/src/StNColor=2Ec<br> +i=
ndex 8b821c3e=2E=2Eba021958 100644<br> +--- a/src/StNColor=2Ec<br> ++++ b/s=
rc/StNColor=2Ec<br> +@@ -27,6 +27,7 @@ in this Software without prior writt=
en authorization from The Open Group=2E<br> + #ifdef HAVE_CONFIG_H<br> + #i=
nclude &lt;config=2Eh&gt;<br> + #endif<br> ++#include &lt;limits=2Eh&gt;<br=
> + #include &lt;stdio=2Eh&gt;<br> + #include "Xlibint=2Eh"<br> + #include =
"Xcmsint=2Eh"<br> +@@ -46,6 +47,8 @@ int flags)  /* DoRed, DoGreen, DoBlue =
*/<br> +     XcmsColor cmsColor_exact;<br> +     XColor scr_def;<br> +<br> =
++    if (strlen(name) &gt;=3D USHRT_MAX)<br> ++        return 0;<br> + #if=
def XCMS<br> +     /*<br> +      * Let's Attempt to use Xcms approach to Pa=
rse Color<br> +diff --git a/src/StName=2Ec b/src/StName=2Ec<br> +index b404=
8bff=2E=2E5a632d0c 100644<br> +--- a/src/StName=2Ec<br> ++++ b/src/StName=
=2Ec<br> +@@ -27,6 +27,7 @@ in this Software without prior written authoriz=
ation from The Open Group=2E<br> + #ifdef HAVE_CONFIG_H<br> + #include &lt;=
config=2Eh&gt;<br> + #endif<br> ++#include &lt;limits=2Eh&gt;<br> + #includ=
e &lt;X11/Xlibint=2Eh&gt;<br> + #include &lt;X11/Xatom=2Eh&gt;<br> +<br> +@=
@ -36,7 +37,9 @@ XStoreName (<br> +     Window w,<br> +     _Xconst char *n=
ame)<br> + {<br> +-    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING=
,<br> ++    if (strlen(name) &gt;=3D USHRT_MAX)<br> ++        return 0;<br>=
 ++    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING, /*  */<br> +  =
                        8, PropModeReplace, (_Xconst unsigned char *)name,<=
br> +                          name ? strlen(name) : 0);<br> + }<br> +@@ -4=
7,6 +50,8 @@ XSetIconName (<br> +     Window w,<br> +     _Xconst char *ico=
n_name)<br> + {<br> ++    if (strlen(icon_name) &gt;=3D USHRT_MAX)<br> ++  =
      return 0;<br> +     return XChangeProperty(dpy, w, XA_WM_ICON_NAME, X=
A_STRING, 8,<br> +                            PropModeReplace, (_Xconst uns=
igned char *)icon_name,<br> +                          icon_name ? strlen(i=
con_name) : 0);<br> +--<br> +2=2E32=2E0<br> +<br> diff --git a/meta/recipes=
-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb b/meta/recipes-graphics/xorg-lib/l=
ibx11_1=2E6=2E9=2Ebb<br> index ebd2640743=2E=2Eff2a6f7265 100644<br> --- a/=
meta/recipes-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb<br> +++ b/meta/recipes=
-graphics/xorg-lib/libx11_1=2E6=2E9=2Ebb<br> @@ -15,6 +15,7 @@ SRC_URI +=3D=
 "file://Fix-hanging-issue-in-_XReply=2Epatch \<br>              file://lib=
x11-whitespace=2Epatch \<br>              file://CVE-2020-14344=2Epatch \<b=
r>              file://CVE-2020-14363=2Epatch \<br> +            file://CVE=
-2021-31535=2Epatch \<br>  "<br><br>  SRC_URI[md5sum] =3D "55adbfb6d4370eca=
c5e70598c4e7eed2"<br> --<br> 2=2E32=2E0<br><br><br> <br><br></blockquote></=
pre></blockquote></div><br>-- <br>Sent from my Android device with K-9 Mail=
=2E Please excuse my brevity=2E</body></html>

------RTDSVV4G6BX7ZX462XK7QDO7CNNMUT--
