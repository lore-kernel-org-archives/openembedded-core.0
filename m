Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3D575047
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:42:10 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id c41-v6so9147839plj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=cFnVxM3cL79Hk8uYS15NlholCrCsPFaZ9/duekJDWss=;
	b=PAudu+cjQQItFDAl+9UacBBf+H9UpLtwQkuM4WUunkuw7gIl7qL/F4fPzr69UgH5Pa
	YizTD6k+iaosmh3H7JxMoyDqzKCVNyFljm5OSFU7UbKak8Md1mSDf+C+jq6+AWBsunHn
	55iZvTr2jeRSsfyvGX6ULG+a8nlUWbvXRq5kBB5sR29G4gzpmwwfME7dVsQNFvb2N0TQ
	YUPDGkUhBvViiyWqWN+fjFwzKFsUcHSOd8ywaSLlCYqbAY25m/A9YAV9GgkZDGgaYyXw
	bR+9Ki3e/BjemsyExv6WjVx8URnRJDSU8UnSU/j3dego9k942vzJ18eAZoEveTPxk4NQ
	ZFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=cFnVxM3cL79Hk8uYS15NlholCrCsPFaZ9/duekJDWss=;
	b=Y03D3GOwCrAg77dZfAaGtrGFj3j+qnbaomHkV2k2A2YPEUCa98frRN5kerMcbaFc3y
	xICgtg4P04ylU0ozbkwd229kXqngirVvhWNLBeTBWnGxGrOXUsidAOXc1AQeGotb1ILk
	rmBm2mpX+GJIzonedrSY/406DXKdk6F7n+tDv4tn0UucrEPD+/XyKuImiY9Vva98OoAE
	fblLd7x8ZAYVYZ+Cew3p99TmoUsBPV1v9Fy4q/aEeftfsai3YRom5mcqSO63Hdvi5SRy
	93G8lky6sz44zCGnXwER5LsaUmY8rZY9hC3bgV7d/0UW1U4z0Gqw0MqJNGousuSG97b0
	PcCg==
X-Gm-Message-State: APt69E2C6fCKJ6ji770FzY6dDiaU7WlvXu3Rn7OyTNXA7I9M0V5LuPtR
	MIv/ZJrnbn1FPIWD7jo/Up+aqw==
X-Google-Smtp-Source: ADUXVKJxbq/k6nO6Qa7QY64VnXX8oJVbdkp73jF5/0WBy61RBOKCW1GpLrDYiF+Na9n0zfpuxOnWnQ==
X-Received: by 2002:a17:902:900a:: with SMTP id
	a10-v6mr14563017plp.41.1529332931531; 
	Mon, 18 Jun 2018 07:42:11 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:eb:1883:34e0:8f40?
	([2601:202:4000:1184:eb:1883:34e0:8f40])
	by smtp.gmail.com with ESMTPSA id
	u47-v6sm26055075pgn.70.2018.06.18.07.42.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 07:42:10 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1527516680-22733-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Lb9tukB0NEpCG5SOU0g6coh06wLjorHVktJd3tCs99edg@mail.gmail.com>
	<74bb7fdc-8e9d-dd2d-c150-6d6b6ab79770@gmail.com>
	<313ce6af489a9ab4bb32f658aa17a251204ea53c.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3f49a1d5-b989-3bd4-14ec-1c9ea429db6c@gmail.com>
Date: Mon, 18 Jun 2018 07:42:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <313ce6af489a9ab4bb32f658aa17a251204ea53c.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v3][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Mon, 18 Jun 2018 14:42:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/17/2018 02:36 PM, Richard Purdie wrote:
> On Sun, 2018-06-17 at 14:28 -0700, akuster808 wrote:
>>>> Requires python-ply package in core
>>> Comment says use meta-python.  If the python code here is useful,
>>> we
>>> can add it to core.
>> its in master now... I think..
> Its in master-next, pending us figuring this other patch out.
>
>>> Conflicts with the commit message.  Pick one.
>>>
>>>> +PACKAGECONFIG[python3] = "--with-python=${PYTHON}, --without-
>>>> python, python3-native python3-ply-native, python3-core"
>>> Just python3-core sounds unlikely as that's a subset of the
>>> standard library.
>> I just noticed python3-ply does not exist in the patch I sent you so
>> I have done a v2 for that python-ply package.
> Can you check what is in -next please as that was my fixed up version
> of your patch which does what it says (and fixes maintainers too).

I saw that a later in the day and it looks fine.
>
> Do we need both the py2 and py3 versions?
py2 came over as-is from meta-python and py3 is new. bind only needs py3

- armin
>
> Cheers,
>
> Richard
>
>


