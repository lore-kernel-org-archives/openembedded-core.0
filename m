Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6FD6193E
	for <openembedded-core@openembedded.org>;
	Tue,  3 Mar 2020 04:18:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g12so721454plo.3
	for <openembedded-core@openembedded.org>;
	Mon, 02 Mar 2020 20:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=r+IUBPY7QpereR5/XxMPfAs6tSQZgbQwS0b1Oq7XXqc=;
	b=ezWHY4tL35pB35EcGyVie9W+A3eQTgI7nJ+eqvL8vLZ9/QIsFBtTOWfqcQhcIGjGvm
	YNu1Cf2CM6R3a3QXUlGetY9gnGXV8OVtUbLQl1c2JiCWZZqbgyqO+1UMdBmoiVKHUzul
	qNJsiubLl5KzEM5sW8F3EHi4aOLA3VLKphIfoY6EyJal/vHG7aAr186P8nQ3irbIeN42
	QOsGgVNlFpXSadxVsfmbMeqCk8+CILIMc4zfVha+63OJvlB722GVL2jRIa8V2ElPjxYC
	Z4ZJfa2udBSfTYWDhDS0EUdPuGzVpPbjslaFqtBeIs3o6urzGMltvpDEp1vCOlg+TYMk
	Vy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=r+IUBPY7QpereR5/XxMPfAs6tSQZgbQwS0b1Oq7XXqc=;
	b=aU4rFvYlOE9A93NKVvet6APkeHQKVonL5tg4Y2mA7o+KvfzuG9QfHnM/Dbktc1HrWj
	5gR9Yb1hRj8O6ztf6AQSfaBykMzEMb5MOPHE42TT9PQOW0ddKXRxmttznrnFGrHGd/uF
	aeHSHiYhX6NpEz0XC+UeAZLzJ2rgsD1S8Z/4D7Qd664UWYcZW0RfTxVNvgJMFLjQdX1D
	U1BfYC7EO3gs0kx4SvBb8rzkSDLC2su5fsxv6l+/etElCWf8E84t83ZzoRRunhaWoqMd
	FzuKnscdoIUfzYgLqGXJhMI3T5IHciTC8t3mnuqrTVmj3oM5UPyBLuIvk36mwEav5Loy
	ANQQ==
X-Gm-Message-State: ANhLgQ0I4kvpOVxDhi40fB+8muTDUnO59hEWWwL2AzfOjDsiRhyZ2YfH
	gnP4VhzbqEmqmEO67g1ixVbOL/Io
X-Google-Smtp-Source: ADFU+vvJNgyJ7OhHRurCJxX2+g8ts43FrV60r9/JDaY0YgGw1eTgLnkkyy4Ho5kO6MfwZXf0PZr6eg==
X-Received: by 2002:a17:902:ff11:: with SMTP id
	f17mr2382444plj.174.1583209081820; 
	Mon, 02 Mar 2020 20:18:01 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:48ca:eebd:2075:4053?
	([2601:202:4180:a5c0:48ca:eebd:2075:4053])
	by smtp.gmail.com with ESMTPSA id gx18sm679777pjb.8.2020.03.02.20.17.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 20:18:00 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@openembedded.org>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <47102fa1-dd23-b5ce-1fcb-d05d97d74794@gmail.com>
Date: Mon, 2 Mar 2020 20:17:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
Subject: Re: M3 build status
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
X-List-Received-Date: Tue, 03 Mar 2020 04:18:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/2/20 8:47 AM, Richard Purdie wrote:
> On Sat, 2020-02-29 at 07:38 -0800, akuster808 wrote:
>> On 2/29/20 5:13 AM, Richard Purdie wrote:
>>> Just to quickly update everyone, a number of patches we probably
>>> wanted
>>> in 3.1 have had issues but have had the issues resolved and the
>>> patches
>>> have now merged. Thanks to all who dived in and helped with those!
>> So no Bind update?
> There is still time, please send an updated patch!
Its unclear to me what change is outstanding.

- armin
>
>>> The patches/issues I'm aware of that are left:
>>>
>>> * ltp upgrade (musl issue)
>>> * util-linux upgrade (breaks wic test, probably simple fix)
>> I can look at the two above but can't start until Sunday so if
>> someone else grabs them today, have at it.
> These are now done thankfully.
>
>>> * coreutils ptest addition (blocked on libmodule-build-per 
>>>   reproducibility issue)
> Still not done.
>
>>> * psplash systemd race (smurray may have a fix)
> Still not done.
>
>>> * autobuilder new branch handling for initial run test comparisons
>>>   (open high bug with RP)
>>> * tinfoil race (open high bug, struggling for owner)
> Both done.
>
>>> * LockedSigs intermittent test failure (RP has open high bug, no
>>> clue 
>>>   how to reproduce or why, total mystery)
> Spent hours on this, limited success :(
>
>>> * Intermittent selftest failure with SystemExit (High open bug,
>>> Kai owns)
> Still pending.
>
>>> As ever, help with any of these welcome. We'll build M3 when a
>>> majority of the above are ready.
> Also, I've realised:
> * there is a high priority pseudo issue assigned to me
> * gcc buildtools tarball issue
>
> + the bind issue you mention
>
>> So where are patches going doing this time that will be in after the
>> release?
> I try not to encourage people to send upgrade patches during
> stabilisation as its a distraction for everyone and means fewer people
> caring about the release. I have had to queue them in the past since
> people ignore this and I may have to again depending on what people do
> :(.
>
> Cheers,
>
> Richard
>
>
>
>
>


