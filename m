Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB70C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:09:17 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web08.7136.1637766556665214438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MnlgBozf;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id j1so1738805vkr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OcX711cNKF0efoQdkruQ1V4KcQvkMHnibgH4KH3O8yY=;
        b=MnlgBozfxtdBd9iV+KOHMfGDwdcXY1ymsBRSYZQJt3ZeKoiD6CCq654OuCQHSYTtoX
         Wyv/Ym3kvu6NB8SVz61y7GiOzpQKSiQJmTzxGMyA3lpnV5U4gxfclNgKckBc1pZtKMln
         FJc8WvqsoOIH+6YfJmPx7vFCjZeXimHLcNcu+CB+ZMGjcY+9TDVuJHuCC8Hg1DV3w3m0
         e+uoSR+Rv70jfmDThFiTbXcbYNCwlI+tK5WPFW7Kyy1xtIBJx62wNDnwiD6Qj7MflO02
         GnYpoR0eLJ5B7S7DGBrAbN3sB28S19KxpRNEKGQwhT/YHJow5VdvR78yNbwEZmPh6kG3
         JSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OcX711cNKF0efoQdkruQ1V4KcQvkMHnibgH4KH3O8yY=;
        b=5KbWiui6shgscVKXNA0tZnUPhWEHGvgJus4NyfazpG26gTe5vPck89z1h9gEIIIqdX
         x2VEeUap2zAsvt0fEhVkJlWiyKIUgQQm0nwHJwo/GU81RFBLuS4LJ500EBTYNOdDgUgF
         bOuEh6Pe2chtof1wqdNoVZLEtpeoLVtk440LDgS03gX0vQ483s9uS/ARr/aIh+/bt+An
         vyMQeLrJfvmKb1zqwhgKDERNdHmaPBW49yCK4441Jcukq5TbSIHCNUfsFouzBgRve80V
         rsjfbzAiLjGSHnITUk3HJmqsthdH43QmgWeLW/qY5AvDD/uB11mvEaw6PJAVL+x6s/st
         cffQ==
X-Gm-Message-State: AOAM532z9q74HS1EINA4zKJsyfN+FN6+wnI7QQcrIEmMGCoU5f06iRMe
	vLuHkSfm/hvY2Hy1gqnQH4XV/zrp1KGUTlSWvcNciAa9X4pvtw==
X-Google-Smtp-Source: 
 ABdhPJyGmCyUQF8Pm3xnYHfsinPMfRhLgYj182U9lllZzIZMxOft+hR6XKI4CGGCMg42k4rjtpFWnfI+Hc5gU3Dp3Dk=
X-Received: by 2002:a05:6122:189b:: with SMTP id
 bi27mr822489vkb.30.1637766553736;
 Wed, 24 Nov 2021 07:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-3-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-3-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:09:00 +0100
Message-ID: 
 <CANNYZj89yTFP9pBjvoQ3ZDrEZNtJJ0o3uBkpGXrMLu4f4NCTSg@mail.gmail.com>
Subject: Re: [RFC PATCH 02/15] recipetool: Skip hbs extension in guess license
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000a9205305d18a3da2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:09:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158715

--000000000000a9205305d18a3da2
Content-Type: text/plain; charset="UTF-8"

Please explain what .hbs is and why it needs to be skipped.

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  scripts/lib/recipetool/create.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py
> index b6c4564761..d41653e7ce 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1191,7 +1191,7 @@ def guess_license(srctree, d):
>
>      licenses = []
>      licspecs = ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*',
> '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*',
> 'e[dp]l-v10']
> -    skip_extensions = (".html", ".js", ".json", ".svg", ".ts")
> +    skip_extensions = (".hbs", ".html", ".js", ".json", ".svg", ".ts")
>      licfiles = []
>      for root, dirs, files in os.walk(srctree):
>          for fn in files:
> --
> 2.20.1
>
>

--000000000000a9205305d18a3da2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please explain what .hbs is and why it needs to be sk=
ipped.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 2021 at 15:48,=
 Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@we=
idmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Stefan Herbr=
echtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier@weidmueller.com" ta=
rget=3D"_blank">stefan.herbrechtsmeier@weidmueller.com</a>&gt;<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0scripts/lib/recipetool/create.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py<br>
index b6c4564761..d41653e7ce 100644<br>
--- a/scripts/lib/recipetool/create.py<br>
+++ b/scripts/lib/recipetool/create.py<br>
@@ -1191,7 +1191,7 @@ def guess_license(srctree, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0licenses =3D []<br>
=C2=A0 =C2=A0 =C2=A0licspecs =3D [&#39;*LICEN[CS]E*&#39;, &#39;COPYING*&#39=
;, &#39;*[Ll]icense*&#39;, &#39;LEGAL*&#39;, &#39;[Ll]egal*&#39;, &#39;*GPL=
*&#39;, &#39;README.lic*&#39;, &#39;COPYRIGHT*&#39;, &#39;[Cc]opyright*&#39=
;, &#39;e[dp]l-v10&#39;]<br>
-=C2=A0 =C2=A0 skip_extensions =3D (&quot;.html&quot;, &quot;.js&quot;, &qu=
ot;.json&quot;, &quot;.svg&quot;, &quot;.ts&quot;)<br>
+=C2=A0 =C2=A0 skip_extensions =3D (&quot;.hbs&quot;, &quot;.html&quot;, &q=
uot;.js&quot;, &quot;.json&quot;, &quot;.svg&quot;, &quot;.ts&quot;)<br>
=C2=A0 =C2=A0 =C2=A0licfiles =3D []<br>
=C2=A0 =C2=A0 =C2=A0for root, dirs, files in os.walk(srctree):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for fn in files:<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--000000000000a9205305d18a3da2--

