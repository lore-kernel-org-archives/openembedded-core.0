Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 23188731E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:10:37 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p63so2027309wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 16:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YGmNxRIy16Ai9gzO5xGPCX2WGJ+/0qxsZED/NAnMRUo=;
	b=K6pUp7M9sy57rQ+gL5zfoLF/7214Nc/ibpAQGCDGdo3gCdabKKUyiwqq307Ev9WroB
	ngK5aBb68mgwPE0mMWvlhrSyj+NpFT9HIDg0I4nMudxk4VdxcAWHYrzM5WFmNRlfJ1+M
	vJaW5Xi0Cd6/bPvRJCkn6TDP8b7UC8U8w76BX7ZL5eJV+dzWy9EuwNF2SB1tZbV4guQ3
	lgnROyv1DrSuJ5VCJ7ZQKkknGSuIYhg1Z4dpjeyeTCxb1T5Qd4ovruSHQVemXuebyc62
	s4xjN72nLJf5W2UI+b1+XHX2L+ZsDF+2vgdUmd+tplpkkWTHpDvyW6GX8eC/TL1cNPyX
	beTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=YGmNxRIy16Ai9gzO5xGPCX2WGJ+/0qxsZED/NAnMRUo=;
	b=I3/VXcI7fJSmD+5imjCzf4o2XcpIkNz+ReZzPISA3baCN24JB6SazegFWarqWCWcGe
	1BCsDb19i4cRhVxJLlc8hEel2lKy3XABHPci5X+65D3wekz4eXYrGmaD0xuysLVPZSsW
	RZKv7xeL85EnVljT9ObEl6hSzBL/8z+A1wvA29C4n2CRF9nQuGu5wOdZCHpRC1QWYuus
	F2b1FqccRk8QySFTz/LhwA2XU7KtZmSQByH9Q9b8JOUnQZGc9FhOAPQmb3p/VJ6p0whN
	0G+c/Wa1naQxRyLJ/jGL7/cFWKCLuvqOfxosey1M8sgAgWnM8AH2dCsz3/ZMRBLp1Gmy
	aBpg==
X-Gm-Message-State: AG10YOQjbBHAZ/enzTcHqEv3ErzkPn/aBUZKwW9r/URVJh1Gzn35TB9lZRPzmqG1lKNBght5m3xFl7QFGUoS9Q==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr30643636wjc.3.1454976638354;
	Mon, 08 Feb 2016 16:10:38 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 16:10:38 -0800 (PST)
In-Reply-To: <56B92C4D.2070507@windriver.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
	<CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
	<CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
	<56B92C4D.2070507@windriver.com>
Date: Mon, 8 Feb 2016 16:10:38 -0800
Message-ID: <CAJ86T=WSV2Rpm2zjNmaJEd67=BogP4KHNTuHipOJnqPi9_csdA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Tue, 09 Feb 2016 00:10:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 4:01 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 2/8/16 5:43 PM, Andre McCurdy wrote:
>> On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>
>>>> Can you give an example? Looking at native.bbclass it seems to replace
>>>> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
>>>
>>> Sure, so in doing a native build TARGET_CFLAGS is used.  But as
>>> security_flags.inc was using TARGET_CFLAGS_append, the end result was
>>> BUILD_CFLAGS appended with the security flags.
>>
>> Yes, for native, TARGET_CFLAGS will end up being "${BUILD_CFLAGS}
>> ${SECURITY_CFLAGS}".
>>
>> However it shouldn't matter - native.bbclass sets CFLAGS to
>> BUILD_CFLAGS, not TARGET_CFLAGS.
>>
>> Do you have an example where host gcc can legitimately be invoked with
>> TARGET_CFLAGS?
>
> You have to remember the order of the operators.  _append says to make the
> append, AFTER everything else has been evaluated (and before _remove).  This
> includes override behaviors.
>
> So if you do:
>
> TARGET_CFLAGS = "-deadbeef"
> BUILD_CFLAGS = "-badc0ffee"
> TARGET_CFLAGS_append = " -foobar"
> TARGET_CFLAGS = "${BUILD_CFLAGS}"
>
> The final value of TARGET_CFLAGS is "-badc0ffee -foobar"
>
> Thus by changing the append to:
>
> TARGET_CFLAGS_append_class-target = " -foobar"
> TARGET_CFLAGS_class-native = "${BUILD_CFLAGS}"
>
> In the case where the 'class-target' is the override you will get:
>
> TARGET_CFLAGS = "-deadbeef -foobar"
>
> In the case where the 'class-native' is the override you will get:
>
> TARGET_CFLAGS = "-badc0ffee"

I'm not disputing that TARGET_CFLAGS can contain something bogus for a
class-native build.

I'm asking why does it matter?

Setting TARGET_CFLAGS at all in native.bbclass is fairly recent and
seems to be a workaround to avoid churning sstate:

  http://git.openembedded.org/openembedded-core/commit/?id=05a70ac30b37cab0952f1b9df501993a9dec70da

Is that perhaps still the real reason to avoid modifying TARGET_CFLAGS
for a native build?


> --Mark

