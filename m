Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 098C1607AC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 13:35:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 18-v6so7716620wml.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=PiqmnTBw/V1ewYW7KylOTAQhl0Qqs4u7XbdDdW81iOs=;
	b=ftDPcUe2BdD9G31yKsuLPyjDlA4X6uYJfD18uBbkr7tzk9MQVqaeF1UbRs7dBhSjPq
	I0Q9pB01yI4hrQ3OfnG219ioTkvWE/kkq6oTmMD8X8vVMLzlkaSNrPxKo68uZlr9apuc
	b3zVCkKD/1w4aI7F9F5o7aBHYd5gBREFCudJH8m/ixKJP1rhy3KaSIzwHLb+ObFZbOPx
	Z7Fp5D8DD4k8KxSjQaEcHpFv2tDhuTyAGsxCgmWzuuGs3hjcfMC/Xyp3x3EdFxftvJqV
	a84USbGsHDKCFbXNu618x9s/wAcCuKcJHmjHkSrM6CRepiWIzXLIxOiz3Mle2xYnCxG2
	oTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PiqmnTBw/V1ewYW7KylOTAQhl0Qqs4u7XbdDdW81iOs=;
	b=tNmkcqI533YFlVWWw56ujr/AlvNkXvFcif253BWmpWykNsXSwziJhNB/v+MrPhgJSd
	l3lRrPP24poA6iOmamBDyEJBVS5gG/O+SedsIBhulj43Oi5nT6hwDmqPNhvv52S0lbp+
	1wkiSMz42VB51pdTyKykJkTdZefEhvKAxbqJ5/bwAb7Xgvfzao0QG13tXNZijEt/Jt6d
	EiACKq/4WnUA+aXs68GIjQwI5TBtVislD0Df0YT3HwOwbqCmkcwkZTqYpIIO7h4Cqxse
	1DfxcVX6CkqqcQtfLiB1QutDMr+DPzVxMFqeg8R/SEnAQSbawoEEOz5xVpBIPaUqj5xE
	1PfQ==
X-Gm-Message-State: ALKqPwfXQN1KYeQB4wuoFz/6bJ+/JNcx4yohGqiakEWHAyD532WVsDBn
	+e8SWvV9xMxiC4w/0K5bekwZnB2Kx5A=
X-Google-Smtp-Source: ADUXVKKZpv4vEeaR0Zuk/AXnXChlULWwdd+n6Cfd6/ls4wDD3GgQH9eUXOrkEUyepHwUVo8DhKfGpQ==
X-Received: by 2002:a50:8fc3:: with SMTP id
	y61-v6mr16625679edy.11.1527946542008; 
	Sat, 02 Jun 2018 06:35:42 -0700 (PDT)
Received: from ?IPv6:2a04:ae08:1403:ff00:489:7961:466d:7cf7?
	([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	c46-v6sm11447617edc.34.2018.06.02.06.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 06:35:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
	<20180601221440.29992-2-dev@sashko.rv.ua>
	<CANNYZj8ZmdHAFix08WYXkLLJ1ZGf5pv8PAHqfR3B4GRHzM_n+w@mail.gmail.com>
Message-ID: <2a578a24-b2cf-fabf-c86a-89e5ca3ed1d9@sashko.rv.ua>
Date: Sat, 2 Jun 2018 15:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8ZmdHAFix08WYXkLLJ1ZGf5pv8PAHqfR3B4GRHzM_n+w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] iso-codes: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 13:35:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 02/06/18 07:19, Alexander Kanavin wrote:
> 2018-06-02 1:14 GMT+03:00 Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com>:
>>   SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
>> +SRC_URI = "https://ftp.osuosl.org/pub/blfs/conglomeration/iso-codes/iso-codes-${PV}.tar.xz"
> The correct new URI is
> https://salsa.debian.org/iso-codes-team/iso-codes, don't grab a random
> ftp from google search results please.
>
> Alex
It is not always easy to find "the new" official URI. I took the one 
that was around for a long time, not "a random ftp from google search 
results".

I will fix and resend the patch.

