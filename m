Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.13787.1624898113339327037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 09:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZajpABVg;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id e33so15910232pgm.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mAtycKPybK4JCepasNYyG7bTCjit4z7si9X34Im5jOo=;
        b=ZajpABVgeItzaG/OEjlSEyR0JKHVW4Y5C11ANHd3uycr7xnjycTL5umfgz86dwQYhU
         VxZxA0N3+55IHMfEH/Kpqokm9mcuizx3LkzgCW2P7Jk9xhC/Gt9q7xI0/cGhC45t9Bz3
         MAbyyDGJWpf0pGMC5Rv1E2sTrzHXdjnK7tfRIeFeaBIVqZTzbFc/J2zVJqR4URhD2Z82
         VhO1z+QvPolLqMEK+OmaoHNR1cjYwKtaIuGUtWQIaVRmPqNdN6znv6gE0Wirksy4rnV/
         lfI9Hu04nCsIcRMKqWKMD9Xw+s46raPdUBKhUcu43FrL/vxdx64hj8zbKwWZAwidcuM1
         Zm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mAtycKPybK4JCepasNYyG7bTCjit4z7si9X34Im5jOo=;
        b=JLAn9eNSHjuI3uvfWngtazBUmE7wtX7rqrERARNI6oz7S9rVLFP4QKFYrVXB86eCLf
         1PLZE3hV4nNh0R+AOl5klXLXUj6YqTvn+shoq/fJvT/vYlns/WQmIL1Wi1Fyup7lTGRq
         Tu2lGIhJXKkHa4tI+ufrymoSLFuODuj8wcAGvL72Al5ZsltalPW1u0TWkQwEflxl7hcz
         1vfAEZqrP1z3Z2yuqnEp4cJSir62mppXCtH+S7hyAL8QEyBAuC5haJ0H9mrca3ce0283
         LMWu9FSdSy+Qcc0D1wRHRtamif4x1PPdFQpaA9/8vcAZAb/fGsJs3OwdfJPDIsAuJE4m
         +bOg==
X-Gm-Message-State: AOAM530xuUqxhWqxvLr+MorItNMy/7vQyGPBGVS/2yunjynXDX/K0nps
	VcRdboDbdNszHOP7jKuTpFMlU0InymWq2g==
X-Google-Smtp-Source: ABdhPJx3mSrqLI55ttIjEQC0eW+wk0iD9JivLooMEEORSpb3xMmIr6h6yB34/DmztbLY4gTqo4hT4g==
X-Received: by 2002:a62:ae19:0:b029:307:403b:5d7f with SMTP id q25-20020a62ae190000b0290307403b5d7fmr25598346pff.5.1624898112534;
        Mon, 28 Jun 2021 09:35:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7ccb:5507:b206:6695? ([2601:646:9200:a0f0:7ccb:5507:b206:6695])
        by smtp.gmail.com with ESMTPSA id 7sm15521677pfu.24.2021.06.28.09.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 09:35:12 -0700 (PDT)
Subject: Re: glibc 2.34 upgrade pre-release testing
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <eb4def6008fbb03a36417b5dcb9e42f1d3675498.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f6a8544c-5ab7-57ec-7587-20e039b62db5@gmail.com>
Date: Mon, 28 Jun 2021 09:35:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb4def6008fbb03a36417b5dcb9e42f1d3675498.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/28/21 12:23 AM, Richard Purdie wrote:
> Hi Khem,
> 
> I put the branch in for testing:
> 
> https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.34
> 
> which resulted in:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2292
> 
> Mainly looks like an issue running on target test builds not being
> able to find pthread. Also nativesdk patch fuzz.

thanks, I will fix the fuzz, since I have been updating the SRCREV but 
not patches.

libpthread and librt is being merged into libc in 2.34 lots of content 
is moving that way, these libs maynot disappear but glibc is treading 
the same path as musl, ( one library for all ) so the pthread issue 
seems to be related to that, I will take a look.

> 
> Cheers,
> 
> Richard
> 
