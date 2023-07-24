Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C72C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 18:13:18 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.1618.1690222393220474352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 11:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LllWhFuW;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52240b64407so357278a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690222391; x=1690827191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IwsFj2HOogacY8qcfwAva9T0BLjTFBW2VAM2vDnaQVg=;
        b=LllWhFuWAf8roHJHlvtwAruc++HpdqCBiz7zaPiyKavYBAfezV+gaw+Pztfd4NBbN/
         bHr4e5oN6EO3NB+fXXO+a3Bl6U6++20XJ/6NrUoIbYA/fGQ8+z69ZGpvixrw5pRZjExv
         eTsY0D5DqZBniuDcDAsUBXS76u2stL+zMwv0ddT77HW0AuPKrbGC1GggTJYnynrgNe9u
         L2WsSnXJVDDsRZqbQnBhcOjJUqeZy1IVaw5j6J8w17wplyXFTH1VWnc+Yjhta3u6Uv7o
         jnOFwYymJB/IJUUsXskesQsyEUeQJH4LXLecYqmFmAqhWTsJMd61ZBVmxeZFDzkMJNBS
         CAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690222391; x=1690827191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwsFj2HOogacY8qcfwAva9T0BLjTFBW2VAM2vDnaQVg=;
        b=VRfIt6RwpjWZaT9kXnwNgILfKKZbjAM8iuoDLcPJMahxE4OmdueqziZaU44vbdiQ8F
         jpRKHgTEi/X+UFoy+BHX3QdMVr7j6jhsDb8NLxLQgHEUw1opPMXW7OOK2TpbEfioCg1a
         E4nYZaQJaoNbf6o4tAL/AJEhn5P6WywWXu/DEtcn4+VCgcPW4LZC2y2/C0BiEG7UUVcE
         lOk8Y6VHPiqlgUSjcvFmfGYXBcu2TqKUaSM856NaxWtgKhC8njYJMMp8cMkgVqhrhjsa
         Uh8GsKyyC3A2oyyG6Dz+QjX+eIGtLRvARJ2Yd4JtgQfOtAeLQneAqiVQe9Js2K3kxAJj
         Hprw==
X-Gm-Message-State: ABy/qLbRwL5C5vWPA5C5dzxey60ZMG4VPPOpFFGRRVJW9qcrRvGcuDEJ
	QEUGe6KTkfn5k8Gmi+jPtJA=
X-Google-Smtp-Source: APBJJlFiUlF1tqjHF/79nD+4c5ynLBp1Y0+8lcJXrkLRl2kcNbB4MzXzpKU38e6wIM1SWXoIHfLifA==
X-Received: by 2002:a17:906:15b:b0:992:9ea0:2317 with SMTP id 27-20020a170906015b00b009929ea02317mr10857971ejh.61.1690222391050;
        Mon, 24 Jul 2023 11:13:11 -0700 (PDT)
Received: from [192.168.2.52] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id oz13-20020a170906cd0d00b0099b8234a9fesm3862868ejb.1.2023.07.24.11.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 11:13:10 -0700 (PDT)
Message-ID: <b000bd79-9788-5345-eaee-b50f27d2fe45@gmail.com>
Date: Mon, 24 Jul 2023 20:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
 <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184803

2023. 07. 24. 17:59 keltezéssel, Richard Purdie írta:
> On Mon, 2023-07-24 at 14:35 +0200, Zoltan Boszormenyi wrote:
>> Some BSP architecture builds (e.g. genericx86-64 or anything from
>> meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
>> directories. This causes rpmbuild fail on the target machine.
>>
>> Use ${SDK_ARCH}-linux as the base arch which likely exists in
>> /usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.
>>
>> Also, fix %_lib and %_libdir in the new cloned platform directory
>> to use ${baselib} and ${libdir} so the RPM package contents will
>> be correct for library packages.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> index 95a9e92f96..21f0127561 100644
>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> @@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
>>   # Rpm's make install creates var/tmp which clashes with base-files packaging
>>   do_install:append:class-target() {
>>       rm -rf ${D}/var
>> +
>> +    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]; then
>> +        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux ]; then
>> +            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
>> +        fi
>> +    fi
>
> SDK_ARCH should not be referenced outside of nativesdk recipes. This
> reference is almost certainly incorrect as it would make the target
> recipe dependent on the value of SDKMACHINE.

Please advise what setting should be used instead.

MACHINE_ARCH is what ends up in /etc/rpm/platform.
TARGET_ARCH is not available in Honister but SDK_ARCH is.

Suggest a common setting that can be used in both older and
newer Yocto versions that has the base arch name and is
usable for target builds.

Thanks.


