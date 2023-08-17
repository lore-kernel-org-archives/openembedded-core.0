Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254CFC3DA62
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 17:17:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.498.1692292623314989758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 10:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fo1cM0Vi;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fe5c0e587eso1156645e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692292621; x=1692897421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKXx2le/4TI0t7+75CWe/1wSww/hEoIm0Jm+7yM4Vbo=;
        b=fo1cM0Vi/Wat7jMAfa9cYGfXaYKyzZD6HQGzJloINFI4mJ+U71WXxb0WlVJtNk2Ejd
         8MhkDgSzwDz94KgdRd8Kql/lh7EX9C31wk+uDCr2+teAspNgtNbNx0rf5BWQ9WslzPP6
         TwEqWeOakLWNkUbpw3gMlBFGDiTZnVXsPFVcYd5TPZHAeX52jJsj8vutGevtIYTpue4v
         XyIIuEcY9zjJztfRE1xiCMFr6xdPoSIzahulkwZawvdcI991RfHaoWh/ee/Pqyl29uFe
         do//oMe7wx3mT/EpIRvf7wdH5RGK49+OAH0KU/F0IkX7aLAcwPJLfV/N38am+FzGgeYm
         3QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692292621; x=1692897421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKXx2le/4TI0t7+75CWe/1wSww/hEoIm0Jm+7yM4Vbo=;
        b=JzkT2shR8CQ6oGYC9Jg0qumTo2LYHBuXIN1ylD/gc25nSqKNfM2zuGkF9+d4uWk8zY
         XCiaik0rYMoWV2/tv3pZfM67pelxE+K1oRM5TOcM8BFJml+fiUWRe1w4W7Yk8aj6rjvW
         rurenXax1i+JmP3KF3rr2OoYtNocLwDRB1Fg3U3QJr7ccuuhmR+183KM8ryWnZvXbfzm
         6V8lESF3qqI2vmrwLK93ZPNdoyAfoEwup/Q3rGYP2jYy2XpsZ/odm+Uyb8BI39tqBSRK
         pYwcB53DlpibcsbFaIGlNAqLa1nO7XMMjnfEW0ZcVbjVCO2rEKf+/T/Q7WHKHYsh9I5U
         8fGw==
X-Gm-Message-State: AOJu0YyCt1j5UEOWBo95QVc7yJUbN0N3zPtYrBjPE+H8XXsJXqA+4p95
	e7pdaqMl6aqYOs9GV294D899iH43s0glHCXvLqs=
X-Google-Smtp-Source: AGHT+IFZ6bBQ9TteRJOaExdX3cvUVbqaoVhj/iUTKowDdAUcMD3vPv0sUUaG15yfWuBRTsrgjIX+wp5nZY5nYp736Js=
X-Received: by 2002:a5d:51ca:0:b0:317:5ddd:837b with SMTP id
 n10-20020a5d51ca000000b003175ddd837bmr113111wrv.7.1692292621293; Thu, 17 Aug
 2023 10:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <177C20A58031C07D.12117@lists.openembedded.org>
In-Reply-To: <177C20A58031C07D.12117@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Aug 2023 19:16:40 +0200
Message-ID: <CA+chaQcybDA0JX53-RSKLnyo+AN9QhoJ5FLXq=Un4c48tTDDZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cross-localedef-native: fix build on hosts with
 older glibc
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, khem.raj@gmail.com
Content-Type: multipart/alternative; boundary="0000000000008c5c4b060321947e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 17:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186329

--0000000000008c5c4b060321947e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem already merged this, so I'll send v2 with just SRCREV bump shortly.

On Thu, Aug 17, 2023 at 11:10=E2=80=AFAM Martin Jansa via lists.openembedde=
d.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Older glibc on host might be missing __glibc_has_attribute added in
> glibc-2.34 with:
>
>
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc/sys/cdefs=
.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb642bf4a9456=
45532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=3D7dd4=
16491e080456fc7742d884c520526509413e
>
> Fixes:
> In file included from ../git/localedef/include/programs/xmalloc.h:21,
>                  from glibc/locale/programs/localedef.h:124,
>                  from glibc/locale/programs/localedef.c:36:
> ../git/localedef/include/sys/cdefs.h:85:51: error: missing binary operato=
r
> before token "("
>    85 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__cold__)
>       |                                                   ^
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../glibc/cross-localedef-native_2.38.bb      |  1 +
>  ...cdefs.h-define-__glibc_has_attribute.patch | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has_a=
ttribute.patch
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
> b/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
> index e7261a644b..673008c57a 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             \
>
> file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
>
> file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
> +
>  file://0003-localedef-cdefs.h-define-__glibc_has_attribute.patch;patchdi=
r=3Dlocaledef
> \
>             \
>
> file://0010-eglibc-Cross-building-and-testing-instructions.patch \
>             file://0011-eglibc-Help-bootstrap-cross-toolchain.patch \
> diff --git
> a/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has=
_attribute.patch
> b/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has=
_attribute.patch
> new file mode 100644
> index 0000000000..d34651e275
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_has=
_attribute.patch
> @@ -0,0 +1,51 @@
> +From a90ba625410f8b49205adbe03652bc2fd0c35cec Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Thu, 17 Aug 2023 01:23:59 +0200
> +Subject: [PATCH] cdefs.h: define __glibc_has_attribute
> +
> +Older glibc on host might be missing __glibc_has_attribute added in
> glibc-2.34 with:
> +
> +
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc/sys/cdefs=
.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb642bf4a9456=
45532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=3D7dd4=
16491e080456fc7742d884c520526509413e
> +
> +Fixes:
> +In file included from ../git/localedef/include/programs/xmalloc.h:21,
> +                 from glibc/locale/programs/localedef.h:124,
> +                 from glibc/locale/programs/localedef.c:36:
> +../git/localedef/include/sys/cdefs.h:85:51: error: missing binary
> operator before token "("
> +   85 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__cold__)
> +      |                                                   ^
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Upstream-Status: Submitted [https://github.com/kraj/localedef/pull/4]
> +---
> + include/sys/cdefs.h | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/include/sys/cdefs.h b/include/sys/cdefs.h
> +index 0f32fdb..8530054 100644
> +--- a/include/sys/cdefs.h
> ++++ b/include/sys/cdefs.h
> +@@ -37,6 +37,23 @@
> + #endif
> + #endif
> +
> ++#if !defined __glibc_has_attribute
> ++/* Older glibc on host might be missing __glibc_has_attribute added in
> glibc-2.34 with:
> ++
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc/sys/cdefs=
.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb642bf4a9456=
45532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=3D7dd4=
16491e080456fc7742d884c520526509413e
> ++*/
> ++/* Compilers that lack __has_attribute may object to
> ++       #if defined __has_attribute && __has_attribute (...)
> ++   even though they do not need to evaluate the right-hand side of the
> &&.
> ++   Similarly for __has_builtin, etc.  */
> ++#if (defined __has_attribute \
> ++     && (!defined __clang_minor__ \
> ++         || 3 < __clang_major__ + (5 <=3D __clang_minor__)))
> ++# define __glibc_has_attribute(attr) __has_attribute (attr)
> ++#else
> ++# define __glibc_has_attribute(attr) 0
> ++#endif
> ++#endif
> ++
> + #if !defined(__REDIRECT_NTH) && defined(__GNUC__) && __GNUC__ >=3D 2
> + # ifdef __cplusplus
> + #  define __REDIRECT_NTH(name, proto, alias) \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186299):
> https://lists.openembedded.org/g/openembedded-core/message/186299
> Mute This Topic: https://lists.openembedded.org/mt/100796990/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008c5c4b060321947e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Khem already merged this, so I&#39;ll send v2 with just SR=
CREV bump shortly.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Aug 17, 2023 at 11:10=E2=80=AFAM Martin Jansa via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;M=
artin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Older glibc on host might be missing __glibc_has_att=
ribute added in glibc-2.34 with:<br>
<br>
<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc/=
sys/cdefs.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb64=
2bf4a945645532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;h=
pb=3D7dd416491e080456fc7742d884c520526509413e" rel=3D"noreferrer" target=3D=
"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc/sy=
s/cdefs.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb642b=
f4a945645532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;hpb=
=3D7dd416491e080456fc7742d884c520526509413e</a><br>
<br>
Fixes:<br>
In file included from ../git/localedef/include/programs/xmalloc.h:21,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from glibc/lo=
cale/programs/localedef.h:124,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from glibc/lo=
cale/programs/localedef.c:36:<br>
../git/localedef/include/sys/cdefs.h:85:51: error: missing binary operator =
before token &quot;(&quot;<br>
=C2=A0 =C2=A085 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__cold=
__)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../glibc/<a href=3D"http://cross-localedef-native_2.38.bb" rel=3D"no=
referrer" target=3D"_blank">cross-localedef-native_2.38.bb</a>=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...cdefs.h-define-__glibc_has_attribute.patch | 51 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 52 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0003-localedef-cdefs=
.h-define-__glibc_has_attribute.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-nati=
ve_2.38.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.3=
8.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native=
_2.38.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.38.=
bb</a><br>
index e7261a644b..673008c57a 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.38=
.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.38.bb</a=
><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.38=
.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.38.bb</a=
><br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};=
name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-localedef-Add-hardlin=
k-resolver-from-util-linux.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-localedef-fix-ups-har=
dlink-to-make-it-compile.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-localedef-cdefs.h-def=
ine-__glibc_has_attribute.patch;patchdir=3Dlocaledef \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0010-eglibc-Cross-building=
-and-testing-instructions.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-eglibc-Help-bootstrap=
-cross-toolchain.patch \<br>
diff --git a/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__=
glibc_has_attribute.patch b/meta/recipes-core/glibc/glibc/0003-localedef-cd=
efs.h-define-__glibc_has_attribute.patch<br>
new file mode 100644<br>
index 0000000000..d34651e275<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0003-localedef-cdefs.h-define-__glibc_h=
as_attribute.patch<br>
@@ -0,0 +1,51 @@<br>
+From a90ba625410f8b49205adbe03652bc2fd0c35cec Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Thu, 17 Aug 2023 01:23:59 +0200<br>
+Subject: [PATCH] cdefs.h: define __glibc_has_attribute<br>
+<br>
+Older glibc on host might be missing __glibc_has_attribute added in glibc-=
2.34 with:<br>
+<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc=
/sys/cdefs.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb6=
42bf4a945645532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;=
hpb=3D7dd416491e080456fc7742d884c520526509413e" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dmisc=
/sys/cdefs.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=3D57ca262bdfb6=
42bf4a945645532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439a4c0c1431351f3;=
hpb=3D7dd416491e080456fc7742d884c520526509413e</a><br>
+<br>
+Fixes:<br>
+In file included from ../git/localedef/include/programs/xmalloc.h:21,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from glibc/l=
ocale/programs/localedef.h:124,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from glibc/l=
ocale/programs/localedef.c:36:<br>
+../git/localedef/include/sys/cdefs.h:85:51: error: missing binary operator=
 before token &quot;(&quot;<br>
+=C2=A0 =C2=A085 | #if __GNUC_PREREQ (4, 3) || __glibc_has_attribute (__col=
d__)<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/kraj/localedef/p=
ull/4" rel=3D"noreferrer" target=3D"_blank">https://github.com/kraj/localed=
ef/pull/4</a>]<br>
+---<br>
+ include/sys/cdefs.h | 17 +++++++++++++++++<br>
+ 1 file changed, 17 insertions(+)<br>
+<br>
+diff --git a/include/sys/cdefs.h b/include/sys/cdefs.h<br>
+index 0f32fdb..8530054 100644<br>
+--- a/include/sys/cdefs.h<br>
++++ b/include/sys/cdefs.h<br>
+@@ -37,6 +37,23 @@<br>
+ #endif<br>
+ #endif<br>
+ <br>
++#if !defined __glibc_has_attribute<br>
++/* Older glibc on host might be missing __glibc_has_attribute added in gl=
ibc-2.34 with:<br>
++=C2=A0 =C2=A0<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dblo=
bdiff;f=3Dmisc/sys/cdefs.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=
=3D57ca262bdfb642bf4a945645532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439=
a4c0c1431351f3;hpb=3D7dd416491e080456fc7742d884c520526509413e" rel=3D"noref=
errer" target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob=
diff;f=3Dmisc/sys/cdefs.h;h=3D8e244a77cf6271f09cbd26d18b1e07b1d1641404;hp=
=3D57ca262bdfb642bf4a945645532f2319ec1ff437;hb=3Dc8ba52ab3350c334d6e34b1439=
a4c0c1431351f3;hpb=3D7dd416491e080456fc7742d884c520526509413e</a><br>
++*/<br>
++/* Compilers that lack __has_attribute may object to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0#if defined __has_attribute &amp;&amp; __has_a=
ttribute (...)<br>
++=C2=A0 =C2=A0even though they do not need to evaluate the right-hand side=
 of the &amp;&amp;.<br>
++=C2=A0 =C2=A0Similarly for __has_builtin, etc.=C2=A0 */<br>
++#if (defined __has_attribute \<br>
++=C2=A0 =C2=A0 =C2=A0&amp;&amp; (!defined __clang_minor__ \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| 3 &lt; __clang_major__ + (5 &lt;=3D =
__clang_minor__)))<br>
++# define __glibc_has_attribute(attr) __has_attribute (attr)<br>
++#else<br>
++# define __glibc_has_attribute(attr) 0<br>
++#endif<br>
++#endif<br>
++<br>
+ #if !defined(__REDIRECT_NTH) &amp;&amp; defined(__GNUC__) &amp;&amp; __GN=
UC__ &gt;=3D 2<br>
+ # ifdef __cplusplus<br>
+ #=C2=A0 define __REDIRECT_NTH(name, proto, alias) \<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186299): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186299" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186299</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100796990/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100796990/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008c5c4b060321947e--

