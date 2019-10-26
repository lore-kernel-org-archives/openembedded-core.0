Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 35D0D7FC3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:35:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l10so4934473wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HLRwxYmFg+frnweBXJA2DgFkqhHxwew4V0WbMy0n5wM=;
	b=Pmjn6h5zYe+ODOKhFqYKqr6duJ4xOKALF2jVCiLHET7mJ2utjBxYKTY9U8ktiD0Kse
	GLZ8TQokMCZA/z0OXFgy+kwYGEU9HNpblYdS7lh6ln5tCBz3Jh9xzYPQSAjsWBgTdpN6
	LGCC7Ku20MgFPqGyx7vD+T6Ygt7+5qojKHgYNf5ho9HCevuuk9XdBQMHhqLQ0IH8j8ez
	GIMM5TBUi/Np65T2ZboFBYujZAnv8TPpzpGuwpAFhGeYnhR9D90PNTILqcti8agFZ3AK
	oWWtMJTJ+LV350Ed7WCCSKDf3KgLpWaow9EkZLNz35EJ/vEYT5g2skukepTF2IAfjUgb
	bjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=HLRwxYmFg+frnweBXJA2DgFkqhHxwew4V0WbMy0n5wM=;
	b=X5sCcNHnt7PHq/tNZxNBzctHXYKtFwSlg4yc3Bjv73a17wtrddHXB9FFZANMOG9CEH
	4gDKJrGTdx5am7ZH0JKGFa99jM5p476Z6vyWWEHC/+cs1lc77HqZFoi6VVocO4QrVOFf
	HuPFnunZcW85FeevPn+WyGNM79hdgk8mc3IKykho117/Ok8ZuF2rzQLdN2dE0ppsqsoY
	E+1jeT2v+ORKl2DssjF7jL1MF6TGGxTJNKHlJ2/2fRHrQSwXn9mLe7l16xupf9GUHtex
	zoEcEQhK50b4PaMbj3I8SOc0KxaEMUjqpXZ8p6SqBW08T9hKtdiGaXmrHe6q6uxAauW/
	d8dg==
X-Gm-Message-State: APjAAAXkcPB2zuBpahsxR9rN+QyFXK9F+Hy77+E4R5Om7NhMxUFhBkDr
	vO9l7KucdWR9Tvwfe6Suivz9WBhW3/Q=
X-Google-Smtp-Source: APXvYqxXAPNdEVirVYK3MF8fMV+66DHHBKzUjJulMokT29EzT2wuFS5Zgi5FGaTuBw3F4XJym+7W2A==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr6446551wro.324.1572082548597; 
	Sat, 26 Oct 2019 02:35:48 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id
	w18sm5239871wrl.75.2019.10.26.02.35.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Oct 2019 02:35:47 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3> <20191025134458.GA22739@linux-uys3>
	<1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
	<20191025172451.GC25729@linux-uys3> <20191025213827.GA31737@linux-uys3>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <18c7cf19-c7d3-da73-396c-05e3ea722d78@gmail.com>
Date: Sat, 26 Oct 2019 02:35:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025213827.GA31737@linux-uys3>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Sat, 26 Oct 2019 09:35:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/25/19 2:38 PM, Trevor Woerner wrote:
> On Fri 2019-10-25 @ 01:24:51 PM, Trevor Woerner wrote:
>> On Fri 2019-10-25 @ 07:37:34 AM, akuster808 wrote:
>>> is someone going to send a patch?
>> Yes, I'm working on that now. This looks like something that should be fixed
>> upstream, so that's the approach I'm taking. Please bear with me :-)
> I sent a "quickie" fix to the list so master builds can proceed:
> https://patchwork.openembedded.org/patch/166245/
>
> But I also opened an issue with the upstream project:
> https://github.com/stevegrubb/libcap-ng/issues/9
>
> And proposed a solution:
> https://github.com/stevegrubb/libcap-ng/pull/10

Thanks, this fixes my problem.

- armin


