Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79EE865CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 02:32:06 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id y89so58153897qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 18:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KI2OtfVrk+/vtlIL+d5AGCjlxdTUIL8wgoYuAHSbSEA=;
	b=OQTY08GFzTbletwtRmbL8Fh42RTFoXHqGsLBBAG59Dm6N3fP+MIGSlM1q63rMtAU1F
	oH81TsG9SqlG3wty8zzrp/zF6hoKOOxCX1NWRHyygxLcCaQqVTUCdHaGZH17KhqWVk3U
	MJb4NZEwGsyIM8LM2Auy4j6KN4hxMKqd9PUK2oH96F2bGlr22XwRo+RKxF7yMJu1OTHd
	kFt4wCDGzopGbYcjYUqOMWHDUynrZboX00HxJiMBHaznJ36uIYufQzBdCxrsOY4/xpJ8
	P3inZVobX/E74aguTbG1KiUe8LnLTqcNziO7lCn7xEu/E+jOC10hwbAk/YZS/4/Qgl8L
	1lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KI2OtfVrk+/vtlIL+d5AGCjlxdTUIL8wgoYuAHSbSEA=;
	b=X3pwJSbIBwlBAd/drUef11IT+l3xeAEhGojV2lU5MjZLbBUd+BMsZQjhcXiEClZ2q2
	j5fX3VQRHXHCiPtwwc9yYEcLkqmmxIZ76m0mX55HtMB4oQqrUfInCR37AIl5XV1g3HLb
	cLEtBzJbPCHXAlyIhDGRXNnsAaBB2ZUqEHv+QZ9t6SvU9S3RFRkpnrL9F10HKo8/ZtVx
	cxyDcOIrUWulQUhdbVjX2i8oKQpnXBB7DZ9znmXV+FD/JlkUK8XXRK61gEJ9Rb5r3OY/
	xevLw09Z1idkhTxhmyHxFi+k8mRrVHhr6tzHwTP+yQv5QGc6syPIoAUchGF1X00aD/oh
	zxdw==
X-Gm-Message-State: AG10YOQ3pA+ZcypG1sXkhEdodWPTM+A+t8637PsbuYXlKZ/B5L/jz/t9BJjX4n7c4aRJrk9qZ5XSUq27qzzTlA==
X-Received: by 10.140.238.8 with SMTP id j8mr37198741qhc.76.1454985127626;
	Mon, 08 Feb 2016 18:32:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 18:31:38 -0800 (PST)
In-Reply-To: <CAJ86T=WSV2Rpm2zjNmaJEd67=BogP4KHNTuHipOJnqPi9_csdA@mail.gmail.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
	<CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
	<CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
	<56B92C4D.2070507@windriver.com>
	<CAJ86T=WSV2Rpm2zjNmaJEd67=BogP4KHNTuHipOJnqPi9_csdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 18:31:38 -0800
Message-ID: <CAMKF1spNB3G3uZG9mAMZJBKdbU1gWDh-cdDcjBmACCoYgNWQ1Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Tue, 09 Feb 2016 02:32:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 4:10 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Feb 8, 2016 at 4:01 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 2/8/16 5:43 PM, Andre McCurdy wrote:
>>> On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>>
>>>> On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>>
>>>>> Can you give an example? Looking at native.bbclass it seems to replace
>>>>> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
>>>>
>>>> Sure, so in doing a native build TARGET_CFLAGS is used.  But as
>>>> security_flags.inc was using TARGET_CFLAGS_append, the end result was
>>>> BUILD_CFLAGS appended with the security flags.
>>>
>>> Yes, for native, TARGET_CFLAGS will end up being "${BUILD_CFLAGS}
>>> ${SECURITY_CFLAGS}".
>>>
>>> However it shouldn't matter - native.bbclass sets CFLAGS to
>>> BUILD_CFLAGS, not TARGET_CFLAGS.
>>>
>>> Do you have an example where host gcc can legitimately be invoked with
>>> TARGET_CFLAGS?
>>
>> You have to remember the order of the operators.  _append says to make the
>> append, AFTER everything else has been evaluated (and before _remove).  This
>> includes override behaviors.
>>
>> So if you do:
>>
>> TARGET_CFLAGS = "-deadbeef"
>> BUILD_CFLAGS = "-badc0ffee"
>> TARGET_CFLAGS_append = " -foobar"
>> TARGET_CFLAGS = "${BUILD_CFLAGS}"
>>
>> The final value of TARGET_CFLAGS is "-badc0ffee -foobar"
>>
>> Thus by changing the append to:
>>
>> TARGET_CFLAGS_append_class-target = " -foobar"
>> TARGET_CFLAGS_class-native = "${BUILD_CFLAGS}"
>>
>> In the case where the 'class-target' is the override you will get:
>>
>> TARGET_CFLAGS = "-deadbeef -foobar"
>>
>> In the case where the 'class-native' is the override you will get:
>>
>> TARGET_CFLAGS = "-badc0ffee"
>
> I'm not disputing that TARGET_CFLAGS can contain something bogus for a
> class-native build.
>
> I'm asking why does it matter?

there were recipes like efi-native and grub-native among others which
showed up failures with sec flags enabled
on older hosts where gcc did not support -fstack-protector-strong, so
it was silently accepting sec flags for native
builds since fstack-protector-all is an old enough gcc option that you
really did not see it in build hosts gcc complaining.

in anycase this is an improvement over what we were doing thus far and
clarifies the intent of recipe classes w.r.t sec flags

>
> Setting TARGET_CFLAGS at all in native.bbclass is fairly recent and
> seems to be a workaround to avoid churning sstate:
>
>   http://git.openembedded.org/openembedded-core/commit/?id=05a70ac30b37cab0952f1b9df501993a9dec70da
>
> Is that perhaps still the real reason to avoid modifying TARGET_CFLAGS
> for a native build?

well

>
>
>> --Mark
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

