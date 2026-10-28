Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44917.1793199347849368745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 07:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=Z6AtWObi;
 spf=pass (domain: 9elements.com, ip: 209.85.167.49, mailfrom: tan.siewert@9elements.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso842224e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1793199346; x=1793804146; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smEZnsk2+DChXYEVLK7Huf2MjrsbKxT0kTSP/+BklI4=;
        b=Z6AtWObicfZcDAvz/prVFiIA2aHL5kj1fganJI6kjBn3jJoSXnjrY+FScPt0nk2A0j
         q1GcviGjQgalsQ6Q5xNaeri9wC/I69dCMUI0vo6E5UQLI6PC2oQ64uKT3eUQC9Lq1dqm
         sxmfcxUftFEtrW1zGk+FZoh0Ic8HLC6oZy1K+/pHp9Sy/YzUMqDFCkt5yKPYYL3EJJLB
         zcOYYaby7ebUoPAGElm9OYoN/fhI0i0lrxi9yoHzo5z96ZeuTAUbaPf1e7afhlq3BS/S
         kw6VzwHB+lXeqgDK9It2jXuHB6OpzL9v2k+Z28k6tfUdtd74F7ISq2rOWlhjX42oZto5
         MkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199346; x=1793804146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smEZnsk2+DChXYEVLK7Huf2MjrsbKxT0kTSP/+BklI4=;
        b=d9qbydYFbmKeIEl/+nrPQ8S/ZIIQ1fDFoCF01gmcj4rKkSQWGLn3c/sSkLCIvqjbGy
         sholSIb6f0CHPou//2wvnkurJlQ4jRitDZ9g2f41vjRRS+Hn7XhvT+UaMSigMjbCa8nc
         JhKye55m3H4qBQHxRjLEyym6Bijz0o3WxFTv/V68xwWDXp7sDMr3nTHDhdxlJPgLmPp5
         5KPteeK1AWWVx7kWepzJaAGAdtIiIvyRig1WQi4/1th/6Bxso7qG11z7zv2LcGQoGUhY
         bETpZ6mk/R/quqMqLnq5/TN/pB9NJdJHccOcOtG8pSVupHg67j/s6ypYYuXM7/3/O5Xi
         aDYQ==
X-Forwarded-Encrypted: i=1; AKwUvByCE/tpjRsj2idDrrqj0OojWxWkcExU+r1HGaHVcWKfVehGROVCp5UtnPmZnqAMLA0TWg4VKr45bvkrrXW6biRaDQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIAAkdGMhVZcGkJibMaYjSy+Sr3UGQKI0chWq3AJ/vIpJnpgaLG
	8iDmjF37hKOw7U3cw40kJuKOtDklN30RtzCMTtDMFXKbSWMG8S0l3VV/AyvNMazZf1QY/bnbP62
	9jKcH
X-Gm-Gg: AYBFou0VkHcGzhXue7ylW/SvYeJt0SBH4/XRw67wk9Zjby1qo2dRBKwFh0a5fAeKcrQ
	vz5h5Lcs01BU5RTfkutGkRp93PowdSWDZbqBzfS73lISE/dy2xm62ggq3E1CUuBYFcHUAxgU1XU
	BcAmYQ4guy5pW4vQPxt9kMqefa6LsxFhwAnnw+itNhPy7gbrgja03oJLm08Rz3wSWS3Jhj9nBHU
	xJifw2iJlKWIYFuPg7O8mCIqd+IT32JFXsTFn3ONYGwG1vZgxiFhUu5V8LmsSonfXfvb30hoYy9
	joBu3qaY55JPaHVDPBvj7de99C5LRsxZ0Iur4ot3yS5Sj9VIIo9tVntu5Uh04tBlB8EC8ovxBrm
	7BK+eVJkZP7zbyPdsGRfs+/7PmR01HISQKK0+soNoLVmluNFe7yVURV7+ohRujxSTutqyWGv4tG
	vvXn/a96YQLmzbdxlmrtCmV845M8zDxuEuFDJ+dpu7Ea74lFcKauhPfU7r9E/bW6/KWTfXnucio
	lopi0BGuTwX08Eh29iU3rpqU/7ApI321gEZj6kRcTDP/lY+iW+UHWzHqbJTg3dhBAduW3Dtc1iF
	MQwXacB2+fXnJkF1h0rnvl0FFNjRL2/uDUWeZ8881Y3Ip0/hTI/ZxM+tB6Z2nGAKfUsplDwWr3i
	CdxE=
X-Received: by 2002:a5d:5e91:0:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-48e5d2f06e5mr6414800f8f.21.1793198895452;
        Wed, 28 Oct 2026 07:48:15 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from ?IPV6:2a01:599:441:aa83:be8d:8cc8:902:f501? ([2a01:599:441:aa83:be8d:8cc8:902:f501])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm14230784f8f.13.2026.10.28.07.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:48:15 -0700 (PDT)
Message-ID: <17d13fd2-4b74-4a80-b4be-c4172ab73ed9@9elements.com>
Date: Wed, 28 Oct 2026 15:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] systemd: add ukify packageconfig
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
 <20261023-systemd-optimisations-v1-1-0cce103e54df@9elements.com>
 <d35ce037b83bad3100142b3715e793b2f41d6474.camel@pbarker.dev>
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <d35ce037b83bad3100142b3715e793b2f41d6474.camel@pbarker.dev>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248817

On 10/23/26 1:34 PM, Paul Barker wrote:
> On Fri, 2026-10-23 at 12:51 +0200, Tan Siewert wrote:
>> systemd gates ukify via allowed(), so it is built and installed unless
>> explicitly disabled.
>>
>> Add a packageconfig option that is enabled by default when the efi
>> DISTRO_FEATURE is set. It can still be removed if wanted, which may be
>> useful when using meta-tpm, which may include ukify implicitly.
>>
>> Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
> 
> [snip]
> 
>> @@ -405,7 +407,7 @@ PACKAGE_BEFORE_PN += "\
>>       ${PN}-networkd \
>>       ${PN}-rpm-macros \
>>       ${PN}-udev-rules \
>> -    ${PN}-ukify \
>> +    ${@bb.utils.contains('PACKAGECONFIG', 'ukify', '${PN}-ukify', '', d)} \
> 
> Does the package really need to be removed here? If it is empty then
> do_package should not create it. If there are still files that would
> otherwise end up in ${PN}-ukify then removing the package entry may
> cause them to be silently included in a later package.
> 

Sorry for the late response.

Probably not. I may have overlooked it when checking the logs if 
do_package built an empty package or not (and I didn't think about the 
side-effects of it that you describe).

I'll remove the condition in v2.

Thanks!
Tan

