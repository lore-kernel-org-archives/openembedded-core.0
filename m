Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4266.1615241728446324986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 14:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RH4f05aQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id ba1so5573393plb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eXYwFkz8JZ2sDJLPSD9RqjDKtEr4SRhhiY4dxyMgOkc=;
        b=RH4f05aQoSosa7DbuVXSoje3bcidf0AWx5ha4yzVLXK5rH9GQv5XBOGkFllcbkjrq9
         exWoMeTviDINrjHOWhEakFlicrwYfL/8VvEeQl7sihmkydk5qtIv9pGfazaVN64Fe67p
         0oU7kD9kOcQnP8TVaejtXSkxkW09HexjQNh7Yo2tQZqdQOaIBKVtppsAMV8E9fUWxY/D
         WFzK7RL/A1GGn2m+9DiwNGjGLpvcnABlUjbA1rvJunm+HW9M9os+ccqdP8yBTpwrzis4
         b/hPm/1jBOsxsTA3I876VyH7SIr1fJ33J47LQEIC3tG1j1l3c2PvsMgc0ZM1gObIX3GZ
         bsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eXYwFkz8JZ2sDJLPSD9RqjDKtEr4SRhhiY4dxyMgOkc=;
        b=Z0BxEBPrxbg1if7C6oklrNEz6Dn2S/Rq5r/b/5V1YOIFsEkV0EBPUgiYewJN3E+gtB
         /3pwURsCoPZb5YFEFoGUvGVa9jN4DfRXF3goMLNsat9U3TLFlujgnLgaCwXXEv1lY7UC
         q0T4e1rENjEGXpTx2HV5CcUd6aOtTc6c56Wep5JPPWgxwMkqAbxqNvj7C6hsruipkmaf
         kI8bhPHLMboS2vzklhVLzPtqNR53B7vdPG0WZVTGcdUazheMxhuoJmr3lG6zkH0sUlT2
         yaW0cp6LZIXZ5NB+MB4s9P0o7qFA8ezjM6KlFbrVrPsX6w5CneOwtkPMLwo9dpnclrFD
         gOOw==
X-Gm-Message-State: AOAM532a47CCcMsMLVrD5+n1YP5kBrO8gcp1zUGvKkQ35b2S8dOIJkph
	JGxfTanJ5bv0m+7QEa5x2Is=
X-Google-Smtp-Source: ABdhPJzLRORZ2DbK5ObkEMiv0enE9fCII8loa1orrp44DQ0ZtwjM1McqaImuhQveeKHcCuav4NXG3Q==
X-Received: by 2002:a17:90a:1463:: with SMTP id j90mr1078204pja.205.1615241727284;
        Mon, 08 Mar 2021 14:15:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:e039:b4fe:1680:1244? ([2601:646:9200:a0f0:e039:b4fe:1680:1244])
        by smtp.gmail.com with ESMTPSA id x7sm349359pjr.7.2021.03.08.14.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 14:15:26 -0800 (PST)
Subject: Re: [OE-core] [PATCH] resolvconf: add missing dependencies to RDEPENDS
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
References: <20210308193028.34418-1-raj.khem@gmail.com>
 <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <2a597a00-fbc0-470e-0f43-1d710c74aeaa@gmail.com>
Date: Mon, 8 Mar 2021 14:15:25 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/8/21 2:11 PM, Andre McCurdy wrote:
> On Mon, Mar 8, 2021 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
>>
>> resolvconf uses flock and readlink.
>> So explicitly added dependencies on util-linux (for flock) and coreutils
>> (for readlink).
>> Note that the options used with flock and readlink are not part of the
>> busybox implementations so full-fledged implementations are needed.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>> index 6df96b699c..6da8cd6023 100644
>> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>>   AUTHOR = "Thomas Hood"
>>   HOMEPAGE = "http://packages.debian.org/resolvconf"
>> -RDEPENDS_${PN} = "bash"
>> +RDEPENDS_${PN} = "bash coreutils util-linux"
> 
> util-linux-flock has its own package.

yeah and busybox also provides flock too. Lets drop it

> 
> Patching resolvconf to use readlink -f (instead of readlink -m) should
> be sufficient to allow it to work with busybox readlink.
> 
>>   SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
>>              file://fix-path-for-busybox.patch \
>> --
>> 2.30.1
>>
>>
>> 
>>
