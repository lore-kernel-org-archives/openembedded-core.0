Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BF8C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:09:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.15778.1678442943106603462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jGzK2T/Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id b10so4795028ljr.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8997vY8tZnx7zr8BGmnUav5da31U5mdK6lYCXItLlUA=;
        b=jGzK2T/YGbBuMsZUfguIUuCqyDup48gxQmWQy7oaKl+KC0BjCOZYczSdl26D6ka0jJ
         CGSLJBqjklHKyZrMEpGdKogO4pHvTzPdDBxlY8BY+AjjBjSNskVwgIM/PSb7LBm6HzyP
         j6b3O7UcMA8H1K5EhGkGW8mlG+dtmF4sW+JvAFfIeSYyVhbtEcoKvaXCw3HqLldLO4bF
         uRfTyIcXnSFXWVZWfpddXqPbPCL6MSJOIj4mX3EdAmPAYnZ2n9e8iQTFd1KMY3O8XeBO
         I+7IdcH+5IeqlpcxmZpDbfRjwL6cW8jPe8shNH4Ze4tW3hZQ3LbyVpoK24ywc8v5u9zW
         7R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8997vY8tZnx7zr8BGmnUav5da31U5mdK6lYCXItLlUA=;
        b=w9J4n3T1iLJ0BM6zPF5z+yUL11/IJiTJAExDwtVkZdNRgJjS9YAQikj3a9I/51on1B
         pBPYDbejBc0pFDETtme7NPpF9T6Yiga/Mp7JyWLTvccYt4xtdmpKXJZDtqP06/MBj7vd
         EQoXCcvqr7tJ6XpU47udWaOchgB7Ew3uh3ebTI6wKAh/bpueUX6krwnaClWhnLUJa0KV
         d5/XZ2EyaSmc0M/aDDw1BDZW5HhRGhhjy8uvnp14iYATLhrcNWXv54JQEIn8P4YlmsJI
         U3jIE5khFrGOBRD1asB1SjveZXq31TGJuSktTWiw2FORFiDtqwHQCBcmJZCoYhWVWIgZ
         U9Rg==
X-Gm-Message-State: AO0yUKX0TA0GdlhWVwyLhuTt4un9iit5gkgc/+vhSYG6rRvAoWlZ7fMw
	iCX8TRts4L5+ACwvJ4y1LR78bCth8V/KeNPCNIw=
X-Google-Smtp-Source: AK7set9kOQylKWKlacMdfWre+g/tlAch5S3HwXhE9ZFuwPQcsHiQLMbNELVR68ZikhUa+vY5S08L48rd6Hh4nciFWZQ=
X-Received: by 2002:a05:651c:200f:b0:298:6a87:6c65 with SMTP id
 s15-20020a05651c200f00b002986a876c65mr2997479ljo.5.1678442941175; Fri, 10 Mar
 2023 02:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20230309203933.834098-1-f_l_k@t-online.de> <20230309203933.834098-6-f_l_k@t-online.de>
 <BIT9RR.SETAPS7EH7BI1@t-online.de>
In-Reply-To: <BIT9RR.SETAPS7EH7BI1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Mar 2023 11:08:49 +0100
Message-ID: <CANNYZj-zGbEEy=TGQYMP4o9zegi1SdUDT8F-Rw4SnQH8WtAnVg@mail.gmail.com>
Subject: Re: [oe-core][RFC][PATCH 6/6] webkitgtk: update 2.38.5 -> 2.39.91
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178324

Thanks for working on this. Webkit nowadays tracks submissions on
github, but you are not supposed to send there directly; instead
there's custom scripting in webkit's source tree:
https://webkit.org/contributing-code/

Alex

On Thu, 9 Mar 2023 at 21:42, Markus Volk <f_l_k@t-online.de> wrote:
>
> This will be required changes for the upcoming gnome release
>
> Am Do, 9. M=C3=A4r 2023 um 21:39:33 +0100 schrieb Markus Volk <f_l_k@t-on=
line.de>:
>
> - added PACKAGECONFIGs for av1 support, gamepad and sandboxing - cmake tr=
ies to find where bwrap and xdg-dbus-proxy are located on target and reads =
the path from ${STAGING_BINDIR_NATIVE}. This breaks reproducibility and run=
time. Fix by adding the needed paths manually. - ccache seems to be working=
 well now. Enable by default. It significantly improves buildtime on rebuil=
ds. - webkit 2.39.91 removed WebKitJavascriptResult in favor of using JSCVa=
lue directly in GTK4 API. Some files needed adjustment after that. I've cre=
ated a patch for it and marked it pending for now. Still need to find the p=
lace where this should be sent to. - webkitgtk can be built with both, gtk+=
3 and gtk4 but it cant be built with support for both at once. there are st=
ill some packages that require the gtk3 variant, nameably surf, gnome-onlin=
e-accounts and wxwidgets while ephiphany for example has a hard dependency =
on webkitgtk built with gtk4. This is why we need to provide recipes for bo=
th variants. If built with gtk+3 webkitgtk provides the 4.0 api, if built w=
ith gtk4 it'll provide the 6.0 api. The only conflicting file between those=
 two is the WebKitWebDriver binary. This was renamed for the gtk3 variant s=
o both variants can be installed into the same image. - update dependencies=
 - wpebackend-fdo: update Signed-off-by: Markus Volk <f_l_k@t-online.de> --=
- ...spection.cmake-prefix-variables-obta.patch | 0 ...ter-remove-of-WebKit=
JavascriptResult.patch | 53 ++++ .../reproducibility.patch | 0 .../webkit/w=
ebkitgtk-4_2.39.91.bb | 168 ++++++++++ ...44e17d258106617b0e6d783d073b188a2=
548.patch | 296 ------------------ ...bb461f040b90453bc4e100dcf967243ecd98.=
patch | 30 -- ...bkitgtk_2.38.5.bb =3D> webkitgtk_2.39.91.bb} | 70 +++-- ..=
.fdo_1.14.0.bb =3D> wpebackend-fdo_1.14.1.bb} | 2 +- 8 files changed, 258 i=
nsertions(+), 361 deletions(-) rename meta/recipes-sato/webkit/{webkitgtk =
=3D> files}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=
 (100%) create mode 100644 meta/recipes-sato/webkit/files/0001-fix-after-re=
move-of-WebKitJavascriptResult.patch rename meta/recipes-sato/webkit/{webki=
tgtk =3D> files}/reproducibility.patch (100%) create mode 100644 meta/recip=
es-sato/webkit/webkitgtk-4_2.39.91.bb delete mode 100644 meta/recipes-sato/=
webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch delete mode=
 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967=
243ecd98.patch rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> we=
bkitgtk_2.39.91.bb} (75%) rename meta/recipes-sato/webkit/{wpebackend-fdo_1=
.14.0.bb =3D> wpebackend-fdo_1.14.1.bb} (90%) diff --git a/meta/recipes-sat=
o/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obt=
a.patch b/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmak=
e-prefix-variables-obta.patch similarity index 100% rename from meta/recipe=
s-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variable=
s-obta.patch rename to meta/recipes-sato/webkit/files/0001-FindGObjectIntro=
spection.cmake-prefix-variables-obta.patch diff --git a/meta/recipes-sato/w=
ebkit/files/0001-fix-after-remove-of-WebKitJavascriptResult.patch b/meta/re=
cipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascriptResult.pat=
ch new file mode 100644 index 0000000000..d22d47c94a --- /dev/null +++ b/me=
ta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascriptResul=
t.patch @@ -0,0 +1,53 @@ +Upstream-Status: Pending + +--- a/Source/WebKit/U=
IProcess/API/glib/WebKitWebView.h.in 2023-03-09 16:12:15.019122873 +0100 ++=
++ b/Source/WebKit/UIProcess/API/glib/WebKitWebView.h.in 2023-03-09 16:14:5=
4.879735391 +0100 +@@ -36,7 +36,6 @@ + #include <@API_INCLUDE_PREFIX@/WebKi=
tFormSubmissionRequest.h> + #include <@API_INCLUDE_PREFIX@/WebKitHitTestRes=
ult.h> + #include <@API_INCLUDE_PREFIX@/WebKitInputMethodContext.h> +-#incl=
ude <@API_INCLUDE_PREFIX@/WebKitJavascriptResult.h> + #include <@API_INCLUD=
E_PREFIX@/WebKitNavigationAction.h> + #include <@API_INCLUDE_PREFIX@/WebKit=
Notification.h> + #include <@API_INCLUDE_PREFIX@/WebKitOptionMenu.h> +@@ -5=
8,6 +57,10 @@ + #include <@API_INCLUDE_PREFIX@/WebKitNetworkSession.h> + #e=
ndif + ++#if !ENABLE(2022_GLIB_API) ++#include <@API_INCLUDE_PREFIX@/WebKit=
JavascriptResult.h> ++#endif ++ + #if PLATFORM(GTK) + #if !ENABLE(2022_GLIB=
_API) + #include <JavaScriptCore/JSBase.h> +--- a/Source/WebKit/UIProcess/A=
PI/glib/WebKitAutocleanups.h.in 2023-03-09 16:24:31.886464831 +0100 ++++ b/=
Source/WebKit/UIProcess/API/glib/WebKitAutocleanups.h.in 2023-03-09 16:25:4=
1.333364986 +0100 +@@ -47,6 +47,7 @@ + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKi=
tHitTestResult, g_object_unref) + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitInpu=
tMethodContext, g_object_unref) + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitInst=
allMissingMediaPluginsPermissionRequest, g_object_unref) ++G_DEFINE_AUTOPTR=
_CLEANUP_FUNC (WebKitJavascriptResult, webkit_javascript_result_unref) + G_=
DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNavigationPolicyDecision, g_object_unref=
) + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitMimeInfo, webkit_mime_info_unref) =
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNotification, g_object_unref) +@@ -8=
7,7 +88,6 @@ + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitCredential, webkit_cred=
ential_free) + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitITPFirstParty, webkit_i=
tp_first_party_unref) + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitITPThirdParty,=
 webkit_itp_third_party_unref) +-G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitJavas=
criptResult, webkit_javascript_result_unref) + G_DEFINE_AUTOPTR_CLEANUP_FUN=
C (WebKitMemoryPressureSettings, webkit_memory_pressure_settings_free) + G_=
DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNavigationAction, webkit_navigation_acti=
on_free) + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNetworkProxySettings, webki=
t_network_proxy_settings_free) +--- a/Source/WebKit/UIProcess/API/glib/WebK=
itJavascriptResultPrivate.h 2023-03-09 16:33:19.420786155 +0100 ++++ b/Sour=
ce/WebKit/UIProcess/API/glib/WebKitJavascriptResultPrivate.h 2023-03-09 16:=
34:07.046094617 +0100 +@@ -20,8 +20,8 @@ + #pragma once + + #include <WebCo=
re/SerializedScriptValue.h> +-#include "WebKitJavascriptResult.h" + + #if !=
ENABLE(2022_GLIB_API) ++#include "WebKitJavascriptResult.h" + WebKitJavascr=
iptResult* webkitJavascriptResultCreate(WebCore::SerializedScriptValue&); +=
 #endif diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.pat=
ch b/meta/recipes-sato/webkit/files/reproducibility.patch similarity index =
100% rename from meta/recipes-sato/webkit/webkitgtk/reproducibility.patch r=
ename to meta/recipes-sato/webkit/files/reproducibility.patch diff --git a/=
meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb b/meta/recipes-sato/webkit/=
webkitgtk-4_2.39.91.bb new file mode 100644 index 0000000000..dde573064a --=
- /dev/null +++ b/meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb @@ -0,0 +=
1,168 @@ +SUMMARY =3D "WebKit web rendering engine for the GTK+ platform" +=
HOMEPAGE =3D "https://www.webkitgtk.org/" +BUGTRACKER =3D "https://bugs.web=
kit.org/" + +LICENSE =3D "BSD-2-Clause & LGPL-2.0-or-later" +LIC_FILES_CHKS=
UM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d84286dda=
758da57bd691 \ + file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf=
298c285f8bab0b12 \ + file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b=
64ae177b2494445b79d21 \ + file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778=
a33ef338abbaf8b8a7c36b6eec80 \ + " + +SRC_URI =3D "https://www.webkitgtk.or=
g/releases/webkitgtk-${PV}.tar.xz \ + file://0001-FindGObjectIntrospection.=
cmake-prefix-variables-obta.patch \ + file://reproducibility.patch \ + " +S=
RC_URI[sha256sum] =3D "92e8a6f599450529eb0bd552e4fc2d1f691831eb4d89caffb96f=
b581d2c836d3" + +S =3D "${WORKDIR}/webkitgtk-${PV}" + +inherit ccache cmake=
 pkgconfig gobject-introspection perlnative features_check upstream-version=
-is-even gi-docgen mime-xdg + +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEAT=
URES}" + +CVE_PRODUCT =3D "webkitgtk webkitgtk\+" + +DEPENDS +=3D " \ + atk=
 \ + cairo \ + gperf-native \ + gstreamer1.0 \ + gstreamer1.0-plugins-base =
\ + gstreamer1.0-plugins-bad \ + ${@bb.utils.contains('LICENSE_FLAGS', 'com=
mercial', 'gstreamer1.0-libav', '', d)} \ + gtk+3 \ + harfbuzz \ + jpeg \ +=
 libnotify \ + libsoup \ + libtasn1 \ + libwebp \ + libxslt \ + ruby-native=
 \ + unifdef-native \ + " + +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTR=
O_FEATURES', 'wayland x11 opengl', d)} \ + ${@bb.utils.contains('DISTRO_FEA=
TURES', 'x11 opengl', 'webgl opengl', '', d)} \ + ${@bb.utils.contains('DIS=
TRO_FEATURES', 'wayland opengl', 'webgl gles2', '', d)} \ + ${@bb.utils.con=
tains('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \ + enchant \ + lib=
secret \ + " + +PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-D=
ENABLE_WAYLAND_TARGET=3DOFF,wayland wayland-native libwpe wpebackend-fdo" +=
PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,virtua=
l/egl" +PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DE=
NABLE_BUBBLEWRAP_SANDBOX=3DOFF,bubblewrap-native libseccomp xdg-dbus-proxy-=
native,bubblewrap xdg-dbus-proxy" +PACKAGECONFIG[x11] =3D "-DENABLE_X11_TAR=
GET=3DON,-DENABLE_X11_TARGET=3DOFF,virtual/libx11 libxcomposite libxdamage =
libxrender libxt" +PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=
=3DOFF,libavif" +PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE=
_GAMEPAD=3DOFF,libmanette" +PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATIO=
N=3DON,-DENABLE_GEOLOCATION=3DOFF,geoclue" +PACKAGECONFIG[enchant] =3D "-DE=
NABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=3DOFF,enchant2" +PACKAGECONFIG[gl=
es2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual/libgles2" +PACKA=
GECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual/egl" =
+PACKAGECONFIG[opengl] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOF=
F,virtual/egl libepoxy" +PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON=
,-DUSE_LIBSECRET=3DOFF,libsecret" +PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBH=
YPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,libhyphen" +PACKAGECONFIG[woff2] =3D "-DUS=
E_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2" +PACKAGECONFIG[openjpeg] =3D "-DUSE_O=
PENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,openjpeg" +PACKAGECONFIG[reduce-size] =3D=
 "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BUILD_TYPE=3DRelease,," +PACKAGEC=
ONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms" +PACKAGECONFIG[jour=
nald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_LOG=3DOFF,systemd" =
+ +# webkitgtk is full of /usr/bin/env python, particular for generating do=
cs +do_configure[postfuncs] +=3D "setup_python_link" +setup_python_link() {=
 + if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then + ln -s `which python3=
` ${STAGING_BINDIR_NATIVE}/python + fi +} + +EXTRA_OECMAKE =3D " \ + -DENAB=
LE_2022_GLIB_API=3DOFF \ + -DPORT=3DGTK \ + -DUSE_GTK4=3DOFF \ + -DUSE_XDGM=
IME=3DON \ + -DBWRAP_EXECUTABLE=3D${bindir}/bwrap \ + -DDBUS_PROXY_EXECUTAB=
LE=3D${bindir}/xdg-dbus-proxy \ + ${@bb.utils.contains('GI_DATA_ENABLED', '=
True', '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \=
 + ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=
=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \ + -DENABLE_MINIBROWSER=3DON \=
 + -DPYTHON_EXECUTABLE=3D`which python3` \ + " + +# Javascript JIT is not s=
upported on ARC +EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF " +# By =
default 25-bit "medium" calls are used on ARC +# which is not enough for bi=
naries larger than 32 MiB +CFLAGS:append:arc =3D " -mlong-calls" +CXXFLAGS:=
append:arc =3D " -mlong-calls" + +# Needed for non-mesa graphics stacks whe=
n x11 is disabled +CXXFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
x11', '', '-DEGL_NO_X11=3D1', d)}" + +# Javascript JIT is not supported on =
powerpc +EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF " +EXTRA_OEC=
MAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF " + +# ARM JIT code does not=
 build on ARMv4/5/6 anymore +EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=
=3DOFF " +EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF " +EXTRA_OECM=
AKE:append:armv4 =3D " -DENABLE_JIT=3DOFF " + +EXTRA_OECMAKE:append:mipsarc=
h =3D " -DUSE_LD_GOLD=3DOFF " +EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_=
GOLD=3DOFF " + +# JIT and gold linker does not work on RISCV +EXTRA_OECMAKE=
:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOFF" +EXTRA_OECMAK=
E:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOFF" + +# JIT not=
 supported on MIPS either +EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=
=3DOFF -DENABLE_C_LOOP=3DON " + +# JIT not supported on X32 +# An attempt w=
as made to upstream JIT support for x32 in +# https://bugs.webkit.org/show_=
bug.cgi?id=3D100450, but this was closed as +# unresolved due to limited X3=
2 adoption. +EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF " + +SEC=
URITY_CFLAGS:remove:aarch64 =3D "-fpie" +SECURITY_CFLAGS:append:aarch64 =3D=
 " -fPIE" + +FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle" + =
+RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info" + +# http://erro=
rs.yoctoproject.org/Errors/Details/20370/ +ARM_INSTRUCTION_SET:armv4 =3D "a=
rm" +ARM_INSTRUCTION_SET:armv5 =3D "arm" +ARM_INSTRUCTION_SET:armv6 =3D "ar=
m" + +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474 +# https:/=
/bugs.webkit.org/show_bug.cgi?id=3D159880 +# JSC JIT can build on ARMv7 wit=
h -marm, but doesn't work on runtime. +# Upstream only tests regularly the =
JSC JIT on ARMv7 with Thumb2 (-mthumb). +ARM_INSTRUCTION_SET:armv7a =3D "th=
umb" +ARM_INSTRUCTION_SET:armv7r =3D "thumb" +ARM_INSTRUCTION_SET:armv7ve =
=3D "thumb" + +# introspection inside qemu-arm hangs forever on musl/arm bu=
ilds +# therefore disable GI_DATA +GI_DATA_ENABLED:libc-musl:armv7a =3D "Fa=
lse" +GI_DATA_ENABLED:libc-musl:armv7ve =3D "False" + +PACKAGE_PREPROCESS_F=
UNCS +=3D "src_package_preprocess" +src_package_preprocess () { + # Trim bu=
ild paths from comments in generated sources to ensure reproducibility + se=
d -i -e "s,${WORKDIR},,g" \ + ${B}/JavaScriptCore/DerivedSources/*.h \ + ${=
B}/JavaScriptCore/DerivedSources/yarr/*.h \ + ${B}/JavaScriptCore/PrivateHe=
aders/JavaScriptCore/*.h \ + ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \ +=
 ${B}/WebKitGTK/DerivedSources/webkit/*.h +} + +do_install:append() { + # w=
ebkitwebdriver conflicts between webkitgtk and webkitgtk-4 ... move + mv ${=
D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver-4 +} diff --git a=
/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a254=
8.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d07=
3b188a2548.patch deleted file mode 100644 index 32f92f7ff5..0000000000 --- =
a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a25=
48.patch +++ /dev/null @@ -1,296 +0,0 @@ -From 0d3344e17d258106617b0e6d783d=
073b188a2548 Mon Sep 17 00:00:00 2001 -From: Adrian Perez de Castro <aperez=
@igalia.com> -Date: Thu, 2 Jun 2022 11:19:06 +0300 -Subject: [PATCH] [ARM][=
NEON] FELightningNEON.cpp fails to build, NEON fast - path seems unused htt=
ps://bugs.webkit.org/show_bug.cgi?id=3D241182 - -Reviewed by NOBODY (OOPS!)=
. - -Move the NEON fast path for the SVG lighting filter effects into -FELi=
ghtingSoftwareApplier, and arrange to actually use them by -forwarding call=
s to applyPlatformGeneric() into applyPlatformNeon(). - -Some changes were =
needed to adapt platformApplyNeon() to the current -state of filters after =
r286140. This was not detected because the code -bitrotted due to it being =
guarded with CPU(ARM_TRADITIONAL), which does -not get used much these days=
: CPU(ARM_THUMB2) is more common. It should -be possible to use the NEON fa=
st paths also in Thumb mode, but that is -left for a follow-up fix. - -* So=
urce/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp: -(WebCor=
e::FELightingSoftwareApplier::platformApplyNeonWorker): -(WebCore::FELighti=
ngSoftwareApplier::getPowerCoefficients): -(WebCore::FELighting::platformAp=
plyNeonWorker): Deleted. -(WebCore::FELighting::getPowerCoefficients): Dele=
ted. -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h: =
-(WebCore::FELightingSoftwareApplier::applyPlatformNeon): -(WebCore::FELigh=
ting::platformApplyNeon): Deleted. -* Source/WebCore/platform/graphics/filt=
ers/DistantLightSource.h: -* Source/WebCore/platform/graphics/filters/FELig=
hting.h: -* Source/WebCore/platform/graphics/filters/PointLightSource.h: -*=
 Source/WebCore/platform/graphics/filters/SpotLightSource.h: -* Source/WebC=
ore/platform/graphics/filters/software/FELightingSoftwareApplier.h: ---- -U=
pstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233] -Sig=
ned-off-by: Khem Raj <raj.khem@gmail.com> - - .../cpu/arm/filters/FELightin=
gNEON.cpp | 4 +- - .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++=
++++---------- - .../graphics/filters/DistantLightSource.h | 4 ++ - .../pla=
tform/graphics/filters/FELighting.h | 7 --- - .../graphics/filters/PointLig=
htSource.h | 4 ++ - .../graphics/filters/SpotLightSource.h | 4 ++ - .../sof=
tware/FELightingSoftwareApplier.h | 16 ++++++ - 7 files changed, 57 inserti=
ons(+), 36 deletions(-) - ---- a/Source/WebCore/platform/graphics/cpu/arm/f=
ilters/FELightingNEON.cpp -+++ b/Source/WebCore/platform/graphics/cpu/arm/f=
ilters/FELightingNEON.cpp -@@ -49,7 +49,7 @@ short* feLightingConstantsForN=
eon() - return s_FELightingConstantsForNeon; - } - --void FELighting::platf=
ormApplyNeonWorker(FELightingPaintingDataForNeon* parameters) -+void FELigh=
tingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon*=
 parameters) - { - neonDrawLighting(parameters); - } -@@ -464,7 +464,7 @@ T=
OSTRING(neonDrawLighting) ":" NL - "b .lightStrengthCalculated" NL - ); // =
NOLINT - --int FELighting::getPowerCoefficients(float exponent) -+int FELig=
htingSoftwareApplier::getPowerCoefficients(float exponent) - { - // Calling=
 a powf function from the assembly code would require to save - // and relo=
ad a lot of NEON registers. Since the base is in range [0..1] ---- a/Source=
/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h -+++ b/Source/W=
ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h -@@ -24,14 +24,15=
 @@ - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE=
. - */ - --#ifndef FELightingNEON_h --#define FELightingNEON_h -+#pragma on=
ce - - #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE=
) - --#include "FELighting.h" -+#include "FELightingSoftwareApplier.h" -+#i=
nclude "ImageBuffer.h" - #include "PointLightSource.h" - #include "SpotLigh=
tSource.h" -+#include <wtf/ObjectIdentifier.h> - #include <wtf/ParallelJobs=
.h> - - namespace WebCore { -@@ -93,14 +94,14 @@ extern "C" { - void neonDr=
awLighting(FELightingPaintingDataForNeon*); - } - --inline void FELighting:=
:platformApplyNeon(const LightingData& data, const LightSource::PaintingDat=
a& paintingData) -+inline void FELightingSoftwareApplier::applyPlatformNeon=
(const FELightingSoftwareApplier::LightingData& data, const LightSource::Pa=
intingData& paintingData) - { -- alignas(16) FELightingFloatArgumentsForNeo=
n floatArguments; -- FELightingPaintingDataForNeon neonData =3D { -+ WebCor=
e::FELightingFloatArgumentsForNeon alignas(16) floatArguments; -+ WebCore::=
FELightingPaintingDataForNeon neonData =3D { - data.pixels->data(), - 1, --=
 data.widthDecreasedByOne - 1, -- data.heightDecreasedByOne - 1, -+ data.wi=
dth - 2, -+ data.height - 2, - 0, - 0, - 0, -@@ -111,23 +112,23 @@ inline v=
oid FELighting::platformApplyNeo - // Set light source arguments. - floatAr=
guments.constOne =3D 1; - -- auto color =3D m_lightingColor.toColorTypeLoss=
y<SRGBA<uint8_t>>().resolved(); -+ auto color =3D data.lightingColor.toColo=
rTypeLossy<SRGBA<uint8_t>>().resolved(); - - floatArguments.colorRed =3D co=
lor.red; - floatArguments.colorGreen =3D color.green; - floatArguments.colo=
rBlue =3D color.blue; - floatArguments.padding4 =3D 0; - -- if (m_lightSour=
ce->type() =3D=3D LS_POINT) { -+ if (data.lightSource->type() =3D=3D LS_POI=
NT) { - neonData.flags |=3D FLAG_POINT_LIGHT; -- PointLightSource& pointLig=
htSource =3D static_cast<PointLightSource&>(m_lightSource.get()); -+ const =
auto& pointLightSource =3D *static_cast<const PointLightSource*>(data.light=
Source); - floatArguments.lightX =3D pointLightSource.position().x(); - flo=
atArguments.lightY =3D pointLightSource.position().y(); - floatArguments.li=
ghtZ =3D pointLightSource.position().z(); - floatArguments.padding2 =3D 0; =
-- } else if (m_lightSource->type() =3D=3D LS_SPOT) { -+ } else if (data.li=
ghtSource->type() =3D=3D LS_SPOT) { - neonData.flags |=3D FLAG_SPOT_LIGHT; =
-- SpotLightSource& spotLightSource =3D static_cast<SpotLightSource&>(m_lig=
htSource.get()); -+ const auto& spotLightSource =3D *static_cast<const Spot=
LightSource*>(data.lightSource); - floatArguments.lightX =3D spotLightSourc=
e.position().x(); - floatArguments.lightY =3D spotLightSource.position().y(=
); - floatArguments.lightZ =3D spotLightSource.position().z(); -@@ -145,7 +=
146,7 @@ inline void FELighting::platformApplyNeo - if (spotLightSource.spe=
cularExponent() =3D=3D 1) - neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1; - =
} else { -- ASSERT(m_lightSource->type() =3D=3D LS_DISTANT); -+ ASSERT(data=
.lightSource->type() =3D=3D LS_DISTANT); - floatArguments.lightX =3D painti=
ngData.initialLightingData.lightVector.x(); - floatArguments.lightY =3D pai=
ntingData.initialLightingData.lightVector.y(); - floatArguments.lightZ =3D =
paintingData.initialLightingData.lightVector.z(); -@@ -155,38 +156,39 @@ in=
line void FELighting::platformApplyNeo - // Set lighting arguments. - float=
Arguments.surfaceScale =3D data.surfaceScale; - floatArguments.minusSurface=
ScaleDividedByFour =3D -data.surfaceScale / 4; -- if (m_lightingType =3D=3D=
 FELighting::DiffuseLighting) -- floatArguments.diffuseConstant =3D m_diffu=
seConstant; -+ if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLigh=
ting) -+ floatArguments.diffuseConstant =3D data.diffuseConstant; - else { =
- neonData.flags |=3D FLAG_SPECULAR_LIGHT; -- floatArguments.diffuseConstan=
t =3D m_specularConstant; -- neonData.specularExponent =3D getPowerCoeffici=
ents(m_specularExponent); -- if (m_specularExponent =3D=3D 1) -+ floatArgum=
ents.diffuseConstant =3D data.specularConstant; -+ neonData.specularExponen=
t =3D getPowerCoefficients(data.specularExponent); -+ if (data.specularExpo=
nent =3D=3D 1) - neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1; - } - if =
(floatArguments.diffuseConstant =3D=3D 1) - neonData.flags |=3D FLAG_DIFFUS=
E_CONST_IS_1; - -- int optimalThreadNumber =3D ((data.widthDecreasedByOne -=
 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension; -+ static =
constexpr int minimalRectDimension =3D 100 * 100; // Empirical data limit f=
or parallel jobs -+ int optimalThreadNumber =3D ((data.width - 2) * (data.h=
eight - 2)) / minimalRectDimension; - if (optimalThreadNumber > 1) { - // I=
nitialize parallel jobs -- ParallelJobs<FELightingPaintingDataForNeon> para=
llelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber=
); -+ ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingS=
oftwareApplier::platformApplyNeonWorker, optimalThreadNumber); - - // Fill =
the parameter array - int job =3D parallelJobs.numberOfJobs(); - if (job > =
1) { - int yStart =3D 1; -- int yStep =3D (data.heightDecreasedByOne - 1) /=
 job; -+ int yStep =3D (data.height - 2) / job; - for (--job; job >=3D 0; -=
-job) { - FELightingPaintingDataForNeon& params =3D parallelJobs.parameter(=
job); - params =3D neonData; - params.yStart =3D yStart; -- params.pixels +=
=3D (yStart - 1) * (data.widthDecreasedByOne + 1) * 4; -+ params.pixels +=
=3D (yStart - 1) * data.width * 4; - if (job > 0) { - params.absoluteHeight=
 =3D yStep; - yStart +=3D yStep; - } else -- params.absoluteHeight =3D data=
.heightDecreasedByOne - yStart; -+ params.absoluteHeight =3D (data.height -=
 1) - yStart; - } - parallelJobs.execute(); - return; -@@ -199,5 +201,3 @@ =
inline void FELighting::platformApplyNeo - } // namespace WebCore - - #endi=
f // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE) -- --#endif // FELightingNEO=
N_h ---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h -+=
++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h -@@ -25,=
6 +25,10 @@ - #include "LightSource.h" - #include <wtf/Ref.h> - -+namespace=
 WTF { -+class TextStream; -+} // namespace WTF -+ - namespace WebCore { - =
- class DistantLightSource : public LightSource { ---- a/Source/WebCore/pla=
tform/graphics/filters/FELighting.h -+++ b/Source/WebCore/platform/graphics=
/filters/FELighting.h -@@ -35,8 +35,6 @@ - - namespace WebCore { - --struct=
 FELightingPaintingDataForNeon; -- - class FELighting : public FilterEffect=
 { - public: - const Color& lightingColor() const { return m_lightingColor;=
 } -@@ -67,11 +65,6 @@ protected: - - std::unique_ptr<FilterEffectApplier> =
createSoftwareApplier() const override; - --#if CPU(ARM_NEON) && CPU(ARM_TR=
ADITIONAL) && COMPILER(GCC_COMPATIBLE) -- static int getPowerCoefficients(f=
loat exponent); -- inline void platformApplyNeon(const LightingData&, const=
 LightSource::PaintingData&); --#endif -- - Color m_lightingColor; - float =
m_surfaceScale; - float m_diffuseConstant; ---- a/Source/WebCore/platform/g=
raphics/filters/PointLightSource.h -+++ b/Source/WebCore/platform/graphics/=
filters/PointLightSource.h -@@ -26,6 +26,10 @@ - #include "LightSource.h" -=
 #include <wtf/Ref.h> - -+namespace WTF { -+class TextStream; -+} // namesp=
ace WTF -+ - namespace WebCore { - - class PointLightSource : public LightS=
ource { ---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h -=
+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h -@@ -26,6 =
+26,10 @@ - #include "LightSource.h" - #include <wtf/Ref.h> - -+namespace W=
TF { -+class TextStream; -+} // namespace WTF -+ - namespace WebCore { - - =
class SpotLightSource : public LightSource { ---- a/Source/WebCore/platform=
/graphics/filters/software/FELightingSoftwareApplier.h -+++ b/Source/WebCor=
e/platform/graphics/filters/software/FELightingSoftwareApplier.h -@@ -36,6 =
+36,7 @@ - namespace WebCore { - - class FELighting; -+struct FELightingPai=
ntingDataForNeon; - - class FELightingSoftwareApplier final : public Filter=
EffectConcreteApplier<FELighting> { - WTF_MAKE_FAST_ALLOCATED; -@@ -132,8 +=
133,23 @@ private: - - static void applyPlatformGenericPaint(const Lighting=
Data&, const LightSource::PaintingData&, int startY, int endY); - static vo=
id applyPlatformGenericWorker(ApplyParameters*); -+ -+#if CPU(ARM_NEON) && =
CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE) -+ static int getPowerCoef=
ficients(float exponent); -+ static void platformApplyNeonWorker(FELighting=
PaintingDataForNeon*); -+ inline static void applyPlatformNeon(const Lighti=
ngData&, const LightSource::PaintingData&); -+ -+ inline static void applyP=
latformGeneric(const LightingData& data, const LightSource::PaintingData& p=
aintingData) -+ { -+ applyPlatformNeon(data, paintingData); -+ } -+#else - =
static void applyPlatformGeneric(const LightingData&, const LightSource::Pa=
intingData&); -+#endif -+ - static void applyPlatform(const LightingData&);=
 - }; - - } // namespace WebCore -+ -+#include "FELightingNEON.h" diff --gi=
t a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243e=
cd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100d=
cf967243ecd98.patch deleted file mode 100644 index 1ff9dcea7e..0000000000 -=
-- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243=
ecd98.patch +++ /dev/null @@ -1,30 +0,0 @@ -From d318bb461f040b90453bc4e100=
dcf967243ecd98 Mon Sep 17 00:00:00 2001 -From: Michael Catanzaro <mcatanzar=
o@redhat.com> -Date: Mon, 16 Jan 2023 16:55:26 -0800 -Subject: [PATCH] WebK=
itGTK 2.39.4 does not build due to missing #include in - ANGLE https://bugs=
.webkit.org/show_bug.cgi?id=3D250689 - -Unreviewed build fix. - -* Source/T=
hirdParty/ANGLE/include/GLSLANG/ShaderVars.h: - -Canonical link: https://co=
mmits.webkit.org/258968@main - -Upstream-Status: Backport [https://bugs.web=
kit.org/show_bug.cgi?id=3D250689] -Signed-off-by: Khem Raj <raj.khem@gmail.=
com> ---- - Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 + - 1 =
file changed, 1 insertion(+) - -diff --git a/Source/ThirdParty/ANGLE/includ=
e/GLSLANG/ShaderVars.h b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars=
.h -index 94cb93e01fc0..ec7bda372f30 100644 ---- a/Source/ThirdParty/ANGLE/=
include/GLSLANG/ShaderVars.h -+++ b/Source/ThirdParty/ANGLE/include/GLSLANG=
/ShaderVars.h -@@ -12,6 +12,7 @@ - - #include <algorithm> - #include <array=
> -+#include <cstdint> - #include <string> - #include <vector> - diff --git=
 a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/=
webkitgtk_2.39.91.bb similarity index 75% rename from meta/recipes-sato/web=
kit/webkitgtk_2.38.5.bb rename to meta/recipes-sato/webkit/webkitgtk_2.39.9=
1.bb index e52920883a..30ed0be743 100644 --- a/meta/recipes-sato/webkit/web=
kitgtk_2.38.5.bb +++ b/meta/recipes-sato/webkit/webkitgtk_2.39.91.bb @@ -12=
,62 +12,63 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPYING.LI=
B;md5=3Dd0c6d6397a5d842 SRC_URI =3D "https://www.webkitgtk.org/releases/${B=
PN}-${PV}.tar.xz \ file://0001-FindGObjectIntrospection.cmake-prefix-variab=
les-obta.patch \ file://reproducibility.patch \ - file://0d3344e17d25810661=
7b0e6d783d073b188a2548.patch \ - file://d318bb461f040b90453bc4e100dcf967243=
ecd98.patch \ + file://0001-fix-after-remove-of-WebKitJavascriptResult.patc=
h \ " -SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389=
bb08aee08c5b0bb0c1a7" +SRC_URI[sha256sum] =3D "92e8a6f599450529eb0bd552e4fc=
2d1f691831eb4d89caffb96fb581d2c836d3" -inherit cmake pkgconfig gobject-intr=
ospection perlnative features_check upstream-version-is-even gi-docgen +inh=
erit cmake ccache pkgconfig gobject-introspection perlnative features_check=
 upstream-version-is-even gi-docgen mime-xdg ANY_OF_DISTRO_FEATURES =3D "${=
GTK3DISTROFEATURES}" -REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('D=
ISTRO_FEATURES', 'wayland', 'opengl', '', d)}" +REQUIRED_DISTRO_FEATURES =
=3D "opengl" CVE_PRODUCT =3D "webkitgtk webkitgtk\+" DEPENDS +=3D " \ - rub=
y-native \ - gperf-native \ + atk \ cairo \ + gperf-native \ + gstreamer1.0=
 \ + gstreamer1.0-plugins-base \ + gstreamer1.0-plugins-bad \ + ${@bb.utils=
.contains('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \ ha=
rfbuzz \ jpeg \ - atk \ + libnotify \ + libsoup \ + libtasn1 \ libwebp \ - =
gtk+3 \ libxslt \ - libtasn1 \ - libnotify \ - gstreamer1.0 \ - gstreamer1.=
0-plugins-base \ + ruby-native \ + unifdef-native \ " -PACKAGECONFIG_SOUP ?=
=3D "soup3" -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'sy=
stemd wayland x11', d)} \ +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_=
FEATURES', 'wayland x11 opengl', d)} \ ${@bb.utils.contains('DISTRO_FEATURE=
S', 'x11 opengl', 'webgl opengl', '', d)} \ - ${@bb.utils.contains('DISTRO_=
FEATURES', 'x11', '', 'webgl gles2', d)} \ - ${@bb.utils.contains('DISTRO_F=
EATURES', 'opengl', 'opengl-or-es', '', d)} \ + ${@bb.utils.contains('DISTR=
O_FEATURES', 'wayland opengl', 'webgl gles2', '', d)} \ + ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \ + gtk4 \ enchant \ =
libsecret \ - ${PACKAGECONFIG_SOUP} \ " -PACKAGECONFIG[wayland] =3D "-DENAB=
LE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland libwpe wpeback=
end-fdo wayland-native" -PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-=
DUSE_ANGLE_WEBGL=3DOFF" +PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGE=
T=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland wayland-native libwpe wpebacke=
nd-fdo" +PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DO=
FF,virtual/egl" +PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=
=3DON,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,bubblewrap-native libseccomp xdg-db=
us-proxy-native,bubblewrap xdg-dbus-proxy" PACKAGECONFIG[x11] =3D "-DENABLE=
_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF,virtual/libx11 libxcomposite lib=
xdamage libxrender libxt" +PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUS=
E_AVIF=3DOFF,libavif" +PACKAGECONFIG[gtk4] =3D "-DUSE_GTK4=3DON,-DUSE_GTK4=
=3DOFF,gtk4" +PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GA=
MEPAD=3DOFF,libmanette" PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3D=
ON,-DENABLE_GEOLOCATION=3DOFF,geoclue" PACKAGECONFIG[enchant] =3D "-DENABLE=
_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=3DOFF,enchant2" PACKAGECONFIG[gles2] =
=3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual/libgles2" PACKAGECONF=
IG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual/egl" -PACKA=
GECONFIG[opengl] =3D "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GRAPHICS_C=
ONTEXT_GL=3DOFF,virtual/egl" -PACKAGECONFIG[opengl-or-es] =3D "-DUSE_OPENGL=
_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOFF" +PACKAGECONFIG[opengl] =3D "-DUSE_OPE=
NGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOFF,virtual/egl libepoxy" PACKAGECONFIG=
[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF,libsecret" PACK=
AGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,libhyp=
hen" PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2" PA=
CKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,openjpe=
g" -PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,syst=
emd" PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAK=
E_BUILD_TYPE=3DRelease,," PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LC=
MS=3DOFF,lcms" -PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOF=
F,libsoup-2.4,,,soup3" -PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2" PACKAG=
ECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_LOG=3DO=
FF,systemd" # webkitgtk is full of /usr/bin/env python, particular for gene=
rating docs @@ -79,13 +80,15 @@ setup_python_link() { } EXTRA_OECMAKE =3D "=
 \ + -DENABLE_2022_GLIB_API=3DON \ -DPORT=3DGTK \ + -DUSE_XDGMIME=3DON \ + =
-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \ + -DDBUS_PROXY_EXECUTABLE=3D${bindir=
}/xdg-dbus-proxy \ ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABL=
E_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ ${@bb.utils.co=
ntains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE=
_DOCUMENTATION=3DOFF', d)} \ -DENABLE_MINIBROWSER=3DON \ -DPYTHON_EXECUTABL=
E=3D`which python3` \ - -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \ - -DENABLE_GAME=
PAD=3DOFF \ " # Javascript JIT is not supported on ARC @@ -126,7 +129,7 @@ =
EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF " SECURITY_CFLAGS:rem=
ove:aarch64 =3D "-fpie" SECURITY_CFLAGS:append:aarch64 =3D " -fPIE" -FILES:=
${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedb=
undle.so" +FILES:${PN} +=3D "${libdir}/webkitgtk-6.*/injected-bundle" RRECO=
MMENDS:${PN} +=3D "ca-certificates shared-mime-info" @@ -148,9 +151,6 @@ AR=
M_INSTRUCTION_SET:armv7ve =3D "thumb" GI_DATA_ENABLED:libc-musl:armv7a =3D =
"False" GI_DATA_ENABLED:libc-musl:armv7ve =3D "False" -# Can't be built wit=
h ccache -CCACHE_DISABLE =3D "1" - PACKAGE_PREPROCESS_FUNCS +=3D "src_packa=
ge_preprocess" src_package_preprocess () { # Trim build paths from comments=
 in generated sources to ensure reproducibility @@ -158,8 +158,10 @@ src_pa=
ckage_preprocess () { ${B}/JavaScriptCore/DerivedSources/*.h \ ${B}/JavaScr=
iptCore/DerivedSources/yarr/*.h \ ${B}/JavaScriptCore/PrivateHeaders/JavaSc=
riptCore/*.h \ - ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \ - ${B}/WebK=
it2Gtk/DerivedSources/webkit2/*.h - + ${B}/WebKitGTK/DerivedSources/webkit/=
*.cpp \ + ${B}/WebKitGTK/DerivedSources/webkit/*.h } +do_install:append() {=
 + cp -rf ${B}/JavaScriptCore/Headers/JavaScriptCore ${D}${includedir} +} d=
iff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recipe=
s-sato/webkit/wpebackend-fdo_1.14.1.bb similarity index 90% rename from met=
a/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb rename to meta/recipes-sato/=
webkit/wpebackend-fdo_1.14.1.bb index 708201043b..9f2ea0b7de 100644 --- a/m=
eta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb +++ b/meta/recipes-sato/we=
bkit/wpebackend-fdo_1.14.1.bb @@ -13,7 +13,7 @@ inherit meson features_chec=
k pkgconfig REQUIRED_DISTRO_FEATURES =3D "opengl" SRC_URI =3D "https://wpew=
ebkit.org/releases/${BPN}-${PV}.tar.xz" -SRC_URI[sha256sum] =3D "e75b0cb2c7=
145448416e8696013d8883f675c66c11ed750e06865efec5809155" +SRC_URI[sha256sum]=
 =3D "01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50" # E=
specially helps compiling with clang which enable this as error when # usin=
g c++11
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178270): https://lists.openembedded.org/g/openembedde=
d-core/message/178270
> Mute This Topic: https://lists.openembedded.org/mt/97505740/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

