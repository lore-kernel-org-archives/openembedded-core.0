Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55D5C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 19:53:49 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.1750.1637006029316619879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ebA3Spn6;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id v2so12106923qve.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2cQ5xLg9EjIU0VxjVBGqEyqFlvrMbKKVCUCi6huLIko=;
        b=ebA3Spn69v1j+3tzKSXqN8/oVy5wIfJr35DKBEaur9Z8mnlsxXvypF4q58y1ZG2oDX
         e8FS3mnsUk5caES2S4qU1301FN6Re4LvFxDD7Nst2P4WI6ldTc5pTqBxQXzJKBRXtJLn
         M49j65jV6V1aHic0dymI3lIeZdi92NV458jpsUDcSAnBInVx7uABrYZnMJ1M6p5GyGRB
         d+9WcFpUQdxKGz11/IGdQ1u0eBUzuKjIQ4p5pN9Lqi8pEok5A8zKLX+YXnDZKGF9IVKX
         KiEFbGywENiXXuYCeEvWQ4p3l3UhCcGxiSU/iyDqVAKXRDszWbJ9h1n2E7m7gFxYIwhm
         Ld2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2cQ5xLg9EjIU0VxjVBGqEyqFlvrMbKKVCUCi6huLIko=;
        b=I4f1nLQehYgElJ84tYd6HxB10GMnFWZ2nFcikBib7/09gNvQr/L+pDIZP+//SVV39m
         b7XtQi23vncS/oPNuhD9v9hlYn5NxSTo3U5TLCOrSj6pvvltyDJn0fW9VMlyIqaAS179
         3lNr82aSMdnctwp6pa/R0rMxbW6FMVJfQlMI47HKQI90Kv1Qdb34Y97R/7UnrbQtovhm
         jgAmbxXvqq5AAW2Rweg3ckzp4q7l4zMyVPdGAhkIPlG+XxrY20vEzKD35edJn07DxHjm
         RDxdde07JmM1NVE4fCQJAiqw8YFG//ItZT48+u+lqjU270FbVRYtw5rdlmbeVLtszZFp
         g8Iw==
X-Gm-Message-State: AOAM531O0mD5C9NqSpPF9EhrUa6RxtUXGyEg5nvkdVbUAT4jvUvp8kQP
	DE3i1Ug/WtQm5KGYetNtQP0=
X-Google-Smtp-Source: 
 ABdhPJwA+xlq4xYp8hHDAyuzBNsIVhW1S/0/3G926vwzSurYKuSJKxqlkrumyzwwKPNpVWPiwueTPg==
X-Received: by 2002:a05:6214:18cc:: with SMTP id
 cy12mr39687922qvb.47.1637006028491;
        Mon, 15 Nov 2021 11:53:48 -0800 (PST)
Received: from [10.129.163.78] ([37.120.205.172])
        by smtp.gmail.com with ESMTPSA id
 j20sm3098181qtj.43.2021.11.15.11.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 11:53:47 -0800 (PST)
Message-ID: <d897665a-3746-80f0-9771-875165d16b2b@gmail.com>
Date: Mon, 15 Nov 2021 20:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] Suggestion to use python-parameterized for QA
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
 <CANNYZj-xeJS_+3r-Lwg=Nzyr+KrtFA8hCpGj-DeDpaihzB_TQg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CANNYZj-xeJS_+3r-Lwg=Nzyr+KrtFA8hCpGj-DeDpaihzB_TQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 19:53:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158311

This is still work-in-progress, but I'm working on overlayfs-etc class, 
which would have different behavior depending on an input variable. You 
can see the example here

https://github.com/UVV-gh/openembedded-core/commit/ea424efb7780dc3c85e329b36f4a675b56e86877#diff-9980b9625344e11f15451ab7c97fb1f137e94b68fa27df737c576b75e313996aR215

Regardless of the input parameter the test would be the same and should 
work.

What do you think?

Vyacheslav

On 15.11.2021 20:38, Alexander Kanavin wrote:
> It would be helpful to provide an example of improvements that can be 
> enabled with it.
>
> Alex


