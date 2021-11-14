Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A297EC433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 19:47:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.13088.1636919236870396346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L0BDU+tc;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id k2so23238808lji.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OzoxGoPmrbUh7BmT+/pxFrIOoq1a6uaMssHpOXnGDDY=;
        b=L0BDU+tcLeHwpsj652NCCTow6ztZO61rTX3nkfbrX7EV3yturXEdXracyI/D38l9ma
         NZ0SiHCs06SPI4GQFqURL7Wgm7baH3yjXmcO86JiG+bxm4wPIe950DPaz6QTRD+67jwS
         cflChSZ3QQfB2X/42exOdNht6aeIiV1/6DuiQyuTAa5QF74tcuo1jhICBG1vpLxYfgca
         Kgl+UzMyt8EbzkN1CP5YMMGpENe4yivZe3KluerblmJUPb4CoxIzv7Od3f6OH9DDWeLF
         0gaQ1KHw6gqbwOsw52r4g3dw2JoJl98QfIBUMmv2jifrWmQIZgt2pQo650Nj5/Eivtii
         C/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OzoxGoPmrbUh7BmT+/pxFrIOoq1a6uaMssHpOXnGDDY=;
        b=uf3S7ztkmxmB9qbLAaSbUi5zpQ9HB8QDTnCgrgskpbpkgGn3WcCzw/0RLBgluc9I7/
         yI4S3qhOMgc/1u3HNuL83eE5RJMBN1Z7ufuFO7iV01o4Nb6M8VuZRcREFKLfsFz4iCT9
         C8m8ROYhysQz1hnUHPu53wriKF3URIPK5enxLb+E2teP6y3d7XRiQo4ej/Z2rY+moDms
         k0c7ICPlFgg55n27INw1QYk3huY8OS4kS9G/ZW3nLq5f4XD+S/wudhh0cbTgvetvsL8V
         PEfiTPYEUcpVOSp/8L4vc/v/b7vZCJ6jGzQhn2fE6mTgOpo6kkvRlkMCcz0QO1Eeo7Vk
         UQ2A==
X-Gm-Message-State: AOAM531mOuFCUDO4cUs5neXAK1q6WMw+sCrdwFg/pVVR06+GVAHS3og9
	qloSHpZbHhtxr3+nekBtP84=
X-Google-Smtp-Source: 
 ABdhPJyKChG7N+/oHxFmd0HvoAYm261ehbwb+y7VFAT/4TseLNwKJYdU+b88YUMddtrPpMlQU53SjQ==
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr32174299lji.411.1636919235072;
        Sun, 14 Nov 2021 11:47:15 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 s7sm1236957lji.67.2021.11.14.11.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 11:47:14 -0800 (PST)
Message-ID: <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
Date: Sun, 14 Nov 2021 20:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [hardknott][PATCH] mklibs: remove recipes and class
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211114065008.3899-1-jacob.kroon@gmail.com>
 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 19:47:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158263

On 11/14/21 20:36, Richard Purdie wrote:
> On Sun, 2021-11-14 at 07:50 +0100, Jacob Kroon wrote:
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> This is not enabled or tested by default, and has never been
>> ported to python 3 upstream[1], which means it doesn't work at all
>> with plain poky. If you need it, please put it in a separate layer
>> and/or modernize to work with py3.
>>
>> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)
> 
> What issue is it causing in hardknott? Normally we don't backport invasive
> changes like that...
> 

The problem is that mklibs-native doesn't build with gcc 11, and 
"image-mklibs" was in USER_CLASSES by default in hardknott.

I sent a patch to fix mklibs build here:

https://lists.openembedded.org/g/openembedded-core/message/151982

but after some discussions we just decided to drop mklibs support 
entirely with the proposed patch.

/Jacob

