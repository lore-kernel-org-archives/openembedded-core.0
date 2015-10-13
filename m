Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6440273232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 11:45:29 +0000 (UTC)
Received: by iodv82 with SMTP id v82so17590909iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 04:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=O1d7TXihgViu/Q3+qJMDB2TTO/btXVbDn0sGZxhbAyA=;
	b=PVQSsIXzzQvvLwbq/dGXTRVlp7UQCHGier/1Y5bbxwCiWFOk+eAusviDVT15sEjb9Y
	sQTLiYzxEDWbb+pUEnpBvBcWIBVH3a4nZDJmPl/eh/ulp24kFeQL6SYMhG+18f4wApu4
	a1t+gEiX1YwiRKdqaqOczFPgvtzuk6RSUh9eRPYQAN7TDMWdgGhpFYUgPgs0DtYTCtIH
	eezsXxvem0x2zoaDyIE2yXIthbki461mitpPuin7YUmhc2NIQV1/FpSltRZUBQ2k15H6
	pW46p0SL1GPmCVEYCsuzKkSKiSSiXlsq8kU4GyImVPa/LaNEpLo7yHfMG+Nuk7FvcjWE
	mL0g==
X-Gm-Message-State: ALoCoQkqZvRCTyP9cw1zD98Mwhc671LdiJatL3hPP89pylqFvU6GZBFN/4x9uEebvT2c80pI/eNX
X-Received: by 10.107.159.3 with SMTP id i3mr11880559ioe.42.1444736729703;
	Tue, 13 Oct 2015 04:45:29 -0700 (PDT)
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com.
	[209.85.213.172]) by smtp.gmail.com with ESMTPSA id
	e19sm1332495igo.14.2015.10.13.04.45.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 04:45:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbni9 with SMTP id ni9so55474737igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 04:45:27 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr19398639igt.5.1444736727573; Tue,
	13 Oct 2015 04:45:27 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 04:45:27 -0700 (PDT)
In-Reply-To: <B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
	<CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
	<B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
Date: Tue, 13 Oct 2015 08:45:27 -0300
Message-ID: <CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Tue, 13 Oct 2015 11:45:30 -0000
Content-Type: text/plain; charset=UTF-8

Hello Jens and Khem,

On Mon, Oct 12, 2015 at 2:54 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>> Am 12.10.2015 um 18:32 schrieb Khem Raj <raj.khem@gmail.com>:
>> On Mon, Oct 12, 2015 at 9:01 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>> Am 08.10.2015 um 18:40 schrieb Khem Raj <raj.khem@gmail.com>:
>>> [...]
>>> During hacking on the fix in meta/conf/machine/ I recognized that the expected thump suffix in meta/conf/machine/include/tune-arm926ejs.inc
>>> isn't there and modified the line as
>>>
>>> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
>>> index 335e4e0..a310c9d 100644
>>> --- a/meta/conf/machine/include/tune-arm926ejs.inc
>>> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
>>> @@ -8,4 +8,4 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", " -mtune=arm9
>>> AVAILTUNES += "arm926ejs"
>>> ARMPKGARCH_tune-arm926ejs = "arm926ejs"
>>> TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
>>> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
>>> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
>>>
>>
>> this is ok ?
>
> From
>
> TUNE_FEATURES="${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>
> is ok probably the wrong question ;)
>
> Setting DEFAULTTUNE to arm926ejs results in expanding PACKAGE_ARCH from TUNE_PKGARCH which is combined via
> "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}" in
> meta/conf/machine/include/arm/arch-arm.inc:12
>
> Since ARMPKGSFX_THUMB is set to "t" (or "t2" on ARMv6+) only when thumb code should be generated and
> ARMPKGSFX_DSP is set to "e" when DSP is featured, both have to be recognized.
>
> The entire construct doesn't feel "ok'ish" - but it works and is more or less reliable ...

I understand Khem is excitant to include more non-upstreamed patches
into GCC but I would prefer to have it included and Java working fine
than a local patch applied forever. :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

