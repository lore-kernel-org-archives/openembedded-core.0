Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id F02CE6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 19:13:47 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fe3so97701996pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s/6vfugTax3kCM8xnKxRyn6MKDyz+SGNqFusU2CMl4Q=;
	b=qv1dShf5MFsanmNfjC9q+fNRnfXChS2vzrKSyjUNBQ87xBb2iH9tsLmOucYBMmUvtR
	pdhZn1uOQey8Cp9/lKS1MQ36K8YP6CyzB4DhMi1tWhf2YpfgFGOtbrRG77uiarivR/Ci
	03lv6pdFiJXecJhxkPJ9ufMGclNImTK5cRcb2hB1V97RJ2n+sjmSqkNdNVG05OvcCTE+
	cM+agh2LkhgFfY7bjur+VYWI8kRR2vjD+slHaEo2QQfc62FUSSU4vSgDw63MoGlYHLF5
	WyuZla9z3wWy0pWJCH1ZWk4IWkfSdyhxbQhsvyLMnHBzRdnKBgVg+nQkIsfut+CaROGr
	3cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s/6vfugTax3kCM8xnKxRyn6MKDyz+SGNqFusU2CMl4Q=;
	b=lBMQXX7Y47vsHyFhtcscXe4bFmrTCrx9mEUTPgqQVxEGCFjGDEnAxaeYhuxRTpRK9w
	Skq3Q96d6QkmYZGjSqEfmO+mefBw9GdlqcOfvwnweMXu+s9/PXhRf/2go4zep4aeMFva
	VLQsVbTXJik8fCcMuWh28l8rJKQc7CFqTdZ5PGydVVqQuOpWq26NtjTkCGe1stMEEE8z
	bV221l6hVx/HhyrMNUaiq7GZYme19PSyh3vVwTFL+i1aiP2XH8RLOZaVy+nB552NqDoq
	OTjh48bk6fre24zZ5Qz8baxrdEuhETZ/xlT2XoMeRnQSNkJN6PrEkZb3pq9Ixv5aNjVb
	v67Q==
X-Gm-Message-State: AD7BkJJ668pgCc+OABI2dlpB4PGySxADLMYoyhrS7bwQ0ZlFqZMabJiaaR4hEo4UDWFReA==
X-Received: by 10.66.136.78 with SMTP id py14mr26721177pab.113.1459538028198; 
	Fri, 01 Apr 2016 12:13:48 -0700 (PDT)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	tp9sm23807910pab.14.2016.04.01.12.13.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 12:13:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id 4so97381576pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 12:13:46 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr873877pfb.141.1459538026093; Fri,
	01 Apr 2016 12:13:46 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Fri, 1 Apr 2016 12:13:45 -0700 (PDT)
In-Reply-To: <CAJ86T=XShqiCRiZan9s4kimpBdejqjRYCHei7aXfv5xfbcpUmA@mail.gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
	<1459377982.2322.57.camel@pbcl.net>
	<CAJ86T=XShqiCRiZan9s4kimpBdejqjRYCHei7aXfv5xfbcpUmA@mail.gmail.com>
Date: Fri, 1 Apr 2016 16:13:45 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpWv6eEGqnnAoqog822avKJLWLErh0aaJfZ1uhBy4d8SA@mail.gmail.com>
Message-ID: <CAP9ODKpWv6eEGqnnAoqog822avKJLWLErh0aaJfZ1uhBy4d8SA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Fri, 01 Apr 2016 19:13:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello folks,

On Wed, Mar 30, 2016 at 8:59 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Mar 30, 2016 at 3:46 PM, Phil Blundell <pb@pbcl.net> wrote:
>> On Wed, 2016-03-30 at 11:53 -0700, Andre McCurdy wrote:
>>> Either way it shouldn't be a concern for the CPU tuning files.
>>> Building Thumb2 for an armv8a CPU is really just an extension of
>>> "optimise for size" and we don't include -Os, -O2, etc options in the
>>> CPU tuning files.
>>
>> Yes, agreed.  In principle there's no reason that the compiler couldn't
>> choose between A32 and T32 instruction sets dynamically for each
>> compilation unit (or each function) according to which it thinks would
>> give the better result.  And from the user's point of view, the outcome
>> should be equivalent apart from minor performance differences.
>>
>>> >> For most cores from Cortex A9 onwards NEON and VFP are optional, so
>>> >> hardcoded assumptions won't work.
>>
>>> Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s Gui=
de for
>>> ARMv8-A mentions:
>>>
>>> "Both floating-point and NEON are required in all standard ARMv8
>>> implementations. However, implementations targeting specialized
>>> markets may support the following combinations:
>>>
>>>  - No NEON or floating-point.
>>>  - Full floating-point and SIMD support with exception trapping.
>>>  - Full floating-point and SIMD support without exception trapping.
>>
>> Is there any evidence that anyone is actually building ARMv8-A (as
>> opposed to -R or -M) cores that lack VFP and/or NEON?  Unless there is a
>> fairly clear indication that such cores do exist and are likely to be
>> used with OE, I think we should not complicate the tuning files with
>> support for such things.  Anybody who wants them can always add
>> appropriate tunes later, either in oe-core or in their own layer.
>
> I can't find any evidence of real ARMv8-A cores without NEON or VFP,
> so if any "new approach" to ARM CPU tuning files is limited to armv8a
> then hardcoding support for NEON and VFP is probably going to work out
> OK (at least until someone wants support for the half-precision
> floating point extensions added in ARMv8.2-A).
>
> Personally though, I'd like to see a comprehensive cleanup and
> restructuring which could be applied to all ARM tuning files,
> including armv7a where NEON certainly is optional in the real world.

Could you, Phil and Khem summarize the remarks in a succinct way? To
be honest I am a little lost on what changes you all are expecting on
top of the last patch version.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

