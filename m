Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 225CC6177F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:43:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so70878pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=JhnjfEEiE8syTZO/YocZkOAUhNtQFuKNfyLLPXBjSwk=;
	b=AQYzXLolOFXxJjdZ0w/oGoU0kD/+eKWvUp0efoB0jt0bbQN7tKN4ryCXOoybgaTxFl
	UGWejKLne6E767EOA87a9MmIC3igphCV9nKsY15q0iRmM2UbHwtEp93UkCNPfVxYIygz
	k+SjO9HeqREynwx2AdJz+m+bqz+0ld+joeDCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=JhnjfEEiE8syTZO/YocZkOAUhNtQFuKNfyLLPXBjSwk=;
	b=L/RsrnK1oCPyNTNgGTbcKSZz9azGDbBRIj1+0p0Xnf3F8jkrNhm+30eUrBudOlREUo
	bxMbvfMg616jCV69Io3ptLrIaewTlH4N8e7RpgI7FxUT7WFav3Crva6mJgrf80G8GHz1
	obnTZXGXzI2ge6P47k6pA2d9mdQZSoQPdCbHhbif3zpYKkh1dHq8bnL2Hc+l/c5L03Do
	P+9JwpMw0GZdeJoSrMi28VsdV3qEJv6YKFuu8+t2yONXe419cOmxj3iD0DY3w1NNuzV1
	oJHYVM0zZifeQMhzvWejbA8KiA+Y7vz1NRiw1mzSCzOE5A3DDO6V0D0IJbtvHYrTQ/06
	awKg==
X-Gm-Message-State: APjAAAXmV/7UUWcNUVv2JDSkWrjMQf73e2d+49KvNBUNgZFHJw7sgWjF
	93IiZhddD/WqjENiPrf9jtHHnQ==
X-Google-Smtp-Source: APXvYqx6rsC6/hv+W18tSXY4ifAskiNTUN247X2AsqSiOuDe9l30MTcisAlzxCfB4MeguxG6ss6x8g==
X-Received: by 2002:a63:3f88:: with SMTP id m130mr104143pga.337.1582659820213; 
	Tue, 25 Feb 2020 11:43:40 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	r13sm3739955pjp.14.2020.02.25.11.43.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 11:43:39 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200225001115.18188-1-scott.branden@broadcom.com>
	<628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
	<f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
Message-ID: <4e0450b0-e1b5-079c-8b83-56ceb7cfd551@broadcom.com>
Date: Tue, 25 Feb 2020 11:43:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: Re: [PATCH 1/2] common-license: add fdk-aac license file
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
X-List-Received-Date: Tue, 25 Feb 2020 19:43:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Richard,

Please drop this patch.  fdk-aac license file submitted to meta-multimedia.

On 2020-02-25 11:13 a.m., Scott Branden wrote:
> Hi Richard,
>
> On 2020-02-25 2:46 a.m., Richard Purdie wrote:
>> On Mon, 2020-02-24 at 16:11 -0800, Scott Branden via Openembedded-core
>> wrote:
>>> From: Mircea Carausu <mircea.carausu@broadcom.com>
>>>
>>> Add Fraunhofer FDK AAC Codec Library license.
>>>
>>> Signed-offby: Mircea Carausu <mircea.carausu@broadcom.com>
>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> I'm not sure this belongs in Core? Is it a commonly used license? This
>> recipe isn't in OE-Core? Does the license have an SPDX identifier (I
>> couldn't see it on https://spdx.org/licenses/)?
> If we do not add this license the following WARNING is emitted:
>
> WARNING: fdk-aac-2.0.1-r0 do_populate_lic: fdk-aac: No generic license 
> file exists for: Fraunhofer_FDK_AAC_Codec_Library_for_Android in any 
> provider
>
> We have submitted the fdk-aac recipe to 
> meta-openembedded/meta-multimedia here:
> https://patchwork.openembedded.org/patch/170495/
>
> Please suggest the appropriate place to submit this license.
> It is an open source license but does not have and SPDX indentifier 
> and is only used for fdk-aac at this time.
>
>> Cheers,
>>
>> Richard
>>
> Thanks,
>  Scott


