Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0776C1B2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 22:45:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f8-v6so3153351pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 14:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=e2fx9I63A2TRxKkyP37cmDEjXRV27niSuCMoO81296U=;
	b=b7khaeqipZtooG1FfVIZZEQ/J0Gfd6votN7nDcwDTSNZ6B/Xt4nGoHrbdiAOI1I2lS
	cTpGg5mHxx2IWvdKvJF2TgiJIfRCuh65Y5RzxTEGYbEtWB8F0K5O8nko0iBgCcTm51q6
	Ip50VJyTIZUJqOefDWOSB5Pbc57z8ZIJOaiPETk6QDQlzfBCaDoxEUpEgGrXdw2tVSgd
	fH3WyeuHy7wZiQUZ/vSUhWlfwUUhVBY+u9D45wJ0cyXL/pNSg6nrzehFeHFtON7TkaZP
	uNjzlPJzes5o1nTuGVWkWclqohtwhk/HYDUmTgPo3AGGFLPwHuMTcC8IJXuVwY2fuYxc
	oQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=e2fx9I63A2TRxKkyP37cmDEjXRV27niSuCMoO81296U=;
	b=FC19f3IxUcoZhaogy3pSFmniVkW1CfoxEvPHYO4hUrCKrHcplZfk+4AIzHIjVPd05Q
	5EQC3G4DrjO34Rb1ONilrtqEADS+N1QszNvOzcCHlci9d3ihUVcc9TwMuAiZxGxkGvgS
	PU6jdtXdbMocAxc1s+g1kUWoon7+qEQE28S8b5mcpSYuhhXToiL9Nx4GNM+YE4mwJww0
	CL/EUPXbzZCQZwwa5SqDixmdhfRFbF4X9Wd8Crk9aN+7XDBZQ4HtWW6MS4JUVm631Bjm
	io2Va99KOBw8cduxJCZoU/SwvrDRSpHEgMN3VrRaNDnXUZT2wKTAPf5whn8ll81FghEE
	k8YQ==
X-Gm-Message-State: AGRZ1gIjXRBYFkl9CvdUrwJfPqKBODtwdurIOrdZBA5EtEiMGvotZl66
	jgWpWk7dOHvptGIzwrVv+62B0rBg
X-Google-Smtp-Source: AJdET5c2dawvP94LqVOXecUi8UhqpIuvwvdXwAHgO380TjRII7LvcXorqACXP8A1dW4LT8NDNud+Xg==
X-Received: by 2002:a63:9a52:: with SMTP id e18mr15306623pgo.14.1541976323893; 
	Sun, 11 Nov 2018 14:45:23 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7077:6962:50cb:42de?
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	a4sm12889235pgv.70.2018.11.11.14.45.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 14:45:22 -0800 (PST)
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<5f051eae-c4a6-dcba-be88-f84bcc8baac8@gmail.com>
	<3babfdb5e229ae4c347d40c563e77270a72a4c6a.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <536fe065-a71d-7e70-c583-bc91d984a811@gmail.com>
Date: Sun, 11 Nov 2018 14:45:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <3babfdb5e229ae4c347d40c563e77270a72a4c6a.camel@linuxfoundation.org>
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already automated
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
X-List-Received-Date: Sun, 11 Nov 2018 22:45:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/11/18 1:59 PM, richard.purdie@linuxfoundation.org wrote:
> On Sun, 2018-11-11 at 13:09 -0800, akuster808 wrote:
>> On 11/9/18 6:29 AM, Richard Purdie wrote:
>>> The nightly-build-appliance target already tests this particular
>>> build.
>> If I am reading the AB code correctly, it is building for x86-64
>> where
>> as this is for x86.  A QA person would say they are not the same.
>>
>> Are the resulting build results testing the same thing?
> I have to admit I did not spot the x86 verses x86_64 difference. They
> are different however I think a b-a image makes most sense as a 64 bit
> one and it makes more sense to test that of the two. I'm not sure there
> is much marginal utility in testing the other?
Nope. x86-64 is fine (until we have an non-x86-64 builders)
>
> I can update the commit message to state its a conscious decision?

I am fine as it is.

thanks,

>
> Cheers,

With every 'Cheers' I raise my glass.

- armin

>
> Richard
>

