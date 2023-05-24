Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF46C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:32:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.194.1684942360533524414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pUEu5TZj;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: kergoth@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ae54b623c2so3849655ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684942360; x=1687534360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZrhx9C/vc2CcX3y92U+Devilo5ClAD386yrCQMr9u4=;
        b=pUEu5TZjadcl5cf1xepmF/CJ6W3UH1bU9J/RrVZ4ux6SYJCX/BhXDlASw486ufp1fa
         8AaMVol+VZgr8Ml/bQAz8g6+Sg65fkWemMF7ZcVjU1QwqhhHiluslmugL+RKmt542ymj
         vbwBShWH6Gz1qQ0mF/oQ+8EwH4WDPib+Ii2aZcYHLnpGoIL0joFVuncL0a/EtrW5Z58l
         uKSE8uteKJgfGflGq/jkdzrdW5ezRf+01byzqksLaraBM6NNhgTY3HLO5ZaEdwDp8zzj
         xQAGuI/FG9etql1PbEaUzDdv5xSX1npxb/DMZUxR/bSHQIiVljI6iLVbKyJckw+BvOcf
         bHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684942360; x=1687534360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZrhx9C/vc2CcX3y92U+Devilo5ClAD386yrCQMr9u4=;
        b=IIzDMMt5AHct92F7mHyoZ4znTpUcqiLyyS6k6edAQF6J6dqNWeQQeFsAFhLaDWHZ9N
         SgyhOheSL9z6q18R1L9NIMl0p/4sFkA1CciQwCdm3Pyf7tr7pCc1F5KtJx3orraizQuY
         aqNeu4TE4XXtOJ3IapbBdNtlw0WjAWKZBzK1scVzLLFF2+Y+DmxbszEWfpjt0B1zXDlg
         aOkgU18U9q5H5fzxvV6iaV1KmCRr6W3ZI0SG3X+zkxks8xGZQJ7f5ITt8YKvgp4uRHcs
         tggT1KLabv2JadgmdgAEuyUFDe7fXM3qzxEBGJojTTJ1MjDJcwDK5M5ZHxbNucHb/KhG
         Nckg==
X-Gm-Message-State: AC+VfDz7NkgY4PzFILf1qHoREvR+X/Gv+W6OqS1hKBawj87rg80JJi4y
	GPxR+ExqtSAPw2XCVbS3E/WuUhTMTsrK+QSFbrc=
X-Google-Smtp-Source: ACHHUZ6XV3vVElMs3srqO37R4rMWNsYb0SdVTgaNQMGvjL5uo6urRFki+FLTQP4w1HIYD7O/yvWq2oVyjVwxX19hjE4=
X-Received: by 2002:a17:902:b216:b0:1af:dd03:ed89 with SMTP id
 t22-20020a170902b21600b001afdd03ed89mr2647841plr.3.1684942359927; Wed, 24 May
 2023 08:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
 <6DA23AA1-4320-4219-AB7E-7BAE7EE0DB08@arm.com> <CA+chaQf19xzSrFjcF68hoQA+qC1sG7kkiPnWoHtVavPA+7LV7Q@mail.gmail.com>
In-Reply-To: <CA+chaQf19xzSrFjcF68hoQA+qC1sG7kkiPnWoHtVavPA+7LV7Q@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 24 May 2023 08:32:28 -0700
Message-ID: <CABcZANnuduuTy68g3yCTCkrvwBLo2ExC18Lk6zTxeosDaJ2suA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libx11: remove unused patch and FILESEXTRAPATHS
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d4a1c605fc7236a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181683

--000000000000d4a1c605fc7236a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nice, love this patch series!

On Wed, May 24, 2023 at 8:05=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:

> I was using
> https://github.com/ros/meta-ros/blob/master/scripts/check-patch-files.sh
> which is far from ideal and has many false positives e.g. you have a
> .bbappend which sets FILESEXTRAPATHS, but doesn't add the .patch files to
> SRC_URI because they are already there from the main recipe or other
> .bbappend in upper layer and also if the .patch files are in subdirectori=
e
> (e.g. android-tools recipes in meta-oe).
>
> Probably not good enough to include in oe-core, but better than nothing,
> maybe add something like this to patchreview script?
>
> On Wed, May 24, 2023 at 5:00=E2=80=AFPM Ross Burton <Ross.Burton@arm.com>=
 wrote:
>
>> Do you have a script to find these patches?  Can we get it added to
>> oe-core? :)
>>
>> Ross
>>
>> > On 24 May 2023, at 08:53, Martin Jansa via lists.openembedded.org
>> <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > * 0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch was
>> removed
>> >  from SRC_URI in:
>> >
>> https://git.openembedded.org/openembedded-core/commit/?id=3De13f651f73db=
0f26f4645447ab5fa17e36d1903b
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> > ...ak-in-XRegisterIMInstantiateCallback.patch | 57 -------------------
>> > .../recipes-graphics/xorg-lib/libx11_1.8.4.bb |  6 +-
>> > 2 files changed, 2 insertions(+), 61 deletions(-)
>> > delete mode 100644
>> meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegiste=
rIMInstantiateCallback.patch
>> >
>> > diff --git
>> a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegis=
terIMInstantiateCallback.patch
>> b/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegis=
terIMInstantiateCallback.patch
>> > deleted file mode 100644
>> > index 722116c07e..0000000000
>> > ---
>> a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegis=
terIMInstantiateCallback.patch
>> > +++ /dev/null
>> > @@ -1,57 +0,0 @@
>> > -CVE: CVE-2022-3554
>> > -Upstream-Status: Backport
>> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> > -
>> > -From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 200=
1
>> > -From: "Thomas E. Dickey" <dickey@invisible-island.net>
>> > -Date: Tue, 4 Oct 2022 18:26:17 -0400
>> > -Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback
>> > -
>> > -Analysis:
>> > -
>> > -    _XimRegisterIMInstantiateCallback() opens an XIM and closes it
>> using
>> > -    the internal function pointers, but the internal close function
>> does
>> > -    not free the pointer to the XIM (this would be done in XCloseIM()=
).
>> > -
>> > -Report/patch:
>> > -
>> > -    Date: Mon, 03 Oct 2022 18:47:32 +0800
>> > -    From: Po Lu <luangruo@yahoo.com>
>> > -    To: xorg-devel@lists.x.org
>> > -    Subject: Re: Yet another leak in Xlib
>> > -
>> > -    For reference, here's how I'm calling
>> XRegisterIMInstantiateCallback:
>> > -
>> > -    XSetLocaleModifiers ("");
>> > -    XRegisterIMInstantiateCallback (compositor.display,
>> > -                                    XrmGetDatabase
>> (compositor.display),
>> > -                                    (char *) compositor.resource_name=
,
>> > -                                    (char *) compositor.app_name,
>> > -                                    IMInstantiateCallback, NULL);
>> > -
>> > -    and XMODIFIERS is:
>> > -
>> > -        @im=3Dibus
>> > -
>> > -Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
>> > ----
>> > - modules/im/ximcp/imInsClbk.c | 3 +++
>> > - 1 file changed, 3 insertions(+)
>> > -
>> > -diff --git a/modules/im/ximcp/imInsClbk.c
>> b/modules/im/ximcp/imInsClbk.c
>> > -index 95b379cb..c10e347f 100644
>> > ---- a/modules/im/ximcp/imInsClbk.c
>> > -+++ b/modules/im/ximcp/imInsClbk.c
>> > -@@ -212,6 +212,9 @@ _XimRegisterIMInstantiateCallback(
>> > -     if( xim ) {
>> > - lock =3D True;
>> > - xim->methods->close( (XIM)xim );
>> > -+ /* XIMs must be freed manually after being opened; close just
>> > -+   does the protocol to deinitialize the IM.  */
>> > -+ XFree( xim );
>> > - lock =3D False;
>> > - icb->call =3D True;
>> > - callback( display, client_data, NULL );
>> > ---
>> > -2.34.1
>> > -
>> > diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
>> b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
>> > index 7831b4986a..9058c1844e 100644
>> > --- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
>> > +++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
>> > @@ -18,14 +18,12 @@ DEPENDS +=3D "xorgproto \
>> >
>> > PROVIDES =3D "virtual/libx11"
>> >
>> > -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/libx11:"
>> > -
>> > PE =3D "1"
>> >
>> > XORG_PN =3D "libX11"
>> >
>> > -SRC_URI +=3D "file://disable_tests.patch \
>> > -            "
>> > +SRC_URI +=3D "file://disable_tests.patch"
>> > +
>> > SRC_URI[sha256sum] =3D
>> "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
>> >
>> > inherit gettext
>> > --
>> > 2.40.1
>> >
>> >
>> >
>> >
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181681):
> https://lists.openembedded.org/g/openembedded-core/message/181681
> Mute This Topic: https://lists.openembedded.org/mt/99104244/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000d4a1c605fc7236a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nice, love this patch series!</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 24, 2023 at 8:05=
=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Mart=
in.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">I was using=C2=A0<a href=3D"https://gith=
ub.com/ros/meta-ros/blob/master/scripts/check-patch-files.sh" target=3D"_bl=
ank">https://github.com/ros/meta-ros/blob/master/scripts/check-patch-files.=
sh</a> which is far from ideal and has many false positives e.g. you have a=
 .bbappend which sets FILESEXTRAPATHS, but doesn&#39;t add the .patch files=
 to SRC_URI because they are already there from the main recipe or other .b=
bappend in upper layer and also if the .patch files are in subdirectorie (e=
.g. android-tools recipes in meta-oe).<div><br></div><div>Probably not good=
 enough to include in oe-core, but better than nothing, maybe add something=
 like this to patchreview script?</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 24, 2023 at 5:00=E2=80=
=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_bla=
nk">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Do you have a script to find these patches?=C2=A0 Ca=
n we get it added to oe-core? :)<br>
<br>
Ross<br>
<br>
&gt; On 24 May 2023, at 08:53, Martin Jansa via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; * 0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch was r=
emoved<br>
&gt;=C2=A0 from SRC_URI in:<br>
&gt;=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit=
/?id=3De13f651f73db0f26f4645447ab5fa17e36d1903b" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3De13=
f651f73db0f26f4645447ab5fa17e36d1903b</a><br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; ...ak-in-XRegisterIMInstantiateCallback.patch | 57 -------------------=
<br>
&gt; .../recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.8.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libx11_1.8.4.bb</a> |=C2=A0 6 +-<br>
&gt; 2 files changed, 2 insertions(+), 61 deletions(-)<br>
&gt; delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-me=
mory-leak-in-XRegisterIMInstantiateCallback.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-l=
eak-in-XRegisterIMInstantiateCallback.patch b/meta/recipes-graphics/xorg-li=
b/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 722116c07e..0000000000<br>
&gt; --- a/meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-=
XRegisterIMInstantiateCallback.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,57 +0,0 @@<br>
&gt; -CVE: CVE-2022-3554<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; -<br>
&gt; -From 1d11822601fd24a396b354fa616b04ed3df8b4ef Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: &quot;Thomas E. Dickey&quot; &lt;<a href=3D"mailto:dickey@invis=
ible-island.net" target=3D"_blank">dickey@invisible-island.net</a>&gt;<br>
&gt; -Date: Tue, 4 Oct 2022 18:26:17 -0400<br>
&gt; -Subject: [PATCH] fix a memory leak in XRegisterIMInstantiateCallback<=
br>
&gt; -<br>
&gt; -Analysis:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 _XimRegisterIMInstantiateCallback() opens an XIM and cl=
oses it using<br>
&gt; -=C2=A0 =C2=A0 the internal function pointers, but the internal close =
function does<br>
&gt; -=C2=A0 =C2=A0 not free the pointer to the XIM (this would be done in =
XCloseIM()).<br>
&gt; -<br>
&gt; -Report/patch:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 Date: Mon, 03 Oct 2022 18:47:32 +0800<br>
&gt; -=C2=A0 =C2=A0 From: Po Lu &lt;<a href=3D"mailto:luangruo@yahoo.com" t=
arget=3D"_blank">luangruo@yahoo.com</a>&gt;<br>
&gt; -=C2=A0 =C2=A0 To: <a href=3D"mailto:xorg-devel@lists.x.org" target=3D=
"_blank">xorg-devel@lists.x.org</a><br>
&gt; -=C2=A0 =C2=A0 Subject: Re: Yet another leak in Xlib<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 For reference, here&#39;s how I&#39;m calling XRegister=
IMInstantiateCallback:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 XSetLocaleModifiers (&quot;&quot;);<br>
&gt; -=C2=A0 =C2=A0 XRegisterIMInstantiateCallback (compositor.display,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XrmGetDatabase (co=
mpositor.display),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (char *) composito=
r.resource_name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (char *) composito=
r.app_name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMInstantiateCallb=
ack, NULL);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 and XMODIFIERS is:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 @im=3Dibus<br>
&gt; -<br>
&gt; -Signed-off-by: Thomas E. Dickey &lt;<a href=3D"mailto:dickey@invisibl=
e-island.net" target=3D"_blank">dickey@invisible-island.net</a>&gt;<br>
&gt; ----<br>
&gt; - modules/im/ximcp/imInsClbk.c | 3 +++<br>
&gt; - 1 file changed, 3 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/modules/im/ximcp/imInsClbk.c b/modules/im/ximcp/imInsClb=
k.c<br>
&gt; -index 95b379cb..c10e347f 100644<br>
&gt; ---- a/modules/im/ximcp/imInsClbk.c<br>
&gt; -+++ b/modules/im/ximcp/imInsClbk.c<br>
&gt; -@@ -212,6 +212,9 @@ _XimRegisterIMInstantiateCallback(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if( xim ) {<br>
&gt; - lock =3D True;<br>
&gt; - xim-&gt;methods-&gt;close( (XIM)xim );<br>
&gt; -+ /* XIMs must be freed manually after being opened; close just<br>
&gt; -+=C2=A0 =C2=A0does the protocol to deinitialize the IM.=C2=A0 */<br>
&gt; -+ XFree( xim );<br>
&gt; - lock =3D False;<br>
&gt; - icb-&gt;call =3D True;<br>
&gt; - callback( display, client_data, NULL );<br>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1=
.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.8.4.bb</a> b/meta/re=
cipes-graphics/xorg-lib/<a href=3D"http://libx11_1.8.4.bb" rel=3D"noreferre=
r" target=3D"_blank">libx11_1.8.4.bb</a><br>
&gt; index 7831b4986a..9058c1844e 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.8.4.bb=
" rel=3D"noreferrer" target=3D"_blank">libx11_1.8.4.bb</a><br>
&gt; +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.8.4.bb=
" rel=3D"noreferrer" target=3D"_blank">libx11_1.8.4.bb</a><br>
&gt; @@ -18,14 +18,12 @@ DEPENDS +=3D &quot;xorgproto \<br>
&gt; <br>
&gt; PROVIDES =3D &quot;virtual/libx11&quot;<br>
&gt; <br>
&gt; -FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/libx11:&quot;<br>
&gt; -<br>
&gt; PE =3D &quot;1&quot;<br>
&gt; <br>
&gt; XORG_PN =3D &quot;libX11&quot;<br>
&gt; <br>
&gt; -SRC_URI +=3D &quot;file://disable_tests.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +SRC_URI +=3D &quot;file://disable_tests.patch&quot;<br>
&gt; +<br>
&gt; SRC_URI[sha256sum] =3D &quot;c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e4=
5c0e2ee59e84c86757df518&quot;<br>
&gt; <br>
&gt; inherit gettext<br>
&gt; -- <br>
&gt; 2.40.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181681): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181681" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181681</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99104244/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99104244/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#333333">Christopher Larson<=
br><a>chris_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens.com</a>,=C2=
=A0<a>kergoth@gmail.com</a><br>Principal Software Engineer,=C2=A0Embedded L=
inux Solutions,=C2=A0Siemens Digital Industries Software</font><br></div></=
div></div>

--000000000000d4a1c605fc7236a1--

