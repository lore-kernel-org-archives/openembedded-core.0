Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.9579.1594684796262077128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 16:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UI6kCnNX;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t6so6778190pgq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 16:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=CvNtT6s1arZUNdhvttbnVVeVNcGgSzKpq5xaOPeqohE=;
        b=UI6kCnNX3VdTywNKzlmMpu6PyX0G7J/sUcCnC+mX39PkWL6dAwO+Em/ZeI8Q+UivgY
         m7vqD1dcB/smu8fDdH8MqHnAk3PJsttibza4xB197d70CCDquwwJcdUQoXuKA7R8AY8e
         33/gYlQIplpKLTLz9psVmp3ni1ANFTRvTqSVw6bTl0nWgBuxbYtQi5HXSNHx16+M3Qsd
         fKq8vKJvP64N0/d9l3YDJIfE2XSA5pfYRsYMrFH9brrZ1MC5oG12RpehBSh20LBiCEdt
         fhKMPZTZaAhWOtrc+4wdmT2AP/XDdAg3Pu6RXyQPpZeD9RdlwKrTDv4rTfwlX2Dppy+a
         CCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CvNtT6s1arZUNdhvttbnVVeVNcGgSzKpq5xaOPeqohE=;
        b=UtuOlihPsXASbqkMi/dz7/sNASviVhQ7/dnMJCS1R8kZuFXONdFTRxeP1Cvp6tY8HT
         tog3I4bzVGod9J7o3lg9EyL/LR67YyBTvhN7eloc952yoQtUigeoCQSqNImlc1Fm+v9T
         bdHeiVCRFITFmNOw8Ap/W4xUbHi26Rz+LHFRPTDDDjnWAzE18/ZMc/M6/P3fiLkh5yZp
         NaG4voPJ81/1j7E5fEIGvzGctLW5le2JE7qgskN4pUEwqhldScRzkUA+q2cxSXc2rRC4
         PmiwTUj0or0sHfNrQPV1VSid0YJ/bSPkL8cPiXDVpuPQrBTGf9gXuAaMwGxCInTdXUc4
         m3nA==
X-Gm-Message-State: AOAM5331Pznk/pYWSQBNc+KvE3zpxgz+m7yKE8vmZCRqNZvHurWPOJZu
	U5P5GJHmjO2qWtFV/ZtVxo1AiZxswvg=
X-Google-Smtp-Source: ABdhPJyJ/GAkS/PTjEAEha/eSS2/zWgYJQxH7LwtdmCjMS1ISfLutw4IitAZWGKvAn97aXm5Ib5W4w==
X-Received: by 2002:a63:f50b:: with SMTP id w11mr1261716pgh.157.1594684795323;
        Mon, 13 Jul 2020 16:59:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5886:34b9:1392:15a2? ([2601:646:9200:4e0:5886:34b9:1392:15a2])
        by smtp.gmail.com with ESMTPSA id r6sm13805161pgn.65.2020.07.13.16.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 16:59:54 -0700 (PDT)
Subject: Re: [OE-core][dunfell 08/15] kernel.bbclass: make dependency on lzop-native conditional
To: Max Krummenacher <max.oss.09@gmail.com>, Steve Sakoman
 <steve@sakoman.com>, openembedded-core@lists.openembedded.org
References: <cover.1594649587.git.steve@sakoman.com>
 <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
 <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <22d1b9fc-57a6-5648-ce31-a6d14a6f5b59@gmail.com>
Date: Mon, 13 Jul 2020 16:59:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/13/20 2:29 PM, Max Krummenacher wrote:
> Hi
> 
> Can we drop this one from the backports?
> 
> The patch possibly reduces a bit of build time if lzop-native is not used
> by any other recipe, but does not fix anything.
> 
> One can build a zImage which is compressed with lzo. For a kernel recipe which
> does use a zImage with lzo and relies on the kernel.bbclass to add a depend on
> lzop-native the build breaks.
> 

it seems original patch is not adequate yet, perhaps it should also 
check for KERNEL_IMAGETYPE to have lzo before dropping this dependency, 
once thats taken care, both together are good for dunfell too.

> Cheers
> Max
> 
> Am Montag, den 13.07.2020, 04:16 -1000 schrieb Steve Sakoman:
>> From: Timon Ulrich <t.ulrich@anapur.de>
>>
>> a native lzop is only needed when an lzo compressed initramfs is actually present
>>
>> Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>   meta/classes/kernel.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 9e3c34ad48..af7e88b380 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>>   KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else
>> d.getVar("KERNEL_PACKAGE_NAME") }"
>>   
>>   PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
>> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native
>> lzop-native bison-native"
>> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native
>> bison-native"
>> +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>   
>>
> 
> 
> 
> 
