Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 099A661B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 18:42:52 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f16so1499474plj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=CBjn59p8Xk2yZSunds5VY93o5DrnxBT4Qx7LePtoIMI=;
	b=LMdoTBh1SNKw9sWRXwV9g8tsnvZUl+RhopU31CXTkcC46UFVPLaxbd3J0d3+YNxfPo
	uAvNnUkSYPTLeC9fCLY0hwpiPBRTtDIM2liTMnHLEa8tvFXYwyt9T4xjTTVr5hNsRzCb
	MOPFpbAp2qsaKV2reiQVgwqizVYAY4K173hA5TmlA6cZSKRAr5uq1UGa8V5fCovVmvyo
	IMoz+HxXUUzf57RTno60gQa4meqRwzaRU/1/HntaCYfwf4Xi6QtcNRS4VZaBqFCEv/7n
	YpfuxiwMsCDg39R441LG71AvWTOfsWPVlitzzl30Zqazj9LMMdLvnChZa32AC11NMfmV
	moYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CBjn59p8Xk2yZSunds5VY93o5DrnxBT4Qx7LePtoIMI=;
	b=l+6iiDacXJul36Xh38wJ4oFHuPRs6ESTQ7afbg0kE4yWkkK45EwPJZHUuSqFg39aql
	D/mANCXVHEqWypRThVnS/dF79LPjIMHZhV9wXf2doE7a/UdoKFyVYuwS5suxoeBQwznj
	eMwLYANyhyOp6T3GaIR2MMovkYKI6jqv15XEoimrjLBjCMs5mzIq+1MrgW9KDSq9VRJ5
	wq0jRLfO5DwE/Hqm27EjvmHLLdRGwJlDsgybdqJ90+wRs/6fCpePUdp5y3RiFL3tMcHn
	DUSmZyId0jw5YtrUeRnGO770HyZfqCdo83xcmpu29fonW/LTF3t+1ccrpcpXSDp4D/an
	fXKw==
X-Gm-Message-State: ANhLgQ2yb3UWWnO2KxtfHoKvbeacaNSmtM9INhXMYESow5m+7oDEKNVO
	vzImmz4r6RniHSAogqleMXSOmRcojj0=
X-Google-Smtp-Source: ADFU+vu4ydmV3vP1hWF+rhtbaPM/ankLzCDbIACkcZKhw0hFNxJVZY3HsrH/DUxofwhl4W7EV7TPGw==
X-Received: by 2002:a17:902:302:: with SMTP id 2mr4427344pld.58.1583952173581; 
	Wed, 11 Mar 2020 11:42:53 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	h12sm36031026pfk.124.2020.03.11.11.42.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 11:42:53 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200311114421.65442-1-richard.purdie@linuxfoundation.org>
	<53da03e4-b7e4-8882-3d10-ff27a051f07b@gmail.com>
	<52dc073deff28f726b7b9f451640a673009df419.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <b8de6b80-cc43-0fad-1247-8ef5517a3232@gmail.com>
Date: Wed, 11 Mar 2020 11:42:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <52dc073deff28f726b7b9f451640a673009df419.camel@linuxfoundation.org>
Subject: Re: [PATCH] coreutils: Fix -dev package dependencies
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
X-List-Received-Date: Wed, 11 Mar 2020 18:42:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/11/20 11:31 AM, Richard Purdie wrote:
> On Wed, 2020-03-11 at 11:29 -0700, Khem Raj wrote:
>>
>> On 3/11/20 4:44 AM, Richard Purdie wrote:
>>> The new ptest dependencies present some challenges, in particular
>>> libmodule-build-perl
>>> which effectively depends on gcc. In multilib images, this results
>>> in both
>>> libXX-gcc-symlinks and libYY-gcc-symlinks being installed which
>>> conflict. This also
>>> makes little sense.
>>>
>>> The easiest way to fix this is to disable the automatic -dev
>>> package dependencies
>>> and manually specify the correct ones.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>    meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb
>>> b/meta/recipes-core/coreutils/coreutils_8.31.bb
>>> index cba0bfe15cc..eac016319eb 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
>>> @@ -149,6 +149,10 @@ inherit ptest
>>>    
>>>    RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl
>>> libmodule-build-perl make perl perl-module-file-stat python3-core
>>> sed shadow"
>>>    
>>> +# -dev automatic dependencies fails as we don't want libmodule-
>>> build-perl-dev, its too heavy
>>> +RRECOMMENDS_coreutils-dev[nodeprrecs] = "1"
>>> +RRECOMMENDS_coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev
>>> bash-dev findutils-dev gawk-dev shadow-dev"
>>> +
>>
>> this also means that any indirect dependency in future has to be
>> added here manually right ? or will that situation never happen, if
>> it will then perhaps a note in comments might be useful about that
> 
> If DEPENDS change, we may need to tweak this, yes.
> 
> The whole -dev thing has a bug open about reworking it and its a mess
> already so this is really a bandaid for now.
> 
> I'd rather have this and coreutils-ptest than not have the ptests.
> 
> I'm trying to be pragmatic about it! :)

I think change is fine, I am just thinking if we will assist keeping it 
sane with a comment, until dev package logic is reworked.
> 
> Cheers,
> 
> Richard
> 

