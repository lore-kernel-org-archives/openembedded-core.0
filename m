Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D6FC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 11:28:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.13818.1737458876338362408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 03:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCfnNGrO;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361c705434so39214445e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737458875; x=1738063675; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laHReS7fZhzGs01TTEJnzAZZGnTnI/ibK6SL8EtIFsU=;
        b=mCfnNGrO620vKIZ2b+n2yBrO+vY8ycZSI7qkBAICItK71jo2VYzR6BBd0RfLQTMV3B
         HUkaE8vdT7sixagkjRlv5b5Mdlkyqc+O37Y5GRpvUgEJ+/kQcNhRt9GNWk71PwEoo7eU
         yJrycu4d797nkRp8JK+A3EAJzWBbDoFKt24/Wk+5AEVoJcv8Fbp1itwh8+ga4QUCqUb4
         9snjxYJGX7hABWO0wmJOjzlAhCEE+r8Xv0nNdHBZ/NJt+tBBt0K5tJimVrzpgrWDP1wj
         gMpijWT3PNsYWOukXmBMReQRfeaxFHtvwDjYKETzoElmHHgsZzuFJUkJotXUQhmQEQHi
         VYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458875; x=1738063675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laHReS7fZhzGs01TTEJnzAZZGnTnI/ibK6SL8EtIFsU=;
        b=Io1wRkgB3CpTRXqZVpGNxZVPuEh3IzPHYeeYOD1B2YL5g7dvsf0HD34Nm3mu4tDpVB
         7Aza63dd9LnRx2OlR/SU3EGnkEhz6qzRtn388X9N7SA9sqZVbkpNF9XhL+ubpiHGiHEK
         aoXPH6skYk84+DUiGMmgNjnXJbtAT2mKfvfQ9VFwXYF1JQBb0KBeFUa9l41IvjONy3Br
         IWlLHBkH3U+n0y7kF2O/D9P7z1mntQeO4N1KhjtT71DYw+6PR1TdS66EPiah+u7BaPbr
         nFyZazyMBDUNmYr6EE0kmc0K0BK8Ro/eOhTgdtWXN6FY5C6fYAou0TychQAbkiHeUwRe
         z9Yg==
X-Gm-Message-State: AOJu0Yy+SYAPoxK48TnxlCdGh1vmKvGGOxiNElarY3C74g1htMCX2kY9
	+wl3RX84k5nc7KNgjUqROm4VEfyroNwRR6eJ1rBsKWTq4enlJIOm
X-Gm-Gg: ASbGnct1UXN9cQ8tVh2RXXjiV1X7Xl9ytUmg6N7LxMvsjayfzljBRvj7m4tBldo3pdM
	xyiCgU7nAzxgbNK1+w8dSLLP4Z4lWxDbtPEVlI6DvVyRMwxfyijCwGQSU+AroPj8pFSPD5rMhCo
	cDLvnOVHvqLQ7hC/CXFYjqj2TC/in4wWEEejfdElafm0mWRAx7gxRMOTSoKPmie0SWjpaRuz5KN
	EfXuoM0u+tB/0kFFJO8ugCPd9RPSS2BavrK29xXzHOKvwpjQUQqIsp6LYz4KH5wvLadIUqQK2nZ
	rdeVrMSIj+g0qXa5HphmctOJfpA=
X-Google-Smtp-Source: AGHT+IEvm+hIEPK8i/miCe1ouGoWwXy2/cGYlTZ+IYxPcAe6fnKdeYxanchHLb3gyK3YHAplQg+Ang==
X-Received: by 2002:a05:600c:3420:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-438913cb729mr163024155e9.8.1737458874586;
        Tue, 21 Jan 2025 03:27:54 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499884sm240073375e9.5.2025.01.21.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 03:27:54 -0800 (PST)
Message-ID: <77aceded-b5bc-41c6-8505-142ea72fa4d4@gmail.com>
Date: Tue, 21 Jan 2025 12:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] npm based packages omit dependencies since Yocto 5.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
 <CA+chaQePYP7LVSK_Fxbuf-+MexZVwUpnn35CO7=2Ji3xB3nZeA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQePYP7LVSK_Fxbuf-+MexZVwUpnn35CO7=2Ji3xB3nZeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 11:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210090

That's it! ;destsuffix=npm helped with Yocto 5.1.
Thank you very much!

I will re-test with Yocto master and report back.

2025. 01. 21. 11:53 keltezéssel, Martin Jansa írta:
> I believe it's the side effect of UNPACKDIR changes, I had to add
> ;destsuffix=npm in all npmsw:// entries (or ;destsuffix=git where S is
> set to WORKDIR/git) for dependencies in node_modules to be unpacked
> where they used to be before.
>
> On Tue, Jan 21, 2025 at 11:31 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>> Hi,
>>
>> I have a minimalistic recipe for pm2 (https://www.npmjs.com/package/pm2):
>> ==================================
>> node-pm2_5.3.1.bb
>> ==================================
>> SUMMARY = "Production process manager for Node.JS applications with a built-in load balancer."
>> HOMEPAGE = "http://pm2.keymetrics.io/"
>> LICENSE = "AGPL-3.0-or-later"
>> LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=9f9fa01c099265d62f73735e404ff8bb"
>>
>> SRC_URI = " \
>>       npm://registry.npmjs.org/;package=pm2;version=${PV} \
>>       npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
>>       "
>>
>> S = "${UNPACKDIR}/npm"
>>
>> inherit npm
>>
>> do_install:append () {
>>           rm -rf ${D}${libdir}/node_modules/pm2/lib/templates/init-scripts/openrc.tpl
>> }
>>
>> RDEPENDS:${PN} = "bash"
>> ==================================
>>
>> Previously this recipe has built and worked correctly under
>> Yocto 4.3 and 5.0, as in the package included its own internal
>> dependencies in /usr/lib/node_modules/pm2/node_modules.
>> Yocto 4.3 ships nodejs 20.8.1, Yocto 5.0 ships nodejs 20.12.2.
>>
>> With Yocto 5.1 (node 20.18.0) and master (22.12.0), the package
>> only has the pm2 module contents in /usr/lib/node_modules/pm2
>> but no dependencies.
>>
>> It seems that at some point, nodejs 20.x LTS upgraded npm
>> to a version with a breaking change which now flattens the
>> dependencies into a single level in /usr/lib/node_modules
>> from the previously accustomed dependency tree in
>> /usr/lib/node_modules/pm2/node_modules.
>>
>> Is there an incantation of EXTRA_OENPM or the npm:// SRC_URI
>> that would allow either to unflatten the dependency tree, or
>> include the dependencies as well as the main node module?
>>
>> Thanks in advance,
>> Zoltán Böszörményi
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#210084): https://lists.openembedded.org/g/openembedded-core/message/210084
>> Mute This Topic: https://lists.openembedded.org/mt/110731121/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [martin.jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


