Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E408CCA487
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:55:53 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web09.41266.1655801750164508881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HZfTD2C2;
 spf=pass (domain: gmail.com, ip: 209.85.219.175,
 mailfrom: qorin.wu@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 23so23322373ybe.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXqzh+avZOtMPsQdDuc9oR2DHVd+HUptf3P7Fvuc+Mk=;
        b=HZfTD2C2/acHSEcI8H8+xi9V64lNbL7jq/bq4mBi2NmHgr6GAdRC/lJHXCRmJ5jw7f
         3tjaeMOsQFj+JMqKSA9MpoWBprNgGiT7fYhDyKVJvjt45Wv9RWTIys7j2e19uBNmvWkp
         uPE8SDpc5NRrunF31nEhshac2H7gt3xYoMUAby2vZxKXACH0znfNxaEB0K79YeOEt+/O
         cGmEWBD8lzieTj/PTMp8glag2gWEXOlu1kd4CmygX5qs5pWyvHgSx30b1nSCzL6WqeEy
         0kt9mEnfxBI33PLlGE4r0OWdFwRVsxsV0w81hx6mcbYDDLqAhYWrxjD/IFYG1l63fBCb
         KEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXqzh+avZOtMPsQdDuc9oR2DHVd+HUptf3P7Fvuc+Mk=;
        b=zbCfgR5wEdBVWWRWNGTVpq9dQb05Vnvdy+qBrfNfDuXW+Hvy9reqXOc6qx+mPXFRaV
         bA0R3AFPxLuScMgj1HRaMuvFcxNFtJ9SEfN4mdB2U6B+LAXxEXOS0SmJ7gx27PhJzpF4
         GOauvGnKPL10cYxSfUDX7UwkvD8h2m5FYk5Zq+L8HaTyhNpciBoVfD98QmbF5PsAXNHQ
         Z1vYPhOXT7wbTd9hfeUsbsXGWf7i43I55qnIbwmTlXM6Z+8aFbjzBF+drK8INlzIbFLQ
         6iJWv2U7Zgm2PppSdf3i8heL1xvSM6jDNaqBJ8Vcw98V9BuF6ZyUozk1vaCC0W96emz1
         +TyA==
X-Gm-Message-State: AJIora/sVkD/aFyuDF4jACGOwTVU4CAOUyazOlhSbOOdgn8zKdDHkQg1
	BkVf68b/6acvD2J1jweUcsPOBC38RRjOLocuig==
X-Google-Smtp-Source: 
 AGRyM1t8DcK4CeVjblGtlIcAL01SP8vwd87DelcuLgKUyfccgjJDiPf07vDc7LNNKQzalcDZ0B+mtMH73ux4ktW6iHU=
X-Received: by 2002:a05:6902:1407:b0:64a:ecc7:aa2 with SMTP id
 z7-20020a056902140700b0064aecc70aa2mr30813411ybu.645.1655801749355; Tue, 21
 Jun 2022 01:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220620131338.160501-1-qorin.wu@gmail.com>
 <20220621102446.16d12268@booty>
In-Reply-To: <20220621102446.16d12268@booty>
From: Qorin Wu <qorin.wu@gmail.com>
Date: Tue, 21 Jun 2022 10:55:38 +0200
Message-ID: 
 <CAB5BoHsrGP75+aBpSHpXpyRGoH0JiX8NVRgHsCmGpX=mH3hdnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] resolvconf: Install missing
 normalize-resolvconf
 file
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Qorin <qorin.qorinna@nl.abb.com>
Content-Type: multipart/alternative; boundary="00000000000016c2cc05e1f163db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:55:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167140

--00000000000016c2cc05e1f163db
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

done!

On Tue, Jun 21, 2022 at 10:24 AM Luca Ceresoli <luca.ceresoli@bootlin.com>
wrote:

> Hi Qorin,
>
> On Mon, 20 Jun 2022 15:13:38 +0200
> "Qorin Wu" <qorin.wu@gmail.com> wrote:
>
> > From: Qorin <qorin.qorinna@nl.abb.com>
> >
> > It was moved to a separate file in version 1.90
>
> When sending a new version of a patch, please mark it as "v2", "v3"
> etc. This is very easy to do with 'git format-patch' and 'git
> send-email' by adding the '-v<NUMBER>' option.
>
> Another thing you are required to do is to sign off your patches. Git
> makes also this simple to do by adding '-s' to 'git commit'.
>
> Thank you!
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000016c2cc05e1f163db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Luca, <br></div><div><br></div><div>done!</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Jun 21, 2022 at 10:24 AM Luca Ceresoli &lt;<a href=3D"mailto:luca.cere=
soli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Qorin,<br>
<br>
On Mon, 20 Jun 2022 15:13:38 +0200<br>
&quot;Qorin Wu&quot; &lt;<a href=3D"mailto:qorin.wu@gmail.com" target=3D"_b=
lank">qorin.wu@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: Qorin &lt;<a href=3D"mailto:qorin.qorinna@nl.abb.com" target=3D"=
_blank">qorin.qorinna@nl.abb.com</a>&gt;<br>
&gt; <br>
&gt; It was moved to a separate file in version 1.90<br>
<br>
When sending a new version of a patch, please mark it as &quot;v2&quot;, &q=
uot;v3&quot;<br>
etc. This is very easy to do with &#39;git format-patch&#39; and &#39;git<b=
r>
send-email&#39; by adding the &#39;-v&lt;NUMBER&gt;&#39; option.<br>
<br>
Another thing you are required to do is to sign off your patches. Git<br>
makes also this simple to do by adding &#39;-s&#39; to &#39;git commit&#39;=
.<br>
<br>
Thank you!<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000016c2cc05e1f163db--

