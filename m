Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD6B071C39
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 23:55:22 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so9185669pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=wO4ijuDTtaA006LqSgPNEQKZXO/YcALHYGH9B6R+RYo=;
	b=cP/PBq68tXFCElJNorz93rGr8a2DyGbGLkrS49HAzUm4aby/nVP13oKiV+/HrjaSxD
	cPIh2IInWHT5DiMytxkzuTD28QnS8VyGzI7C+7IiNEiMGcENRVe5g8SD0zSEZUNei9WO
	2MLAd+RTEybTest84ZGOMAMJo59dTxAxMwi/o3sgaZa0YxJU2TtPCPZP5taqj/KTDGhn
	v44PO/jw4DV4WGY8RRy2P5gg6umVQ9UesiTMdjDGmJwDoi3je8h5GkUebIOfReC1UTFR
	XZ5L/VCdBxory+38PJvOu5N77MugHwHU8tgehrM1fNdfKoqzf3A+X7zb0BdcbX4zGvva
	PGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=wO4ijuDTtaA006LqSgPNEQKZXO/YcALHYGH9B6R+RYo=;
	b=YIlMNZsHd06fm4bOiE2vG/25cZTwOjGO41l+OnSJ+xIAAicU/TMxo7/jFcS+DKCZ8v
	IUyJWv3kPm5Oxa6nCPoUyeILLhg/jAIoeqrtVKRF6zKmU/sJ4v05+HoxuljM2dPXC4dZ
	sdCFWc41Vm+INxZTlqKUKg3ukvkI0NNzMeygVhzGTyoT6vNZ9IIiDQKTy4L51wObM3bN
	1gZmry4nj9w6ca9ODbAXneDnCzdgkfkm8lh8T7is9glYEJWv08KdqDKePWgaidk9HGoF
	Q1/tTWWKtgBJkfIrdHSfhQTxhw/UVpNKb+BbPLZgnGhi55ZNMHJenmWcWNh6yJvyJxVc
	AzAA==
X-Gm-Message-State: ABUngvfXTCrl3Sgi3LEIKZUk1zE7Gq5VYXfDbyE3k13a40RgN+dEtXoD4h6fmvv7MOkl5A==
X-Received: by 10.98.223.25 with SMTP id u25mr30753391pfg.96.1478303724001;
	Fri, 04 Nov 2016 16:55:24 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:e83e:7662:2fe9:93ef])
	by smtp.gmail.com with ESMTPSA id
	z9sm22837311pfd.29.2016.11.04.16.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 16:55:23 -0700 (PDT)
To: Phil Blundell <pb@pbcl.net>, Li Zhou <li.zhou@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20161104090719.30795-1-li.zhou@windriver.com>
	<b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
	<1478301288.3662.21.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <3ceaa47d-7f30-4b0a-f554-eb193a10f82a@gmail.com>
Date: Fri, 4 Nov 2016 16:55:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478301288.3662.21.camel@pbcl.net>
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 23:55:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Phil

On 11/4/16 4:14 PM, Phil Blundell wrote:
> On Fri, 2016-11-04 at 11:22 -0700, Khem Raj wrote:
>>
>>
>> On 11/4/16 2:07 AM, Li Zhou wrote:
>>>
>>> The swpb in macro MUTEX_SET will cause "undefined instruction"
>>> error
>>> on the new arm arches which don't support this assembly instruction
>>> any more. If use ldrex/strex to replace swpb, the old arm arches
>>> don't
>>> support them. So to avoid this issue, just disable the ARM
>>> assembler
>>> mutex code, and use the default pthreads mutex.
>>>
> 
>> it would be good to keep this for older < armv5 arches
> 
> I guess you meant "<= ARMv5".  STREX etc were introduced in ARMv6, so
> ARMv5 (and ARMv5TE) don't have it.  But in any case, won't the default
> libpthread mutex work just fine on those older architectures?  There is
> no SMP on anything before ARMv6 anyway so lock contention will be
> relatively low, and it seems fairly unlikely that anybody has a real-
> world application which uses db so heavily that the mutex
> implementation will have any noticeable performance impact.

yes I meant <= v5, it should work usually, I am just thinking its a untested
option, it may not be as bad as I think but some testing might be useful

> 
> And, given that it's now something like 15 years since support for
> STREX was introduced in ARMv6, and more than 10 years since support for
> SWP was deleted in ARMv7, it doesn't seem entirely unreasonable for oe-
> core to pick the newer paradigm as the case to optimise for.  Distros
> that want to target ARMv5 or older are obviously free to do so and they
> can carry the SWP patch locally if they want to.  But as far as oe-core 
> itself is concerned, at this point it seems like it's just scar tissue.

yeah agree here.

> 
> p.
> 

