Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F31C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:28:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.9997.1641918526096183360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GHXMVIpT;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id g2so1713163qkp.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yp0ARQ8Ad/vMLcLPThXmG5gMKBZksWh1+CI4vgUQMk0=;
        b=GHXMVIpTZiOSJg1lc1l+y7fr12bWLTZelyD7PR+8lTKs65dyTo0d/pQREANNXRpaR9
         M/B6kRrZxKmsjC6H5gjE5wCCu/oqgRLbzkSsIZHpjtE1WSChpKSQAgFnzn6P1/9geJcR
         o0llICxTH66NmjHCejIn8XVNcK0YKBiUqDY+rv/NsA+fZJAq098MB1281E68QSVoTHHc
         Iyjbxl9ZJrsLRsVbXU5scx84oMORrPKD2gSUUJB9YfltfviahNycwMnCzKek+nuH3zb9
         SJTc8V22i+yd5hnjVx/95DDRryHJgAxLVwbO7IOqo2GDj3mA4wV26wwwej+AGbBQ+gZT
         k/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yp0ARQ8Ad/vMLcLPThXmG5gMKBZksWh1+CI4vgUQMk0=;
        b=VXIMuIfBUFP3D7n8E5z69RHvvMO/dZdbDXIugvBBjG+0tPXX6XFXjQ65nzbeBsgVF8
         +OYopXrxmsxNiVNJTcBmaRNH+cIyrDuxRqcz2NG8+cJuEtV8mVieR26MJ2eQfZzIWqNv
         IlYYm0DSTOVPj0sXlhUnWdMqqGXvBDoHpyYTGZU7gOwpsrxZBI7SrZVhSEk+stId6azj
         8xeHbNgGyCtbnMCACppc2D3bGgz5jgUWpAyYzqjp58uPl7nDbKt950nunjQdOZSWyXTT
         v51WdsZdGhc0ibdGhLKDy/kcPFYwSEUqTQtqU2STwbLnZw8MnEnVORh9zXyOc7BK2+mA
         RyAA==
X-Gm-Message-State: AOAM5325wMarlvuS91+KpzouOMHBDroovQLbHGG6+PN+1tqikjy8f5Kc
	yJ7CevS1fzY+Is/s+tFpr/LltlcEkW0fOiwq/Y1ywHCLSXo=
X-Google-Smtp-Source: 
 ABdhPJz/clUJIu1O4B7MpOtEfaLOby0pxmxAKR+8RIyhwfaiFte5QAZDpOtEstkH05pwLENU7+7Z+yxcZUzerPP/fqA=
X-Received: by 2002:a05:620a:1496:: with SMTP id
 w22mr3587339qkj.463.1641918525115;
 Tue, 11 Jan 2022 08:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20220111162327.33864-1-nishaparrakat@gmail.com>
In-Reply-To: <20220111162327.33864-1-nishaparrakat@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jan 2022 08:28:34 -0800
Message-ID: 
 <CAMKF1soAvWcenT3k1sab3iBM3AdrL7f_jwRSzABRQJaogk8BHQ@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] nodejs_16.11.1.bb: only handle npm if
 configured
To: Nisha Parrakat <nishaparrakat@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000708fba05d550f20e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 16:28:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160420

--000000000000708fba05d550f20e
Content-Type: text/plain; charset="UTF-8"

This needs to go into openembedded-devel mailing list so it can be picked
by lore and other tools

On Tue, Jan 11, 2022 at 8:23 AM Nisha Parrakat <nishaparrakat@gmail.com>
wrote:

> npm-cli.js should be symlinked only when the file is present
> the file may not be available if the configure option is --without-npm
>
> Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> index 11034420a..c8d942538 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
> @@ -175,8 +175,9 @@ do_install:append:class-native() {
>      # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
>      # use sed on npm-cli.js because otherwise symlink is replaced with
> normal file and
>      # npm-cli.js continues to use old shebang
> -    sed "1s^.*^#\!/usr/bin/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> -
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]];
> then
> +        sed "1s^.*^#\!/usr/bin/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    fi
>      # Install the native binaries to provide it within sysroot for the
> target compilation
>      install -d ${D}${bindir}
>      install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
> @@ -189,7 +190,9 @@ do_install:append:class-native() {
>  }
>
>  do_install:append:class-target() {
> -    sed "1s^.*^#\!${bindir}/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]];
> then
> +        sed "1s^.*^#\!${bindir}/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +    fi
>  }
>
>  PACKAGES =+ "${PN}-npm"
> --
> 2.17.1
>
>

--000000000000708fba05d550f20e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This needs to go into openembedded-devel mailing list so =
it can be picked by lore and other tools=C2=A0</div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 11, 2022 at =
8:23 AM Nisha Parrakat &lt;<a href=3D"mailto:nishaparrakat@gmail.com">nisha=
parrakat@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">n=
pm-cli.js should be symlinked only when the file is present<br>
the file may not be available if the configure option is --without-npm<br>
<br>
Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:nishaparrakat@gmail.com=
" target=3D"_blank">nishaparrakat@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.11.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.11.1.bb</a> | 9 ++++++---<br=
>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.11=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.11.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.11.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_16.11.1.bb</a><br>
index 11034420a..c8d942538 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.11.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.11.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.11.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.11.1.bb</a><br>
@@ -175,8 +175,9 @@ do_install:append:class-native() {<br>
=C2=A0 =C2=A0 =C2=A0# /usr/bin/npm is symlink to /usr/lib/node_modules/npm/=
bin/npm-cli.js<br>
=C2=A0 =C2=A0 =C2=A0# use sed on npm-cli.js because otherwise symlink is re=
placed with normal file and<br>
=C2=A0 =C2=A0 =C2=A0# npm-cli.js continues to use old shebang<br>
-=C2=A0 =C2=A0 sed &quot;1s^.*^#\!/usr/bin/env node^g&quot; -i ${D}${exec_p=
refix}/lib/node_modules/npm/bin/npm-cli.js<br>
-<br>
+=C2=A0 =C2=A0 if [[ -f &quot;${D}${exec_prefix}/lib/node_modules/npm/bin/n=
pm-cli.js&quot; ]]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;1s^.*^#\!/usr/bin/env node^g&quot; -=
i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0# Install the native binaries to provide it within sysr=
oot for the target compilation<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/out/Release/torque ${D}${bindir}/t=
orque<br>
@@ -189,7 +190,9 @@ do_install:append:class-native() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append:class-target() {<br>
-=C2=A0 =C2=A0 sed &quot;1s^.*^#\!${bindir}/env node^g&quot; -i ${D}${exec_=
prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
+=C2=A0 =C2=A0 if [[ -f &quot;${D}${exec_prefix}/lib/node_modules/npm/bin/n=
pm-cli.js&quot; ]]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;1s^.*^#\!${bindir}/env node^g&quot; =
-i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-npm&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000708fba05d550f20e--

