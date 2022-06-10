Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1640C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:19:29 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.27624.1654870759418970880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 07:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WLf+19F2;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id v25so35498186eda.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Miq4N/6HM8N3U9TNON4ycmrUg42387uhQe/zfhFQuy8=;
        b=WLf+19F2ABKj001z/fLYtBTZeNSupV6C0milMc/bevcUBupIhbMRG6pIHfplstvHX2
         NnCLrtGNi9GMikOUGLzb36KqAagw8eF7N5fLHyi+pwb0KhTedGnCuW0NbhIWZjtFLhq1
         VM8SiozFxiceLecXK4tWrWVEPxDfheZxmeL+LvGcytm7b0GYdUM5A74vNb7COILfd4OT
         X/zxerbEvVYbpEHRSh0A7GUm9fhWbShcTz64DJZHE8qmF16Msegh0LzNyyYePdis4Zex
         vDWfrWJp+jFaQ14H4uYcLgSJAIaLe0B0mAxb9HTb4iDORZC455mtqrP4Vz1Jj3m27Zka
         Z4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Miq4N/6HM8N3U9TNON4ycmrUg42387uhQe/zfhFQuy8=;
        b=caIrQhMNDMOFVlku9fF/Sjl+TVa8WmATLUPoD6seQMb9xnuteNplkXAMhnqYrGEAeS
         gkY2NmxmioIwam4OtzwihjwoHClhqR5CdVh2natWJRGaJF/ZkAQnQLfdjspymOsYR9mg
         4URO4DMhynbl4BqQ2JOItVPFXkKpGHd6eoJMMCiCF9iyVXQ7ApsCrfNi9Fe16eOXo7A9
         Tbo39i6hKg8IKTRZUj/XQJGubFNOviMTpl5UuHgbKrmae5bkle4cGlldbgThwNUd9yJU
         HjNJZxPfmJ46Ho/qlb46IgQ9LHtpGIaP46hJqG5kIzxSELUoS6D0kBFFqDTBPucbj+Pt
         UrbQ==
X-Gm-Message-State: AOAM532e/7gcZYhDCtmtEHbcjKu9zgjVdWJCsaISTnu8LJ4SwWCaHGFf
	CxP9MPSx9cC7UYQcR6jOItmogsnt7FoXbd8ul5V3sw==
X-Google-Smtp-Source: 
 ABdhPJySa2rQcrKl6W2GATJX578bd7zZcVtpigp2GZfpSJiwV4hlRr5v2nQ+2GJU0dhNMCkzJv1iHmqrTyDFpRchOsw=
X-Received: by 2002:a05:6402:703:b0:42d:d347:a586 with SMTP id
 w3-20020a056402070300b0042dd347a586mr52167780edx.316.1654870757666; Fri, 10
 Jun 2022 07:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654188574.git.steve@sakoman.com>
 <11399.1654850358021809382@lists.openembedded.org>
 <CA+chaQevwOdx8w6bGNqwX1=WBN9WnBgHv+EBkUOf8cT7Z=NbjA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQevwOdx8w6bGNqwX1=WBN9WnBgHv+EBkUOf8cT7Z=NbjA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 10 Jun 2022 04:19:04 -1000
Message-ID: 
 <CAOSpxdY7jX0L+eVhQmsATJ0Ui7WY2BO3YLhHPy9A1_xD8WVo7Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone 00/26] Patch review
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 14:19:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166807

On Thu, Jun 9, 2022 at 11:12 PM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> Don't know if it was intentional, but these patches seem to be moved to s=
table/kirkstone-next:
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-next

Yes, it was intentional :-)

The general flow is:

1. Patch testing is done from stable/kirkstone-nut.  This branch is
changed/rebased multiple times daily and is likely to have issues, so
it is not for general use at all!
2. Once I have a good patch set in stable/kirkstone-nut I send a
review request to the list and allow 2 work days for comments.
3. If there are no comments after the first day, I move the patches to
stable/kirkstone-next.
4. After the two day review period I send a pull request from
stable/kirkstone-next. If there are comments on a patch I will
typically just drop the patch from stable/kirkstone-next and deal with
it in the next batch.
5. Richard takes the pull request and the patches move to the main
kirkstone branch

As you might expect, I follow the same process for dunfell :-)

Hope this clarifies things a bit!

Steve

> On Fri, Jun 10, 2022 at 10:39 AM Sundeep KOKKONDA <sundeep.kokkonda@gmail=
.com> wrote:
>>
>> Hello Steve,
>>
>> I am planning to do a regression test on gcc-11.3 and cloned the repo fr=
om given link 'git://git.openembedded.org/openembedded-core-contrib stable/=
kirkstone-nut' but I did not get these patches included in the cloned repos=
itory. I could still see gcc-11.2 cloned. Also, I verified patches in rust-=
common file, those are also not updated.
>>
>> Can you let me know does this repo is correct or I've do anything else t=
o get these patches?
>>
>>
>> Thanks,
>> Sundeep K.
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166791): https://lists.openembedded.org/g/openembedde=
d-core/message/166791
> Mute This Topic: https://lists.openembedded.org/mt/91503792/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

