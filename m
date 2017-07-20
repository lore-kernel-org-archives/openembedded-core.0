Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A0B6E606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:56:05 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w126so33044407wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ka+rRIvw37RpWiRebqhvfj6x8ZbhdHuTJ/TZIEnqqRE=;
	b=EtnCJTww48ucEMmFdw2PII1S7WFEgri5i78xS47im2vGzSOlNKlClmI2tOkZTF+oua
	mbIBxhv4AumyZLEPXsETOHw66YC6RMpaCnVwSau5Manw68JKxW41SqRfLppcDgzOQiiW
	FYgsTJLLyZexScN3F0vv6iD0MPtFR1flhIHdtecommMCR+2wjBCqGbGnr2miLAiueYCk
	W+LzZmypsypANiVSobRdvGBmZmv5e1XpPmavFrhnaeQRVSQhiGxnfjQ6Nc4ojYRo52uf
	5VQtE93n31KmcGSLvpRG9RlhPlN/9Xek71yBUXlxjbEnjFYl+lkyuDlPDx5sd5IrAh5d
	zHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ka+rRIvw37RpWiRebqhvfj6x8ZbhdHuTJ/TZIEnqqRE=;
	b=Yjwp5vEn9A9FE5bjdJzyDlcg4f5K2aA17wpqATd5zQQgMYgNEvi6N9kunov6Ts4Dm7
	D3w8hBYp3CbxieiR9eT/9RHX1im0PCYRt+HwpIPcCFTKIByp7I/PLe9ilxyxxqDGhMCU
	WA2T4LbToHTxvxH+gWanKRQjIGC9eSqMeKHQolY98s+qvEX/p1ONBzRa/zi50rAeifik
	iwls4uMeO7vr4BTY0zuKH/Xeu1peGfzw+qy/ouu9UiwgIRfG2CQBiCrDhzxCUXOsO9mM
	zdH4tLvKPhjLUcMBrJSECaqLaI03i2+pg6RX2auFzThP0KHIRua0EphE0qZlrbW+ffXp
	dvGQ==
X-Gm-Message-State: AIVw112V+hIXYfZAyNFEI5WyfhJ8WWqj1MtD70cH8bUFpF4YgH6S8jfK
	CRH21UeD6rX3X8Fe4LM=
X-Received: by 10.28.144.211 with SMTP id s202mr2535573wmd.111.1500580565872; 
	Thu, 20 Jul 2017 12:56:05 -0700 (PDT)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com.
	[209.85.128.182]) by smtp.gmail.com with ESMTPSA id
	p23sm7597059wrc.35.2017.07.20.12.56.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 12:56:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f182.google.com with SMTP id f21so18343464wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:56:04 -0700 (PDT)
X-Received: by 10.223.148.36 with SMTP id 33mr8316077wrq.24.1500580564782;
	Thu, 20 Jul 2017 12:56:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.141 with HTTP; Thu, 20 Jul 2017 12:56:03 -0700 (PDT)
In-Reply-To: <CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
	<CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
Date: Thu, 20 Jul 2017 16:56:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
Message-ID: <CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 19:56:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 4:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jul 20, 2017 at 3:22 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 20 July 2017 at 16:37, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> This fails to build on ppc:
>>>
>>> | checking for libdrm >= 2.4.75 libdrm_intel >= 2.4.75... no
>>
>>
>> Same on arm and mips now.  Basically everything that isn't x86, so I'm
>> wondering what the difference between your build environment and the
>> autobuilder
>
> may be pkgconfig is installed on working system.

I wonder why; I will try to reproduce it and also will inspect the
changes on configure.ac to find possible causes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

