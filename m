Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ACFC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:38:39 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.50199.1742211516751084232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=er3jOEoh;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so2941856a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742211516; x=1742816316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XfT9JcfC2lD3nJKgOWdNzRVaObTArO/qPuiffzpq2ts=;
        b=er3jOEohNL809zSJFZrjgnEi9onS2to/OPPWx+7aJIp/18NNRIOysl1kaB61zKJVw6
         dkp7NSXTA9wgqHXLj3yvlrSiB36ZHup8WF0EBmhxFcpiQMt/8TSlvlVJJRBvMI8mQrcD
         Cs9/LVPiOMzfRejqqtoeb+QK7x9FrQ7ZxCYIHqoO5cr3985TcptDLD9fTjqw9Q2wuD58
         3j/264hxgsRqyvU4HhGT4cvxjeknK3/h4YYsxkZhrDTZBJwIpIFAVFOZocDRQVqBH+rS
         xE/yfISjo9y+HdrP73L2DV6+QAfYcFXKVgVivih626kqUZT3U7Okor+a8i2GhXaBloSo
         JOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211516; x=1742816316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfT9JcfC2lD3nJKgOWdNzRVaObTArO/qPuiffzpq2ts=;
        b=TZgfOJ870Y0p7oq/1r49ZZDPK/Fed+aUPaV3lgoPH7iS6iV3pRAwkmKsM9ZbUqlOnz
         muijk3e79dfLSzLsJ7BEEoGQLITVqku5oMce2B0cpaikjNZgltra0OENCZuUixMpjeNQ
         ekY97rvD9POMCqT18WzFi6SmiMvM36fIQLLyPwAIpPctTWpveMmT9VCOUlz5eJXLPYi3
         scaQb0TXNHl/or916iDQbLK7dAT94wr/RjdiGgTI0hkomrNd2CchMXKXHxXDErKjLV5U
         p3j4v18oyAK5aXN7iy3JSXKLrPWsWz2K1TBON2eHy8BsIF82MqSodtgrmi5xhq6Ma61h
         ejQg==
X-Forwarded-Encrypted: i=1; AJvYcCXUMxuy/a6G0U5IVRlw/it62vAWvG0RwCkZ1fyxdDCFxpJqHQMTl3j67W0DhdL1l7bEnnukL7Vmr1xEN5mzlbl5jA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3HdPOBju4KYyPFw7d1prW6VlBtF6atJDHSrri7qofOsGrsRJy
	Crscb+JGaMb5iYBNK4LmnfFGFyc3fCmSC54kTBrHU8csqdaPSVm8gNnKoeQcnn8RH4+T8nibE2L
	fjWvkzwr8Pw7apergcPdPaB3JrXo=
X-Gm-Gg: ASbGncvsIDX0Cj3K1DXJj1zUxTubWfKvxWnxNTmUDbo4LESkvoodB6Vfb5fcXnS8oST
	8OeB2INJWhYLIxZchcE1LcAmaqqZwTYrmcReECDy3W/XDrJqHhWrAWSQjYpnIiYK4pOoPgOGzON
	DCqmXfjBFwsP8kdzB5XHc/icldGBhet9B/lxSwYSU=
X-Google-Smtp-Source: AGHT+IHBbIfJMGN1lEQB0nshcNZIbkiQxyqeUleS1K67YV4xoce2Va8+PM3O2BhohvnHxwVmxCTmyx1sYd++FaZdDzM=
X-Received: by 2002:a17:90b:3804:b0:2fa:4926:d18d with SMTP id
 98e67ed59e1d1-30135f4cf2bmr21113751a91.13.1742211515848; Mon, 17 Mar 2025
 04:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250310124949.2414614-1-peter.marko@siemens.com>
 <387AAA58-90B2-4F98-9CA7-7287198371CD@arm.com> <AS1PR10MB56973C195061C8E5FBE5D8E6FDD62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697C8041F4E3E9FEB36D4FFFDDC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <730307A2-7B3E-4019-86CC-76AB1128D826@arm.com>
In-Reply-To: <730307A2-7B3E-4019-86CC-76AB1128D826@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 17 Mar 2025 12:38:24 +0100
X-Gm-Features: AQ5f1JojnPHKsGWinT2xle476pnh4gMKZcAcD2WIXi6fCOzoBRBSMJ4vDTB0M8M
Message-ID: <CAApg2=QaDHhXCsHZRi8QB2vfGkMnb3zo7Yb_KvLMuwfER6BL4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] xwayland: mark CVEs fixed in 24.1.6 as fixed
To: Ross Burton <ross.burton@arm.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000086a2de0630883a0f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213076

--00000000000086a2de0630883a0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Mar 2025, 12:18 Ross Burton via lists.openembedded.org,
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> On 16 Mar 2025, at 18:16, Marko, Peter <Peter.Marko@siemens.com> wrote:
> >
> > One week later these CVEs were extended to xserver-xorg.
> > I have also sent these ugly patches for that.
> >
> > The CVEs also now have a banner saying:
> > This CVE record has been updated after NVD enrichment efforts were
> completed. Enrichment data supplied by the NVD may require amendment due =
to
> these changes.
> > I guess at least we'll finally have more CVEs in our lists.
> > On the other hand, maybe more work to mark them?
> >
> > CNA here is Red hat, Inc.
> > I guess you'd have to email them to have the fix release corrected.
> > Not sure how that works.
>
> NVD gave me a contact at Red Hat that I=E2=80=99m mailing now, but:
>
> https://nvd.nist.gov/vuln/detail/CVE-2025-26594 lists three affected
> configuration: all tigervnc, all xserver/xwayland, and RHEL 7/8/9.
>
> https://www.cve.org/CVERecord?id=3DCVE-2025-26594 has an entirely differe=
nt
> set of affected products that is all RHEL.
>
> I=E2=80=99m now confused/concerned why these are showing different sets o=
f data=E2=80=A6
>

The RedHat CNA has a habit of only adding their own products, and NOT
adding open source upstream. I see that pattern frequently.

You can see the source of this CVE:
https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/26xxx/CVE-2025-=
26594.json

It looks to me that NVD has already added *some* open source projects
affected, but only on their side, not updating the CVE entry.

Kind regards,
Marta

--00000000000086a2de0630883a0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 17 Mar 2025, 12:18 Ross Burton vi=
a <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openemb=
edded.org</a>, &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedd=
ed.org" target=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On 16 Mar 2025, at 18:16, Marko, Peter=
 &lt;<a href=3D"mailto:Peter.Marko@siemens.com" rel=3D"noreferrer" target=
=3D"_blank">Peter.Marko@siemens.com</a>&gt; wrote:<br>
&gt; <br>
&gt; One week later these CVEs were extended to xserver-xorg.<br>
&gt; I have also sent these ugly patches for that.<br>
&gt; <br>
&gt; The CVEs also now have a banner saying:<br>
&gt; This CVE record has been updated after NVD enrichment efforts were com=
pleted. Enrichment data supplied by the NVD may require amendment due to th=
ese changes.<br>
&gt; I guess at least we&#39;ll finally have more CVEs in our lists.<br>
&gt; On the other hand, maybe more work to mark them?<br>
&gt; <br>
&gt; CNA here is Red hat, Inc.<br>
&gt; I guess you&#39;d have to email them to have the fix release corrected=
.<br>
&gt; Not sure how that works.<br>
<br>
NVD gave me a contact at Red Hat that I=E2=80=99m mailing now, but:<br>
<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-26594" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-=
26594</a> lists three affected configuration: all tigervnc, all xserver/xwa=
yland, and RHEL 7/8/9.<br>
<br>
<a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2025-26594" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://www.cve.org/CVERecord?id=3DCVE-2=
025-26594</a> has an entirely different set of affected products that is al=
l RHEL.<br>
<br>
I=E2=80=99m now confused/concerned why these are showing different sets of =
data=E2=80=A6<br></blockquote><div><br></div><div>The RedHat CNA has a habi=
t of only adding their own products, and NOT adding open source upstream. I=
 see that pattern frequently.<br></div><div><br></div><div>You can see the =
source of this CVE: <a href=3D"https://github.com/CVEProject/cvelistV5/blob=
/main/cves/2025/26xxx/CVE-2025-26594.json">https://github.com/CVEProject/cv=
elistV5/blob/main/cves/2025/26xxx/CVE-2025-26594.json</a></div><div><br></d=
iv><div>It looks to me that NVD has already added *some* open source projec=
ts affected, but only on their side, not updating the CVE entry.</div><div>=
<br></div><div>Kind regards,</div><div>Marta</div></div></div></div>
</div>

--00000000000086a2de0630883a0f--

