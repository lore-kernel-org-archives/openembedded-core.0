Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B07D78997
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:15:46 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id t133-v6so17630388oif.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vliAglqSNaK47BEO7fweO2IMiIBXAzGOOdoJ96jIHFI=;
	b=Lh8PfGbeA6PJZa53qXK3+JKMe11NUWHrFAf9H7LW4vYtAx0t1QHUUXeUUQe2pk67Tg
	V6DEVA+GFq3LvFB0aFhDaiCNBPb3OQHsMsSrYILUUtoZzFpAJusoFLGpCHB9GIJownU7
	+A9Oub4q0Ng0vgw1VZzTEiITgrtmtN8ZerlV7uo0B62gpC/POWkoMDmOF6Ozhm/nISzb
	oULtEty5KMWqsGlveGIao/bRt8xHvNPwLKw5cZjl8kBpTCJ1NRDN02NkXUbnDNXkGoEJ
	IHIlSd9fANr6HRNxdgF+fdAI3btMWKam1S1A2jKh52LgZV2VLJC5MyQXWzboOduWMdLN
	LMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vliAglqSNaK47BEO7fweO2IMiIBXAzGOOdoJ96jIHFI=;
	b=kn3gjt/hz63guaLDjEOJz3XlOpHN5Atp0ILiu2GyvLcUkO2OdQnpgjmLFE1PMrEA8z
	PNJY+DcWp6dOOfslDFf92BML/8e7PcvfNpKukfckKZmblecP+rxZPSsNguH0PdjGdg02
	t2kCmQ2zO8jc1TXRat6CEcHrJb+Xi8Uv0XESrZy9jKVkbTveCnEf3ksYpYAh0LrLc9Tz
	Dc5IDiQ2bjID1durEFr7CnB/zPDhGic/Yu4UNj6SP5oclFLBz/SEMxEH8UlUKIXEGTp5
	N1ZJEcNrsqTKVO8xkcsO78YqCHkC2HWPsAw2dig5Cjn23B88kKklCL1+87sy8y63/+bM
	VTNQ==
X-Gm-Message-State: APt69E10IKC3CJ1Cb2sDDAw0XfQG+dItTI10QKJa0KzFA1V7jKWAdRoL
	phAQSqzBXTf+if2KyKrzf/xrakz/mvq+bXXo0JmVQQ==
X-Google-Smtp-Source: ADUXVKLhIKrP3MTqx+wAhQCZLbGUMGQS5uYIsLmiD2cbLWNgb7TvPdYbMqPV0XBZ28cNdlVfpNva/R+p4IYdujYX2Y0=
X-Received: by 2002:aca:590a:: with SMTP id
	n10-v6mr8439963oib.18.1528719347255; 
	Mon, 11 Jun 2018 05:15:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 05:15:26
	-0700 (PDT)
In-Reply-To: <ea8c1a44-c10a-d693-578f-04ac8f4a4d51@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
	<1528574447-21755-2-git-send-email-akuster808@gmail.com>
	<CANNYZj8UfLsDXQ=3tOAo+ih2B7T5orT_C9hE02pH_O1rHXtx+w@mail.gmail.com>
	<ea8c1a44-c10a-d693-578f-04ac8f4a4d51@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 13:15:26 +0100
Message-ID: <CAJTo0LarSUWvzyweD1MMbzMCOOBH-95NSpQC67Mz9D5kAcJdLA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] selftest: add cmake test
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
X-List-Received-Date: Mon, 11 Jun 2018 12:15:46 -0000
Content-Type: text/plain; charset="UTF-8"

Well the problem in 12762 is that cmake *hardcodes a list of valid
boost versions*, and I'm struggling to understand why this would seem
like a good idea.

Some thoughts:
1) We definitely need a selftest for cmake.  We have a few build-stuff
test cases already (lzip, cpio, galculator in sdk and runtime, some
other in devtool's selftest).  I believe they need consolidation
(repeated for runtime and SDK tests) and review (they're all
autotools-based).  We should definitely be exercising that the build
systems work on target.
2) 12762 is a very specific problem with cmake.  Do we want to add a
whole selftest just for this?  Would it be easier to just patch cmake
to handle all versions?

Ross

On 10 June 2018 at 17:04, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 06/10/2018 12:25 AM, Alexander Kanavin wrote:
>> 2018-06-09 23:00 GMT+03:00 Armin Kuster <akuster808@gmail.com>:
>>> +DEPENDS = "boost"
>>
>>
>>> +find_package(Boost 1.60 REQUIRED
>>> +    COMPONENTS
>>> +        unit_test_framework
>>> +)
>>
>> Is it possible to use something else than boost here, if we want to
>> test cmake's ability to find compoments?
> I am not a cmake expert by any means. I just took a testcase given that
> found a problem that I fixed earlier this week. I have not other idea
> one would ensure folks don't break cmake when the update packages.
>
>> So that the build time is as
>> quick as possible - boost isn't particularly fast.
>
> - armin
>>
>> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

