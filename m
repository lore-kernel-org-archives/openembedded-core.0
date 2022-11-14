Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA78CC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 09:39:08 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.3729.1668418739333881389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 01:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=amtgE5C4;
 spf=pass (domain: snapchat.com, ip: 209.85.167.173, mailfrom: ecordonnier@snapchat.com)
Received: by mail-oi1-f173.google.com with SMTP id h132so10853698oif.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 01:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UqxuvmkLUbDj+RFy2Uw3bHWxOkd/9wBROCf49l6m5YA=;
        b=amtgE5C4q59r+cTUgaVuS6Wy/yTtTNO7PFz7keZhrBWq9Ova3B9Wobb3Ob6K51SXnb
         t/hnivKx4QCpE6M1WEq4Pdna7ieGQvm64eKTnHroK8VtC4srX3APQKLNN8uajlVwVqVV
         LB8OichssNk1kWdgWfBUpQEhYUuTpfJP/OaQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqxuvmkLUbDj+RFy2Uw3bHWxOkd/9wBROCf49l6m5YA=;
        b=bdZeatAiyUC1CtB4hYirOMmhAd86HDgEXrDG87Gav0pyUu6fo706IT0D4CcuqAr7E+
         tUbRCltG9LWm+/m+WYX7WiHnY6aFMZc0xy43M/bYAKDkrTJ6qcd0H+eF5O6eOptvhVtz
         OFXSu1rideAM31R9Fc175vvI1bYHE6oUf1VvwF/n35c2+nmfOiJu5okdrxau8Mn1VLqg
         DJ5NxjmkWbbghHOKD9bS/ypDSJKr+7jGy/DKB+56MMEUSniY2///Og7LkEe/5vGu2FrP
         n+5Pm28C6vYH8LleDdnZ9iqXdZzEJVPGnGxlPtVV+DTHFslCw4KDd61z43F4kaSJqMb6
         +nmg==
X-Gm-Message-State: ANoB5pnHkFvY270ylxnXKN9iPoPQu0vl1w7Ulied4n20TCTaO7ONW2bs
	Y7DpHw+rTzgyIGQvjtCu+OO2Xz2YKo5Bxt12aCerRg==
X-Google-Smtp-Source: AA0mqf47rtmzA8xJuu/WMzyY57DU6KR2xUJ08jM11hVzAbPsDZtAWr0YozcC3CserfL/Mbjwy16/5+3z7tyJABt1MYI=
X-Received: by 2002:aca:2306:0:b0:35a:83c1:ce7 with SMTP id
 e6-20020aca2306000000b0035a83c10ce7mr5397821oie.107.1668418738437; Mon, 14
 Nov 2022 01:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20221107095119.965403-1-ecordonnier@snap.com> <935fefd6-3746-56f4-0f9e-21f3f505f629@bootlin.com>
In-Reply-To: <935fefd6-3746-56f4-0f9e-21f3f505f629@bootlin.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 14 Nov 2022 10:38:47 +0100
Message-ID: <CAHUKmYaBo4Gd3wPhte3TJ3yDucbjroK7kmrjst5HXi1x3cXS7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for nativesdk-binutils
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003def8d05ed6b0230"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 09:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173233

--0000000000003def8d05ed6b0230
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,
thanks for your reply and sorry about the wrong email. I changed the
configuration and added "sendemail.from" (I had used
sendemail.envelopesender previously). However this patch is already applied
to the master branch, so I didn't send an updated patch.

On Tue, Nov 8, 2022 at 11:36 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Etienne
>
> Many thanks for the patch!
>
> On 11/7/22 10:51, Etienne Cordonnier via lists.openembedded.org wrote:
> > This is useful e.g. when using meta-clang, which introduces a dependenc=
y
> to nativesdk-binutils when
> > populating the SDK, and then a full tarball of binutils is fetched
> additionally to a shallow tarball.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>
> However, there's a problem with the way your patches are received on the
> Yocto Project mailing lists though. I used to have it too.
>
> If I apply your patch through "git am", the author of the commit will be:
> Etienne Cordonnier via lists.openembedded.org
> <ecordonnier=3Dsnapchat.com@lists.openembedded.org>
> instead of
> Etienne Cordonnier <ecordonnier@snap.com>
>
> That's because of the configuration of the Yocto Project mailing lists,
> if I understood correctly.
>
> Because of this issue, the maintainer has to manually fix this field
> when accepting your patch. Worse, if he doesn't catch this, that's
> harder to fix afterwards.
>
> You should be able to fix this by running:
> git config --global sendemail.from "ecordonnier@snap.com"
>
> This should add a "From" field to the sent patch which "git am" should
> be able to match with your name.
> At least this worked for me. See
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.openembedded.o=
rg_wiki_How-5Fto-5Fsubmit-5Fa-5Fpatch-5Fto-5FOpenEmbedded-23Sending-5Fusing=
-5Fgit-2Dsend-2Demail&d=3DDwICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DOATWj9fV3DIgh3gSY=
x7h1yPhVJlnNDVyzQschgNMU_R_oANac6LSiRo7KudX_voS&s=3Du9CUuyjhy1CAiQqvOo0blFX=
DVHF2H69Kkre3Sm8ViaY&e=3D
>
> Could you try to send an update (don't hesitate to send a private one to
> me first)?
>
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&d=3DDw=
ICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DOATWj9fV3DIgh3gSYx7h1yPhVJlnNDVyzQschgNMU_R_o=
ANac6LSiRo7KudX_voS&s=3D33HzPwa4N8A8AGPjlZNOGbTWftq-kFhbFm3OVBa0QXw&e=3D
>
>

--0000000000003def8d05ed6b0230
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michael,<br>thanks for your reply and sorry about the=
=C2=A0wrong email. I changed the configuration and added &quot;sendemail.fr=
om&quot; (I had used sendemail.envelopesender previously). However this pat=
ch is already applied to the master branch, so I didn&#39;t send an updated=
 patch.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Nov 8, 2022 at 11:36 AM Michael Opdenacker &lt;<a href=3D"ma=
ilto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Etien=
ne<br>
<br>
Many thanks for the patch!<br>
<br>
On 11/7/22 10:51, Etienne Cordonnier via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; This is useful e.g. when using meta-clang, which introduces a dependen=
cy to nativesdk-binutils when<br>
&gt; populating the SDK, and then a full tarball of binutils is fetched add=
itionally to a shallow tarball.<br>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
However, there&#39;s a problem with the way your patches are received on th=
e <br>
Yocto Project mailing lists though. I used to have it too.<br>
<br>
If I apply your patch through &quot;git am&quot;, the author of the commit =
will be:<br>
Etienne Cordonnier via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> <br>
&lt;ecordonnier=3D<a href=3D"mailto:snapchat.com@lists.openembedded.org" ta=
rget=3D"_blank">snapchat.com@lists.openembedded.org</a>&gt;<br>
instead of<br>
Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_b=
lank">ecordonnier@snap.com</a>&gt;<br>
<br>
That&#39;s because of the configuration of the Yocto Project mailing lists,=
 <br>
if I understood correctly.<br>
<br>
Because of this issue, the maintainer has to manually fix this field <br>
when accepting your patch. Worse, if he doesn&#39;t catch this, that&#39;s =
<br>
harder to fix afterwards.<br>
<br>
You should be able to fix this by running:<br>
git config --global sendemail.from &quot;<a href=3D"mailto:ecordonnier@snap=
.com" target=3D"_blank">ecordonnier@snap.com</a>&quot;<br>
<br>
This should add a &quot;From&quot; field to the sent patch which &quot;git =
am&quot; should <br>
be able to match with your name.<br>
At least this worked for me. See <br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.opene=
mbedded.org_wiki_How-5Fto-5Fsubmit-5Fa-5Fpatch-5Fto-5FOpenEmbedded-23Sendin=
g-5Fusing-5Fgit-2Dsend-2Demail&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_=
4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
amp;m=3DOATWj9fV3DIgh3gSYx7h1yPhVJlnNDVyzQschgNMU_R_oANac6LSiRo7KudX_voS&am=
p;s=3Du9CUuyjhy1CAiQqvOo0blFXDVHF2H69Kkre3Sm8ViaY&amp;e=3D" rel=3D"noreferr=
er" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__www.openembedded.org_wiki_How-5Fto-5Fsubmit-5Fa-5Fpatch-5Fto-5FOpenEmbedd=
ed-23Sending-5Fusing-5Fgit-2Dsend-2Demail&amp;d=3DDwICaQ&amp;c=3DncDTmphkJT=
vjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKU=
kSGa66m67E&amp;m=3DOATWj9fV3DIgh3gSYx7h1yPhVJlnNDVyzQschgNMU_R_oANac6LSiRo7=
KudX_voS&amp;s=3Du9CUuyjhy1CAiQqvOo0blFXDVHF2H69Kkre3Sm8ViaY&amp;e=3D</a> <=
br>
<br>
Could you try to send an update (don&#39;t hesitate to send a private one t=
o <br>
me first)?<br>
<br>
Thanks in advance<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.c=
om&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DOATWj9fV3DIgh3gSYx7h=
1yPhVJlnNDVyzQschgNMU_R_oANac6LSiRo7KudX_voS&amp;s=3D33HzPwa4N8A8AGPjlZNOGb=
TWftq-kFhbFm3OVBa0QXw&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&amp;d=3DDwICaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DOATWj9fV3DIgh3gSYx7h1yPhVJlnNDVyzQsch=
gNMU_R_oANac6LSiRo7KudX_voS&amp;s=3D33HzPwa4N8A8AGPjlZNOGbTWftq-kFhbFm3OVBa=
0QXw&amp;e=3D</a> <br>
<br>
</blockquote></div>

--0000000000003def8d05ed6b0230--

