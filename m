Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B772C5DF62
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.3926.1649487956013629452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 00:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O2HWpWG1;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id t25so18401565lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMShBWvuHBWWEfgvQ442AcugvbRBf/J/QXjJ4FJaJS8=;
        b=O2HWpWG1XkjLMO7ddw4IfbD2xk0NzOX3Um+hAiQWJyh6MMEBsZrkyDFbjCahTQ3OAP
         xrFrU4fd4QOhEOmc0JY2FlWBpqlb76ISwcnPWKf3fOr3O6z8fHhz2CMY+aAr06kIMMMr
         iE/7XdTU4KNY3OJjvLib4kV7yceKu8uoM8PcW8Ef3wHxGMaK7UvzFDJPnibZC1AOdT1o
         XnMBOyailqx9bcjYgbDuXp208iG8aApInOJ42RCiDFuxwjq414atPLDCZVINEgUODnke
         HdrXHX5kMac6yScmmP6i8j17qlNfXYVy2Cnyalky2fDbL+2tEl4PxOzs6tMUcG6d59jm
         RkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMShBWvuHBWWEfgvQ442AcugvbRBf/J/QXjJ4FJaJS8=;
        b=HxCQo5IsrK2aDT7jMWlKPOYNWZGg1AszGr9n2xWAjfL/QGr7oHxMVkvIfPv18Vn1sc
         PmVaThUNMPGHWwX71IDw/L5RkPYfQLBZANvZCsvWTlstSZR93tjg6LAz3h34IuxnUk+2
         vPjlu8AIz+ryVqB3UlWH+T7A8zPXdE8v4wY0AjVVt3MQUlz9Z7Sgt08aKH1KXiTHroCz
         FXO0EJGqHOihKRdjsZ9B4kgDIGvMybqZ9fKPkVk4gNZWPbugcZnkqzfzKmGlT62juRXK
         cjlq+Pl3fijMq91JzqdqCnUPoZCZxVXm52qFST1hYNoSEE9MvlEPEzT+VYATV4KdJPxz
         fS4g==
X-Gm-Message-State: AOAM533R8EBvgBGoIXZ+wDFUBMAvVbdprFDUITEBADZhFwcexePtQzTF
	Y9Z49eI9gXiGiRlRnfAaCqdB7seV3N4zbKm9VVQ=
X-Google-Smtp-Source: 
 ABdhPJxy4JVK3kF3ifcPcRfOlFjcAipugKfK8aUR9pO1/8S5OztFHs3VSXoGLxSgF4aOAvYaAV+pbK7K1JltYZGo+E0=
X-Received: by 2002:a19:651d:0:b0:44a:b88a:b0b1 with SMTP id
 z29-20020a19651d000000b0044ab88ab0b1mr15515178lfb.380.1649487954028; Sat, 09
 Apr 2022 00:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220409063325.3252179-1-raj.khem@gmail.com>
In-Reply-To: <20220409063325.3252179-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Apr 2022 09:05:43 +0200
Message-ID: 
 <CANNYZj98epqX4pQaW20Gu2xOUMiJ_sC8mpEOCX8He--JSYprWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Add missing header locale.h
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008fac8105dc335757"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164186

--0000000000008fac8105dc335757
Content-Type: text/plain; charset="UTF-8"

Can you submit upstream please?

Alex

On Sat 9. Apr 2022 at 8.33, Khem Raj <raj.khem@gmail.com> wrote:

> This fixes build issues seen on mips, but problem is generic
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../webkitgtk/add_missing_include.patch       | 19 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.36.0.bb  |  1 +
>  2 files changed, 20 insertions(+)
>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
> b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
> new file mode 100644
> index 00000000000..e60c317a26f
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
> @@ -0,0 +1,19 @@
> +Include locale.h for LC_MESSAGE definition
> +
> +This fixes build error
> +Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp:115:51:
> error: use of undeclared identifier 'LC_MESSAGES'
> +            return g_variant_new_string(setlocale(LC_MESSAGES, nullptr));
> +                                                  ^
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
> ++++ b/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
> +@@ -30,6 +30,7 @@
> + #include "FrameView.h"
> + #include "Page.h"
> + #include <glib/gi18n-lib.h>
> ++#include <locale.h>
> +
> + namespace WebCore {
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
> index 09d44933706..db8a565511a 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
> @@ -15,6 +15,7 @@ SRC_URI = "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-Fix-build-without-opengl-or-es.patch \
>             file://reproducibility.patch \
>
> file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
> +           file://add_missing_include.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164185):
> https://lists.openembedded.org/g/openembedded-core/message/164185
> Mute This Topic: https://lists.openembedded.org/mt/90352028/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008fac8105dc335757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you submit upstream please?</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sat 9. Apr 2022 at 8.33, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">This fixes build issues seen on mips, but problem i=
s generic<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../webkitgtk/add_missing_include.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
9 +++++++++++++++++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.0.bb</a>=C2=A0 |=C2=A0 1 +=
<br>
=C2=A02 files changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/add_missing_inc=
lude.patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch b=
/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch<br>
new file mode 100644<br>
index 00000000000..e60c317a26f<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch<br>
@@ -0,0 +1,19 @@<br>
+Include locale.h for LC_MESSAGE definition<br>
+<br>
+This fixes build error<br>
+Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp:115:51: erro=
r: use of undeclared identifier &#39;LC_MESSAGES&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_variant_new_string(setl=
ocale(LC_MESSAGES, nullptr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+--- a/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp<br>
++++ b/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp<br>
+@@ -30,6 +30,7 @@<br>
+ #include &quot;FrameView.h&quot;<br>
+ #include &quot;Page.h&quot;<br>
+ #include &lt;glib/gi18n-lib.h&gt;<br>
++#include &lt;locale.h&gt;<br>
+ <br>
+ namespace WebCore {<br>
+ <br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.0.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.0.bb</a> b/meta/recip=
es-sato/webkit/<a href=3D"http://webkitgtk_2.36.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">webkitgtk_2.36.0.bb</a><br>
index 09d44933706..db8a565511a 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.0.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.0.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/re=
leases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-without-ope=
ngl-or-es.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reproducibility.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-When-building-introsp=
ection-files-do-not-quote-CFLAG.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add_missing_include.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b877cca1f105235f5dd57c7ac2b2c2be3c6b691f=
f444f93925c7254cf156c64d&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164185): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164185" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164185</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90352028/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90352028/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008fac8105dc335757--

