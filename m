Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3646C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 13:41:14 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.11673.1700228472560768065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 05:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YbHnpBWh;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7781bc3783fso120442985a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 05:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700228471; x=1700833271; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eyw+//YOdKGduK3f26w8YGWgKddnC1IJTf0hOde4/g=;
        b=YbHnpBWhWsbWdeg2zvBDZFjgVcWJAylyg/91fJpUE4PMitZ5PmF9CT5F3TgM6qLJvA
         6XN3REvGD3cRrlGfz6nw3rMF3nrKzQeXJVI3jfxB96wVK8GVtMSe0o+qs2ZZdIJ15Dkl
         05pgLJXjRIaRK0pxNr0edjxoaRtwSujGJcOwg0hZDVvsamSeCa5u7mobUhEJ5AVzXS+q
         QAHH1JBkKNGHqmO87jEPjOONhtk+xcrVAHkoAQ9KwJTti33HJlqm3leC2b1fja1Ckw98
         wMT7MIu+VVs2/6LKlmyrkI9xMYfXiMC5sKnAahwy5sPe5A8LdcW/j0ii2Lwy8+PAHdex
         atvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700228471; x=1700833271;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eyw+//YOdKGduK3f26w8YGWgKddnC1IJTf0hOde4/g=;
        b=W0flfN3M8naxpgUxmM341LvIyTWfg9IcopuiduxMdotOhcnsdqwzs2ZXn2tg/cL4V9
         XmREzbHy5e78JNDp9qdlDCwcfTq2xwEdQiKuUsCKx/YQsUZIO3ZuYCcmravmWgWS67nR
         LDELQKL0T6KCkKV0ga6XK6pNoGt+y8cgYWQod1cTN1lqhvjwVx1JdDiQ6qqlzmOMUnJ+
         sAsvAb04oD96wWe63x6c5pTi1cmurWxRZN5aaqdc4t3PRKktTPJjRBfYtgEQDHQlszJj
         AARlU50MmMb1UmbLyVPcnTJ1WwJ4Ac/yqcVGPObPiN5A9UZ6Iadq2r2zmJl878TfZgiK
         X3hQ==
X-Gm-Message-State: AOJu0Yz6sW9oBwyOST64DNPpOCp4l98yqP3huBIq9zn7lG0P2P2YhbfG
	ZW5flB85wx/cNhgWGcwYcGDx1g==
X-Google-Smtp-Source: AGHT+IFAb1qanqHIl59Gw5X8Ei+FTf44I2a20cVqcSOI5sKY2vZ15x1wAktev3SLxdmGneCK8Rz7Vw==
X-Received: by 2002:ad4:5983:0:b0:658:23a5:e062 with SMTP id ek3-20020ad45983000000b0065823a5e062mr10243126qvb.31.1700228471097;
        Fri, 17 Nov 2023 05:41:11 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id p14-20020a05621421ee00b00677fb1f6d8dsm172389qvj.74.2023.11.17.05.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 05:41:10 -0800 (PST)
Message-ID: <e6b53d28-9fcf-4c37-8ca6-dc80d0750ff2@baylibre.com>
Date: Fri, 17 Nov 2023 08:41:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] Upgrade status: 2023-11-15
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <0101018bd371ac9e-f3e617c1-3285-42ca-b76d-805f5ba01cac-000000@us-west-2.amazonses.com>
 <CANNYZj-3GjmxVFSdryznTp6vGnkR673TxH0fUmCLYcA0UkjxNA@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj-3GjmxVFSdryznTp6vGnkR673TxH0fUmCLYcA0UkjxNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 13:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190849


On 2023-11-17 08:33, Alexander Kanavin wrote:
> On Wed, 15 Nov 2023 at 15:45, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
>>          python3-cython, 3.0.5, Trevor Gamblin <tgamblin@baylibre.com>
>>          python3-mako, 1.3.0, Trevor Gamblin <tgamblin@baylibre.com>
>>          python3-numpy, 1.26.2, Trevor Gamblin <tgamblin@baylibre.com>
>>          python3-trove-classifiers, 2023.11.14, Trevor Gamblin <tgamblin@baylibre.com>
>>          python3, 3.12.0, Trevor Gamblin <tgamblin@baylibre.com>
>>      Trevor Gamblin <tgamblin: attempted=5 succeeded=4(80.00%) failed=1(20.00%)
> Hello Trevor,
>
> I'm working on python 3.12.0 update. Can you handle the other four please?
Sure thing. Thanks for doing the 3.12 upgrade.
>
> Alex

