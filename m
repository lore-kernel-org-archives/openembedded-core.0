Return-Path: <pascal.huerst@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id EDB4F7FE56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:22:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q9so2883282wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 05:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iIvHjB24wCTZSI6Du2wZOt7aAOf25WUvq5u7M8vuJM4=;
	b=eBcsRBzjku3dcDbS20uEotQDD4L6iGGj4XJcpsirGWsox1hFIPGjGm8+X8yiMAs4Lu
	t762kTo6KOKtMBEhNEog8qVIIDXv6TtnejOZmPVBTK1ugFItWlAGfTcEbZAVCPzkqDan
	sBqJqO78lpZrHO3IeDqrRitOlqyAcHpMoQcLk9l88xkJkzYNEHTqxQ9dFzY+dr8WhXQf
	aNK7/4z++g7BM/QSIr8DuhhXlBrEJd/ypNKrtJafh6V9Z+YIvhTWoe5JyX55wg8QEYdJ
	YA24azl/LWR8f6tk944/hxmJRqbvyNvwIuzFIZTV4vrZSr7oLyOZl5KfDmvJaKUeEakC
	trsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:references:from:autocrypt:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=iIvHjB24wCTZSI6Du2wZOt7aAOf25WUvq5u7M8vuJM4=;
	b=ofTX43mLVBde06zQNP+1CraZA7oVpQmxdbXj53D4v+QERwYpyW1lNfqRpk5FaAbOue
	VtrJQPw0zJU/w8yJPx4EfwCVQ9k1NM0dT+AYKe+qsGJib5RSQKDWDlglSfy4KBNoUlFH
	EP0ed3nQGQ2D3NhnAN6W9iHr7oIP9ORqLWb67pw8kodTF1O2ni/qAXIzKt/4m6klMt4S
	uUAbi33Oc9qpdRZJtGalbyNR9a1HIwxkqS7FKL6QS1NpV6gDt6J5VcCOUhBpzaHujNCM
	Cnf5Ihxc++1/1CYr9lGu7q1SDSSa3t/wueLJNOTp+O6SgOSozYDmSnuvwGWSaP7QmMQF
	IOAg==
X-Gm-Message-State: APjAAAXa2ucgn+PTmhlrpmMwZQ8t1hS+PXXpT630/ZUsz6wOqOK+Bqvj
	mpJamLW+AKqg6/gNmOczz7o=
X-Google-Smtp-Source: APXvYqywRyLTLpQaXQ7x6cFwTv3ozy4i+wyhQ6owjFzAuLsP5RM3xAuWi0xMW8nAVcYb3PXLcO0A/w==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
	x6mr4702291wmj.177.1578576154541; 
	Thu, 09 Jan 2020 05:22:34 -0800 (PST)
Received: from [10.10.222.52] ([194.162.236.226])
	by smtp.googlemail.com with ESMTPSA id
	z187sm2943491wme.16.2020.01.09.05.22.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Jan 2020 05:22:33 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<CAMKF1soSLjcZBoF2sg9cnTUWS2p5k3cqhR2Zo472tMOOeDiB1w@mail.gmail.com>
From: Pascal Huerst <pascal.huerst@gmail.com>
Autocrypt: addr=pascal.huerst@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <09965869-94c5-2c32-9010-434dc33dc5aa@gmail.com>
Date: Thu, 9 Jan 2020 14:22:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soSLjcZBoF2sg9cnTUWS2p5k3cqhR2Zo472tMOOeDiB1w@mail.gmail.com>
Cc: Rich Persaud <persaur@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 13:22:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/01/2020 05:05, Khem Raj wrote:
> For such usecases, Maybe you can use floating tags ( like
> 'latest-release' or 'last-good' ) and move them when needed and lock
> the recipes to use them to achieve what you want.

I guess we will have to do it that way then, or we create some scripts
which create an include file of the revisions we want, using the fetcher
calls, as proposed by Richard.

> since use of AUTOREV in public recipes is discouraged, this does not
> affect public layers as much
> but I do worry about alternate workflows.
> 
>> Thanks!
>> Pascal
>>
>> [1]
>> http://lists.openembedded.org/pipermail/bitbake-devel/2019-December/020618.html
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

