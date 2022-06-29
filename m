Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F86C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 15:15:44 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.12790.1656515734356686183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UCKHyVxn;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id o23so19333344ljg.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hu/pO67eQFUYeisUlVgrFzEu2YRcWOcO7QdRMWavqRI=;
        b=UCKHyVxn6X8K4qZJmlohGWzoxyJn3KOYsUaDueQi7y7DpgpVqLT8K51N+HLB1Q/AHQ
         X/TgHq17G/hm1iEsAYMXyn1uwBYflmUKhLues8+TNKvrXH1SBAaEjNRdjmRv9e8tVceR
         jw0zWFO8paYD0F9kA0UmNTHFTLEjgrqS51+QN33xuyVSInSpwi6NR9FlWmb0VGl0HoFH
         IAgXcSd1uYz28msnOxZtKVmBghAf+lWq/amduZXBH6WfqDzm3VYcDWINvQxeaSW5FV7Y
         7ZzpzLikePZ5oHFZb6L6MrlnYekhl7fnMRnxMZoANMcFNvl2f/ZxQJkPauaNrbKbQIhC
         /xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hu/pO67eQFUYeisUlVgrFzEu2YRcWOcO7QdRMWavqRI=;
        b=8JganosaSrO7uh9fNlSDT4bDgYf/TTUPlyQNjc0lwZyjC8AWouo2IFOdXcSONugJzi
         dwb2HVOSr27xQmMZEB6M1HDSUeJJ3tfTPjXr/yEpHOdQWRw3wkI2L8FufjQc8mpObCZ5
         /N1WcBMghA1kD3tsbS5U4KpRhIqrCNDcl8XPR7hFRFWukbHIbHlDEGGJa0XrEKN2deoF
         KThofY1O7GMFxyV7SW8BKXS+O2QLvHxSC5c5nd5CMlN2IbSHLVRcNF2w6RaERH+DwIG2
         CVzpVhc/LrC/CKj8J9bemv55MSPSqFu63SRzqMyyB5yfuXGz8cxK8C00EP4X+XEMg6+D
         1FSQ==
X-Gm-Message-State: AJIora/ARUHOmjreGX3NC6glwKcezPFvRyLkOxgVlzOmZKqSv6yfNM46
	Z6usENJO+kWOP1UnjU+2jbVjnK2lBb9eHRtMjes=
X-Google-Smtp-Source: 
 AGRyM1uCdKqe1ovL5vQmhVyzxTeg/H6ueKWh4IDXPTUhTsINiV8XLYSx06Hzz1hV+f88KIBSmiVgyaoPiGmbfQrk8cU=
X-Received: by 2002:a2e:8555:0:b0:25a:7efc:4670 with SMTP id
 u21-20020a2e8555000000b0025a7efc4670mr2232260ljj.513.1656515732466; Wed, 29
 Jun 2022 08:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220629132621.581615-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8mU1djPZBVQHFa_=FBL1tUw6OXH0AJ8VDKPX+bEmqbYg@mail.gmail.com>
 <a5da318795d11aeff646b1e5c1f357c00bee1e2c.camel@linuxfoundation.org>
In-Reply-To: 
 <a5da318795d11aeff646b1e5c1f357c00bee1e2c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jun 2022 17:15:21 +0200
Message-ID: 
 <CANNYZj_3+OxpbVNriWFm6KGuMTr0n9E7uBwRTEwLsEP=XSEEOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: 8.2.5083 -> 9.0.0005
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 15:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167383

On Wed, 29 Jun 2022 at 16:10, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm not sure it makes a lot of difference. The 5 changes after 9.0 look
> relatively harmless, some of them are translation fixes. This change
> addresses 4 CVEs and I suspect there will be more to follow so we'll
> have to update past 9.0 soon anyway. I was torn but going for the
> latest seemed to make the most sense.

Right, that's fine. I wish we could have a tidy list of things that
need to be updated, but some components like vim don;t make it
possible.

Alex

