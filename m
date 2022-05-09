Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5654C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 14:42:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.32783.1652107328840827468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 07:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jq2UEeC4;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id s14so14053361plk.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KwiABcern/hNiLH7OhLtGS1CRLO+H8fAVLvFA32pPbw=;
        b=jq2UEeC46KT+te1N5F8wCwYFZPNUY6Kzz5pmut+zf2XLWxaUS8ND11zGuz9dzg6JB1
         Ke312CRSnIZL//o11on9TtbmeG7aCSV1PsM5zYDstPBlteRw72gy9pPYadS7gGEFwGlm
         XCnmhNut8zgblUe94FHRy2JNOIMK8LEfq36ipcXkmOYbNdd8GeHDsFWDJnogHjxbCP+m
         TF+OsympSYNELX8ifIQzaJgkrl7TuD+f11Ffvg3lhPK9Xwg1BJRZ8I/Phxc4nFWo/pb6
         YArdSeM1uc7V1NCnQmA5xPXaYYI0QGW9AlmNPEQyBPId1VA2I/WDPtlXPUzYK91bp5Wi
         U8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KwiABcern/hNiLH7OhLtGS1CRLO+H8fAVLvFA32pPbw=;
        b=ldm4rT2EHUKvQL3FzKUuroLvRrlbbfunIoLIj6h+kDWtwomIES4zXZm1L0l279l9E1
         aRLfvnBaNU3pnKV5HHdprK3qIchFuricCayEv1FIuS7flBelFosVjEjxWstH9lmQLg3r
         e6Zbk5jDdEkYGuhi7VU6L8GGkWJHP822EYBZupG53FbTBQdcmmlqi0+g4WYzH6TbhB9K
         /rwP3Wexym9NS8aZzt3liPjAjXQzPRp4m11AWZyL1NEGNbV0xddVOtx/X+Ei8Zzq0ZL2
         GkqtdwUu4ocEb9Rkj7pJ2AY6NjvsEY487YopGrYO7F7oZdYqTDupp9XGacONXKsBKPnH
         BBew==
X-Gm-Message-State: AOAM533O25t7UQAaynxsMH4pdJXBAXrLSLhzU/u36qoiLvQrK1UYiGLz
	6ZWWatdIdMVtL8RWZElz1Kr3eNrRKkrQVXVf1Gk=
X-Google-Smtp-Source: 
 ABdhPJwC+yDzuuGL6vqk0rssfbMVbJ91Wkw1EE/EI9m2kBgk0H8JdtYfw6BM4Msa035CHMTwQVhXBa26qwfLxDRXBqc=
X-Received: by 2002:a17:90b:33ce:b0:1dc:690e:acef with SMTP id
 lk14-20020a17090b33ce00b001dc690eacefmr26362117pjb.121.1652107328366; Mon, 09
 May 2022 07:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220508123418.159142-1-richard.purdie@linuxfoundation.org>
 <16ED214F51D113CA.5869@lists.openembedded.org>
 <940414ecb58f77ed1c0ce6693cf7b5e8836ce28a.camel@linuxfoundation.org>
 <CAApg2=TNtVc1Zb4_1pD2Vd53338++wPa+Lwj4QUVJaBdMwkjiQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=TNtVc1Zb4_1pD2Vd53338++wPa+Lwj4QUVJaBdMwkjiQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 9 May 2022 16:41:56 +0200
Message-ID: 
 <CAApg2=SuKxA7ZJnsOV=93jd=GSkotJfSZVFdBxx33E+2NicgdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] freetype: Upgrade 2.12.0 -> 2.12.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000702d2405de9536b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 14:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165399

--000000000000702d2405de9536b8
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 12:40 PM Marta Rybczynska <rybczynska@gmail.com>
wrote:

>
>
> On Sun, May 8, 2022 at 6:45 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2022-05-08 at 13:34 +0100, Richard Purdie via
>> lists.openembedded.org wrote:
>> > Includes fixes for CVE-2022-27404, CVE-2022-27405, CVE-2022-27406.
>> >
>> >
>>
>> I'm amending this to "Include fix for CVE-2022-27404" since CVE-2022-
>> 27405 and CVE-2022-27406 were already in 2.12.0.
>>
>> I don't think the CVE checker is going to like these as they're using
>> dates for these for reasons I don't understand.
>>
>>
> They also include versions in the NVD, but there is no version "
> non-afected"
> as of today for CVE-2022-27404. I'll figure out the exact versions for
> those
> CVEs and update the NVD in the next hours.
>
> Kind regards,
> Marta
>

Update: the message to NVD has been sent. According to my analysis all three
CVEs have been fixed in 2.12.0.

Regards,
Marta

--000000000000702d2405de9536b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 9, 2022 at 12:40 PM Marta=
 Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 8, 2022 at 6:45 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2022-05-08 at 13:34 +=
0100, Richard Purdie via<br>
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
 but there is no version &quot;<span style=3D"background:rgba(0,0,0,0) none=
 repeat scroll 0% 0%">non-afected</span>&quot;</div><div>as of today for CV=
E-2022-27404. I&#39;ll figure out the exact versions for those</div><div>CV=
Es and update the NVD in the next hours.</div><div><br></div><div>Kind rega=
rds,</div><div>Marta<br></div></div></div></blockquote><div><br></div><div>=
Update: the message to NVD has been sent. According to my analysis all thre=
e</div><div>CVEs have been fixed in 2.12.0.</div><div><br></div><div>Regard=
s,</div><div>Marta<br></div></div></div>

--000000000000702d2405de9536b8--

