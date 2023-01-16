Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D967C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 19:21:29 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.176966.1673896887631166222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 11:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HkUECfNr;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id n190so26105435vsc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 11:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uhiyn9NxbGlrUrC+BaEmuByxQkbQCPFuPQhZSjIPD/0=;
        b=HkUECfNrWnkmRTQDjd0H7nKtFoWm2TN4N/3kQqgUK5qybAAGjnT7WTRyVYXNrHDP4Y
         139/MpQxTjiOopkcdmswhti3MBs1ngRjISPw5nRi3ROPhSTjU7xqXgekpTSfsR727yJS
         YFGLLq44V2mB/6uUK0+Zz4JdZZKqc9+LY/0B2uYLI2m1fzCnqRoZocYA9xvcvznVW/o7
         sr8qs7BzTZwl8nbQqNd6Q2p0yhh8N7rVT1Ms4Ygwp7YoMu+zXp82TM/E4DYL2W02x9NO
         Hs5vSCoPAifjimFZXq6vAq9gm36TqH0GuEVth87duRFpFkMpOL1XvGXhM0lX72ZtOwhT
         UPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhiyn9NxbGlrUrC+BaEmuByxQkbQCPFuPQhZSjIPD/0=;
        b=ZItwZONNE2vwkEnwIFyJ+6C3dufm6RLJyJluOGDaMSrs6+vejfmCGdXVEqZ+Y0qH+1
         g8/ACo4u+2W8cGbqOwFQ0Gxoup0ZdGQpD19Rv+vytAe5PczuHmKo+/0VUMrdxpEy15Tr
         oDAKx4efbCOedUyDQzFMBfcw38ya/kHVFCTv5MY0Ko+aZxxXPypUYTK894PuPKmb+WkS
         jy9CjxGhg8EOwy+FU4taJfa+SdStoQN/jjsVIaUK/rH5W7LNNrFPzBj5Ej5u/4IUgCfH
         /Qt+lNTb3cdDBFjhFbWoWandSs9g+KqmIOL8MtKnH7Qg+61+tktOHbTbsrars862gzUd
         8M8A==
X-Gm-Message-State: AFqh2kqfAMv/0v/iLRsGpnEO0GIcHavbLWZ1+8YA2PKXDreg3euOOeqT
	IJIXyWwJFi8jhR5ia4ZgQNutbCok2TODKnXutBc=
X-Google-Smtp-Source: AMrXdXs5gQrWgjy7VYQVEVMkztRVDjauIPqaSlOLC9SwBUhApIdLYwnLoRUF4H1CCmGdRJxD02RG+1+hXFmdviBMQSw=
X-Received: by 2002:a67:f611:0:b0:3d3:e612:b19e with SMTP id
 k17-20020a67f611000000b003d3e612b19emr17117vso.2.1673896886595; Mon, 16 Jan
 2023 11:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 16 Jan 2023 19:21:15 +0000
Message-ID: <CANPvuRmQiEXiZ7+9_N5O=FmKcMPcjhqBU-Fn8bJ-KYirNg0Z3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uninative-tarball: Add libgcc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050f48805f2667d09"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 19:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176013

--00000000000050f48805f2667d09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I am seeing some build errors like this at the end of the build whre bibake
segment fault.
My problem is this happens on a build that doesn't use uninative,
does bitbake require uninative to build on master?

This is my build log where bitbake crash at the end:

INFO: Build completion summary:
INFO:   do_populate_sysroot: 100.0% sstate reuse(387 setscene, 0 scratch)
INFO:   do_deploy_source_date_epoch: 100.0% sstate reuse(5 setscene, 0
scratch)
INFO:   do_deploy_archives: 100.0% sstate reuse(400 setscene, 0 scratch)
INFO:   do_create_spdx: 100.0% sstate reuse(364 setscene, 0 scratch)
INFO:   do_create_runtime_spdx: 100.0% sstate reuse(342 setscene, 0 scratch=
)
INFO:   do_package_qa: 100.0% sstate reuse(243 setscene, 0 scratch)
INFO:   do_package: 100.0% sstate reuse(26 setscene, 0 scratch)
INFO:   do_packagedata: 100.0% sstate reuse(243 setscene, 0 scratch)
INFO:   do_package_write_ipk: 100.0% sstate reuse(243 setscene, 0 scratch)
INFO:   do_populate_lic: 100.0% sstate reuse(395 setscene, 0 scratch)
INFO: Writing buildhistory
INFO: Writing buildhistory took: 10 seconds
libgcc_s.so.1 must be installed for pthread_cancel to work
/lmp/bb-build.sh: line 24: 91770 Aborted                 (core dumped)
bitbake -D ...

Jose


Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 9/01/2023 =C3=A0(s) 13:49:

> We ship libpthread with uninative. when uninative is active we're seeing
> failures like:
>
>    libgcc_s.so.1 must be installed for pthread_cancel to work
>    Aborted
>
> which is since we don't have a libgcc that matches libpthread. Add libgcc
> to avoid these errors.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/meta/uninative-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb
> b/meta/recipes-core/meta/uninative-tarball.bb
> index a21d08b591c..4aecf39b890 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -20,6 +20,7 @@ TOOLCHAIN_HOST_TASK =3D "\
>      nativesdk-libxcrypt-compat \
>      nativesdk-libnss-nis \
>      nativesdk-sdk-provides-dummy \
> +    nativesdk-libgcc \
>      "
>
>  INHIBIT_DEFAULT_DEPS =3D "1"
> --
> 2.37.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175684):
> https://lists.openembedded.org/g/openembedded-core/message/175684
> Mute This Topic: https://lists.openembedded.org/mt/96152280/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000050f48805f2667d09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Richard,<br><br>I am seeing some build errors=C2=
=A0like this at the end of the build whre bibake segment fault.<br>My probl=
em is this happens on a build that doesn&#39;t=C2=A0use uninative,<div>does=
 bitbake require uninative to build on master?<div><div><br>This is my buil=
d log where=C2=A0bitbake crash at the end:<br><br>INFO: Build completion su=
mmary:<br>INFO: =C2=A0 do_populate_sysroot: 100.0% sstate reuse(387 setscen=
e, 0 scratch)<br>INFO: =C2=A0 do_deploy_source_date_epoch: 100.0% sstate re=
use(5 setscene, 0 scratch)<br>INFO: =C2=A0 do_deploy_archives: 100.0% sstat=
e reuse(400 setscene, 0 scratch)<br>INFO: =C2=A0 do_create_spdx: 100.0% sst=
ate reuse(364 setscene, 0 scratch)<br>INFO: =C2=A0 do_create_runtime_spdx: =
100.0% sstate reuse(342 setscene, 0 scratch)<br>INFO: =C2=A0 do_package_qa:=
 100.0% sstate reuse(243 setscene, 0 scratch)<br>INFO: =C2=A0 do_package: 1=
00.0% sstate reuse(26 setscene, 0 scratch)<br>INFO: =C2=A0 do_packagedata: =
100.0% sstate reuse(243 setscene, 0 scratch)<br>INFO: =C2=A0 do_package_wri=
te_ipk: 100.0% sstate reuse(243 setscene, 0 scratch)<br>INFO: =C2=A0 do_pop=
ulate_lic: 100.0% sstate reuse(395 setscene, 0 scratch)<br>INFO: Writing bu=
ildhistory<br>INFO: Writing buildhistory took: 10 seconds<br>libgcc_s.so.1 =
must be installed for pthread_cancel to work<br>/lmp/bb-build.sh: line 24: =
91770 Aborted =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (core=
 dumped) bitbake -D ...<div><br></div><div>Jose<br><br></div></div></div></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no =
dia segunda, 9/01/2023 =C3=A0(s) 13:49:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">We ship libpthread with uninative. when uninative i=
s active we&#39;re seeing<br>
failures like:<br>
<br>
=C2=A0 =C2=A0libgcc_s.so.1 must be installed for pthread_cancel to work<br>
=C2=A0 =C2=A0Aborted<br>
<br>
which is since we don&#39;t have a libgcc that matches libpthread. Add libg=
cc<br>
to avoid these errors.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D=
"noreferrer" target=3D"_blank">uninative-tarball.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb"=
 rel=3D"noreferrer" target=3D"_blank">uninative-tarball.bb</a> b/meta/recip=
es-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D"noreferrer" tar=
get=3D"_blank">uninative-tarball.bb</a><br>
index a21d08b591c..4aecf39b890 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D=
"noreferrer" target=3D"_blank">uninative-tarball.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D=
"noreferrer" target=3D"_blank">uninative-tarball.bb</a><br>
@@ -20,6 +20,7 @@ TOOLCHAIN_HOST_TASK =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-libxcrypt-compat \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-libnss-nis \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-sdk-provides-dummy \<br>
+=C2=A0 =C2=A0 nativesdk-libgcc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
-- <br>
2.37.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175684): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175684" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175684</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96152280/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96152280/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
>

--00000000000050f48805f2667d09--

