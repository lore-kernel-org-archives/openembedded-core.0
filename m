Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517ACECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 08:01:45 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.3760.1666944102839626046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 01:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=ELmuirz1;
 spf=pass (domain: snapchat.com, ip: 209.85.167.170, mailfrom: ecordonnier@snapchat.com)
Received: by mail-oi1-f170.google.com with SMTP id r83so5419390oih.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AxdUYD7zgCVI0hWGw5onnVG3MvTI2UlMGxj6i+nD/k8=;
        b=ELmuirz156qL43WIA6bMQ5D8Gq/BASGMiQlOWYBNWuPMFKPZcnK4b43TFmZyQep2Wa
         ljigUi+VBxxnPbm7jer34eOaRfE1TjkiPDRUt4bahAwzz7fx+Rwo/944lR2jelJpBbaZ
         Me8hrgsV4F7BTzzb/9BwIxNjfIDmydjVzNGpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxdUYD7zgCVI0hWGw5onnVG3MvTI2UlMGxj6i+nD/k8=;
        b=b9R0j/4ZJl2jAVvgMui4vJh7FiBQH7LnSeQOPvm58XF2kmzvw4BqPCrMT7t/9SA2bQ
         /adXShdVjhOsR3Wg6G88Bh0hCvZQ+ty+K9CA07vHqCBNwum21XeS8uDLZW4MVgIXP6z9
         8hRw/Ye1oV7jY4F2u2JQgdhNr4lT2zNBmVXahPb/aafgv01IKZN1vnWY5dD0MIlhCHi/
         O1Qd/EbAqOuPKUytEEVFs5NYxhzLNeCGKTseDhFbcAK0iNNM/8KnIYqIWM05yJPziNx+
         NQuWAsDKjSe8B5Ryjcu3rSZm6tE1pn6ZiGTfk+a20HGmzGeJbD4shjRUUuSMeurGg2VZ
         tqqA==
X-Gm-Message-State: ACrzQf2mAi5pjm6q4rKcZ0DvYVsRFiqU1hmhm+bd/uV48VL7pRgwRGVj
	wRRmpFZ5uzm8R5Em4ZneVNAXN0nkPyUlrPwnSKkdvQ==
X-Google-Smtp-Source: AMsMyM4s35l14B/gNC6r6lLoeo9JgK1NhFDW9T5doQ4NQQBxUg9W4WoMZzedmvgC3SySBB6Tv2cwVH7XhciZ+/ms+bA=
X-Received: by 2002:a05:6808:114a:b0:357:7649:d26f with SMTP id
 u10-20020a056808114a00b003577649d26fmr7176153oiu.111.1666944101761; Fri, 28
 Oct 2022 01:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <1721EF56935912B7.550@lists.openembedded.org> <CAHUKmYbuyn_WayncEW1kvUorpf3L5kQrWvx_1YXQXw85qd+rxg@mail.gmail.com>
 <6f888c8b7e63a706f9e04fc81acf2098c0e781d5.camel@linuxfoundation.org>
In-Reply-To: <6f888c8b7e63a706f9e04fc81acf2098c0e781d5.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snapchat.com>
Date: Fri, 28 Oct 2022 10:01:30 +0200
Message-ID: <CAHUKmYYWdNArOiimBW1ipnDSFKH0oMiU2OLx+Re9=7kQbXUpQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for binutils-native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="0000000000000beaeb05ec13abd9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 08:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172238

--0000000000000beaeb05ec13abd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, I've sent an updated version of the patch.

On Thu, Oct 27, 2022 at 5:56 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-10-27 at 15:24 +0200, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > To give some context: this is useful e.g. when using meta-clang,
> > because this introduces a dependency to binutils-native, and then a
> > full tarball of binutils is fetched additionally to a shallow
> > tarball. The original BB_GIT_SHALLOW lines were added because
> > of
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.mail-2Darchive=
.com_yocto-40lists.yoctoproject.org_msg08752&d=3DDwIFaQ&c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67=
E&m=3DnVObLY1dvBCdprETjd0dKD8MywPxPwPFOo2S3xaOrsbb9PBXwmUmg4KNC7LrAWKz&s=3D=
3NQJjTvA0JYUgctkXdw4Z-Ugu7WmncIYVzdA7CbEl3o&e=3D
> > .html
>
>
> Rather than replying to the patch, this information should be in the
> original commit! :)
>
> Can you resend with that included please.
>
> Cheers,
>
> Richard
>

--0000000000000beaeb05ec13abd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, I&#39;ve sent an updated version of the patch.<br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Oct 27, 2022 at 5:56 PM Richard Purdie &lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio=
n.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, 2022-10-27 at 15:24 +0200, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; To give some context: this is useful e.g. when using meta-clang,<br>
&gt; because this introduces a dependency to binutils-native, and then a<br=
>
&gt; full tarball of binutils is fetched additionally to a shallow<br>
&gt; tarball. The original BB_GIT_SHALLOW lines were added because<br>
&gt; of=C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__www.mail-2Darchive.com_yocto-40lists.yoctoproject.org_msg08752&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DnVObLY1dvBCdprETjd0dKD8MywPxPwP=
FOo2S3xaOrsbb9PBXwmUmg4KNC7LrAWKz&amp;s=3D3NQJjTvA0JYUgctkXdw4Z-Ugu7WmncIYV=
zdA7CbEl3o&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__www.mail-2Darchive.com_yocto-40lists.=
yoctoproject.org_msg08752&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3DnVObLY1dvBCdprETjd0dKD8MywPxPwPFOo2S3xaOrsbb9PBXwmUmg4KNC7LrAWKz&amp;s=
=3D3NQJjTvA0JYUgctkXdw4Z-Ugu7WmncIYVzdA7CbEl3o&amp;e=3D</a> <br>
&gt; .html<br>
<br>
<br>
Rather than replying to the patch, this information should be in the<br>
original commit! :)<br>
<br>
Can you resend with that included please.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--0000000000000beaeb05ec13abd9--

