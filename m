Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25384C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:24:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.9427.1635326685507628276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VhBSgi/M;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id u11so4848072lfs.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bivSU8FTZ9jTz/JfjL/5nhaEBGGuEtVNRT9w0MSa8z4=;
        b=VhBSgi/MLDofLOocesk2hPEECoYzysZH4ENxhF7imw4YUAi2Xl5JxCcqvripQNP4zr
         nBfI3GYiA/tiwo3t/FjzU0wl8J9vB+Sy4Yh63w/A/0h2imtv34HwnuDR4BynHGzO+7kK
         onMPfkKx/2HFcT5F30tVaJny6sU9n8jIPPhcdxFKoQvsQOpJl8tNkntlAnlu3iZaApsp
         gE70IBE7iNRe5xZd2g/iNB1e41KzKWfRXK5znBonzkaITGf6qv0709YcsRKsJZpMh+Dc
         iJxGdQGhMj3ZNoiTFgRcZeD60kk/2LB9kZmNZVXxieBQkUFKRNvI3NSXZZ6B4pAq9Dq5
         YFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bivSU8FTZ9jTz/JfjL/5nhaEBGGuEtVNRT9w0MSa8z4=;
        b=MgeY69uDpMwG1UnfZ5FqxvLBXFVqifnwhOZnl0oQ9ZXe1RMCpc/vMLmlBtAPPdblx6
         dM+GpsJvQHwWyRKFvvRdWSvm0SKqZfPhyf4yVY4iTBUg8asrXiec8g66744w2D42h5p6
         s17RtsWyhNxAEW04xaYsyu4cDkL1G8ob/pvIFGP2XZNTmVgFbF8sYVnDuVm/oetZexF3
         j83chxQzSQ574yf9s3JErDHBscygOYodI5buMH1athIgeA9R4CNB2tl6RCLEr75qH6Mi
         uRe2RiTd5Rsd1b7KRFxTKVGPrQ0/vcatP6oOsszrgdqIcKy8UbOJqkVzv2fchl3MiuiD
         CaZw==
X-Gm-Message-State: AOAM5314kGSihMsobZDYw4i0CR3VNzR5wIOF5bj6ojo92999ioUmho2A
	sv0o3HAbwKdb4RLP8tRIO8z60bUyxgEb/8fSKi0=
X-Google-Smtp-Source: 
 ABdhPJzrJJ1uUda2CfdztkqeooCr8wabo9mkQOpAfBUy21ewVhu2ypJDlFTeiYdB+1nHO/BRm5cwmVAaytgIXiFekZ0=
X-Received: by 2002:a05:6512:36d3:: with SMTP id
 e19mr28804974lfs.94.1635326683638;
 Wed, 27 Oct 2021 02:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211027091252.5781-1-jay.shen.teoh@intel.com>
In-Reply-To: <20211027091252.5781-1-jay.shen.teoh@intel.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 27 Oct 2021 10:24:33 +0100
Message-ID: 
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000011f08b05cf522a1c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157508

--00000000000011f08b05cf522a1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia quarta, 27/10/2021
=C3=A0(s) 10:12:

> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>
> Add the following line to common_errors list.
>
>   [drm] Cannot find any crtc or sizes
>
> This message is not harmful, it extended the coverage for drm error
> message.
>
> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
> b/meta/lib/oeqa/runtime/cases/parselogs.py
> index 2b8893d842..96da0b4f5c 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -32,6 +32,7 @@ common_errors =3D [
>      "Failed to load module \"fbdev\"",
>      "Failed to load module fbdev",
>      "Failed to load module glx",
> +    "[drm] Cannot find any crtc or sizes",
>      "[drm] Cannot find any crtc or sizes - going 1024x768",
>

I think this one ^ can be removed


>      "_OSC failed (AE_NOT_FOUND); disabling ASPM",
>      "Open ACPI failed (/var/run/acpid.socket) (No such file or
> directory)",
> --
> 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157507):
> https://lists.openembedded.org/g/openembedded-core/message/157507
> Mute This Topic: https://lists.openembedded.org/mt/86623483/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000011f08b05cf522a1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Teoh, Jay Shen &lt;<a href=3D"mailto:=
jay.shen.teoh@intel.com">jay.shen.teoh@intel.com</a>&gt; escreveu no dia qu=
arta, 27/10/2021 =C3=A0(s) 10:12:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@i=
ntel.com" target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
<br>
Add the following line to common_errors list.<br>
<br>
=C2=A0 [drm] Cannot find any crtc or sizes<br>
<br>
This message is not harmful, it extended the coverage for drm error message=
.<br>
<br>
Signed-off-by: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com"=
 target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/parselogs.py | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runti=
me/cases/parselogs.py<br>
index 2b8893d842..96da0b4f5c 100644<br>
--- a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
@@ -32,6 +32,7 @@ common_errors =3D [<br>
=C2=A0 =C2=A0 =C2=A0&quot;Failed to load module \&quot;fbdev\&quot;&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0&quot;Failed to load module fbdev&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;Failed to load module glx&quot;,<br>
+=C2=A0 =C2=A0 &quot;[drm] Cannot find any crtc or sizes&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;[drm] Cannot find any crtc or sizes - going 1024x=
768&quot;,<br></blockquote><div><br></div><div>I think this one ^ can be re=
moved</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
=C2=A0 =C2=A0 =C2=A0&quot;_OSC failed (AE_NOT_FOUND); disabling ASPM&quot;,=
<br>
=C2=A0 =C2=A0 =C2=A0&quot;Open ACPI failed (/var/run/acpid.socket) (No such=
 file or directory)&quot;,<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157507): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157507" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157507</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86623483/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86623483/5052612</a><br>
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
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000011f08b05cf522a1c--

