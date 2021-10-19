Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D58C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 11:11:39 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web12.8210.1634641898305832461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UMFatl1D;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id q13so9655141uaq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXJmIk49DSqcrIzHJjdb8HlIwcHclpOJZkkE/yE8Z2w=;
        b=UMFatl1DEuR070Dxtpg7p+UPlZmoFCGn1TOECIHk9i66pfqg2jhLOwEql0n+/wAEel
         WxkYnZFGPgcTtooBA/oqJPt8wzae2Wo9UjmujiaRLZ81nG0Mar903LNbsah+htZTFanP
         xYXMzOI7IIJvHRvR/Bm8iJeG3cF+aGwQCCtCn2wO6kNVdt3JegJm/YLOBm9UaMu8LaZK
         fXFu/uzPwcr4bGcWQ9jXGr+YMvRSeMdIBfZ9fLW9AArUXp8p8S9cg7FzkSaSSuYE7qhc
         u/X4HhO9gIwwQk9iYzteJW1K6FvLfOENwejD5uQqWMVJk+k5HNv/uod4aTCcgruZZD/O
         /UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXJmIk49DSqcrIzHJjdb8HlIwcHclpOJZkkE/yE8Z2w=;
        b=SIi7XD/x7fCFWeytZIfJ9/Aw/d2GEjV1FzT1q3SO1Q/qOqI8ooX0U5fzfe99D6raCU
         TAn7WA4Ddd6baMy861/hRE6LGimZAmA/dh/yX4w5bAjGJxTrDw3sy/6DtI2WfViZ/yJW
         67k+5JXh8nIhJhNkFKIvvG14tektK0aTSvPQhUTmHVa6oDgTYA4p7xBBwr2lb5lDJD2F
         QLRpPLUgUxCkpOuRhEM7Q/0IT4IYSVL4q2WrYd8skl/CHxzGThrVCFbC9xSnmc8319hU
         p9gWYX6cRwGtdWQ/uKjXP39dVX3S4t2a5g3MkV4G3gVacYUPtxNawn8x9AI0KuwU1nhG
         CvpQ==
X-Gm-Message-State: AOAM533s2UXCMIddOdgS7xdB7IFfsAqKulSYLFvvRlYSC9gJRjP9ZyDd
	YUOMWJPTzcYW3kBl1vRHpJRulhvESiMczyRvUd0=
X-Google-Smtp-Source: 
 ABdhPJz5XEbp3/wFTbjyv4X4FVSJsTnh3emAKb1GQJ9SC73BrCr9d4x+C1Ri436X9icBWivW7smL8/805kVTGveCj9I=
X-Received: by 2002:a67:c11e:: with SMTP id d30mr34890292vsj.1.1634641897447;
 Tue, 19 Oct 2021 04:11:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DB9PR06MB7932CEB962AE403349272E12ACBD9@DB9PR06MB7932.eurprd06.prod.outlook.com>
In-Reply-To: 
 <DB9PR06MB7932CEB962AE403349272E12ACBD9@DB9PR06MB7932.eurprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Oct 2021 13:11:26 +0200
Message-ID: 
 <CANNYZj9m6nt4jvxVB-2CJUooDY5B+e186ukd41o+-s_Aqb4Nqw@mail.gmail.com>
Subject: Re: [OE-core] OpenSSL 1.1.1k: Rationale for deprecated_crypto_flags
 in hardknott-next
To: Florian Miedniak <florian.miedniak@de.abb.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="000000000000a1e41405ceb2b996"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 11:11:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157108

--000000000000a1e41405ceb2b996
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Oct 2021 at 12:55, Florian Miedniak <florian.miedniak@de.abb.com>
wrote:

> is there a rationale, why Configure is called with a bunch of
> deprecated_crypto_flags in hardknott-next
> <https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb?h=hardknott-next&id=557d956743ecf5e1d002ae0b2135b1307736b7c8>while
> this is *not* done e.g. in dunfell
> <https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb?h=dunfell&id=0826a41940da14631043e2a496854dbb5da9a15f> ?
> Just had a look at openSSL release notes and the CVEs as referenced by
> commit messages, but found no rationale there, too.
> We stumbled upon this, since it deactivates SCRYPT algorithm.
>

This was done after dunfell was released, and was not backported to it.
Current master (which has 3.0.0) has again dropped the idea, as it only
resulted in mass reenabling of the supposedly deprecated stuff. I think we
should simply trust upstream to make the right choices.

Alex

--000000000000a1e41405ceb2b996
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Oct 2021 at 12:55, Florian Miedniak &lt;<a href=3D"mailto=
:florian.miedniak@de.abb.com">florian.miedniak@de.abb.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"DE">
<div class=3D"gmail-m_5968791334562507668WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;He=
lvetica&quot;,sans-serif;color:rgb(51,51,51)" lang=3D"EN-US"><span style=3D=
"background:white none repeat scroll 0% 0%">is there a rationale, why Confi=
gure is called with a bunch of deprecated_crypto_flags in=C2=A0</span></spa=
n><a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1k.bb?h=3Dhardknott-next&amp;id=3D557=
d956743ecf5e1d002ae0b2135b1307736b7c8" target=3D"_blank"><span style=3D"fon=
t-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:rgb(51,122=
,183);text-decoration:none" lang=3D"EN-US">hardknott-next</span><span style=
=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:rgb=
(51,51,51);background:white none repeat scroll 0% 0%;text-decoration:none" =
lang=3D"EN-US">=C2=A0</span></a><span style=3D"font-size:10.5pt;font-family=
:&quot;Helvetica&quot;,sans-serif;color:rgb(51,51,51);background:white none=
 repeat scroll 0% 0%" lang=3D"EN-US">while
 this is=C2=A0</span><b><span style=3D"font-size:10.5pt;font-family:&quot;H=
elvetica&quot;,sans-serif;color:rgb(51,51,51)" lang=3D"EN-US">not</span></b=
><span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-ser=
if;color:rgb(51,51,51);background:white none repeat scroll 0% 0%" lang=3D"E=
N-US">=C2=A0done e.g.
 in=C2=A0</span><a href=3D"https://git.openembedded.org/openembedded-core/c=
ommit/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb?h=3Ddunfell&amp;i=
d=3D0826a41940da14631043e2a496854dbb5da9a15f" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:rgb=
(51,122,183);text-decoration:none" lang=3D"EN-US">dunfell</span></a><span s=
tyle=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color=
:rgb(51,51,51);background:white none repeat scroll 0% 0%" lang=3D"EN-US">=
=C2=A0?
 Just had a look at openSSL release notes and the CVEs as referenced=C2=A0b=
y commit messages, but found no rationale there, too.</span><span style=3D"=
font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:rgb(51,=
51,51)" lang=3D"EN-US"><br>
<span style=3D"background:white none repeat scroll 0% 0%">We stumbled upon =
this, since it deactivates SCRYPT algorithm.</span><br></span></p></div></d=
iv></blockquote><div><br></div>This was done after dunfell was released, an=
d was not backported to it. Current master (which has 3.0.0) has again drop=
ped the idea, as it only resulted in mass reenabling of the supposedly depr=
ecated stuff. I think we should simply trust upstream to make the right cho=
ices.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=
Alex<br></div></div>

--000000000000a1e41405ceb2b996--

