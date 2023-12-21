Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46152C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 21:51:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.5824.1703195452338836884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 13:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=axWgW228;
 spf=pass (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2330a92ae6so161346866b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 13:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1703195451; x=1703800251; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oEUzgv76qYU1NoS7TP1v+s0n5hjpkchu/MNrC2cTeCc=;
        b=axWgW228rw9I3xqamRGvIhtqNuK3tzskciMWlYDAJK6ZUi/dwK7l9+eihDdWXuDUYP
         cyeU0z+KQ1Se9NlsOlGuHqx1OX+fwGjYltUQUGhebHa/adWYo/1YNYBr98XA6z0mE6iH
         XvQ8tz8ECCyovTeExR2iISkbJE86RR/Vb1QrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703195451; x=1703800251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEUzgv76qYU1NoS7TP1v+s0n5hjpkchu/MNrC2cTeCc=;
        b=lFp3b1F8EtH5pAknbHNuch/wkMLJW6R1DBxZHPWdBsIoh7/+2KaWOaucx5BOYSt3Iy
         wZcu+r8KHI0sS868R+Ts6Hwo+Oc91p+HU4rQRKHlk356BSycVK6oY1IJDbEXkICXqv4C
         oUGX1ABLV8g/Bdx5youtK3VKQFD6Q+hCYYWeJN3T+1kMOk//jkwKPOGO8gmv1UQpdJWH
         L0RjGC+hiRnLAx+Y6JskpbcpZoGaT9aMf5bTwztSpRJUo92CjYfIhqql2r0j9iU1wdD7
         DZCOVvO/v/yKN37P4UsgIWzZkcGzQ6lMPbcASgorMPh0bsPvJNFbOOY/bETCfcDs79I5
         uTPw==
X-Gm-Message-State: AOJu0Yz1RFpxvTeBg+8t/Wp2YsVUiWnLUntcUmTceQr7glDrq1ute4w2
	aJCk+2l61brUh0N7Fd1kDqTC4mMiKBV1cEgq7MNvtbnqZ0xjfQ==
X-Google-Smtp-Source: AGHT+IGEzDvWpp0Xhc9cXUaEpHEq8j6kDRahzBe25MdlkJ53/r5XmFWPq8SMPlcwCAt3swBVB4vCdoHSPJz5I0HDspo=
X-Received: by 2002:a17:907:2d8b:b0:a26:a5fe:d67d with SMTP id
 gt11-20020a1709072d8b00b00a26a5fed67dmr329371ejc.136.1703195450586; Thu, 21
 Dec 2023 13:50:50 -0800 (PST)
MIME-Version: 1.0
References: <17A2F72F5D272934.28089@lists.openembedded.org>
In-Reply-To: <17A2F72F5D272934.28089@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 21 Dec 2023 22:50:39 +0100
Message-ID: <CAHUKmYbFxWSV5X3tvmUrhjA_EqOgmof76Q79p-EiNiCqH08CZw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0d26d060d0c1757"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 21:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192851

--000000000000d0d26d060d0c1757
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

patch v5: added ignore_dangling_symlinks to avoid error when linux sources
contain dangling symlinks

On Thu, Dec 21, 2023 at 10:49=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The function do_symlink_kernsrc is not reentrant in the case where S is
> defined
> to a non-default value. This causes build-failures e.g. when building
> linux-yocto, then updating
> poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
>
> Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctopro=
ject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Deo=
9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=3De9FG4cG4=
GbLjCy8loEN6qVisSUax4Ngvd_Ok8TPonvY&e=3D>
>
> Tested with a recipe "my-custom-linux" which unpacks sources to a custom
> ${S} directory
> and ran symlink_kernsrc several times:
> $ bitbake -f -c symlink_kernsrc my-custom-linux
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 9ff37f5c38..45b63f1fa1 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
>              # drop trailing slash, so that os.symlink(kernsrc, s) doesn'=
t
> use s as
>              # directory name and fail
>              s =3D s[:-1]
> -        if d.getVar("EXTERNALSRC"):
> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
>              # With EXTERNALSRC S will not be wiped so we can symlink to =
it
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            # perform idempotent/reentrant copy
> +            s_copy =3D s + ".orig"
> +            if not os.path.isdir(s_copy):
> +                shutil.copytree(s, s_copy, ignore_dangling_symlinks=3DTr=
ue)
> +            bb.utils.remove(s, recurse=3DTrue)
> +            shutil.copytree(s_copy, s, ignore_dangling_symlinks=3DTrue)
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> --
> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192850):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192850&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=3DnSj=
1eesCBnUi3mKI3TDrQr4rYtnlCUqYquM2YdP3kwc&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103308574_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Deo9dzHi2uXPV1=
dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=3Dxqoor0ld3IbCh7N9Dby=
l9PAlnSZbl2j66iPA0PYKAl0&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Deo9dzH=
i2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=3DcvRKeVUNWw1O=
0f_mV9dU_qkoh5ifOuu8pqC7Wg81hSg&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d0d26d060d0c1757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">patch v5: added ignore_dangling_symlinks to avoid error wh=
en linux sources contain dangling symlinks</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 21, 2023 at 10:49=E2=
=80=AFPM Etienne Cordonnier via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@list=
s.openembedded.org">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">From: E=
tienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_bl=
ank">ecordonnier@snap.com</a>&gt;<br><br>The function do_symlink_kernsrc is=
 not reentrant in the case where S is defined<br>to a non-default value. Th=
is causes build-failures e.g. when building linux-yocto, then updating<br>p=
oky to a commit which modifies kernel.bbclass, and then building linux-yoct=
o again.<br><br>Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;=
d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoD=
iG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3De9FG4cG4GbLjCy8loEN6qVisSUax4=
Ngvd_Ok8TPonvY&amp;e=3D" target=3D"_blank">https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D15325</a><br><br>Tested with a recipe &quot;my-custom-l=
inux&quot; which unpacks sources to a custom ${S} directory<br>and ran syml=
ink_kernsrc several times:<br>$ bitbake -f -c symlink_kernsrc my-custom-lin=
ux<br><br>Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonni=
er@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>---<br>=C2=
=A0meta/classes-recipe/kernel.bbclass | 8 +++++++-<br>=C2=A01 file changed,=
 7 insertions(+), 1 deletion(-)<br><br>diff --git a/meta/classes-recipe/ker=
nel.bbclass b/meta/classes-recipe/kernel.bbclass<br>index 9ff37f5c38..45b63=
f1fa1 100644<br>--- a/meta/classes-recipe/kernel.bbclass<br>+++ b/meta/clas=
ses-recipe/kernel.bbclass<br>@@ -189,11 +189,17 @@ python do_symlink_kernsr=
c () {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# drop trailing s=
lash, so that os.symlink(kernsrc, s) doesn&#39;t use s as<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# directory name and fail<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D s[:-1]<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if d.getVar(&quot;EXTERNALSRC&quot;):<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if d.getVar(&quot;EXTERNALSRC&quot;) and not os.path.islink(s):<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# With EXTERNALSRC S will n=
ot be wiped so we can symlink to it<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0os.symlink(s, kernsrc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0el=
se:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import shutil<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# perform idempotent/reentrant cop=
y<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s_copy =3D s + &quot;.orig&=
quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.isdir(s_=
copy):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.c=
opytree(s, s_copy, ignore_dangling_symlinks=3DTrue)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(s, recurse=3DTrue)<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(s_copy, s, ignore_dangling_s=
ymlinks=3DTrue)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.m=
ove(s, kernsrc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symli=
nk(kernsrc, s)<br>=C2=A0}<br>-- <br>2.34.1<br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192850): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
2850&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4=
GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3DnSj1eesCBnUi3mKI3TDr=
Qr4rYtnlCUqYquM2YdP3kwc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_192850&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9=
BN&amp;s=3DnSj1eesCBnUi3mKI3TDrQr4rYtnlCUqYquM2YdP3kwc&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103308574_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U=
1d0O2JxX3PprS_T9BN&amp;s=3Dxqoor0ld3IbCh7N9Dbyl9PAlnSZbl2j66iPA0PYKAl0&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103308574_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2T=
TF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3Dxqoor0ld3IbCh7N9Dbyl9PAlnSZbl2j66=
iPA0PYKAl0&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__Swn=
F1U1d0O2JxX3PprS_T9BN&amp;s=3DcvRKeVUNWw1O0f_mV9dU_qkoh5ifOuu8pqC7Wg81hSg&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4Go=
A6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3DcvRKeVUNWw1O0f_mV9dU_q=
koh5ifOuu8pqC7Wg81hSg&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d0d26d060d0c1757--

