Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A2ED874EBD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:38:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l1-v6so8093589wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=kK+ABijVXUFwvGdACCMQGEqY0BYcbRGe5UvRrrutaiQ=;
	b=MmOi4QDP89YqB9lfQfDwGoLYhfFHwZil34AdxQ2xWk5SG5eyIwMoLuQEaHFOBQyI7U
	nTQVO5EDGTWyUmY7hmtAOUgm4kRPFS9eNgLcN4ZxehaGrHFcPdypFgDvoP59+/jr4A6q
	AgjujgqsH3+equU/nE1S1mf4Yb8YWjdQL0gQKCmNUknsPPsaOV1CpcpHhuD4+Q5/Zo6G
	u2M1Z1wFMq1XBQ7i6vGkzx80z3TEiKwj8SOSIbzjP2u8Xk0yyo0kpHhmqF6qCJ89R53E
	UcGvXBIaIwpQODRPelEVOs9EiDgRWGoftXcN3ibx99nTg7TfC9nwwnfTvUh3XbV7OIay
	n9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kK+ABijVXUFwvGdACCMQGEqY0BYcbRGe5UvRrrutaiQ=;
	b=g1ib5TNeJ7gMgzFHI6FpSgbEIlW6EyViUOMO7kQToV9Xv2B/vtSo2zxyHvzLlqH676
	EARz9W6XiyDCiasBZudWKNMzvONgfcBbzlLmtMuvK0DtniH212lfJS9Xu6WQM/qvD77O
	7T6gL7G9WNXrhgcvf/Ke5LYnsjktqhlIETxn53VQPGIJsB9BGtPMGOY7hwmaRF/xLqKt
	Zv3GYXcBPRbgFiHeTEkV12mcf51DihQeqJ+MkMiCWUIJUtdqK1bd34GaYErWo1WxQ6RH
	uTujEmkI3yZiTbrrnjb5cOdw016JAlxh8PUOj7yQXKKdWW4LwK0QNN4zk2nzy7Cd1F+M
	Q2KA==
X-Gm-Message-State: ALKqPwfarNZ1AJBt98BVob4b9QJQgdWOOsYCIsCodk79jycs/f7qJQxC
	PMcV97CZkdsnMcIXtoBI/N4yKpe1KEw=
X-Google-Smtp-Source: ADUXVKLAI+b29ruTyW7ieDeCEcSFKeKQXYz6TEaBWdWe5kufUH9TXVXysExTcs2b7QVS94tALV/taA==
X-Received: by 2002:a50:95b6:: with SMTP id
	w51-v6mr17561305eda.33.1527975515119; 
	Sat, 02 Jun 2018 14:38:35 -0700 (PDT)
Received: from ?IPv6:2a04:ae08:1403:ff00:489:7961:466d:7cf7?
	([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	c7-v6sm22708613eds.83.2018.06.02.14.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 14:38:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
	<20180601221440.29992-2-dev@sashko.rv.ua>
	<CANNYZj8ZmdHAFix08WYXkLLJ1ZGf5pv8PAHqfR3B4GRHzM_n+w@mail.gmail.com>
	<2a578a24-b2cf-fabf-c86a-89e5ca3ed1d9@sashko.rv.ua>
	<CANNYZj_KLQGyoQ1D+Bbh7sCqarKcnJu1fJBregJ+SPkQFnFDrg@mail.gmail.com>
Message-ID: <c6d74cd5-da4d-98ed-bf0b-1d5f4dbc647b@sashko.rv.ua>
Date: Sat, 2 Jun 2018 23:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_KLQGyoQ1D+Bbh7sCqarKcnJu1fJBregJ+SPkQFnFDrg@mail.gmail.com>
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
X-List-Received-Date: Sat, 02 Jun 2018 21:38:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

No feelings were touched. I should have indeed explained why the SRC_URI 
was changed.

I'll update the patch. Cheers.

On 02/06/18 23:35, Alexander Kanavin wrote:
> I'm sorry for being terse. Reviewing patches before morning coffee is
> not always a great idea.
>
> When changing SRC_URI, you still need to explain in the commit message
> what's wrong with the old URI and how the new URI was chosen.
>
> Specifically here, alioth is not temporarily down, it has been
> deliberately taken offline:
>
> https://wiki.debian.org/Alioth
>
> and the same wiki page lists salsa.debian.org as the successor. Any
> debian-driven projects are likely to have been moved there, and so
> that's the first place I had checked.
>
> Alex
>
> 2018-06-02 16:35 GMT+03:00 Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com>:
>> On 02/06/18 07:19, Alexander Kanavin wrote:
>>> 2018-06-02 1:14 GMT+03:00 Oleksandr Kravchuk
>>> <open.source@oleksandr-kravchuk.com>:
>>>>    SRC_URI =
>>>> "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
>>>> +SRC_URI =
>>>> "https://ftp.osuosl.org/pub/blfs/conglomeration/iso-codes/iso-codes-${PV}.tar.xz"
>>> The correct new URI is
>>> https://salsa.debian.org/iso-codes-team/iso-codes, don't grab a random
>>> ftp from google search results please.
>>>
>>> Alex
>> It is not always easy to find "the new" official URI. I took the one that
>> was around for a long time, not "a random ftp from google search results".
>>
>> I will fix and resend the patch.

