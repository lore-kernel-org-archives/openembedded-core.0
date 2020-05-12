Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.6847.1589293631144660862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hy/BoULG;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id i19so14067563ioh.12
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=EAncCvAYYQK2Zl5q3QoMEwnSfFXu1uYOPnDtsbXcNYw=;
        b=hy/BoULGyjGNE/P1Q1L4ixrXWRFBhdfIBW5i4AhuBNKluG7XA8sxGPAvpH465cp89S
         0wgwgYTOKHSFqTz6Wfuzol+p293pIQYVo7RWtdJJV94ccPTGc9PWfyRa4mP4saEC+KmA
         7oBp9UjYFC2vup4F1JccE8YQZ5hZYi6vOkTEp9Hao620YZv5VthoArzRdZ2eQ92dgIOC
         bS2xwQ2Ax0UNua4otV6b0dvQCHf6ilJZFhJFPyW0gC4MdYzswX+04jM9adgrQqaExFLq
         d3Iq+j4k3Q/LlKBhI0q+VvhrqvoOXOCXIzKZHRavWsLtd6a6vLhDIAuFUHcPM40DLM8N
         xkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EAncCvAYYQK2Zl5q3QoMEwnSfFXu1uYOPnDtsbXcNYw=;
        b=ifCNOBwN4JjZksdpvU0CTb+WKZ7+8lbV0wB/2VE6tqXfEyokZo07gWGWCHOuiYRU4o
         sea6oVw1KUpEr1Itqgp6g+uYnY6saAYcMN5iQehWZtLfJFdsuXNkNeSlYkG6kKTFn5ZR
         x+wyQ4MrJzyfpB01Ka3mzaT3LUVRkZ2rQbkx0yxWAKsHjm1tDtS+IBu2bgC+8usFmBLz
         ma4+bJnf/iEoRoWzIl1Yi+4JNvUL9qL10jKGfqgo0DXuEi+ARiZvGBk0uXjLPWyQotzp
         qjgwo4WqUhorEsABZQ8zCLDdpJoWgqIZ0kHoQWGPAWedm6jsbCp5qEXLg8yrw6/0LbE6
         t+dg==
X-Gm-Message-State: AGi0PuaDTxaVKMh13l890bY5jeMNJW2t2BwDXnPS76g/Yoi6ghNmQRnT
	bRuhAhg4ArZ6Xsn42K3YSs0R3NM1UCE=
X-Google-Smtp-Source: APiQypJWTq4i6FaM3TwWbc8DDlEcT7PipCblUqOWVJR+7shdYk2Ndew4wdbzKeFdYC1Escb2xOdMKA==
X-Received: by 2002:a02:8666:: with SMTP id e93mr9741125jai.0.1589293629980;
        Tue, 12 May 2020 07:27:09 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:48c7:8e3e:3527:79a? ([2605:a601:ac3d:c100:48c7:8e3e:3527:79a])
        by smtp.gmail.com with ESMTPSA id d13sm3395439ios.11.2020.05.12.07.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 07:27:09 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] classes/kernel: Generate reproducible kernel module tarball
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200512134013.25080-1-JPEWhacker@gmail.com>
 <3f5f200c47a92bc0a417300d0d0efa73d423d9ba.camel@linuxfoundation.org>
Message-ID: <4c850dcd-5049-55fd-279e-ad1a858ffce0@gmail.com>
Date: Tue, 12 May 2020 09:27:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3f5f200c47a92bc0a417300d0d0efa73d423d9ba.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/12/20 9:22 AM, Richard Purdie wrote:
> On Tue, 2020-05-12 at 08:40 -0500, Joshua Watt wrote:
>> If reproducible binaries are requested, generate the kernel modules
>> tarball in a reproducible way. Namely, sort the tarball contents, clamp
>> the mtime to the source date epoch, compress the archive with a
>> consistent compression level (9), and don't include the name and
>> timestamp in the compressed file.
>>
>> [YOCTO #12719]
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/classes/kernel.bbclass | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index a724645466..c124645643 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -691,7 +691,15 @@ kernel_do_deploy() {
>>   
>>   	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>>   		mkdir -p ${D}${root_prefix}/lib
>> -		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
>> +		if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
>> +			TAR_ARGS="--sort=name --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
>> +			GZIP_ARGS="-9n"
>> +		else
>> +			TAR_ARGS=""
>> +			GZIP_ARGS=""
>> +		fi
>> +		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip $GZIP_ARGS > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
>> +
>>   		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
>>   	fi
> Do we need to make this conditional or could we just do it by default?

I don't know if we can rely on SOURCE_DATE_EPOCH being set unless 
reproducible_build.bbclass is inherited, but at a minimum we can always 
use the gzip args.

>
> Cheers,
>
> Richard
>
