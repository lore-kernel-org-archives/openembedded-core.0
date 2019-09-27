Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 108A37ED52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 02:54:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x10so2634357pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 19:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lPT7PazSr4St2B0nZMJ+dAhNgDPWK8kkvdXqHMX+fkc=;
	b=mMirMMyZtEtYLIUv9pMntdvKdwbtOiSyjLfOmL/IdFxuypr3zUu90WFjoN/PbnGTqh
	AYPxPgpW7mg1/bafNvz8AXFelRKgn4ndnfC+uVa6SwXYZHMVfwH2/EiJsRyfwrkYt71P
	mHGj84Ki94qBPmyhRzJGxxhv+jn52+ZrzW9S3ce46J6YvSk1eIQpJEmWlmBa2jeWc4y6
	zz/0rO83Hk9YeVHukwx5n2ywnDdA/klLVqziOiSyZ88beh7uiNwH/ZJMAi+o7Er3ymf6
	gvgNgeqzOKq6UdNrR66A9fvhihkLDkZayZLH0W4jOXDi+C7uuo/zAcm88CQT/GbZ6EMk
	FsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=lPT7PazSr4St2B0nZMJ+dAhNgDPWK8kkvdXqHMX+fkc=;
	b=UPDOr5B9pMXe8Jak1ZGCjmdM8zYZ8FsulLDsabMuFDxNe0b8nbFezdM2DqUkTBHvuz
	GNvrZPSqe1vC4YiFd1+hlm1CVxT9y3Un00jH/dNqaDjhBq9ekFi4y6uVTc1K86yJgTAT
	yfwNLgDJJyKFdylcP7vCpy0NZB8mmYjxZTI2b4mlCnXlbxLJJnFfXvtQcWJ3bgfjzNXV
	8PgnB2bm3B0c1pLBvBRJIiIYYHUGl6vldMut82uV2YZI6uS+s2ePhpg4ZJoi+6Yn/SAt
	MkyMpuZ3aHSXFg5JGqgfr7dk3hLrn7HHzGSSXmCXMudfB87zRgqkppXu73pUI4MvfkzE
	1gBg==
X-Gm-Message-State: APjAAAXnL/J3EDVnkpUR/PFZnrV+RLzbr/s/aktuBmP+3FsizURWeYxU
	kxuGiPwHNpMebTx7Nd4NH7+qyfRfB8w=
X-Google-Smtp-Source: APXvYqwK3ro3vx4OQJjqjd3uaBQc56H8MXEWNE7p20Qa5Duoinap+f9KoiSn1D+G50B16+fCfIEBVw==
X-Received: by 2002:a63:741c:: with SMTP id p28mr6710004pgc.147.1569552852145; 
	Thu, 26 Sep 2019 19:54:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:40e0:1cd6:848:14bf?
	([2601:202:4180:a5c0:40e0:1cd6:848:14bf])
	by smtp.gmail.com with ESMTPSA id
	x20sm634449pfp.120.2019.09.26.19.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Sep 2019 19:54:11 -0700 (PDT)
To: "Bedel, Alban" <alban.bedel@aerq.com>,
	"laurent.bonnans@here.com" <laurent.bonnans@here.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
	<2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
	<6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
	<ee76450e-80e2-7527-7296-df2e6cc83576@gmail.com>
	<7fe69c8b-abc8-9b97-753e-da531152eadd@here.com>
	<1f780a6de67698530d7a338f0b17a81a05b5b334.camel@aerq.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a1aeeb02-290b-3139-6c49-0c517d7f9191@gmail.com>
Date: Thu, 26 Sep 2019 19:54:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1f780a6de67698530d7a338f0b17a81a05b5b334.camel@aerq.com>
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Fri, 27 Sep 2019 02:54:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/25/19 2:32 AM, Bedel, Alban wrote:
> On Wed, 2019-09-25 at 08:49 +0000, Bonnans, Laurent wrote:
>> On 9/25/19 2:23 AM, akuster808 wrote:
>>
>>> On 9/24/19 12:23 AM, Bedel, Alban wrote:
>>>> On Tue, 2019-09-03 at 09:41 +0000, Bedel, Alban wrote:
>>>>> On Wed, 2019-07-31 at 13:53 +0000, Bedel, Alban wrote:
>>>>>> AArch64 images are not self-decompressing, thus usually much
>>>>>> larger.
>>>>>> Boot times can be reduced by compressing them in FIT and
>>>>>> uImages.
>>>>>>
>>>>>> This commit is a backport of commit a725d188b5 (kernel-uboot:
>>>>>> compress
>>>>>> arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove
>>>>>> useless
>>>>>> special casing of arm64 Image) from master. Both commit were
>>>>>> melted
>>>>>> into one to avoid some useless churn.
>>>>> Was this patch overlooked, or is there a reason it is not
>>>>> considered
>>>>> in
>>>>> the next round of update for warrior? Without this patch kernel
>>>>> images
>>>>> are too large to fit in the flash of the system I'm using.
>>>>> Furthermore
>>>>> it is not trivial to fix this in my own layer.
>>>> Please, I really like to get an answer here. I'm fine if there is
>>>> a
>>>> reason why this patch is not considered for warrior, but just
>>>> getting
>>>> ignored is very frustrating.
>>> This appears to be a performance enhancement which does not fall
>>> into
>>> the criteria for back porting to a stable branch.
>>>
>>> - armin
>> Just to bring all the elements on the table:
>>
>> It's possible to argue that it is more of a fix for a performance 
>> regression, as the sub-optimal approach was introduced in
>> 1aa417df604d2627c56232a7a2c396c6b085d74b and  the patch
>> in question is equivalent to a revert.
> Also it is not a question of performance, but of storage space. This
> commit effectively broke every board which doesn't have enough storage
> for an uncompressed kernel.
>
>> For example, the pyro branch does not seem to have the issue.
>>
>> I don't know if it makes a difference in terms of criteria for a 
>> backport but I agree that the problem is indeed made worse because it
>> is quite hard to override in user layers.
> That's exactly my problem, I really don't see how that could be fixed
> in my own layer. Furthermore, unlike ARM or X86, ARM64 doesn't support
> self decompressing kernel, so that can't be workarounded from the
> kernel itself.

Thank you for the additional information.  This will help me in making
my decision in backporting this commit

- armin
> Alban


