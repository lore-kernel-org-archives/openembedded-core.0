Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58711C678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 10:19:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.30022.1678097959121281703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 02:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RIBan9Z5;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id s11so36245301edy.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678097957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnRs+U3aAU8llrUlbhncUZMfcUb7lqGI7JqMnvEx2aY=;
        b=RIBan9Z5CqmFWb17Znrj5dlMOtlQgJEN7pc3ykY/KFJOHsJHBwmDxmTWwl0368RS+q
         VFYnF8Byz1HNjctgOlqKb/bT8GJKSHp/Ep9t8xvmzQU+c54dKvkbGAZSluIy+nzsRCGE
         zw5C4cKI249LFHa3V++lfKwnue1T9dchL1fl6DGuaA1g3BzMkA+p3jgzsWQaRK6oJt0Q
         a0K7wl/HQEI7dCi+es0N8jkHxw4yIwMN7C8cFuNS5j7fKORtO480Qb8D0jHIFX/nl1Dy
         0SxTqGql1yXD/r1nFOJsEnUfOvSw6P3gUuIydWddcDrle/AJi26J5Kaw4aFhQ01BI62+
         skiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnRs+U3aAU8llrUlbhncUZMfcUb7lqGI7JqMnvEx2aY=;
        b=0mvggFT14G4RkIT6I0JBUXAbNcULYDubrKAaAj8DjUSKYjziBGDCDkc3wz8Tu7PRfP
         FiQMdtyU1vl0jhAiHiRkfMSjmBF0NlqfguMSa2OYPc96mOZ1Jd48dTC2dv9wdHE//xjf
         +40HR2PBAS20UmxMGe+I3iHQftjvwR1o5Thih0Cec2rjGvZZDXEsY7bhXSdOMgRNaOw6
         xDPw+JFJy+wiNmLPLJVHIykghHXGGlyGHGt7XSHjbc2t6ihTPrQxFBEXZaSD93WQFH8q
         AgjnXmicH6K+1H10HZbTlpiqZUxBHMXFvxQxGLfOSldLHEhYG8YafZtPVnFBC8rm7xAe
         GIyA==
X-Gm-Message-State: AO0yUKVOBJsjQXSNFXqZHEOhYuFJhH84UugDGKxP5+kE2++/xPjbSbWE
	usrXnsDOq9w0u+N2ISR2zpU=
X-Google-Smtp-Source: AK7set8FZTHFv65koEfhx40TGhXBBvO/PKxz4oK0C6/AQO6V3PhX2447/Ioo2Jtt0bvTzEHrcEW/4A==
X-Received: by 2002:a17:906:6bd9:b0:8b2:e92:41e1 with SMTP id t25-20020a1709066bd900b008b20e9241e1mr9759009ejs.9.1678097957492;
        Mon, 06 Mar 2023 02:19:17 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id e16-20020a1709061e9000b008bfe95c46c3sm4366984ejj.220.2023.03.06.02.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:19:17 -0800 (PST)
Message-ID: <92fb177d-aaf8-61b7-974e-247e117e6b70@gmail.com>
Date: Mon, 6 Mar 2023 11:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Mesa 23.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
 <CANNYZj-r0Wo4bUk1E7N2wSWYTWjpWa3FeOqYxWFSL=eVHjmmOg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-r0Wo4bUk1E7N2wSWYTWjpWa3FeOqYxWFSL=eVHjmmOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 10:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178067

2023. 03. 06. 11:09 keltezéssel, Alexander Kanavin írta:
> On Mon, 6 Mar 2023 at 10:11, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> * bindgen-cli MR has the suggested changes
>>    See https://github.com/kraj/meta-clang/pull/748
> I would prefer that this PR is accepted and merged first before a
> change that relies on that recipe to exist is submitted here.

And a seemingly unused new recipe is not going to be merged
for maintenance cost reasons as it was expressed on this very
mailing list a couple of times. Chicken and egg problem.

I prefer posting both at the same time.


