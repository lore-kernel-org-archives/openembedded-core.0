Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3722C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 06:37:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7396.1678343868074230336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 22:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NY7Ygh03;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id ay14so2855552edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 22:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678343866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNrTBa/s1LDI7JbGhVOo6WOcrrEvhqhq6+cUjK8PUHA=;
        b=NY7Ygh034RH9xEZVcOXI3QYBNUzZm0p52kY9j9HGwLl1NkFSF99hsUMLnZuyg7qXMM
         n9COR+qK0HkXOtou43q8lTl8JOp8rjh4IyIHhGGya3wCY2aPLBSFc0GfYaZyvKLGXrfx
         /t/o6RVNmVN2HCggxMkdGoq0pArsXuFd6cASuQwr/och1NBord7cHnL82Vya7xlFrnZu
         QRF9bcJcP3OiuWKfg9A/ECZlVOlusMGVz5PYAgegpPvQTB7C/mAD4+kvtf/UA73TO4Ce
         PORo7uigMgcd/nH/ue0F3sx7F3IdJtz3KyFj7cLJkFFjE5xxQvTQoOVVJMPI2IjZUe2s
         YrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678343866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNrTBa/s1LDI7JbGhVOo6WOcrrEvhqhq6+cUjK8PUHA=;
        b=Rn2W6pAkuXcVPbm4Gf/UaAxVm/EYOMcqgPPJlerTPPJe+23uDxAA+3b3ndfnKoAxWF
         bsW5FMFO+haRA2AEVvuhRIFITbGRR+fWcAsn57BMWw/qU+uzkvh3y6FjDTVKK3mQ2iLX
         XOADss/vCuxYk+8jvTE9OkCwucX+bwGB6tqqTHgiCQ/nLdEwWki5krue8mVF8oCoqCZR
         jHeOxFl6AsglKYZGDr1XBJtE8Aiti/Twwpoyy7pi1EoKefMUwLvvldym8qSNv+jEdA1K
         YvKECFH2QGTmM51tXXmyn94T7FWlpun+kAd8BcAOsKi9Lx31oAIS0CXeEJsG+eIb8ALZ
         S8Lw==
X-Gm-Message-State: AO0yUKWHAJ2IFFORsFMefLCx5vx35TmVqod+HSQiyf2puZaSvZBQWEgW
	S8QyZdGfkoE+OKV+zmJeuUs=
X-Google-Smtp-Source: AK7set/pdGIopsYdRI4VVSLxk4/se+vOea3rMrTz46RDOxYxceONOGUN7GfalMF70dPfYb6wKcVz4A==
X-Received: by 2002:aa7:db58:0:b0:4ad:738b:6706 with SMTP id n24-20020aa7db58000000b004ad738b6706mr21305020edt.2.1678343866397;
        Wed, 08 Mar 2023 22:37:46 -0800 (PST)
Received: from [192.168.1.143] ([188.36.69.113])
        by smtp.gmail.com with ESMTPSA id w19-20020a17090633d300b009197dc4138csm1812683eja.84.2023.03.08.22.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:37:45 -0800 (PST)
Message-ID: <85fe2b73-9169-8593-d36c-de0c239dad16@gmail.com>
Date: Thu, 9 Mar 2023 07:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] Inconsistent libOpenCL.so.1 expectations
To: Anuj Mittal <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>,
 "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
References: <174A81466EAA9EC4.23983@lists.openembedded.org>
 <b1a311d7-2a11-66ff-9698-29b95f1192cc@gmail.com>
 <29be1b4493e3a719eacffcb62410d6e60f036112.camel@intel.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <29be1b4493e3a719eacffcb62410d6e60f036112.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 06:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178209

2023. 03. 09. 3:32 keltezéssel, Anuj Mittal írta:
> On Wed, 2023-03-08 at 18:23 +0100, Zoltan Boszormenyi wrote:
>> Added cc for the interested parties.
>>
>> 2023. 03. 08. 18:19 keltezéssel, Zoltan Boszormenyi via
>> lists.openembedded.org írta:
>>> Hi,
>>>
>>> I observed the following inconsistencies:
>>>
>>> 1. opencl-icd-loader and ocd-icd both provide libOpenCL.so.1
>>>
>>> 2. opencl-icd-loader has PROVIDES="virtual/opencl-icd", ocl-icd
>>> hasn't
>>>
>>> 3. oe-core's piglit recipe explicitly depends on opencl-icd-loader
>>> (should be
>>> virtual/opencl-icd)
>>>
>>> 4. meta-intel recipes RDEPENDS on ocl-icd (should be
>>> virtual/opencl-icd)
> I think all should be changed to use virtual/opencl-icd and ocl-icd can
> do a PROVIDES for it. We will have to set a PREFERRED_PROVIDER for it
> as well then. Most distros seem to prefer ocl-icd as the default
> perhaps because it has been around longer?

I have some internal fixes for this problem that
I was able to use in Kirkstone.
However, to satisfy *RDEPENDS*, I also had to add

RPROVIDES:${PN} = "virtual/opencl-icd"

to both opencl-icd-loader and ocl-icd and use
PREFERRED_PROVIDER and PREFERRED_RPROVIDER
to select on of them.

Would that still be needed for Mickledore?

>
> Thanks,
>
> Anuj
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178208): https://lists.openembedded.org/g/openembedded-core/message/178208
> Mute This Topic: https://lists.openembedded.org/mt/97477512/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


