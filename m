Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FD7C00528
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 09:51:08 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.7703.1691142666438256981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 02:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nKCM5WJ4;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-44768e056e1so828680137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142665; x=1691747465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=38Z0kF05q+5Mk3VfjSOyJiONoUNj2tn9hm3mIJWVcHs=;
        b=nKCM5WJ4+cnerD76bjxsm+gEwFGwlLjRrE0NJWDCf9smeUMwCLhJN0sTdzYSWfwpPj
         N9B3weGA9Z5psl9ZHH7VDoYeM9qNXDgBWqiW0WPTsSbgLc7jqyIdrw9GsTJ8xrUE2G40
         4Cie3Q5TzFzZha+mgoXmaLCZzVVGXVMdn1r/H1UbiLv5DtL1vZnYQu8U2sqPJN4VG45g
         f9eqLosrf1q2QCn8WrUvsZRfY+GKvefbuGYkBlAW7y1UFcBL9oZthLzVLfhGp4Q+GL4i
         2Ke6+nvMwtMjLzk2lvuogj8OD+rr+dUFKsk0ejaPjg8/RYq46aU2kkJ/sBXIbclnDpuq
         iF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142665; x=1691747465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38Z0kF05q+5Mk3VfjSOyJiONoUNj2tn9hm3mIJWVcHs=;
        b=V6cHUrhWfmrkZ5EJwrSTzvnIDFTjvbs3x94wzimG8gP5LNNKqvw9xUjHCjgTzdVUCj
         mZEwHFX5hlGDDhG5jCAm6w+Ps8fEMknRUPQdcpEW7GJ3qBbcxhSGIpfiLlGgWjixShbp
         nI6ajkoxt3OVVHz5fjIWYumieqOjmax3TaM0Qg5rBJ4gTJ75BQYoUKbL1Cvl7A/4fC1x
         IRUk46sf3YEJi9Sdn6OMwYQVtcQFhAJyFoH7dWvw58gUOGxNBA9vvleVRhLx90VLfaXd
         lEoj8NMc0/xAe5IzIm77kzJZ2Obei/XpOckA67B3HufrLXCRt9HjEQ4YJpBN7/xq6CU+
         IF3A==
X-Gm-Message-State: AOJu0YyVUg9MufSF8kgho0qmMVRzmbRgp2nG7HEQJ5GmdGpq9mgoNR5e
	x5/jg93dR0VtEsmQFE3mc5pV4el519SrIvLBcIk=
X-Google-Smtp-Source: AGHT+IFgRS46098OysTolZZNBC9uKrmObEN/qaPwjCib8U6bYUhlkZCxDJ9hThD++thJ0sNyHsu3ZCVaadVlOusVrzc=
X-Received: by 2002:a67:f5da:0:b0:443:8034:be4a with SMTP id
 t26-20020a67f5da000000b004438034be4amr689409vso.28.1691142665351; Fri, 04 Aug
 2023 02:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230804084315.55768-1-p.lobacz@welotec.com> <20230804084315.55768-4-p.lobacz@welotec.com>
In-Reply-To: <20230804084315.55768-4-p.lobacz@welotec.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 4 Aug 2023 10:50:54 +0100
Message-ID: <CANPvuRnTX==Rx-CkttgCii_NpNgjRinA2m5+zd1j9Hh-L3cL8A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d53761060215d5b4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 09:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185520

--000000000000d53761060215d5b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Piotr =C5=81obacz <p.lobacz@welotec.com> escreveu no dia sexta, 4/08/2023 =
=C3=A0(s)
09:45:

> Extend `tar` command, with additional parameters, depending
> on choosen package class and target distro features, in order
> to support ACLs and xattr.
>
> Additionaly set archive posix format, in order to preserve
> milliseconds in timestamps for reproducibility tests.
>

Looks like this adicionality set archive posix format to preserve the
timestamps
is a bug fix that should be backported to previous version.
Can you split this patch in two to make it possible?

Jose


>
> Currently only `package_ipk` supports fully ACLs and xattr.
>
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/sstate.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass
> b/meta/classes-global/sstate.bbclass
> index 95373fd60a..ac890fc98e 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -848,7 +848,7 @@ sstate_create_package () {
>         mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
>         TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
>
> -       OPT=3D"-cS"
> +       OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', '=
acl',
> '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr',
> '--xattrs', '', d)} --numeric-owner -cS"
>         ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
>         # Use pzstd if available
>         if [ -x "$(command -v pzstd)" ]; then
> @@ -914,7 +914,7 @@ sstate_unpack_package () {
>                 ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
>         fi
>
> -       tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
> +       tar -I "$ZSTD" --format=3Dposix
> ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)}
> ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', '', d)} -xvp=
f
> ${SSTATE_PKG}
>         # update .siginfo atime on local/NFS mirror if it is a symbolic
> link
>         [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ]
> || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
>         # update each symbolic link instead of any referenced file
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185514):
> https://lists.openembedded.org/g/openembedded-core/message/185514
> Mute This Topic: https://lists.openembedded.org/mt/100542722/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d53761060215d5b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Piotr =C5=81obacz &lt;<a href=3D"mail=
to:p.lobacz@welotec.com">p.lobacz@welotec.com</a>&gt; escreveu no dia sexta=
, 4/08/2023 =C3=A0(s) 09:45:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Extend `tar` command, with additional parameters, depending<br=
>
on choosen package class and target distro features, in order<br>
to support ACLs and xattr.<br>
<br>
Additionaly set archive posix format, in order to preserve<br>
milliseconds in timestamps for reproducibility tests.<br></blockquote><div>=
<br></div><div>Looks like this adicionality set archive posix format to pre=
serve the timestamps<br>is a bug fix that should=C2=A0be backported to prev=
ious=C2=A0version.<br>Can you split this patch in two to make it possible?<=
/div><div><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Currently only `package_ipk` supports fully ACLs and xattr.<br>
<br>
Signed-off-by: Piotr =C5=81obacz &lt;<a href=3D"mailto:p.lobacz@welotec.com=
" target=3D"_blank">p.lobacz@welotec.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/sstate.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass<br>
index 95373fd60a..ac890fc98e 100644<br>
--- a/meta/classes-global/sstate.bbclass<br>
+++ b/meta/classes-global/sstate.bbclass<br>
@@ -848,7 +848,7 @@ sstate_create_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;-cS&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0OPT=3D&quot;--format=3Dposix ${@bb.utils.contai=
ns(&#39;DISTRO_FEATURES&#39;, &#39;acl&#39;, &#39;--acls&#39;, &#39;&#39;, =
d)} ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xattr&#39;, &#39;-=
-xattrs&#39;, &#39;&#39;, d)} --numeric-owner -cS&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ZSTD=3D&quot;zstd -${SSTATE_ZSTD_CLEVEL} -T${ZS=
TD_THREADS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use pzstd if available<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x &quot;$(command -v pzstd)&quot; ]; then=
<br>
@@ -914,7 +914,7 @@ sstate_unpack_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ZSTD=3D&quot;pzstd =
-p ${ZSTD_THREADS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&quot; -xvpf ${SSTATE_PKG}<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&quot; --format=3Dposix ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;acl&#39;, &#39;--acls&#39;,=
 &#39;&#39;, d)} ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xattr=
&#39;, &#39;--xattrs&#39;, &#39;&#39;, d)} -xvpf ${SSTATE_PKG}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # update .siginfo atime on local/NFS mirror if =
it is a symbolic link<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTA=
TE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2&gt;/dev/null || true<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # update each symbolic link instead of any refe=
renced file<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185514): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185514" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185514</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100542722/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100542722/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d53761060215d5b4--

