Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0BE78246
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 20:33:58 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l64so4068734pge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=FjoA0EebFfAGojcyhzATpM+E0x7i6rDSCNhWWawzaMQ=;
	b=AoPiJG6yREtmDT2oyit2tEBrkyQRFWS3sFnVvQhInRnHyfCKKl9puiAB053W15XoUy
	+U+Wk7/jeO1eGCtwEAmKAh2ryxt4ahmrJj2Ui7RX6QEwGw0Zy+VfdtKmV8uUiLY7HElB
	I05yYeAdezwL8rY8uZW9J3XCQiL1lu4G/RvPjIL7MVVE4SCNDFA3A5Ni1SgXm5n2VTfO
	3NIziXdcczBvKje0FuJZ0LYdvcL6K3fjooii4Dqq6k+SIQKoFUXR8dIxyItWjdyOK3vW
	aEif6vS30hYc4D8bI46ErjhO9HWE7sJawff8GNvBjMLEiWVu+T+zhbF+evAOBZFI9rMp
	Mw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=FjoA0EebFfAGojcyhzATpM+E0x7i6rDSCNhWWawzaMQ=;
	b=ImUq0znbtSxwOKgw71SdCcl0uX8csJY1zhtDAJXMMG5E8rILj+mKM5A7ZFohKTDN2P
	c3+nnY66g46qbf0+7RNK00dj1R5WxGeVeHYHGIMDWzWVa99Etj7ULW6yHGDsPOllz7t0
	GGgtiGELzmcPmzUP9GNeb9c/6SLohAAnn+bEER7kEaabEPj6ME9b0+hmyCbeoc7q7/JZ
	ptX9e4mKwb3eGGFJH6+i1hLvnNtiqq9DDF1We72q631msdxrk1cBt2kcQ1YqGaMi1aeD
	Og7wjp2YJRHOR0B6VYWNsTCkPFFlzGOhz0z5MbW74Ar2iHNPNGMEdm6Fl9hC2GIGAro1
	7LRQ==
X-Gm-Message-State: AIVw111u3KALOWBwG+2SZphb3iu0j7p9fwhaork0eS5SHxXoCCiYOedE
	LXmTR1sGfWCTtjAj
X-Received: by 10.98.220.214 with SMTP id c83mr20916171pfl.334.1501619639564; 
	Tue, 01 Aug 2017 13:33:59 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	y6sm54496138pgq.41.2017.08.01.13.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 13:33:59 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
	<9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
	<4a2dc4e3-7291-ad72-838c-c54a907312e6@gmail.com>
	<CAP9ODKqTykvrXqC82Dyq2X_v7MOLbOormG2YCjFoyvxs2_iW3g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1c686c58-c6d6-3235-be04-bf3da58d001e@gmail.com>
Date: Tue, 1 Aug 2017 13:33:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqTykvrXqC82Dyq2X_v7MOLbOormG2YCjFoyvxs2_iW3g@mail.gmail.com>
Cc: Anton Novikov <a.novikov@yadro.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Tue, 01 Aug 2017 20:33:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/01/2017 01:32 PM, Otavio Salvador wrote:
> On Tue, Aug 1, 2017 at 5:30 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>> On 08/01/2017 02:50 AM, Ian Arkver wrote:
>>> On 21/06/17 10:05, Anton Novikov wrote:
>>>> [3 patch attachments]
>>
>> only one patch is missing
>>
>> "fix case fallthrough and printf overflow warnings"
>>
>> the others I already had from other back ports. all are in my
>> akuster/morty-next.
> It has been there for  a while; what is holding them to be applied?

clean build in the AB.

- armin
>


