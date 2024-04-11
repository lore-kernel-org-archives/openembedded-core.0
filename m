Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E1EC10F10
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 13:20:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.17833.1712841656473653916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 06:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TD4NK2yw;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e3ca546d40so47780915ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712841656; x=1713446456; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lWbdkLhQekLepc2SZM3iOsl5x7bslNo9fxIrTKWbByI=;
        b=TD4NK2ywgQzY8iT7ugaaurn8E9BOUa2lr2lLxIXcp1HXUut0VrpKKkti0kddQsHj4Y
         kOiLzlN6mJ+B7IkgRcg4gOwyQiMEorcvzshiodpKcCTGaj2sVL+kU+Wt+l/X+s/5977B
         gU9+mDUtH6xRvtDOMZMuxVZs798D6up9++Kat8xvzSeLDIMqaZNu7gsldru5PmP3Niut
         glORgFNWUpcdAc0w/rE5Au712fabunpBSazm+s6tTQuyUao/6yHmjoRIK3Rmjqs9k/gV
         QNenMK2VMzljI+jNVFlSX+flWsy9dygXseJhroXE14S93ntwe6oelNVSBbkPTid+xL06
         HmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712841656; x=1713446456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWbdkLhQekLepc2SZM3iOsl5x7bslNo9fxIrTKWbByI=;
        b=fwVWKJBeI52rdADpeB1ALUx3UEvVWnZULNTP8vELtq4DybNs+/Nm43/gEk6l9ACKlH
         c2clpPfDVW0NkjTioHKGBYUDGCVCTPdjJc6mpedydV0ciUnMyTaIAPYtGa1uqq8GowyJ
         c0Zv+J2qQVStsuktYxP+l/o74iF/65DlBm6GVH7FxgsMSAFXXXfVe8AbcN5S84BBM/UR
         Qk91CTTnf+1dwDWvcGAtIuOEDPmnOWIJO9NrWl9Wt6magg7Ie4CderMMq7Q5V4ghijVd
         zk0RJ8lhW+kGEdKkN6SS5zGzuR5A4xHCrUVXkd4MGJ3IxMAZ2/+jBxfTc0ZTOKwHnPgE
         k63Q==
X-Gm-Message-State: AOJu0Yw4b4dfTKbIGLee4yaxQNDXyjs+JFev1wasTA2HnNGd28WbShYJ
	cyFHzecf9aoFYJ3Lw5rUQ5a5pZfKr9HxzGV9+Fn7UT8He5JR/iQIAAKXuHHQ9gWUG7/NXPuOvN4
	6OgmkIkFEebFtGb9sEYfTGrhrwVk=
X-Google-Smtp-Source: AGHT+IGpl2y1etgBE4PXjH3ma1AV2LdxHhlQRiqtOOSl68y/8J4B0y6+DS7dXaG9WOHu4QLOFHUVC2GLCorM708N2qk=
X-Received: by 2002:a17:902:f64b:b0:1e2:7916:6b7a with SMTP id
 m11-20020a170902f64b00b001e279166b7amr5533659plg.6.1712841655751; Thu, 11 Apr
 2024 06:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240410231243.2363935-1-raj.khem@gmail.com>
In-Reply-To: <20240410231243.2363935-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Apr 2024 09:20:44 -0400
Message-ID: <CADkTA4NFrUYM3brHAG_kpGaUY9h5rRw+cA=3o5Lz1Z-rg68gLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Enable nft modules for ptest images
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000729f370615d20614"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 13:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198128

--000000000000729f370615d20614
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No concerns here. The Wind River team has been sending updates to
that fragment for some time to get better ptest results.

So enabling it this way is fine with me.

Cheers,

Bruce

On Wed, Apr 10, 2024 at 7:12=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> nftables ptests need it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> index 1c03e22c3cb..e8e84f8f788 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -64,7 +64,7 @@ KERNEL_FEATURES:append:qemuall=3D" cfg/virtio.scc
> features/drm-bochs/drm-bochs.scc
>  KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
",
> " cfg/x32.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc",
> "", d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198109):
> https://lists.openembedded.org/g/openembedded-core/message/198109
> Mute This Topic: https://lists.openembedded.org/mt/105453044/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000729f370615d20614
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">No concerns here. The Wind River team has been sending update=
s to</div><div class=3D"gmail_default" style=3D"font-size:small">that fragm=
ent for some time to get better ptest results.=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">So enabling it this way is fine with me.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Apr 10, 2024 at 7:12=E2=80=AFPM Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">nftables ptest=
s need it<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_6.6.bb</a><br>
index 1c03e22c3cb..e8e84f8f788 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a><br>
@@ -64,7 +64,7 @@ KERNEL_FEATURES:append:qemuall=3D&quot; cfg/virtio.scc fe=
atures/drm-bochs/drm-bochs.scc<br>
=C2=A0KERNEL_FEATURES:append:qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
=C2=A0KERNEL_FEATURES:append:qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot;, d)}&=
quot;<br>
-KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;, &qu=
ot;&quot;, d)}&quot;<br>
+KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc features/n=
f_tables/nft_test.scc&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_F=
EATURES&quot;, &quot;ptest&quot;, &quot; features/gpio/mockup.scc features/=
gpio/sim.scc&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0KERNEL_FEATURES:append:powerpc =3D&quot; arch/powerpc/powerpc-debug.s=
cc&quot;<br>
=C2=A0KERNEL_FEATURES:append:powerpc64 =3D&quot; arch/powerpc/powerpc-debug=
.scc&quot;<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198109): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198109" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198109</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105453044/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105453044/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000729f370615d20614--

