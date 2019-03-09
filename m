Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C6E4A7CC0C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2019 21:30:28 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a3so747155pff.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2019 13:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gP12Ux319eZptM1Wf4eTPf1ou2qUZRCHJUQMVRsc86Y=;
	b=FcBzCkff3oAG5kPdUd4bT6dobNI7wpy/fH/VTXjMNVXbPYu+Y8M9xYWCJUcLkvTq4P
	yK6hFv28fI7V1hssh42MkorEQ0J+O3oOqGtWMZWDk1D7HklccPxY1wE47Y1Q72DtcQ0x
	OKM+87nMTWKKbPS+rxpCBjnn7e/qPyFjYIgP3AFi8k7z8ddtwCjfFiA0D0YoypSxmciU
	K7cpN6K6h/S03VFgt6LjblnuWGtoNc0Oo7D7e25sA5WP274TBhJ//lQS85yGFA64POlt
	v6mOPQ6pKJm1xxvAzoxxew8lzk6yliylsnjyeRTFd8h50cpvTOLtTe5f9Ppb3kGxevvk
	Prww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gP12Ux319eZptM1Wf4eTPf1ou2qUZRCHJUQMVRsc86Y=;
	b=QFeZZHPoye2KelZKbPEKLccM7LFZ7fr/7KQ4ZcMVl1DcKh6u7PdtoYPhYzoP/bhyLX
	YIW90rTl7Z9U3IdFZEV6jIf/SjMy6VmltGYwhSCqgWJjJOccFgPIQCepXPTWlSoqDT9W
	wq5l+iwwBe9Od8J6VT3mrcr7+iLN9Cq0wCzcxYv3hN9gjuLn3mKUwVaojNMkihEeSOP7
	zkrHroEHMO3bvEA8akrIaCOeE9Ny2PvC9pnBTPFpuJVtVZrxqq9IdtMU3r2m9tWS0HVE
	roB3StNwBGHMnXNhTzD8GvofXCMqfy/ilY8GzeCkYeXBjmNepPWOcKmMMC5DaWlhcJbd
	cUFA==
X-Gm-Message-State: APjAAAVjc+6RgVTpT3ar5YWEYVXrUS7t3TS8aEoV/D3k7+t/ncUAOqRK
	FuaqrDdqBJ9QRHcnp/l+QDzHH4H1
X-Google-Smtp-Source: APXvYqyw1+v3pVcQ8AEl9z40cjDOIALYEK6du2+pyUwkEbW6RSDzkbBAIbF/DjcnB/n93eSovBXU7g==
X-Received: by 2002:a65:6642:: with SMTP id z2mr23334819pgv.196.1552167029223; 
	Sat, 09 Mar 2019 13:30:29 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:c42a:981d:f0a6:3117?
	([2601:202:4180:c33:c42a:981d:f0a6:3117])
	by smtp.gmail.com with ESMTPSA id
	u14sm2073567pfm.66.2019.03.09.13.30.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Mar 2019 13:30:27 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <868bb7ff-0775-8253-ed72-213c8b582d36@gmail.com>
Date: Sat, 9 Mar 2019 13:30:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190308193841.GA13393@localhost>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Sat, 09 Mar 2019 21:30:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/8/19 11:38 AM, Adrian Bunk wrote:
> On Fri, Mar 08, 2019 at 10:15:42PM +0300, Alexander Kanavin wrote:
>> This is premature. Plenty of recipes outside of oe-core still rely on
>> openssl10,
>> ...
> How many and which recipes actually?
>
> The upcoming releases of Debian and Ubuntu ship without OpenSSL 1.0.

I do agree having only one openssl to support moving forward is a goal.
The issue as I see it is we=C2=A0 hit feature freeze for 2.7 so this may =
be a
better candidate for 2.8.
This will give the other layer maintainers time to clean things up.

- Armin
>
>> Alex
> cu
> Adrian
>



