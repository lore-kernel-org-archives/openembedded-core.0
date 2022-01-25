Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3158C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 15:10:23 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.8345.1643123422926102664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qZm9hxQ7;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id b37so20235265uad.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DBq4BQAttruMPgGugjnNLAjUe0dGui6QVmar47JCqTE=;
        b=qZm9hxQ7pIVElqle8iKeQ1hVV4oTxSozwhblYU3C160LtxcfC7lcz7/qxvzgHNkuHP
         AKetBaPYhHlqd/ACGLT/Jgg8AtHjDGAL5fm3DSfZ3TNHiV2yJk0YIbpUsZ3HCnAiM13B
         9rIWEEuSzJlIn1T2lserV3AbE2R811IePPVkvGVqMjKBJrC9wTU+jLKM/NluRoaiMRlI
         ioGmxnmewdfUc0HXs1roWAaEfIndbIKYFGuOGxXwXRhoOAW3S+i9LObEmWNzzedowigf
         B7buG6hklFdFgRDfv3Dh7wua7UvonlVXYMVf6I9ziY1J4kwiuaKMjK+/+mEijq+2Pglp
         wg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DBq4BQAttruMPgGugjnNLAjUe0dGui6QVmar47JCqTE=;
        b=KaYAfgyRk/ZB00FDL25sSqouMU7t98mwTWQLooOBTWoF96TN4TJen2kopllEZG/1uu
         pVU8aBV1G4CUbkgHwWQ0fBjTXOoBh0nKi1iekZSNkdrX8ZrTc59Vy0Rlz3FeXyVoFRtH
         cqKdB4nR/EYdSOVqerpWOJRkksQ/nC6pczT9NCsvvMsuVTj5cpP9q0F083RspvczktvK
         IO7rx52mNdMSdhAROOCl6jVk820+hvxHbSmANBFSpjhouKeqsH9/IX24BzO11pnviw3A
         SdQ6b1RNREKqRV/6awWSgPOX07zzDzvZifwKRPPjGYBrOaCl7c71GTYeR1nVM3BPijC6
         CMHQ==
X-Gm-Message-State: AOAM531F2FK3MXdZ2E1hNt7OYYah4VoExbW/klEWcb+NgqPhRnXtPnb0
	ScdcdD6xKxsv3NJGfEy573k7WgiE26FaasWEjpQ=
X-Google-Smtp-Source: 
 ABdhPJzdXLuT3c2uxoL2+W3BeDzfb+kSE+KmdN5WraV/eLulhou5VyvTsuRzs704+ZPFCKqtREo+bl3/2AtqREI/HNc=
X-Received: by 2002:a67:d90a:: with SMTP id t10mr2844759vsj.42.1643123421887;
 Tue, 25 Jan 2022 07:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20220124181156.3921311-1-ross.burton@arm.com>
 <20220124181156.3921311-2-ross.burton@arm.com>
In-Reply-To: <20220124181156.3921311-2-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jan 2022 16:10:10 +0100
Message-ID: 
 <CANNYZj9b+1BgqGEtqyjiY7JFmh0moHweEN9O1Qj8iv90NNd8pA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato-sdk: allocate more memory
 when in qemu
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e241b905d6697b43"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 15:10:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160939

--000000000000e241b905d6697b43
Content-Type: text/plain; charset="UTF-8"

Seems to not work on arm(32):

Central error: [    5.282955] vmap allocation for size 1052672 failed:
use vmalloc=<size> to increase size

https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3528/steps/13/logs/stdio

Alex


On Mon, 24 Jan 2022 at 19:12, Ross Burton <ross@burtonini.com> wrote:

> Compiling code is memory-intensive, especially kernel modules like the
> SystemTap probes, so give the VM 1GB of RAM.
>
> Hopefully this solves the intermittent failures caused by OOMs during
> the SystemTap test.
>
> [ YOCTO #14673 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
> b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index b52de0def02..7df8d00971c 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -10,3 +10,6 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>
>  IMAGE_INSTALL += "kernel-devsrc"
>
> +# Compiling stuff, specifically SystemTap probes, can require lots of
> memory
> +# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14673
> +QB_MEM = '-m 1024'
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160890):
> https://lists.openembedded.org/g/openembedded-core/message/160890
> Mute This Topic: https://lists.openembedded.org/mt/88653349/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e241b905d6697b43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems to not work on arm(32):</div><div><pre class=3D=
"gmail-row gmail-log" style=3D"height:926.317px;overflow-y:auto;display:blo=
ck"><span class=3D"gmail-ng-scope"><div style=3D"height:18px"><span style=
=3D"font-family:arial,sans-serif"><span class=3D"gmail-no-wrap gmail-log_o =
gmail-ng-binding"><span class=3D"gmail-">Central error: [    5.282955] vmap=
 allocation for size 1052672 failed: use vmalloc=3D&lt;size&gt; to increase=
 size</span></span></span></div><div style=3D"height:18px"><span class=3D"g=
mail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-"><br></spa=
n></span></div><div style=3D"height:18px"><span style=3D"font-family:arial,=
sans-serif"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><spa=
n class=3D"gmail-"><a href=3D"https://autobuilder.yoctoproject.org/typhoon/=
#/builders/110/builds/3528/steps/13/logs/stdio">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/110/builds/3528/steps/13/logs/stdio</a></span>=
</span></span></div><div style=3D"height:18px"><span style=3D"font-family:a=
rial,sans-serif"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"=
><span class=3D"gmail-"><br></span></span></span></div><div style=3D"height=
:18px"><span style=3D"font-family:arial,sans-serif"><span class=3D"gmail-no=
-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">Alex<br></span><=
/span></span></div></span></pre></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Jan 2022 at 19:12, Ross Bu=
rton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Compiling =
code is memory-intensive, especially kernel modules like the<br>
SystemTap probes, so give the VM 1GB of RAM.<br>
<br>
Hopefully this solves the intermittent failures caused by OOMs during<br>
the SystemTap test.<br>
<br>
[ YOCTO #14673 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk=
.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a> b/meta=
/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" rel=3D"noref=
errer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
index b52de0def02..7df8d00971c 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
@@ -10,3 +10,6 @@ IMAGE_FEATURES +=3D &quot;dev-pkgs tools-sdk \<br>
<br>
=C2=A0IMAGE_INSTALL +=3D &quot;kernel-devsrc&quot;<br>
<br>
+# Compiling stuff, specifically SystemTap probes, can require lots of memo=
ry<br>
+# See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14673=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D14673</a><br>
+QB_MEM =3D &#39;-m 1024&#39;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160890" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88653349/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88653349/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e241b905d6697b43--

