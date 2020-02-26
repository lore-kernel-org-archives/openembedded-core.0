Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 003F361615
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:14:26 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6yOJ-00053c-Fk; Wed, 26 Feb 2020 16:14:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2fkYmQfsvbpWnlBTbzgzeOoY32E8+XiqplvZPVYHiCI=;
	b=MBE4kB34ZDrIP9s3A5HqHjvv3i
	DarOkxxIVQH20OiUf0cV7N0tzvKYg5EoQH+ckmLZ1o8B7dQltKYJ+EGJZ4VgPKdrV87o+gzw6XeGt
	dm5ur9Dw02n9Kr3rct+Bj9BEK6Do0+1x7s+rKS6VfyZPqQHjogcXl1gh2EjbKPiyx0I6SzN8wOohE
	BRmwxtlI0LKmWrJLN7NsB/hdGzYsNHlOw2sC1bbczzm0IINI1qaHCrcERagGr4EHut02F/K2t9EZq
	cLYyG2jMwJnzoM9mKpI8BN6Z/NrRb/uehImVNWsHOVqspkREo6DF2YiAbYiELfB/qblysx4a6qxAV
	wSx6MykA==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j6yOF-0007uU-8u; Wed, 26 Feb 2020 16:14:25 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-5-zboszor@pr.hu>
	<CAMKF1soh5mSvuVC8zhven1QwAPPU7DqiOr2Gw8TB4wmW8K3cYw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <62608f92-9730-bbec-20cf-e0219a8d9ffb@pr.hu>
Date: Wed, 26 Feb 2020 16:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soh5mSvuVC8zhven1QwAPPU7DqiOr2Gw8TB4wmW8K3cYw@mail.gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 9aa6e473b57a71193a43f99e3f89aa6d
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226151425Z
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 5/5] mesa: Enforce TOOLCHAIN="gcc"
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
X-List-Received-Date: Wed, 26 Feb 2020 15:14:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 16:00 keltezéssel, Khem Raj írta:
> On Wed, Feb 26, 2020 at 6:08 AM Böszörményi Zoltán via
> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>
>> When meta-clang is used, for example to build chromium-x11 from
>> meta-browser, a linker error occurs in Zeus.
>>
>> See: https://gitlab.freedesktop.org/mesa/mesa/issues/2533
>>
>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index 800e8813c7..b8f09a2ed3 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -24,6 +24,8 @@ PROVIDES = " \
>>       virtual/mesa \
>>       "
>>
>> +TOOLCHAIN = "gcc"
> 
> lets fix the linker error instead.

The linker errors were similar to reports I found on some forums
from a couple of years ago and they all pointed to RTTI needed
to be enabled in LLVM/CLANG. But it didn't help.

This is a good workaround until meta-clang is fixed to build Mesa.

> 
>> +
>>   inherit meson pkgconfig python3native gettext features_check
>>
>>   # Unset these to stop python trying to report the target Python setup
>> --
>> 2.24.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


