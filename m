Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF58C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:35:26 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.11906.1635024925315179373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XwE+Q3e4;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id q8so4722410qvl.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PjG8O5bbulpZfQlWnp1P9LtHbVcQI2NYesQt+Zb6lCo=;
        b=XwE+Q3e4VTFewvpt2yp5eU0n2emXSXsNaOU4CE0zROgePo8bgtZfN8+XrXka0Bk2pg
         BgGwIr2VUj/VJCE6e1A1gJCxWnZn229rnrq+3wSiPzMU6pMZ932knFSnE0HVLD/jh0SX
         qtto0b1VBeDSSHJiwMXlpf9w3d/eJMaNB8zNPBrkIQw+w8/XJLJgo9B2QIrZkwAj/NZe
         8IexM6+QoZHw4yBGNEvhYchpnwOJE7gm2+4xwokZBIRl9Y7QU7bKn8kHFAgz9QV19Qh6
         z92c7GbxwHrTbf3EsZF85WLY1gvD7SU1t1Ekt8r50ocWuCloTT56FZ4HgrHRYwdAa8DV
         0rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PjG8O5bbulpZfQlWnp1P9LtHbVcQI2NYesQt+Zb6lCo=;
        b=RExw9eGsIkbsBrEH943fFErI+rCh4Qdaj9YCLnOFtEDlHw7gSu2IlIvm38Kjszl2h1
         +kYnRWkWotWAtWNke+LmIKkZ6B2kOyGGTwq1d90q2crwa3nfmgSEQXRoSTF5KSa5mzh8
         TmWyzmEM971XTdc8fvgdv8X8Lj9jijcdDqn2Qd6LBZARh3RAm6cRXXBfi8X2vMi0/q/H
         7199BQB88Ubzy9RxFa6ppiziogJcwmK3w5J1H51jr0L8A4Ss7w+fYxG8mspVYZTSMuOE
         FqwRVQpKZSxFDXjXIJwC3bCq9HNMkFdBpFancMvKuwqmUXuqLPbw8e79SYikh8t7cXF7
         papw==
X-Gm-Message-State: AOAM532mq7ZttndUB1DexBmAeejBwq1+dG0YznwbdEfQgh+mGAy1Bxu4
	3fKFDbood4BQQjhBUEYgD7o1R4JU70oy+8Icq/w=
X-Google-Smtp-Source: 
 ABdhPJydBdlzjamEflfBsfpp+19kVKMq6aQdfWy9qHMAm9dZOCt4aYdDi1D7kkyj/Jno0M/Ihq+ETNboYuNun+Mt0SM=
X-Received: by 2002:a05:6214:188:: with SMTP id
 q8mr7590998qvr.5.1635024924456;
 Sat, 23 Oct 2021 14:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-26-alex@linutronix.de>
 <968cbfa1-7d80-11d2-d6ab-e050ea855799@gmail.com>
 <CANNYZj8D2kgjU=LzbpY6simn3cRM0-j4UOM68iDB526robueLA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8D2kgjU=LzbpY6simn3cRM0-j4UOM68iDB526robueLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Oct 2021 14:34:58 -0700
Message-ID: 
 <CAMKF1soYDEzCb+5o+hg4CbudBgc9qQnYyRPbQaypSfy0KOoN2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/65] psplash: upgrade to latest revision
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 21:35:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157319

On Sat, Oct 23, 2021 at 10:38 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 19 Oct 2021 at 18:44, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > -SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
>> > +SRCREV = "f5203fdee61b90ef9552ca49c213fe16776b3e4b"
>> >   PV = "0.1+git${SRCPV}"
>> > -PR = "r15"
>> >
>>
>> Since PV is not bumped. Resetting PR will break feeds
>
>
> ${SRCPV} ensures it won't, I think?

yes with PR service on it should, On local build it complained with
version going backwards since PR server was not
enabled.

>
> Alex

