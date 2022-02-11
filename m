Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B37C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 12:08:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.6371.1644581310264603235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WX7Wr0Kl;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id f41so8913702lfv.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=dbZ5TKTqXxPBp31ARvZXGz/UAa4A2loZB7MOwzid/G4=;
        b=WX7Wr0KlxnyZ9tq41e9tvidMxgg0S+33ugHwVHBrSjkZhWcQHmzxPJNTr0/4ziuNvK
         IO9LEyGagsqq4GEWFwfUcWVJ05Cwbeo8zjpyEK3q9r0ORbZgGBsALCrxKZDL5Ge4aged
         Qc1O1IL4rRCUyxIaDiSKe2tjTdhIW9YxlegrupA/XT4JZGlHrc1qM2kpPSnvOblYC0qX
         3QUhOVP/JqbRyBUiveSdOzL+Ou1/p2XU0NaPjkjSZmTtvwz2ws8J7P6dVZFZAcg12jT5
         2hPc9L+jY3LJCTgU3VijA80Js4G7IKU4QDUqbpvbo0+eB0SqNFBoUkbPMMvz8QojzR+g
         4k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dbZ5TKTqXxPBp31ARvZXGz/UAa4A2loZB7MOwzid/G4=;
        b=frhoMmIcy9lwD9ewKvsR2WU+X0T5J+5Z10dLjaTmBmnf4BL6c7+hZzVWD7Dwk9QOrz
         c5uAPUev8S3L0bcKolgZP/15BFNPJ8AWXew1cJYtN0Ulnh60uUpOTr59esFW4X2rgUGM
         xk/whz7aMEVAiL35e/rbKtTRzrjpJ+rxH4ltfJOypnxbr/w3VSHAvRC4UGTOIYyem+0u
         wwx6hwRMAQBRtZHFbcnbmJlBm79rHO/FnKAR1BlN/m62WZHf8PEonSZ5lahv54sHPHf1
         LpBJ8+SR0B9+074jk5k4uNtsbHAkWfNoNSFraUlIZV/nTeYZXjBOI6yVeCH5OQtSvtCz
         Hw8Q==
X-Gm-Message-State: AOAM531Ler8t3HfxZCLs4FgWu2kqn5vOUKTMLaxZFohovnRNvEXK9oBp
	FPfo/mhr6WXiI6ywQfrS1M0=
X-Google-Smtp-Source: 
 ABdhPJzVU3Hc/Y0f4WYKOHR7flej9NtCzPxFW6BZQuUGaPYRCOtOr9aVcRKjViNsvV8DW717ln5TiQ==
X-Received: by 2002:a05:6512:2629:: with SMTP id
 bt41mr991891lfb.49.1644581308236;
        Fri, 11 Feb 2022 04:08:28 -0800 (PST)
Received: from [192.168.51.33] (194-22-63-58.customer.telia.com.
 [194.22.63.58])
        by smtp.gmail.com with ESMTPSA id
 l5sm3174295lje.21.2022.02.11.04.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 04:08:27 -0800 (PST)
Message-ID: <b8ff8c70-ddcd-5a31-ce40-53fe2f43d2b1@gmail.com>
Date: Fri, 11 Feb 2022 13:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] sanity.class: Add possibility to configure
 networking check
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220211084433.10614-1-pavel@zhukoff.net>
 <CAAnfSTsvaGZ2khtFLNdkqbMRK_Yx_CmOLtSj_Jt4PSJZOb970g@mail.gmail.com>
 <be3113b8-81a1-ca3a-32d2-4fa6783bfec2@gmail.com>
 <CAAnfSTt==tDAVW7DaGKKDwwJvwGbTQPw26-Oc2dDpeQf263Wsw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CAAnfSTt==tDAVW7DaGKKDwwJvwGbTQPw26-Oc2dDpeQf263Wsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 12:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161646

On 2/11/22 12:39, Ross Burton wrote:
> On Fri, 11 Feb 2022 at 11:23, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> I vote for removing the check altogether.
>>
>> As I understand it, the check was added in order to prevent
>> hard-to-interpret error messages when network failed. I can live with that.
> 
> I think the check should remain, and example.com has served well for
> some time now (since 2016 in
> 423a2645377bff2cd7292e1dc9796eeb3595e937).
> 
> We moved to example.com to speed up the check: the old tests were for
> two yoctoproject.org URLs and it downloads the entire page, so that
> took time.
> 
> If we can get a minimal page added to yoctoproject.org that doesn't
> involve hitting WordPress, then we can own the URL and have fast
> responses.
> 

I suppose if the intention is that the Yocto server will never ever be
down, the check is ok. But if it is ever going to need to go down
because of maintenance you will break bitbake builds for everyone in the
world, right ? Then I don't think users will be happy, even though the
downtime was planned and publicly announced on some website.

Jacob

