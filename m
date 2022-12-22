Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E073C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 18:40:03 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.53167.1671734394041644838
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 10:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OMjLBH1L;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id cf42so4027441lfb.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6/TibfiqniQHc/buRoHZwBoQnQ9Uttb4jfqBUKb9PE=;
        b=OMjLBH1LT9kzUhPo4NFxJUKfiHtJVk9qXNEcURbYrA2zVY3aq+3ieuzi5iBvHK5lbi
         bbsL1n2qyVZC/0/Ibm/wdo2aC0bG+nVmz13Gann16sD4REiC041TuAPSBwrMid4u0GNL
         aUg4R5n248U5z6NJn2rfwZrPbIgTpMdwBTmGOmwHSTwD+NLWuTN6F8bBw3uDgU01VevS
         MtELac9vc2egTOB7pLmE8/zEaCwUa1PpjFMCzURAR1bNKynBa/pUXf+7kcqEksvamHgQ
         el4UIlyIKjKfFdjNEnwgefN3tIn3jVgZPFGmzQde7kfbp2AU6IINVhooJv70g/uZ2+28
         J0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6/TibfiqniQHc/buRoHZwBoQnQ9Uttb4jfqBUKb9PE=;
        b=bMDf3uutQc/Dp71x7rwEX8nVy/nldHPsxYw26IWawnTqZj0kecG2nkLdY1ryendT1H
         R30GtzbHTFX7EVuKzCNI8oIYPNtLeuhm32YUnyKuRNttKYmFaAl6jhXoNCMNzvXJu0HE
         VNgUPPum3UM8a1SaVnQlRoulyIA3ctKEZWOCzCIJIQ+ZaWkoXhBhYULVgSdSbLJmp+Db
         yKqLrcw0WZDafUzefMAAUD1spAKKZr7LXyOkdh6yv1wF3wz3M9Bwwt75veGdIIhM2+ew
         7PyCt4G0S7LdqsQqlwtHQeUdVoRAg+mYSLC0krhIi0Gi4GMZ89OHv0K9CTiCQvNimPP9
         Snnw==
X-Gm-Message-State: AFqh2kokuKICFRhW+91MFBUmRKdswS2+IE/9xQO6hXqwx9hDyTg3s//B
	zcSHYv5qTa9uEcwLX/Yf/hI=
X-Google-Smtp-Source: AMrXdXt88HU00mo7RkhnaHNYUV9kpcVqp5My3Q6YnFtq369dLrQFPyBOMb2XT5qCRJ33+11sajYnbQ==
X-Received: by 2002:a05:6512:2031:b0:4b5:81ab:4c75 with SMTP id s17-20020a056512203100b004b581ab4c75mr1741742lfs.40.1671734392151;
        Thu, 22 Dec 2022 10:39:52 -0800 (PST)
Received: from [10.133.224.14] ([185.253.97.14])
        by smtp.gmail.com with ESMTPSA id c23-20020a196557000000b004978e51b691sm157638lfj.266.2022.12.22.10.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 10:39:51 -0800 (PST)
Message-ID: <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
Date: Thu, 22 Dec 2022 19:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Openembedded-core@lists.openembedded.org
References: <20221222150246.91423-1-uvv.mail@gmail.com>
 <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 18:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174970

On 22.12.2022 17:48, Bruce Ashfield wrote:
> On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> This patch is not in master and is not a backport therefore not
>> eligible for kirkstone/langdale.

My bad, the intention was to have it in all three branches: master, 
kirkstone, and langdale.

> 'nor should it go to master.
>
> If someone wants to allow go to fetch sources during builds, it needs
> to be done in their own layers.
>
> Bruce

Probably I misunderstood the outcome of the discussion in my first link. 
Bruce and Richard, you both suggested to have it in go-mod with the 
warning. I agree that it breaks reproducibility, and is considered a bad 
practice in general (I'm aware of a few more build systems with the same 
shortcoming).

My point is, until a proper solution is in place, it should be at least 
documented somewhere that this should be done in own layer/recipe. Any 
suggestions where this can be documented if not in OE-Core?

Vyacheslav

