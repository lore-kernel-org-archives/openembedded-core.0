Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251F2C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 18:47:48 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web09.1982.1635446867321234395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D4RWnNfd;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 131so6188049ybc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u2toh8KQ6BeXrBPWS+p4LLbF4c8589ZYgtsp73Ywgdo=;
        b=D4RWnNfdlAQHDa7dGg9dqMlyCuAyNB7YoFhOIUIsuzaixuru2V1LPiYBC5ruk6cK0r
         l2TIaPJGCoDvKXZpeUQ84fVNIBugvfdSJJoFvKTcki2CHtU07VA/eKlIU+bB5no68R73
         RN7gz5PzTHnHZZoJBuO+XKrqqTysQS+re9EoaUa2qWw8IlbYdnCNJ/pV6hfOjH5ckhz/
         BcKiVRSGr/Nz4IrhdLVy2h8/CyeVqCydumEAqIwaKmbiayW8jvowYPeC1EM35xSsSida
         E0sAuSoMbbg7o7sVa1XZVKaXnrjnSeQl6a6W42iSuCN0HHhFaLMj/KO4BGC1pusr//o7
         vSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u2toh8KQ6BeXrBPWS+p4LLbF4c8589ZYgtsp73Ywgdo=;
        b=qs8t+S9K3BSPcKu/sg4Pa7b76OEQcmiVCstXkIEbCA0hOmRoSawO8unwdvEdydzlwj
         yOJu+upZg9mjfxThcLDSd6dpEb7Vyepx745MAKg73ZAQHDWy5RB7xJElUXBOUcTisbdg
         YMWyfmpDO5qW//dVFxg/z1xycEzOUZp070RJeLJr6QUXVnpZwlvEoKvb6GD/HgQ+w29T
         vZRL88TKmdiJy7G8+5osXS7Pghih9ZQPeZDGDJZ/TtPp5T/PAx6edORCpoV9WPZOsBwq
         j/Sxoj6Tz9k6fU9hTr8dDhUx6tg17F0DFQ3FOpjnkybxpMSMXTc6aMZu7JRS+g2ManiC
         dmiA==
X-Gm-Message-State: AOAM533dxJ1Gk8S98O0Uv418tHOBmSi9cuE9ZJxt70ilu1PoXZTKTv4y
	h01lNeyFqzd2htqq57cTKQhf+qRkwVTUPd+L6ajnz7qE
X-Google-Smtp-Source: 
 ABdhPJxQT6CPQijXSJJrZ1bDQGj/cAQcjrqs/ZRR9NI4i9zUWBvOqd/pzwldCYpya5hIJyLabktGv+S0yIwY9FiJaPk=
X-Received: by 2002:a25:f211:: with SMTP id i17mr6899836ybe.378.1635446866568;
 Thu, 28 Oct 2021 11:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Thu, 28 Oct 2021 08:47:35 -1000
Message-ID: 
 <CAGDS+nkJ4en5JjLGSMuePSQUY+mvLiek4X67q5Go+LA8307ApQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Saul Wold <Saul.Wold@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 18:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157604

On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
> Hi all,
>
> There are any plans or is it possible to backport the SBOM/SPDX to the du=
nfell branch?

I'm going to yield to Saul as to whether he thinks this is
desirable/possible or not.

Steve

> Doing a quick look on it I see that it is not too intrusive and the most =
one is in
>  classes/package: Add extended packaged data
>  7ec54b174304e940ec66f21ac512f7b50fa637b3
>
> Jose
>
> Saul Wold <Saul.Wold@windriver.com> escreveu no dia quarta, 27/10/2021 =
=C3=A0(s) 02:31:
>>
>> Add annotations to relationships and refactor code to add
>> create_annotation() function for code reuse.
>>
>> Ensure that "cross" recipes are factored into isNative also.
>>
>> v2: removed leftover and unused annotation per Joshua
>>
>> Sau!
>>
>> Saul Wold (3):
>>   spdx.py: Add annotation to relationship
>>   create-spdx: add create_annotation function
>>   create-spdx: cross recipes are native also
>>
>>  classes/create-spdx.bbclass | 22 ++++++++++++++--------
>>  lib/oe/spdx.py              |  6 +++++-
>>  2 files changed, 19 insertions(+), 9 deletions(-)
>>
>> --
>> 2.31.1
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157476): https://lists.openembedded.org/g/openembedde=
d-core/message/157476
> Mute This Topic: https://lists.openembedded.org/mt/86616599/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

