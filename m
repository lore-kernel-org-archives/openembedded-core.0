Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FEDC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:08:40 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.7348.1637766519407080197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A/yAHWRp;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id w23so5776337uao.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=35GAApINL8rmyqSUnX6SrNlQbO2j335qnFE1YYwWPQY=;
        b=A/yAHWRpVK/4BfjZ968bbqn9Uxt5R6iG+WcsR3a34ht07UuQYvi/RFJFZvm6nV5qD1
         k0Cv7Vg21uuXuwgT+9U6iyZ2PGntjvWLAphsbZobM31wMtE/XBtdDETUmQFK2HOaxeO/
         QLULhnI1IMscTxgnrKmkjGs+r3M1hbFhZiER7RuIKe0J5eHzd1kjE/bSyb+6g3fnMMP3
         pPqIptGztXhSYKLf4gG3pSqRAFFvOXWHfAUmCWgqLZGq0ofSEDrhCCxi0MPNOuxWe//7
         Rm+Etg+qlnZ0kLpsAk13OyhtXZmhV/wQl8/Ss/aJRRT0wxA7hX8re0XUYi/Z5/Qv+G27
         /oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=35GAApINL8rmyqSUnX6SrNlQbO2j335qnFE1YYwWPQY=;
        b=1iE7f0UChzKUn1D4SfM/kdamQi+nLQSVsiFnmNStAPcsmp2SU2aBOCLxeNhrWn/q7j
         yGDjTCiTNl/EOsS1pk7HL02JBnjNDC4ObPIrOJzhTPoJQxsyblNyXE/q5b3OoqwbjEVd
         YwMF6Yz9qu0Ge4c3M5UihZp9Yfn+oXBC2jqLc3SR2J2Qdc4TK6DxqZ4BvtLEYIgrOIcR
         WJJzeoAR8bfG93WswRyVlU+yfkNRDmsfJYFg1f6BgPPiF7CATLM/IeoEOH0Jw9tEeRuA
         4G27x5GqNgDenRLp3M+2Lnob1YNFUr9ELEooAnmORx16TxfOJJkkwHW1VPBM0Q8f9yc1
         GXVQ==
X-Gm-Message-State: AOAM531Oh+CAd1M/GfIi00mqlpT4PSv2rpkQq/FtncT3IfFrDLrLflTC
	5mI7QYhO+DaASKG2aNXZaSLCDJG1YmzcYpw+orY=
X-Google-Smtp-Source: 
 ABdhPJwn1KcsqKX+n+tsg5z+gMhOoz0isVCJHAC6O/yuFvro8BLeu1W+W5B3MiocUXn/6hncHsATHNUq/Kru5Is1+To=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr23378132vsl.18.1637766518585;
 Wed, 24 Nov 2021 07:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-2-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-2-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:08:26 +0100
Message-ID: 
 <CANNYZj-9mp1KkWkGSk2p+AMO-a4XsCMh=x53Qwu-xBvYchwoUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/15] openssh: Extend to provide native recipe
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="00000000000090be4405d18a3b20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:08:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158713

--00000000000090be4405d18a3b20
Content-Type: text/plain; charset="UTF-8"

The use case for native openssh needs to be provided in the commit message.
Just say that 'this is needed so that X can work properly'.

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/recipes-connectivity/openssh/openssh_8.8p1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> index ee86bb92ab..33fdf1e8ab 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> @@ -182,4 +182,4 @@ ALTERNATIVE_PRIORITY = "90"
>  ALTERNATIVE:${PN}-scp = "scp"
>  ALTERNATIVE:${PN}-ssh = "ssh"
>
> -BBCLASSEXTEND += "nativesdk"
> +BBCLASSEXTEND += "native nativesdk"
> --
> 2.20.1
>
>

--00000000000090be4405d18a3b20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The use case for native openssh needs to be provided =
in the commit message. Just say that &#39;this is needed so that X can work=
 properly&#39;.<br></div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 2=
021 at 15:48, Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrecht=
smeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier@weidmu=
eller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.com</a>&gt;=
<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.8p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_8.8p1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.=
8p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_8.8p1.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_8.8p1.bb" rel=3D"noref=
errer" target=3D"_blank">openssh_8.8p1.bb</a><br>
index ee86bb92ab..33fdf1e8ab 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.8p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_8.8p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_8.8p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_8.8p1.bb</a><br>
@@ -182,4 +182,4 @@ ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
=C2=A0ALTERNATIVE:${PN}-scp =3D &quot;scp&quot;<br>
=C2=A0ALTERNATIVE:${PN}-ssh =3D &quot;ssh&quot;<br>
<br>
-BBCLASSEXTEND +=3D &quot;nativesdk&quot;<br>
+BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--00000000000090be4405d18a3b20--

