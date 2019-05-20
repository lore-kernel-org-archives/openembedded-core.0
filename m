Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D68547E0D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:52:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id i21so7330375pgi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AC1XWG1mATGZdhkH77G9P4lT09vSmMyOydxQEKnf03M=;
	b=Yqe6uaXnT/6Nves4SegUj08AjChuGIci4LV/EFAQrd/pczvQmzVsDyAKoZAbghkVgn
	FNCxffyjEgF3HPl2p5DB3ZSgUX2BvssFmXVELe27nwErKqx9zVjsF4aH4KmlSMgkGwMB
	VRWYgSviWX5mdGH88SQb6t5xPdthAwXGozubMcvuVo1hG1lQMo4SYLQ1Eh/N7lxIIuRj
	/TsgzOcD1ieFJfQwUmR6c0rEYkrobnY9Nn0y/gTT6F0rZQc0ZVVkHxRCltsy+bYnPXGY
	zB6OWS14aK49TGAfkVfC6PSdg10lUykuNlbKyZPHObG3zNDvQGgwnXWd1KPI3DHsXTpC
	SDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=AC1XWG1mATGZdhkH77G9P4lT09vSmMyOydxQEKnf03M=;
	b=smrfvXoN00ABgNmVHw06gw3KlPv54kiNy1SvyWV11GE864+0bxHCr4w9Yc00w7thh9
	NMwwULLDfDdZUd7SK94rMinRaNg7lLFCPw4VTSlV47HOqBlS2mUx02Ka5LiXtHM1OJ0F
	grB1PO5bNLLoyPyQRtcDZeMdkammoZMAQe/1uxAjp86e1P5FLnRmw2OqMqLvPZoopV9/
	xDZMtTWZnnD8gZvqajsVn8x3oP4ATP7Jvp6RlkqLdyPE/b8Wvv2lC/TwVm4AdpgYf93s
	3J5/qF2230lubgMPfdDAgE7q4PGmXtu+TC3xLbW2WAPsIepEiAq/PiWSgHWrbP/CpEKo
	7tNQ==
X-Gm-Message-State: APjAAAXWUhvO0VGaUNYIov5epsHPbk51wReaqzWYHkf7esjiVYuRaSKs
	KH3k3Dkmc/r6PXjI/c1zd3NLEiOP9+E=
X-Google-Smtp-Source: APXvYqznM3K3h9GAbfbHKP/E6JEgn+gR8bw9iYZspnoWRXlQF4g7GkgqJcd8cvRSuDP5X6rN3y+OoQ==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr18445187pfd.178.1558385576447;
	Mon, 20 May 2019 13:52:56 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	n12sm18806990pgq.54.2019.05.20.13.52.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:52:55 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Randy MacLeod <Randy.MacLeod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5a976b52-c2b5-2458-8c94-121122a0d781@gmail.com>
Date: Mon, 20 May 2019 13:52:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Mon, 20 May 2019 20:52:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/14/19 7:08 AM, Richard Purdie wrote:
> On Mon, 2019-05-13 at 23:57 -0400, Randy MacLeod wrote:
>> About half the ptests will fail if the executables deployed
>> as part of the ptest package are stripped. Currently
>> there is no easy way to only strip the main valgrind
>> package so leave it and the ptests *all* unstripped.
>>
>> There is an enhancement filed to enable wildcard stripping:
>>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13343
>> so this recipe can be fixed once that is implemented.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> I did test whether we could get away with a dependency on valgrind-dbg
> as in theory that should behave the same way. It doesn't which means
> the debug symbol linkage isn't being honoured by valgrind and that is
> something we need to look into too :/.
> 
> I'm torn on whether to accept this patch or try and fix partial
> stripping...

we need PN-syms and PN-dbg and then we can add rdep on PN-syms alone
but sadly thats another hump to climb.

> 
> Cheers,
> 
> Richard
> 

