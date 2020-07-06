Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.61588.1594052206729688877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=u/TWp08B;
 spf=pass (domain: googlemail.com, ip: 209.85.221.46, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wr1-f46.google.com with SMTP id z15so30429580wrl.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=rDOq2AtuEX48LxrHpj9Vf0RKGVI9YlOASMChvd1MEXo=;
        b=u/TWp08BE13jprbyqTGQeiwGsSd1FehcVPNuNQS3UtRH1hTsjURZhNpJCEQBTVuGP6
         lBwFgGFNrlP2g/JUcq/EOhYXS80xaNXrz26+KQ0/ey4AESUnF1DdMfOgtM+v+z7lTTTo
         0PzIhJD+tJ36jq8ho7tuJFxqC4CT6E9Jiuv8EIKW8HjRw7tMvjW9qEySZxtjGjbMqgVy
         a6JvAuhJsRCFvvXCH5ltOaJtlMRbYbEJbP2AlNJu2WZnriLjmNL7M7dwjQYo+bVt1zk1
         HPydlBJ7xzpv0mwXbVJSC72s6zJeYJk4MAsjxAfnB+V1iWAOt1qeLdEvz8EU6k2W2LB+
         Ftrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rDOq2AtuEX48LxrHpj9Vf0RKGVI9YlOASMChvd1MEXo=;
        b=Ssn/uEJENlWfCm4Ij8HM9TxO/D4BdlPFi+YVUU1cVzgprId4RZlQhSFsUHpzCjgQyR
         2I1jgKfkGi+hcspw5sxboWPDYueuvL4GX8P8Trtk1NKuQml47/bg4b9nNBCS3sKWplEj
         o/8emvEKm0zQNoXBwOU6/rr3sM9iD0baSabYn1m1LLoXN26fV1YSVv7H6XoLPyHhZB0Z
         +QuM/qkRzY0Zen2Hk+9fmPVFe6M9Tn7xE6nO0QkUbC1Kdo515974oTMLJLkmN+TFsTn0
         WtdFBl1Aa9IdB7FUxVASB9YJBPfQh5idVFZ2bui8hdtzGoLNJ6ck47HxgrwJkZ8e6hmD
         A/Sw==
X-Gm-Message-State: AOAM531lZ52qwQWIQ1JSBON94s9Vnhl1qEJPMdqkW/5buiwCYZ7Kkn6m
	kfAvj8FVhC+tZGMXSppjb0NEp1YuVS0=
X-Google-Smtp-Source: ABdhPJxDnA04MYAEzE1YS/kMQRUEKn2ygek/djVcCnFsaCnTQwUF4seElrXxhOV7Mc2iEN9wTB+Y4A==
X-Received: by 2002:a5d:60c7:: with SMTP id x7mr46414860wrt.138.1594052204767;
        Mon, 06 Jul 2020 09:16:44 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from ?IPv6:2003:f8:5713:cb00:3c6e:c7ff:fe93:53d1? (p200300f85713cb003c6ec7fffe9353d1.dip0.t-ipconnect.de. [2003:f8:5713:cb00:3c6e:c7ff:fe93:53d1])
        by smtp.gmail.com with ESMTPSA id w12sm26210059wrm.79.2020.07.06.09.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 09:16:43 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
 <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
 <5ce01ee5048a9f5c0e11889cd6a9ecb150420f2f.camel@linuxfoundation.org>
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
Message-ID: <38bf8144-019d-f9c5-f816-1ad80ed79d8d@googlemail.com>
Date: Mon, 6 Jul 2020 18:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5ce01ee5048a9f5c0e11889cd6a9ecb150420f2f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 5/26/20 1:37 PM, Richard Purdie wrote:
> I think we need to be really clear about what the license of ${PN}-lic
> means.
>
> That leads to a really good question, which license is the license text
> itself under?
>
> I've asked this on our licensing list to see if anyone knows.
>
> Cheers,
>
> Richard

I do not mean to annoy you by any means, but what is the status here. 
What would be a good approach? Adrian said, at least GPL License is free 
to copy and distribute. So another idea would be, to generally whitelist 
those license packages instead one by one.

Regards,

   Matthias

