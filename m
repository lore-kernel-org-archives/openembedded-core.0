Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2980F616F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:30:12 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m7so1319676pjs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=suGWdmOmtUboTI9V4byR1qn6MpCR7VGZ4Ct8S3zXmFo=;
	b=a6c/yrhtGsqOZkorpjp9/TYRlZjJ0OyX39u7mX7WrW5K5y9gbmUzoKPG5SptQ5Qf1H
	0wzMZLoFYEp5wSI7LWHzi2QQmzb6at2WzdcsTUT2hgLto0GwSgk5Lz9NrU+2tF4ghCok
	PgNhcS1ARTdNMOPU6MWAFst/jumkbJVkk0Sgd8tW/M+AL40E0qQ+/6sb6e2GMMyL2I+S
	Hawcd5YBPBfx8/1oU18BjtiJA4tafHvrDcvJs5leA7zWEvbuBIaZv3L2s2OuXlngjW+4
	NSNtY3ukzRnxDNMYghuGchnENos2mv8PDGnb4T5uINITLfyh3S0ktju8aOYQrRUfMb5u
	wcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=suGWdmOmtUboTI9V4byR1qn6MpCR7VGZ4Ct8S3zXmFo=;
	b=pWWVQcg2I/yHgCjvXhrnFqyMWjLTUPcStdHEv73h+ABsp/fD/uWvqZPLfwB9coQD9R
	uwe09ujmiQci6qOZ443TpimAyKQ86MOvG6U9aezDbvlRkPuUUKUHsPQC6FBTjDGyzNUq
	ucP4FCIAicSrfEAYnao0sGScC+sisHqywzC6g8k0pZXebLbG3jDR5RgvUCzMcuJJCLPm
	cj4sJ8/QbCxZQE+P58PXGsvWGZA9VY8mFu92Oc8kDFWSOD3A2T/EcgicBiirttAijOTM
	J163Kudu4te2OEMBuvHFTHeml7z3FTDDJ9AJTQ2ubAQc1QiRp5Fm9iCtDQqauUSFr1xe
	shWQ==
X-Gm-Message-State: APjAAAUyirt+8QvyY36PyCpUqemJv9FohupRu4xfiK7pDRFRInugB5Wx
	CdsxWU0oiqFpFtkjb1eTgYA=
X-Google-Smtp-Source: APXvYqwsSD3MUqlDIfHpa+2TGbROGUTl7/TbI24QFctnWOnoCRYdVfsxidADK4TbT9bzW8ChImK9vw==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr542974pjn.127.1582659013969; 
	Tue, 25 Feb 2020 11:30:13 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0::396c? ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	190sm17943913pga.85.2020.02.25.11.30.13
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 11:30:13 -0800 (PST)
To: Scott Branden <scott.branden@broadcom.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200225001115.18188-1-scott.branden@broadcom.com>
	<628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
	<f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <90132247-53a6-3ae1-efc0-7aa2479fde86@gmail.com>
Date: Tue, 25 Feb 2020 11:30:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
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
X-List-Received-Date: Tue, 25 Feb 2020 19:30:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/25/20 11:13 AM, Scott Branden via Openembedded-core wrote:
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
> It is an open source license but does not have and SPDX indentifier and
> is only used for fdk-aac at this time.

you can propose it for meta-multimedia

> 
>> Cheers,
>>
>> Richard
>>
> Thanks,
>  Scott

