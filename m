Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 43106789DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 03:33:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c22-v6so2493371pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D7G07q8TnH91nFEpI8OSSnkiAeF2h/ezaK9agFrdbPg=;
	b=YPu8VoZoE9iDp/d6aDtg9nup7A9Z0LyU/H6Ti+fdof1m4WW2LOiYMgWT0b8YF4PBz+
	ywrl7HUf6/22zip1qZcJ3dPaveh5Z2h4svzNYwY4Jmuwd23qkDX+jBFbDdwJ87cW5ZK+
	GwBMtXXm0PtLUBD07paePUAPb6B3B2aZ45pK/eAi86xapi+1qpkpbpR6KIWNrHXYbq5U
	hlHpA7GM9moZaDs69QO0Mp6MH81Iu/ANli/+N1/psnF62ZmoHqttcpETl/MScsgewf2B
	ZbFxCIi8Qh22WVOmtXn3TflAyIUxQhISUA9auyX+0hI11YD0malPcq45wi3vEiSjPYc8
	RaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=D7G07q8TnH91nFEpI8OSSnkiAeF2h/ezaK9agFrdbPg=;
	b=qd7Xo7nGl881l0EyTymN/RiOmTwujbQwjefvU3Hvqgr+KYXEqIe3nIJpc6tuwEdxXl
	Qh7fSx8StmOoSCagCutbiBkPhZRXJKF5AQVCyO+6UohSkb/BtYOiFsRB1Hn0vxDtitn9
	wYexqseudYwz2cALW/H58439Bp4yxpCSkbff/tnbfnqaoxJh9rlo7USD0c8T3Y50pDE6
	NjHH7okuFg/1d6GJyNIwBmbRHJhI+xIc1maJA5aQlQlRBafqyDLWekt47G876F0QaKAS
	aSh9oVg4AdowjmVgw2VFwKYZlVfzXsk7n53qvE6TkbxzStS8OgYl1JlAw2IxnoWI5KG6
	Lhxw==
X-Gm-Message-State: APt69E048MLwez797sgy7LtAr32A//UmAK9+l7nCTeS57uS1W0Y3WY+H
	HwpZscTCnY48FOMNkNPRljZ/0XWy
X-Google-Smtp-Source: ADUXVKIxaQwkpKeXQnPC5U0uLNDZuCskHS5MoG7qOnznLV67vEG1lW2xfNCOGd9vFtrFf6TNhUesZA==
X-Received: by 2002:a63:4346:: with SMTP id
	q67-v6mr760871pga.328.1528947198657; 
	Wed, 13 Jun 2018 20:33:18 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:2108:381:a4e5:ed3b])
	by smtp.gmail.com with ESMTPSA id
	10-v6sm6218072pgb.40.2018.06.13.20.33.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 20:33:18 -0700 (PDT)
To: Kang Kai <Kai.Kang@windriver.com>
References: <20180613061252.18271-1-kai.kang@windriver.com>
	<CAMKF1spMCuxOxztWfEGGepupH-K2DOTKwViDf==XoOipocqgHA@mail.gmail.com>
	<1ef2ee09-4f69-2a91-80f0-e700bc139e1c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <37dc38fa-f80a-7cff-0409-b9cb72bc10e3@gmail.com>
Date: Wed, 13 Jun 2018 20:33:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1ef2ee09-4f69-2a91-80f0-e700bc139e1c@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: set SECURITY_CFLAGS for mips64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2018 03:33:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/13/18 8:15 PM, Kang Kai wrote:
> On 2018年06月13日 22:01, Khem Raj wrote:
>> On Wed, Jun 13, 2018 at 12:16 AM <kai.kang@windriver.com> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> When include conf/distro/include/security_flags.inc, NOPIE flags are
>>> still required for MIPS64 target builds. Otherwise it fails to build
>>> packages such as glide which inherit go.bbclass:
>>>
>>> | 
>>> .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/recipe-sysroot-native/usr/bin/mips64-wrs-linux/../../libexec/mips64-wrs-linux/ 
>>>
>>> | gcc/mips64-wrs-linux/7.3.0/ld: 
>>> .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/go-tmp/go-link-518447869/go.o: 
>>>
>>> | relocation R_MIPS_26 against `a local symbol' can not be used when 
>>> making a shared object; recompile with -fPIC`
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/classes/goarch.bbclass | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>>> index f54c5169e3e..5fd9f294a8a 100644
>>> --- a/meta/classes/goarch.bbclass
>>> +++ b/meta/classes/goarch.bbclass
>>> @@ -36,6 +36,7 @@ COMPATIBLE_HOST_mipsarchn32 = "null"
>>>   ARM_INSTRUCTION_SET = "arm"
>>>   TUNE_CCARGS_remove = "-march=mips32r2"
>>>   SECURITY_CFLAGS_mips = "${SECURITY_NOPIE_CFLAGS}"
>>> +SECURITY_CFLAGS_mips64 = "${SECURITY_NOPIE_CFLAGS}"
>> perhaps we should use _mipsall once
> Hi Khem,
> 
> I don't quite follow you. It seems no such override '_mipsall' exists. 
> Do you mean 'mipsarch' or something else? Thanks.
> 

yes mipsarch indeed.

> Regards,
> Kai
>>
>>>   SECURITY_NOPIE_CFLAGS ??= ""
>>>
>>>   def go_map_arch(a, d):
>>> -- 
>>> 2.17.1
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

