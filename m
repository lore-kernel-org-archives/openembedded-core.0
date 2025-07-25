Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10287C83F27
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 05:11:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.12889.1753420254598856077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 22:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KyII8WRG;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso1204960f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 22:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753420253; x=1754025053; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESBtE4CCu9jzXCdLURPkWtmCZSl35XQrhrdg2QOSIsY=;
        b=KyII8WRGIzX8kCmiHsOhNBC+xGSvCpkvmz2CesEUrU3jSmMoYk4IydAULkpZ+e1b1E
         56y3x1xpFbM0USbf+kOHsB9sZvXlCM2HbloBaT8CwgXMEMQtlVbwI/EWfxAa4CY4pCEH
         iIg5aIuPFrW4pUajj1/oL8NX4SsQrwQq8udi/x6rtSXatL7Mkdj0slDwtdIlJLdyfBlg
         g85drNDFu3R1nILvW+rTN26MIvPPCxIkyvjyEHAcMBc9MEii2Mu5q6xqrL7u5uvMZZPs
         Kqwa8m9zxszTmCCVp7LTT6Dn7hog6HJYALZ9AgZndlJgQenh+1mqoCWSJqJdYPQRYxpM
         L64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420253; x=1754025053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESBtE4CCu9jzXCdLURPkWtmCZSl35XQrhrdg2QOSIsY=;
        b=rfwkSsJjQpg2igPGz868Wnx4OBLWoQwAnkNRulX6xebSjnn1IaScsIHOlXkyUMPVZg
         6p08j9Db/XWyuSxhRZuMtBuILrcyPWG4/64Hp7sjmf/JdAT3VBfDwksap+MQaS/apYel
         xxXNdntkylDVK9Qsni9T2F3ftQqSN7x0jiPsb0hgjnWUlcJPrjO/fwcjydQ+01e1/03R
         3KNhIo5vtw2Mk9GFWY57T4ug4NENBcuRy7kRqRHRF5o21ACiMnPDfgsSy0xW0Jmwj5wG
         krCCD+IiJ0FDZ5hS8lXevgr/7oOKzmHrp8kgNeit5qom68M+WWwSI58E9f//dALrGy2B
         DAKw==
X-Forwarded-Encrypted: i=1; AJvYcCV/1HIFlt+rxma3LcwY5OUPc7iiWWsrXP3WDR/GAWf5k7NysnzsflMqdUog4DQu90HgRllrQIdePhNd1rHJQKJpxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyGk65U3aOqsLj9ImRf6wNZ9gk/QYRnaxwPDAu4e27Kr11YY15
	dVmYzi61M5doD/1KpqTguFajcoHLerxfkaI2S4MIN5tutVrE4RdhSL8r
X-Gm-Gg: ASbGncv9+cw00DjgWhhAZVwELGkcQDjlqcJSUpN/iWwTDNFHrllkaOjAgOG77kWORWw
	3citlxNxQfww+rfaQa8Km2ksQ5kZ+khKQo2Wp0hySpM5ERAnxWAWyWnw9Vef9FkibBWwcnwEI5d
	YUikoARVeR+XdX+EeI/uJkR2dFb8LB4FyWEvhJUhV4ZJ+s8NTI8Jg5sKzNGF8QXGNAW31iC5lxH
	yGEaThhtc7e9rdeg6sw6KovAQp0PhiQWOz6jEU2WQQyaJVAuBlzKN/YvPoWU/ytsPWtUx9DY0UL
	iRTb3o5Z9lUey8NE5lMAHRwr+iTGHySwfYQyxEn459rMPnRlbZlqbXyIIIcj8QzU37/y9c3BDmZ
	/oB8MSLAwEBQZc/zfH4lA3RqDFVT+Pw==
X-Google-Smtp-Source: AGHT+IEXqe6a4vnHQRRRGDliipGx/3NSMKsoqFqVSvXGDzGWHgaWUBSzYnnnHNK+6BDnL5bDg6ufZg==
X-Received: by 2002:a05:6000:250a:b0:3a5:3b14:1ba3 with SMTP id ffacd0b85a97d-3b776780d0bmr415192f8f.49.1753420252646;
        Thu, 24 Jul 2025 22:10:52 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458704a77fasm42639435e9.0.2025.07.24.22.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 22:10:52 -0700 (PDT)
Message-ID: <cdf6356e-44b0-4151-aedc-5375355e164a@gmail.com>
Date: Fri, 25 Jul 2025 07:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 03/16] binutils: Fix CVE-2025-7545
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1753392770.git.steve@sakoman.com>
 <5c0c7058484fd8b1a82c2c810f7bccf016ea482b.1753392770.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <5c0c7058484fd8b1a82c2c810f7bccf016ea482b.1753392770.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 05:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220896

On 7/24/25 23:35, Steve Sakoman via lists.openembedded.org wrote:
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -53,6 +53,10 @@ SRC_URI = "\
>       file://CVE-2025-1179.patch \
>       file://0022-CVE-2025-5245.patch \
>       file://0022-CVE-2025-5244.patch \
> +<<<<<<< HEAD
>       file://0023-CVE-2025-7546.patch \
> +=======
> +     file://0023-CVE-2025-7545.patch \
> +>>>>>>> binutils: Fix CVE-2025-7545
>  "

This looks like a merge conflict.


