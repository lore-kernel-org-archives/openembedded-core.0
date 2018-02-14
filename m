Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 808E3605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 17:26:20 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id f4so8895911plr.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 09:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=0TP6tkqaLLKx/wFay0TQeDRp8K23JDS4LEKVXyIfpSk=;
	b=Vw3DW1r0zOgY/PvEGfOExAwT+T9gArmeYeIUkK6p6413vd/Dt0Ah84IYNjQrGIUTzA
	FXOkTZX+cte2AcFjEV8ReQAHwnDHMosWlSG23aco5MAHQPxjQjRIuwBxOtgZhb93HAZ7
	/Be/Vt8sjzMPL/rC9eRz49Bysy/CViQkXHYJREvpeiwdqbIL7Yc/RH8NDVKKuPZJY7Tr
	j1c4M1Tfhe31CIdixsSYSpdpHwUeH8bM5f1Dkxn8qQZ8JSVhu2tHEbAIC3l9UkIguFPK
	4WEauUmU1l/46C253R2jerZh51DRfgkdTpsFBvaXD5TIm8Wq7JrgI+UOSXgqd6+n7A5m
	fMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0TP6tkqaLLKx/wFay0TQeDRp8K23JDS4LEKVXyIfpSk=;
	b=E6oD0HhYuimw1m372U2A4XqyB8UM99nfKv6tsbsgyEpPI8lNqfaRQlE9WJ+WncboZB
	jI/MwbZHJ5mYU6/+px65LkcTB0E7wzNesjIR3cabsIIhsEX463vxxaDPoxY4/xKCzFgz
	dYC1ffmafkn1mwQ5udHh5VrMs1HKlL6ZbBGT0A1/z20IBKIcHufeHKvN56xXSd2QQHQn
	hqynuD0fw0cd0vsAnl3S22ZBFKNux9fJMp/XTk3P0pGsWSdo/th3hze6AmasrbzTRK7s
	yBYxyrFzEW/Hz8XQ/ymIcZU5Na8i+DA3SIFnlQtxOdyAL4EpbqheFVv6EyybDYcmsro2
	eQ9Q==
X-Gm-Message-State: APf1xPBigzQt6LnRM8BN4/ymd811Bu3YE8t0YTi5zwAbVFrQtGwX5m+4
	SxcabSX90V7ZhQTFyD4Mi2g1gA==
X-Google-Smtp-Source: AH8x227nb6t+gf3TgAY0w2tzi77tcpCbxUlxz5U5oiMwmDwN56WjXANTG6W20lT5+HaMY5BB5kBt2w==
X-Received: by 2002:a17:902:2904:: with SMTP id
	g4-v6mr5087485plb.170.1518629181512; 
	Wed, 14 Feb 2018 09:26:21 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:4c3d:6d16:593d:cc61?
	([2601:202:4000:1184:4c3d:6d16:593d:cc61])
	by smtp.gmail.com with ESMTPSA id
	e81sm24418951pfb.58.2018.02.14.09.26.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Feb 2018 09:26:20 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	robert_joslyn@selinc.com, openembedded-core@lists.openembedded.org
References: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
	<00ccda06-5caf-0aad-9df8-df46a8b40a9f@gmail.com>
	<1518623907.24236.115.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b2346dc6-5649-8924-044b-1a193dd5adc6@gmail.com>
Date: Wed, 14 Feb 2018 09:26:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518623907.24236.115.camel@linuxfoundation.org>
Subject: Re: Backport OpenSSL 1.0.2n
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
X-List-Received-Date: Wed, 14 Feb 2018 17:26:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 02/14/2018 07:58 AM, Richard Purdie wrote:
> On Tue, 2018-02-13 at 08:27 -0800, akuster808 wrote:
>> On 02/12/2018 01:08 PM, robert_joslyn@selinc.com wrote:
>>> I'm working with the pyro release, and noticed that it's still
>>> using 
>>> openssl 1.0.2k. The latest version in the 1.0.2 series is 1.0.2n,
>>> which is 
>>> already available on master. Is there a reason that the newer
>>> version 
>>> hasn't made it back to pyro (or rocko, which is on 1.0.2m)? 
>> openssl 1.1 was added and the openssl files got restructured making
>> simple cherry-picking not an option for older releases.
>>
>> 1.0.2n hit master 7 days ago, sorry for the delay.
>>
>> 1.0.2n is now in stable/rocko-next and will migrate to rocko when
>> appropriate.
> It is? Not pushed maybe?
it is.. just not in poky-contrib ;) its over on oe-contrib. Its where I
queue up things

- armin
>
> Cheers,
>
> Richard


