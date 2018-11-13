Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D9B9E6C3F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 16:14:12 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id n4-v6so6249266plp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 08:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IPnicdvbgJvGk5h+RrZhijvRrxV9bmXJCuCueaSf5SQ=;
	b=V7Vfak0jLiG16r2MyfA2/PNVf0e8j6DzNddxHtAl6qzUm1W9REK6MWJZLWhyhWIID4
	cU/HVCcUYm0JDK74a0SLcXuHv7nGWObNSoCSvMQL9zs8Q83MsYVuVisdI0sgCPznMuCf
	F6oX0dVUQw0h8ep/RNgsLWIcjggCEK8a8GMBQtzgf7mFX8qCgkNj2zDPLz2egaMxFXEd
	pSN3Fn5Yx/6+s1rT9dpRLlUnvZYbswlDUQOLLlshxQP8oo6xc9gzXCmju3BQz44Ao4lX
	AQr8sfSUs6AGu4bm1lQjZ6IlSQzZ3ES1F/kT36Ul/tzthu1Q/Nk7/5jE3v4V3Y49wKvz
	/4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IPnicdvbgJvGk5h+RrZhijvRrxV9bmXJCuCueaSf5SQ=;
	b=o+ZQXhxVN5pCnSc/eoVqFVY3zi4IVTrDtOelm+z5ufR6SIFD+q4P2HkxYrISJ1vVyI
	SYctSvwLcc3UJJtzQM/buiPsoKn1vhGYZSjV2ZYlqMu/Ihhi9VyiWu/BVZfTCp0IpYu9
	PbLzYnv2+1ZDMWX5Ut4h5YuIWScfGA+cWBDCOnHi7wKYeIJsJyL6pZHr/fZryAAhyWo+
	mgnJALA26xR5nvz/AmmsCnMfxZlhgQKu5mv5/I3Ym2DdYQ6QLS1lnLlFiNA+1VfAXP9y
	E5MNQ3OCjC7YAEJQ9kMjj1tmfGwor6Bw9D8idyEST4nwMWkd8nfGUfyE7mhQfJVLLQ0J
	uU0Q==
X-Gm-Message-State: AGRZ1gJQFINfNpLwu86gaygUV0WKpQKBXTFo2mG4+X78BdyFZnaowouA
	IPGnRVcrTVfBUfvaeOf6GTt+cuKo
X-Google-Smtp-Source: AJdET5efwA0XeQZ+cNWU50K95QiRqb7X2pdZC2eG4nC/+uFV8RzgDsZF4gu4/N1gXYONU3VwPvRUYg==
X-Received: by 2002:a17:902:a81:: with SMTP id
	1-v6mr5732545plp.20.1542125653060; 
	Tue, 13 Nov 2018 08:14:13 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:75ee:9e74:d500:909d?
	([2601:202:4180:c33:75ee:9e74:d500:909d])
	by smtp.gmail.com with ESMTPSA id
	a17sm24986681pgm.26.2018.11.13.08.14.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 08:14:12 -0800 (PST)
To: "Awan, Arsalan" <Arsalan_Awan@mentor.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1541168618.git.Arsalan_Awan@mentor.com>
	<6bf54a814e2aaa03e262aa2edd529405d391ee22.1541168618.git.Arsalan_Awan@mentor.com>
	<c1316e3a-ec0c-3320-0972-9c7ee532aee8@gmail.com>
	<1541403256938.5944@mentor.com> <1542106011533.81309@mentor.com>
	<2b65cd7af45b116efc01a943c002917ddab3ba7e.camel@intel.com>
	<1542108537484.19904@mentor.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cf7c9446-1dca-358c-1aa6-4ecc7760c333@gmail.com>
Date: Tue, 13 Nov 2018 08:14:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1542108537484.19904@mentor.com>
Subject: Re: [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix booting from removable media
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
X-List-Received-Date: Tue, 13 Nov 2018 16:14:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/13/18 3:28 AM, Awan, Arsalan wrote:
>>> ping
>>>
>>>>> Arsalan,
>>>>>
>>>>>
>>>>> On 11/2/18 8:01 AM, Arsalan Awan wrote:
>>>>>> From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>
>>>>>>
>>>>>> The EFI bootloader name and path for being able to boot from a
>>>>>> removable storage media - such as USB - must be like:
>>>>>>
>>>>>>    /EFI/BOOT/boot<arch>.efi
>>>>>>    /EFI/BOOT/bootx64.efi
>>>>>>    /EFI/BOOT/bootia32.efi
>>>>>>    /EFI/BOOT/bootaa64.efi
>>>>>>
>>>>>> otherwise system will not be able to boot from it.
>>>>> Is this fixed in Master & Thud ?
>>>>>
>>>>> - armin
>>>> Yes Armin! It is fixed in Thud and Master.
>>>>
>> Would it make more sense to simply backport:
>>
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit?id=b591fb889b02ba82e6e35bb64b9fcb313f4bb5cb

got it thanks.

- armin

> Yes!
> That would be fine.

