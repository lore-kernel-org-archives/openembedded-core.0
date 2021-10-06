Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A961C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 08:46:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.9046.1633509988970993330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 01:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AZMFoGgV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b20so7358702lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XJkDMf6jJ1aEXEFVetD8q86K5QGJN70VH96DYkvuhI=;
        b=AZMFoGgVcJjeiOnrHSVt5AfJ/TKr29945HJ49secMmsQJQHAF8k0ztXMn+fzSOG6hA
         hPq2ZAuWQqH0f1k/MskonGDGwUmwiRrrMXFnCXe0ZyQXiim1KCfUt4NrZ/kMoegsxl4/
         KzlMUBWFzj4UsvOE+jW7J7LCHBXIlzdu+ceOx3+q3Ick4xh+CdYxuBQre15BNK+cEWIR
         isOtVjMRHwocJScoIX5iEj7Hu/JB6GoTqXPG0wE4x/9jLbUPhWIRKc40oKVpe9RH/ma7
         YZfUSBVEly0qGqdC7f0I1FGBdaYgyQO00FFXjzQeT+Fhi8BeyyJ3WPvmAZ6ZTFwFnjfp
         x1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XJkDMf6jJ1aEXEFVetD8q86K5QGJN70VH96DYkvuhI=;
        b=j1WZ2GCH6iNem3Br0+JtN3rcw0k+CdwVCSGM9IvHRcz5Ij5FHywbbBux0/4koPZkl8
         A85kg4s2KGTQ3xQe/+gFub+fN/mlI99uBsrh9v0p7rAdN2BPnRKGJsaSw9keZn/RdmgH
         1ZRY1kQFcl91yU7U0g/pSDjLzaQVop2fIuiLrJrNMgPmCLQaSguo2rZQZrbqUON9ry/4
         AiVWtGTrJS6vZtEv3uOxltVVj26NL2sAMyjbpYy/xZdtHdpyDGniYU7WMd9GshaDJ90+
         cnwDEQgq0D7AjwajT/xGLEPJZnoVrnlZ6rfeb4Ec2Ta9Dd/Jd9BHIv95fOrzgosyKIIQ
         Qdrg==
X-Gm-Message-State: AOAM530PJTwz8TrWouh/HSX07EgWbwmAZzrBQev6BywSbt/+X4F/zSLS
	i1zkJG8iXTrLKrSeQ9WItes/VnaWJkBbvUjt+KQ=
X-Google-Smtp-Source: 
 ABdhPJy2pZj43A4+KkL/w+uP6qIYKYNMLI4eS+tdC/1e6Y2nyqk/JUewXnY+95z/maa2xwqBmB3EIZx3nQXgjgnfADE=
X-Received: by 2002:ac2:4f01:: with SMTP id k1mr8329356lfr.94.1633509986927;
 Wed, 06 Oct 2021 01:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
 <6bf351545a8bf21fff5c00ff1ed8978b475f05d4.1633478971.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <6bf351545a8bf21fff5c00ff1ed8978b475f05d4.1633478971.git.bruce.ashfield@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 6 Oct 2021 09:46:15 +0100
Message-ID: 
 <CANPvuRnBLLeOOhurA9r5ihC_epZuESynEauXRe7PoUePa6dfWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] kernel-yocto: don't apply config metadata
 patches twice
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000082089605cdab2e3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 08:46:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156676

--00000000000082089605cdab2e3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quarta, 6/10/2021
=C3=A0(s) 01:12:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 549dfd97a4..1d5a8cdf29 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -36,7 +36,10 @@ def find_patches(d,subdir):
>              if subdir =3D=3D patchdir:
>                  patch_list.append(local)
>          else:
> -            patch_list.append(local)
> +            # skip the patch if a patchdir was supplied, it won't be
> handled
> +            # properly
> +            if not patchdir:
> +                patch_list.append(local)
>

I think that will be useful to have a warning there when the patchdir was
supplied

Jose


>      return patch_list
>
> --
> 2.19.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156667):
> https://lists.openembedded.org/g/openembedded-core/message/156667
> Mute This Topic: https://lists.openembedded.org/mt/86108495/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000082089605cdab2e3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Bruce,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escre=
veu no dia quarta, 6/10/2021 =C3=A0(s) 01:12:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index 549dfd97a4..1d5a8cdf29 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -36,7 +36,10 @@ def find_patches(d,subdir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if subdir =3D=3D patchdir:<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch_list.ap=
pend(local)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_list.append(local)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # skip the patch if a patchdir w=
as supplied, it won&#39;t be handled<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # properly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not patchdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_list.append(=
local)<br></blockquote><div><br></div><div>I think that will be useful to h=
ave a warning there when the patchdir was supplied</div><div><br></div><div=
>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
=C2=A0 =C2=A0 =C2=A0return patch_list<br>
<br>
-- <br>
2.19.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156667): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156667" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156667</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86108495/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86108495/5052612</a><br>
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

--00000000000082089605cdab2e3b--

