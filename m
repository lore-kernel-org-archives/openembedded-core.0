Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5F46168A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 14:34:13 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x14so14241955ljd.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=MgzepiGod7YAinBmN3MoHsah6Sa2dpjToUvUjkuZM8o=;
	b=oDoQQa8SJo6JWJU6x0tRhRt8CGwzHu8+UXoHoojineEfo+ReyVOEvuRwP+HwrlgewQ
	0ngh1WtmOjxu8R4hIGeCWcGkLZQPZHE9jeLkEgkxahAnzmvYZJ+Je9V5uWDU854yU/QE
	8pGw/W9/bbxaoo3a5pJM3U3E4gzYakZKrVQ2b5dOjhELqiFABPXXYVzZkxuBs8qyFnPS
	HZ/LuJaIxg3FnAfW9Fv7ODszfSbb1nwqj86n4/pEybwM5F7yNw10ADLiqA82pzPU3guD
	YjRBC2roO8M3611QIuWfegQx52/qge5zRcjG8lbszDzUY5wJatoH6Wdi1PE1WAWe7Ovh
	zpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MgzepiGod7YAinBmN3MoHsah6Sa2dpjToUvUjkuZM8o=;
	b=F7MIz7HPUYh0D2uKHkVoC+5KIf6nGV27NG9wCygljfxVFd8E5ANbQCKqzJT0MVpGnI
	m37m/RVWCOdoTym3eD2uk/+Lo/5kPK5eiB5PLYnW0H9simDechv+FGHL0QbEx17BNLTr
	mM5eqnCHwb1DIKGBQrTipCBpPzhHexCjd8M0k2UTwjl4VNVHmx0eKoIbY2czNoB49KaM
	lU1xoC0cLu1Lk1/ugunhmmH9EpmjG4NyTkh/Ybsw7jwee6sQxXEjG9V9tDhuLgEauN7x
	i+tBFlQ46uW7pZWpZ+blXW/OrwatEkcFk9Ea8kLJakvoVjMimhGdJ1lmIiIIJt9KIPtF
	jK5w==
X-Gm-Message-State: APjAAAW6AG1QoLpoX4fOUBwcuVra/wsL45Y9cjKf301lmQ/zfeeKl1lt
	T0vrtpz4675PF7lOUsg7pAN2xuoZ
X-Google-Smtp-Source: APXvYqzeLrq5jytKt59f0dgiOYyAmrhvyw8fMjn9nBW11qA/YjXdrOpVJKpfECZsqWmnh2cgWMk1mQ==
X-Received: by 2002:a2e:9052:: with SMTP id n18mr33586503ljg.251.1582641253388;
	Tue, 25 Feb 2020 06:34:13 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	e25sm7822298ljp.97.2020.02.25.06.34.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 06:34:12 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200222185400.32136-1-jpuhlman@mvista.com>
	<a133657b-8b8f-a4e9-5999-41781f74db6d@gmail.com>
	<42d690f3ae40a420179cb85453d2722c153c2d8c.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <bf82e526-a78b-14b7-42cc-b5fbb467e35b@gmail.com>
Date: Tue, 25 Feb 2020 15:34:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <42d690f3ae40a420179cb85453d2722c153c2d8c.camel@linuxfoundation.org>
Subject: Re: [PATCH] readline/ediline: Fix conflicting manpages.
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
X-List-Received-Date: Tue, 25 Feb 2020 14:34:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/25/20 2:33 PM, Richard Purdie wrote:
> On Tue, 2020-02-25 at 14:08 +0100, Jacob Kroon wrote:
>> On 2/22/20 7:54 PM, Jeremy A. Puhlman wrote:
>>>    BBCLASSEXTEND = "native nativesdk"
>>> +
>>> +inherit update-alternatives
>>> +
>>> +ALTERNATIVE_PRIORITY = "90"
>>> +ALTERNATIVE_${PN} = "history.3"
>>> +ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
>>>
>>
>> With this change (I think), I now get a file
>>
>>> +lrwxrwxrwx root       root               38
>>> ./usr/share/man/man3/history.3 ->
>>> /usr/share/man/man3/history.3.readline
>>
>> in my rootfs, which is wierd since I don't have any other man pages
>> in my image..
> 
> At a guess, ALTERNATIVE_${PN} should be ALTERNATIVE_${PN}-doc ?
> 

I can confirm that changing the recipe according to RP's suggestion gets 
rid of that file in my image.

Thanks,
Jacob

