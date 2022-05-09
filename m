Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD1BC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 10:40:54 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.30010.1652092839490352200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S+lEsQT9;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t13so11676095pgn.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Rn4ZDuusm/uVs7m6+8+I+gXTjZSLWe1nOdFQrd76gU=;
        b=S+lEsQT9ow/rviBi9IzRXUyM/PP5j3YEfiLXq7wc5xpCUJpXUXNUrxItSzBVJyyOdN
         4mje8Zt8loUUalBsROCUSsKY32U/DusK2xnC4Yzp6I5YH0xZ89jhOBjtJzG7NRBfqVjl
         HOj9jA2fUrI98MkaT/o4CcfLofLvcBWJOkwkCAY0bjSl/FwlKZnOXmrnl25jUMPCqPPJ
         POwOJAkdEkarrKLNyHeNSid4VFQiLDIUJXTsSzNB4Yp4W7W+xJKoM/OGlH1FgniMG1ds
         eRp73pf7mIxNrBRuJoCeXv1YLLkUFwDDkkFPvHKBNVVA2TEqsCFqWoVREA35vLXE0TRO
         /XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Rn4ZDuusm/uVs7m6+8+I+gXTjZSLWe1nOdFQrd76gU=;
        b=lsxrjH+2dsmaoSxf3p73UVZhfFLidaDIlczU7v5Ny1ATjiRYnnl0OFxdVCOHb+hL1c
         NDty82EnFvqu5xuMrT3umn10jqsPXH6XCUANMGFTSVu3ky2Xn8s2vP4QXO94kX958Uea
         aebFksges3VnUS83yQfwyoucqcqXZLanhlR6akhX6ytMk64jTGG3uLoMI+eh8XIbANQw
         NMYXhm0cFEL2y2jqTN/f4Rje2E2AwvH0nhLpPWMEqBY53dBGrsTch6qMzh9Ir2dzZhsm
         FMOooRhek/V5yIzfvhnZ5sqbtoVwO+8JT9ynR6eejzNHVaBvbmI9thOeGyoqJ2e5Hn5Z
         rrhQ==
X-Gm-Message-State: AOAM530RPZ4JQvg8TRnLLh6M2Z3O7kfiXpMIgziikj0F5sXnxCPHbbHE
	oRf9Ul6TvPU4F8J8VCIPLrchsqpqaPCdo+a74v8=
X-Google-Smtp-Source: 
 ABdhPJwuonHg15Y3hkT51mt18eWoLPz5P0XH575jgUyyfVFS+P6GyGFHaHjT4ZOecbz7QH2fLCgqDCnN4Jm9WrQgcS8=
X-Received: by 2002:a05:6a00:2408:b0:4f7:a8cb:9b63 with SMTP id
 z8-20020a056a00240800b004f7a8cb9b63mr15646016pfh.33.1652092838099; Mon, 09
 May 2022 03:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
 <16ED214F51D113CA.5869@lists.openembedded.org>
 <940414ecb58f77ed1c0ce6693cf7b5e8836ce28a.camel@linuxfoundation.org>
In-Reply-To: 
 <940414ecb58f77ed1c0ce6693cf7b5e8836ce28a.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 9 May 2022 12:40:25 +0200
Message-ID: 
 <CAApg2=TNtVc1Zb4_1pD2Vd53338++wPa+Lwj4QUVJaBdMwkjiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] freetype: Upgrade 2.12.0 -> 2.12.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000c03d9a05de91d63f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 10:40:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165391

--000000000000c03d9a05de91d63f
Content-Type: text/plain; charset="UTF-8"

On Sun, May 8, 2022 at 6:45 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.
> >
> >
>
> I'm amending this to "Include fix for CVE-2022-27404" since CVE-2022-
> 27405 and CVE-2022-27406 were already in 2.12.0.
>
> I don't think the CVE checker is going to like these as they're using
> dates for these for reasons I don't understand.
>
>
They also include versions in the NVD, but there is no version "non-afected"
as of today for CVE-2022-27404. I'll figure out the exact versions for those
CVEs and update the NVD in the next hours.

Kind regards,
Marta

--000000000000c03d9a05de91d63f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 8, 2022 at 6:45 PM Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie=
 via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.<br>
&gt; <br>
&gt; <br>
<br>
I&#39;m amending this to &quot;Include fix for CVE-2022-27404&quot; since C=
VE-2022-<br>
27405 and CVE-2022-27406 were already in 2.12.0.<br>
<br>
I don&#39;t think the CVE checker is going to like these as they&#39;re usi=
ng<br>
dates for these for reasons I don&#39;t understand.<br>
<br></blockquote><div><br></div><div>They also include versions in the NVD,=
 but there is no version &quot;<span class=3D"ng" style=3D"background:rgba(=
0,0,0,0) none repeat scroll 0% 0%!important">non-afected</span>&quot;</div>=
<div>as of today for CVE-2022-27404. I&#39;ll figure out the exact versions=
 for those</div><div>CVEs and update the NVD in the next hours.</div><div><=
br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--000000000000c03d9a05de91d63f--

