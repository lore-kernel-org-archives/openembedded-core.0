Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 188007CED7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 17:30:31 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b13so16408792pfo.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RXD0HrCR6CYyRZcXMiq4qYGR0C7DMjkx2asn5LHC1FQ=;
	b=X11ySxMQ/f3XOoI9LmBlzCOau+BxuqXzRmvUPTppe7Y90VNEJRlq/O2q/wKS2pARHZ
	xAuNKHcSjWYSYTAluxWVRAN4cLbk93U03g877yS/useYPYUQ12Um6KIKQL3tXkek82/4
	3jlRPodjEBSzdgMkKxhF0tSloRDHNfxGaXB6xOhuPVibCbz7fA4xNitkEidDdUdqU9Yb
	jGcuDaEhiiKkAdu+kDjaeRkXBiuU1GuakIl9oK51u3aOWzZdlbNR56ii+SJzhNZ9T6p6
	uNh/2tUGbDYVXaTLda3hvMJjGL4/bPWO3wmVlvcVYhtIMstcxXsM+khfCJX4llrheo9n
	i4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=RXD0HrCR6CYyRZcXMiq4qYGR0C7DMjkx2asn5LHC1FQ=;
	b=LYtUT2TQ4l1NbCMr+xnz60oXA18wbAXftDJCKr8iN1dryJ3eIO1H7VdlfccXohV0Z6
	zqgGI641vUCywkykfkGcBX9GoMlHaq9Izs2F/UUdbzuBNC7xkh32NNBt7sf6mirCvaY6
	W0QS8xxeqnNgIwdSL+udwqwwTqvx97NrxLGyYStjM4N82JGwQAG+sbGVP/sGB2C6xUoU
	2Rts+NGPKZfsSx0ueMqea83YBCZcVa40kFVQrSuY6Tgy16AhUlNY5MqoYOz7wJsyDVo8
	iDc/NTNhipP/73Sa6yGA/rXKYpya/pZys3ede18z437B78A4XgEtK77qwxCKkU1ukmNC
	fVNQ==
X-Gm-Message-State: APjAAAUhxfygmz703ySTdy69+7jDUAnQkDmuy11xhzTvU4RayFq/i90d
	fflLdlyWfnOK2sU/8C2NcTcet6eLBcA=
X-Google-Smtp-Source: APXvYqxhXBOKmpw2m1pWKhUnkad7RFyEoMmAf09srs1Z4/2aX/js1g+wC7j8Tm1pXI0bARTD0sJecQ==
X-Received: by 2002:a63:f24e:: with SMTP id d14mr20332473pgk.184.1568309432796;
	Thu, 12 Sep 2019 10:30:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:94af:b4e3:6058:dfc8?
	([2601:202:4180:c33:94af:b4e3:6058:dfc8])
	by smtp.gmail.com with ESMTPSA id
	74sm51598696pfy.78.2019.09.12.10.30.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Sep 2019 10:30:32 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190912065221.733-1-zangrc.fnst@cn.fujitsu.com>
	<e91aab69-d7ab-dd80-1671-72e21e85711b@gmail.com>
	<20190912142824.GB5021@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <95697dfd-5692-c175-3fd4-0609e3b96310@gmail.com>
Date: Thu, 12 Sep 2019 10:30:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912142824.GB5021@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Thu, 12 Sep 2019 17:30:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 9/12/19 7:28 AM, Adrian Bunk wrote:
> On Thu, Sep 12, 2019 at 07:10:08AM -0700, akuster808 wrote:
>>
>> On 9/11/19 11:52 PM, Zang Ruochen wrote:
>>> -tzdata : upgrade from 2019b to 2019c.
>>>
>>> -tzcode-native : upgrade from 2019b to 2019c.
>>>
>>> -tzdata.bb and tzcode-native.bb require timezone.inc.
>> Not exactly what I had in mind.=C2=A0 When there is a TZ update they s=
end out
>> what changed any why.=C2=A0 It looks like this"
>> ...
> IMHO that would be far too long for a commit message,

I have been including that information for years. IMHO that make it the
standard for that package.

Up until now , no one has had an issue with it.

> and changelogs of this size would make the git history
> unreadable if everyone would start pasting huge upstream
> changelogs in their commits.

I have no fear of that ever happening as it has been totally acceptable
not to have a commit message included=C2=A0 and there is no enforcement o=
f
that process.
We had this discussion in the past and we go round and round and nothing
ever changes. So I am not worried.

I applaud those who=C2=A0 take the time and=C2=A0 effort of providing add=
itional
information in the commit messages.


> cu
> Adrian
>
> BTW: How is the legal handling of the metadata, when such lengthy
>      3rd party texts copyrighted by various people under various=20
>      licences are distributed as part of the git metadata?
Interesting question. Since I am not a lawyer, maybe you can help guide
the community so we do the right thing. Now I am worried about the
stable branches,
do backports have=C2=A0 this same issue, are those 3-party texts?

- armin
>



