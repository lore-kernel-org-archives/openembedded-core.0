Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id CAF5E7F9A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 15:18:29 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id az9so2753464plb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 07:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2/8TwxQjrcOgH9I2cI3no52s4NaCuNJVvzgcfjXU1v8=;
	b=udzH9RHYpGxxaeSTK1jGJapyvPvq7Dar7R7+1oncFktCNqR18EFEs6Z9D04YsU7pvW
	OGbDfpIN4k0sUsyf2G2sjpNQjs1rrS7tqFjTLhIsJ1b5o9j0LmP6w1Ek1+rQnCG6GHSI
	tO249gdC8Z2bADOWDoBSyOBBqAfe9KhDkyhYHFvWJuIHQZKtKLP4pOda6euxUj7btljZ
	SXA5m0N86Ptzhxqi/gnPfabqxP1P7reiQrRR4gdc5/qumEeD89bd9WZoS/iYHAjO3U45
	JfUmb1eaIZYsnOTNbSizXSsi6xxwtdhXDnm4rvFyASFm/8CDR9oib+ZBAFFQ5cd1qevU
	/6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=2/8TwxQjrcOgH9I2cI3no52s4NaCuNJVvzgcfjXU1v8=;
	b=jitBfZP+1+xEwyLHfyetLkp5xYBujd3AoJoJVC473ixDMpnTPdB8xuqHAzbO9ZhL1H
	ZyAIrEXTvBYJmMp6JeP974x5brVgyOxDJqAcF8s8xd6PZiRi8xEwZkqZsvOkTKZhK+FK
	zzIgwkewfom9hVVqXUwczJu8yCZH4GtUXzZBnKzRviqn8O08sm7YoTB8O9vTIKPu+b2q
	wcoUjyiWH/wuNn/u8tlF5IhkQcxfweLq+bRF07Yv2VfhzTwFQOBFirRvScVJxQkoOip0
	s5GIB0P9YHiiJgZfFjQFe5a6J9Zup1FfdZry4whCoNou1FO1dPzxoiSC7GH+CC71fzqb
	tPvg==
X-Gm-Message-State: APjAAAXK54QUpTiUevuVkYXp5lddsq4CgJFItwZ8GiupWa12jO3AytMf
	fpReD/JK/32O7MFRwr6AsCW4zOfu
X-Google-Smtp-Source: APXvYqwCjYAOIVKugNDGwSk/guWhh2xdVtQTSlEA7euT+3SJ8Djgy9Rl4tpTU84qchmx6bB8gpbfcg==
X-Received: by 2002:a17:902:760b:: with SMTP id
	k11mr9872236pll.126.1573744710430; 
	Thu, 14 Nov 2019 07:18:30 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:90e5:8f1e:65b9:f435?
	([2601:202:4180:a5c0:90e5:8f1e:65b9:f435])
	by smtp.gmail.com with ESMTPSA id
	e17sm9635159pgt.89.2019.11.14.07.18.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 07:18:29 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, Ross Burton <ross.burton@intel.com>
References: <20191113081914.28778-1-bunk@stusta.de>
	<02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
	<20191114125101.GB13971@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cc75af7e-6229-44d0-5d30-d74a8ba11576@gmail.com>
Date: Thu, 14 Nov 2019 07:18:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191114125101.GB13971@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Thu, 14 Nov 2019 15:18:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/14/19 4:51 AM, Adrian Bunk wrote:
> On Thu, Nov 14, 2019 at 12:04:40PM +0000, Ross Burton wrote:
>> On 13/11/2019 08:19, Adrian Bunk wrote:
>>> +# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
>>> +CVE_CHECK_WHITELIST += "CVE-2019-6470"
>> Can you be a bit more explicit about why this is whitelisted?
> Something like
>   BIND >= 9.11.2 need dhcpd >= 4.4.1, don't report it here since
>   dhcpd is already recent enough.
Actual. checking isc dhcp sources, it appears the fix is sitting in
master and has not been merged to any of the stable branches. I have not
had the time to unpack and check in an OE env ti validate that.

Have you done that?

- Armin
> ?
>
>> Ross
> cu
> Adrian
>


