Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id F07A07E468
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 16:10:29 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w16so9203480pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=JrMzvWsZZmsHjmLolKHYKyS2Trwy4ATi/NXEfd4c05k=;
	b=HSnyYCTQkuQK+nlIyfEyQdqrY/X+Cj+r7CvKk/KTKrVgAiacEBAGBL0w2zHlzHSPrJ
	E6mJnajDRZ1eCxnwqD3/XBWM7JNjHsa9/J7rzJ1mbtDCJ0MWkP0fKBxgDmbvhHF4psya
	sNomDG447xYAo54KcVI+Lo8CdZV/7x1qPpwt6vGy1xqY3XeoZ0s3FG/yDFluMivXII9H
	fafgA294Tp+xO/DGuwzPLQUwbZz6eYE+4NAA5klAgPWTBkZrA/DiUGcYeAP8HnjB29kS
	Oy3tRmCretNmkVJ3ZVSULHSkJzm5b18EJjDHOIaBdqRib4I3JqVLzNQI+U7K9kpF4eJK
	q1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=JrMzvWsZZmsHjmLolKHYKyS2Trwy4ATi/NXEfd4c05k=;
	b=f/2W5lAuTz4Q6Gful/qmGFTY6NIeGNGiPeKQSH9SbiN7BGEPcuvupKN9O4SuepTvK1
	fUCWnnaI/9qig0du6eTrKook3VQpFhoF9igZNHSk2jUgvWN40HxU/BC8h+gQ3Sj3XxVa
	t4ye74LciEhGbEBHcjOzxmZji/xv7whKu4CEnXmG9786bqpf2vTta9LsTV/Q66iCwjhh
	9g1At3piRoYUynfcxonmVMl6raRMd+VgBecuhATAB2+eR6jzDJBA0JQ8JO412u3MNMtA
	4whnGMex1sc+yDQ3zE44PTCm/gLsQ9y8LviDxvZlNDPj9F4b0WeaUSg1haylsKmohlDO
	JU0Q==
X-Gm-Message-State: APjAAAUXiNuKA7mS34gWrJuDm5BYPb+FlfU6oRfHYw+7dwt1tbmYZSjA
	0QP5hXho90R9iYaNuX6fTXZlQGRa
X-Google-Smtp-Source: APXvYqyeZ+moA1OpcIYYzBzA/2HfBqxIrmGENj/6E2ocQvlbITVeLr9k8MRUqPqgFgJ+Vaf10wiceg==
X-Received: by 2002:a62:6c1:: with SMTP id 184mr34154899pfg.230.1567440630140; 
	Mon, 02 Sep 2019 09:10:30 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	k5sm7306982pfp.109.2019.09.02.09.10.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 09:10:28 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190831211549.23729-1-akuster808@gmail.com>
	<20190901140542.GA11574@localhost>
	<9b09243d-86b7-b358-e0be-c41f8acbcd47@gmail.com>
	<20190902124003.GA8291@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2b9ef422-21c4-32d1-903c-b9c1b84b9011@gmail.com>
Date: Mon, 2 Sep 2019 09:10:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902124003.GA8291@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Mon, 02 Sep 2019 16:10:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 9/2/19 5:40 AM, Adrian Bunk wrote:
> On Sun, Sep 01, 2019 at 10:07:13AM -0700, akuster808 wrote:
>>
>> On 9/1/19 7:05 AM, Adrian Bunk wrote:
>>> thud and zeus are providing 2 gcc versions each that need fixing.
>> That is a true statement. What are you expecting?
> The other versions also being fixed?
By whom?

>
> gcc-8 being fixed in warrior before it gets fixed in master would be
> the wrong order, and would introduce a security regression in master.
Warrior mainline does not have this fix nor does Thud. There is nothing
wrong doing all the prep-work so changes can land in the the proper
order. I am fine if they don't get accepted.


>
> The code should be nearly identical in warrior and master, so fixing
> this also in gcc-8 in master should be trivial.
If I find some additional free time and resources, I might be able to
swing that. We currently don't validate the Alt gcc's and they add a
maintenance burden.

IMHO, the older one should be dropped, like we did for Warrior.

>
> Fixing gcc-7 in thud would be a bonus.

Patches welcome for the bonus.

- armin
>
>> - armin
> cu
> Adrian
>



