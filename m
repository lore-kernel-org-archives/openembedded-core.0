Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.63901.1595878111221189293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=i5si69yq;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id q6so18518297ljp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=WH6Ft8V1ci48Re2xHQQokzLtURtXKibFrmXf/+c1XjI=;
        b=i5si69yqpPNcFPtVeQdQyCJehxrcbFnqYvfojAS0C+H7XlIBRp95UEDsvAuRxpu4X/
         bb8rJQ0SjMQBx+imUU7fQjbhxo8HuQshu4O3bu3FRUFRa4V7cr8kPvO8t4dkQ9mpHeIi
         RXcn6+9j2f+JW0PNgS8sPnYRODdu73bB0iSRnfjXhRbUV6tVaHrnF4LKXMGgJYjAB1no
         6F34sHWKLuiN5gWH3YJ7ERd44hQ/XKhRPCW39iHgMgamtmvCr2E5MqHCLr/u0HQC94tb
         ZFaoXqHIPt73Q7wP+RurqBq3IU9+FtJYmVdTy1ai3NRqckv+ZmfLu797ZvN0C4n5eZVZ
         Dp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WH6Ft8V1ci48Re2xHQQokzLtURtXKibFrmXf/+c1XjI=;
        b=A+Ou3GUrKb+eAAUGLLwKRX2WSC5oZghoYYiDqKC+9DYab1SrDlsTXtWB7Fs3Xg8SBJ
         asmZAvmZTlcSBLki71qqPJNhguuiZ8jpjV62KGXuCRKME5kHztUYa/bMG2eF+0jAiT6a
         xMbBLNkD1gi+/sTt8tOkKuXfCwBqSddXjWj7xepIo7Ov15rhG9dfPIiFxa/rru6acsQj
         KWYlVV6298U09McZM3Yc959VKkehE7THD2VYEe5tpdhNEQqXt67Gz7vaqYqRIczLk7Mb
         WwYO4ZdS6FP6VQFrb1ZWVzpmlHGrDO8lXRqVJ4OtLhtlEmHr1pguJa+FSivwJJh0KjYD
         VgVw==
X-Gm-Message-State: AOAM533V3jwbqGvKUIrhhERZ6A6i0k+67w6Da47KsQ4gTDyNSxPQ2VqM
	FSv4LnSrcv+OWDRKXIVYNXoKf7Rq/LY=
X-Google-Smtp-Source: ABdhPJx/hdH74fQj1z+ANVL2jR8mmtY6PLdYA7yeyBqDT1EqIPDtHyy693eJwewiW7fRlHxg+jh5RQ==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr11703593lji.81.1595878108587;
        Mon, 27 Jul 2020 12:28:28 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id a14sm1152976ljb.29.2020.07.27.12.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:28:27 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] re2c: update to 2.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200726194213.351746-1-open.source@oleksandr-kravchuk.com>
 <ee5491c9de9fba8b39c233b648afd7b55b061eec.camel@linuxfoundation.org>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <5f1545fe-d15e-177a-470d-b5b495fbae40@oleksandr-kravchuk.com>
Date: Mon, 27 Jul 2020 21:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ee5491c9de9fba8b39c233b648afd7b55b061eec.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 27/07/2020 21:22, Richard Purdie wrote:
> On Sun, 2020-07-26 at 21:42 +0200, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   meta/recipes-support/re2c/{re2c_1.3.bb => re2c_2.0.bb} | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>   rename meta/recipes-support/re2c/{re2c_1.3.bb => re2c_2.0.bb} (74%)
>>
>> diff --git a/meta/recipes-support/re2c/re2c_1.3.bb b/meta/recipes-support/re2c/re2c_2.0.bb
>> similarity index 74%
>> rename from meta/recipes-support/re2c/re2c_1.3.bb
>> rename to meta/recipes-support/re2c/re2c_2.0.bb
>> index e9053acdf6..b73b024072 100644
>> --- a/meta/recipes-support/re2c/re2c_1.3.bb
>> +++ b/meta/recipes-support/re2c/re2c_2.0.bb
>> @@ -5,10 +5,8 @@ SECTION = "devel"
>>   LICENSE = "PD"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
>>   
>> -SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz \
>> -           file://CVE-2020-11958.patch \
>> -"
>> -SRC_URI[sha256sum] = "f37f25ff760e90088e7d03d1232002c2c2672646d5844fdf8e0d51a5cd75a503"
>> +SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
>> +SRC_URI[sha256sum] = "89a9d7ee14be10e3779ea7b2c8ea4a964afce6e76b8dbcd5479940681db46d20"
>>   UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
>>   
>>   BBCLASSEXTEND = "native nativesdk"
> The above patch wasn't git rm'd. I fixed it as I merged it.
>
> Cheers,
>
> Richard

Thank you, Richard.

