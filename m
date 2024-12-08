Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D190E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 22:42:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.88164.1733697729793207104
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 14:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qr5hZP8T;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385de9f789cso2827660f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 14:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733697728; x=1734302528; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeklwPme2W41c/hzegwJ2fN6gzO5EbeFCLShmarBA2Y=;
        b=Qr5hZP8TueyhOceY2Lip2TLwT81Kw+QrBF7QwOwU1iEqAB0Ipv701clOj4I3YYcCaY
         WBrwtVcwRnYWKm+7G2eYhFV97tZtJ1gBhewzFUjreyyPZ8NwlITnpasOEv7s5V1b9YBj
         BrDTfRMXA8u7nEDEMrZur4YcUP3GyN0fW/SYBSkXRiucf7OEvW+RgaU5rmrcNi5qpJsc
         nQlU+N6Do/P8s189oI2AZKo4CTl43v1zPpUABriLyDmsKVdIthr/c2xPXqeifO5AOA38
         NWd+l/o/FJ4vD3roeNGLp0QO1/E2OQ8HIXukEswXIfIRDHq0+QSCS+5r+iW888I6/H8Y
         jC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733697728; x=1734302528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeklwPme2W41c/hzegwJ2fN6gzO5EbeFCLShmarBA2Y=;
        b=DukWDk5sR0eg2gZXV9uOEWvssOjxIsrPOBmStFwr4P8itX/KO/Qofdhmu9JEY+ZxX+
         VeN7gOYDlPe2TzI/bOWwo76sw2gQj5iycFCxiQg3GUmEZH4oWkHYBAe8drDOKuMQMdBz
         wOomiCNicqDqIujsbgC1K4RVyRxDQlLHqlVQl7QjDP7lduchyeMJ42UK8qJ5d9gCuhIe
         lh1St4E+k8aaaQODi8u9BVGQOGLyx/65DG81piwx7OkmfxsG6+s54Nl3/U9E1cPIXR3R
         nd0G/rh3spY3oAA+7kYF9zw2nKhD+tR0LBzrbu064kkEYBD8OTmdb1qi995yj3snxFYp
         0J0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh1z6h7UXK5keD9jlr6ChG/makCE+mPfknNgs1TgUCkl4B3Ag45LkKjbWngbs8sEQx5Q6/mL7Lo1V1GayLoDqz0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUFjL0gQHToBKZ1zNL98D99tFyfBX7Izzyz/WAE9Ot8HVhBpNN
	XFPBtjlxXZRo/ekp3NVbOn9C1KDpRGS93upQK+Oisx4+/Zrowawb
X-Gm-Gg: ASbGncvlGZhc6GQ7wu7B/LXcP1iMh4dY5medSXFR73Ub2t7jaxUZbAsWRW8XNj42G3o
	kAcxzFBjm61V1icG6jXvXzau4Vv9PDNsJu+fgDZbn8pzs/0+Oa6x8Bf2XH6+QGSqF0oU8zab7pH
	4FpFm6cLagRyYIU84Vil5F1RkrnlLVmYsBXrwHo/9QHAdJL4XkCC3A0d8p9ltIX+XkvTgJVqgxt
	cAOm8cO3zX2weog7Xce/vbb/FtwoWIR4ta5HPuWdvtQPGWMW9qa9h28gXieHS+hfNDE5mLo9fgE
	azyNc+tZiENxFFaXyhrddnlxkmnVNQ==
X-Google-Smtp-Source: AGHT+IFhpbSnvDos47P2bpgee5zhBoiph8aKrYlTfKkryIcWGuwW6caFeaoDjPhAcmRxzomEIT/Lew==
X-Received: by 2002:a05:6000:1f84:b0:385:e9de:d52a with SMTP id ffacd0b85a97d-3862b3ceecemr7945811f8f.48.1733697727901;
        Sun, 08 Dec 2024 14:42:07 -0800 (PST)
Received: from [192.168.188.21] (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fd46b73sm11214373f8f.58.2024.12.08.14.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 14:42:07 -0800 (PST)
Message-ID: <93546c3c-9586-3beb-25c4-a67417f50b1d@gmail.com>
Date: Sun, 8 Dec 2024 23:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] go-vendor.bbclass: avoid QA errors with
 absolute paths
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
References: <20241206173119.12422-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <045483954dfffbe9dc30f4032b0bf78cbbc4d9b8.camel@linuxfoundation.org>
From: Robert Berger <oecore.mailinglist@gmail.com>
In-Reply-To: <045483954dfffbe9dc30f4032b0bf78cbbc4d9b8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 22:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208472

On 12/8/24 23:27, Richard Purdie wrote:
> 
> Can you provide a little more information in the commit message such as
> the kind of symlink and whether go-vendor always creates these or what
> the trigger is for the issue? Which tool is creating the symlinks? Was
> this a change in behaviour of the tool? Could the class create relative
> symlinks by default rather than fixing them up?
> 
> That symlinks class is a heavy hammer and I'm surprised this hasn't
> come up before now if it is always needed.

Let me see if I can find some example where I came across this issue.

> 
> Thanks,
> 
> Richard

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--


