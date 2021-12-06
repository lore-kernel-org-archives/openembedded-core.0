Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21E0C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:57:27 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web10.53526.1638806246839998111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ixmDqtjM;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id n6so20592829uak.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5GEGRpPiXdOOSPVkzeceGRDP1L8d7ylw5OnrDCjZz8=;
        b=ixmDqtjM7yilTOSK2SZFL7T4QsJ2mCNSqE+2EPCfQ4qx833rK85KIZdhIfbZrZ1WvX
         6HTnoFKWpZa55GWA4CyNXoM7KSd6mhkN1pGJGym+kUTrC6Ds4wxXuXQV4QYVDHW6Bf9+
         8UrCiemau4Q9feYfpjmxErdnx3TYDahu6a0wpXma87hksj4xSCpdSZPdGZvlsF71APQD
         FIAO8Debecx5VGCYhbnH8m4W/CDNphq3i61KS5KjfCM0ywyZO6YeW56LWSiABHR5Z6GJ
         ybVxT+EzkL81gHWB0JRStoGsUo9HfQ+eiA9YiIsN43fgZDck1vZ30NkEmlXiC+oo9+5f
         yAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5GEGRpPiXdOOSPVkzeceGRDP1L8d7ylw5OnrDCjZz8=;
        b=dDvArzSVfwIbjn+DqI/B+DnYgJPRwowpMdwmu8YdeXsKEzp6rcd7nhjjrJQjDjtBBU
         irDPvRhrQycDmSCzYqVcMTHvFhsP3moaEcKktsVX03y29B+VOerWjONB3SkQT/nwOvL8
         a1LwjqRlE1qrlRPFa7uvtLyoox+AEIbp57C/idcTb2l7tGZJvwBRga9eyJQwIkgHTzx3
         bHqjPvACLVyzjtlN7RK3J9r6nn/hkSreQ8O/BJG4gJG2AkrdkcEk0KtMJV5jmEJG15t8
         gTJQTukRLO+Qv+EjunmB78Jke8EH+UYArV04q6gnvRiaxn+Iw5y4S66xX9PhAdrVY+PW
         lwJQ==
X-Gm-Message-State: AOAM530UhHLJAndS/vfG8VgRkhAOCwMDq5zpiqjSQH6Onkue7D1hTR0K
	/9H5rNtbCOXUtC3tj0ayoo0ECyomybEHgtEXvL4=
X-Google-Smtp-Source: 
 ABdhPJxsGkD7KQRaP+CdyOn58Fkh7zTQbrcYaeu4xuxnx0p9ijimr6ld4kE+mVJhGG5Ufc3RgFWocXju/D3a826WqJ8=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr36703214vst.42.1638806245225;
 Mon, 06 Dec 2021 07:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
 <f0d640e1911f8e9577ef7ee5ffef426b084861f4.camel@linuxfoundation.org>
In-Reply-To: 
 <f0d640e1911f8e9577ef7ee5ffef426b084861f4.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 16:57:14 +0100
Message-ID: 
 <CANNYZj82Y67WWDXi0FPHu1sEPCxkK4eUiA3_2km0t-sscr_Oig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] minicom: Upgrade 2.7.1 -> 2.8
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001a3a1205d27c505a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:57:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159251

--0000000000001a3a1205d27c505a
Content-Type: text/plain; charset="UTF-8"

This one is odd and it should be working. I'll cherry-pick your update and
get to the bottom of it. This may mean we are missing other updates that
are coming from debian tarballs.

Alex

On Mon, 6 Dec 2021 at 14:59, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-12-06 at 14:43 +0100, Alexander Kanavin wrote:
> > Since AUH didn't pick this up, can you run 'devtool latest-version
> minicom'
> > with this update, as it probably would report something that needs
> fixing via
> > regexp?
>
> That shows:
>
> WARNING: latest_versionstring: package minicom_2.8.orig.tar.bz2 don't
> match pattern
>
> Cheers,
>
> Richard
>
>

--0000000000001a3a1205d27c505a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This one is odd and it should be working. I&#39;ll ch=
erry-pick your update and get to the bottom of it. This may mean we are mis=
sing other updates that are coming from debian tarballs.</div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 6 Dec 2021 at 14:59, Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, 2021-12-06 at 14:43 +0100, Alexander Kanavin wrote:<br>
&gt; Since AUH didn&#39;t pick this up, can you run &#39;devtool latest-ver=
sion minicom&#39;<br>
&gt; with this update, as it probably would report something that needs fix=
ing via<br>
&gt; regexp?<br>
<br>
That shows:<br>
<br>
WARNING: latest_versionstring: package minicom_2.8.orig.tar.bz2 don&#39;t m=
atch pattern<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000001a3a1205d27c505a--

