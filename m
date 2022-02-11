Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5800C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:23:07 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.5955.1644578586687808797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RDNKIvt7;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id z19so15810688lfq.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n6LpWRuQAdhgM8e56Y6VR6FPwvxQSdxRfAdngJV31FE=;
        b=RDNKIvt7/a2W6w4So59vRV5H+GTCmx0/7H7++44VCYVcQ4tE+/7ZaWpXYnxnqJNM81
         Yy/ddk9Nwp8fMoUXhAOab3nBQcfzoF6w/rWxmNnPEjAFVNQllu4VE4DRF/3vnrqn37GE
         /eiUJEy8tyJP1j9MBd2ycHbhTVQkZYsBPu0kay86LZGmHucKpFaFg36opnxYD36fcRFH
         BGKenWYnjUlv1JZRDF4oAZuRcnnNNj9pj/7uVVvqEz4Yg2M3leQNI788CXBerpp8s1ys
         gb89jXxAc1MASZVEzLUwW77UAZlAI5nPf4lWIshZa5zkZRrXA1Wo+jAjth09XktLZOLC
         HuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n6LpWRuQAdhgM8e56Y6VR6FPwvxQSdxRfAdngJV31FE=;
        b=VMELd1+lMPM7Y0sdusXaOYMdfuyyzlMGqjgFYe48hz90jEd5FoLQUslmmotrcJcxEM
         zAP6luUXvAZljw+rUur5Z2e14OrQ+P8PaJlZPrns/n8Nu5f+NeYlBHP/nLfPnE0TumcR
         2YyygLsIjfZawfL8boBKssM5pjRjcW3eDqONVv2kAbF2GcGsvxKbqEh6EpTxLZUZnEQZ
         TNg7S9gxzAoTKIDtXdjq5sDScOqIx0kBPcO13YW/wTKyjC2TVEEu1sohYjsb+xzvFrst
         cBxtpy1sugiCemz0k7QCDmH3UPlrrFw9FG9ZEjbN/aJv4d7EkqMdagurIFIp5VDIQgvD
         J4FA==
X-Gm-Message-State: AOAM5305NH2NHwd53mJ4fEUCxD5n8ZCWyNqMyxUxFbN099fF8O80Mt+7
	himxybxMXCYbqm5VYY4Q1co=
X-Google-Smtp-Source: 
 ABdhPJzOdei5KdgMLBOGgmd+NmyNjRXF/JKbCi0qk/+cE+pSF7R5Wau9NbSjgzAfB8Tf77cxAucCEg==
X-Received: by 2002:a05:6512:308b:: with SMTP id
 z11mr915947lfd.512.1644578584509;
        Fri, 11 Feb 2022 03:23:04 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 d24sm3120066lfj.110.2022.02.11.03.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 03:23:04 -0800 (PST)
Message-ID: <be3113b8-81a1-ca3a-32d2-4fa6783bfec2@gmail.com>
Date: Fri, 11 Feb 2022 12:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] sanity.class: Add possibility to configure
 networking check
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
References: <20220211084433.10614-1-pavel@zhukoff.net>
 <CAAnfSTsvaGZ2khtFLNdkqbMRK_Yx_CmOLtSj_Jt4PSJZOb970g@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CAAnfSTsvaGZ2khtFLNdkqbMRK_Yx_CmOLtSj_Jt4PSJZOb970g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 11:23:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161642

On 2/11/22 12:18, Ross Burton wrote:
> On Fri, 11 Feb 2022 at 08:44, Pavel Zhukov <pavel@zhukoff.net> wrote:
>> +        for uri in test_uris:
>> +            try:
>> +                if check_all:
>> +                    fetcher = bb.fetch2.Fetch(test_uris, data)
>> +                else:
>> +                    fetcher = bb.fetch2.Fetch([uri], data)
>> +                fetcher.checkstatus()
>> +                return retval
> 
> This seems like it's overcomplicating things to me.  example.com was
> having uptime issues, and we can change it to www.yoctoproject.org so
> that we know in advance of expected downtime, and have direct contact
> with the people responsible for keeping it up. So let's just change
> the URL to www.yoctoproject.org instead of adding more variables and
> non-trivial logic.
> 

I vote for removing the check altogether.

As I understand it, the check was added in order to prevent
hard-to-interpret error messages when network failed. I can live with that.

Jacob

