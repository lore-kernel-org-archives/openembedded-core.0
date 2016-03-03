Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 07E32738AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 19:11:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so472339wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gQB/pQCYdYwEs64O4ofPENJpWenc29uUMUztbqBPFzU=;
	b=00+m5cdr1mXC8tq4gCnh2sqUAF/nKS27a+wo6Aj2Zsd5jYvK+vKHntOuhut8iML3Y7
	T/qq93jzyAGmDe6ERefTJ7fxPC9IYqZFRdeL8YJChiKNYDcrkj5JUDyZRT5yoJtUBkkk
	SknfMZ2/GaaxRNSZ+rLx/XY2N922XK024yEP/lxb2hZzliwD0hjumJjbfvuDwj+B1mOx
	mONjD8JJZLaVfkVrV2u5RKaeH559DvokcYI3/NExtWV9cWeYv6RwoMbjtPM619IZmfr4
	Es6pIPs08NR2a9oMJLX7X9XqgRgZAK1B1sxoPV15OI+4XLihaUzKJ2meWy6xnMPBi6W0
	ZJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gQB/pQCYdYwEs64O4ofPENJpWenc29uUMUztbqBPFzU=;
	b=FnswrWgtiWNnzqBY0794mRvUnEs1t5WIzT5EMTuNnSrei4UKaw5AREW6JD+4eQ1weV
	5XledfE5v+lWB/sgyss3HNhTKXxIIXWWxh2rf/B/pFME4AwVYwd0dRJQWLWkVJPOaBo1
	itQaFjsNB4xIZeyXx/5DSLoTgDGVYGb22oZhWavGtd7HvOQyQV2RoI+c4en+RdnKgcy/
	DRaQqrquZoABODn2r7Cpj96u1naKspixCMqeZXh3EQ7ytWN7Bkx/dv2RrTjo02deTkKf
	+e9nmpiXAulVnx2aGjDa8A8HQqUij3GLl1yJJb6evNCl8gdhy1V0xyT8/6Mvdcaql6Tn
	4FVA==
X-Gm-Message-State: AD7BkJLZYmIBpi/BeC9rCdIDGLKBKwsLmHe1zfm39RKX0Saiyb17T8YzADcwCZImekHCSGtnqnGo4zhay2FTdA==
MIME-Version: 1.0
X-Received: by 10.28.49.3 with SMTP id x3mr714953wmx.4.1457032311266; Thu, 03
	Mar 2016 11:11:51 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 3 Mar 2016 11:11:51 -0800 (PST)
In-Reply-To: <1457013652.3476.44.camel@pbcl.net>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-4-git-send-email-armccurdy@gmail.com>
	<1457010155.3476.31.camel@pbcl.net> <20160303131826.GE2569@jama>
	<1457013652.3476.44.camel@pbcl.net>
Date: Thu, 3 Mar 2016 11:11:51 -0800
Message-ID: <CAJ86T=VFnc1rPssKouNWGbr-_WgyLKjau5hwn5-B4LiCh=jJUg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 03 Mar 2016 19:11:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 3, 2016 at 6:00 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2016-03-03 at 14:18 +0100, Martin Jansa wrote:
>> On Thu, Mar 03, 2016 at 01:02:35PM +0000, Phil Blundell wrote:
>> > On Wed, 2016-01-27 at 15:28 -0800, Andre McCurdy wrote:
>> > > -ARM_INSTRUCTION_SET = "arm"
>> > > +ARM_INSTRUCTION_SET_armv4 = "arm"
>> > > +ARM_INSTRUCTION_SET_armv5 = "arm"
>> >
>> > Although I agree that this is a net improvement over the old code
>> > in
>> > almost all cases, this patch is not quite right.  The reason for
>> > the
>> > original override is that there is assembler code in glib which
>> > won't
>> > compile as Thumb-1 (but is ok in Thumb-2).  Thumb-2 is only
>> > available
>> > in ARMv6T2 and newer architectures so with your patch it looks like
>> > compilation on arm1136jf-s (which is ARMv6 not ARMv6T2) would now
>> > fail.
>>
>> If the MACHINE doesn't have thumb in TUNE_FEATURES (for selected
>> DEFAULTTUNE) won't use -mthumb, so building on ARMv6 shouldn't fail
>> or I didn't get your point.
>
> Well, right, clearly it won't fail if you don't select thumb at all,
> but the same is true of armv4 and armv5 so by that line of argument the
> overrides here are completely redundant.  If you enable thumb on ARMv6
> then glib-2.0 fails to build in the same way as it would have done for
> armv4/armv5 without the overrides on ARM_INSTRUCTION_SET.
>
> (Admittedly though, if you actually try to enable thumb with ARMv6 then
> there are other problems that you need to fix before you can get as far
> as even trying to compile glib-2.0.  This is perhaps further evidence
> that nobody is doing this in practice!)
>
>>
>> > 3. Take the view that it's now nearly fifteen years since Thumb-2
>> > was
>> > introduced, OE-core no longer needs to pander explicitly to Thumb-
>> > 1,
>> > and we should just remove all this scar tissue entirely.  Distros
>> > that
>> > do want to target Thumb-1 can still maintain the appropriate
>> > compatibility stuff (which is probably only a dozen lines or so)
>> > for
>> > themselves.
>>
>> Except that oe-core still contains qemuarm which is armv5t and
>> almost
>> nobody is building it with thumb enabled in DISTRO config.
>
> Right, and the point I was trying to make is that, in this day and age,
> it's not obvious that supporting Thumb1 is an important goal for oe-
> core (because Thumb1 is sufficiently limited in both capabilities and
> performance that anybody who wants Thumb-state will be using a Thumb2
> capable cpu, and anybody who is stuck with an older cpu will be using
> ARM-state).
>
> If nobody, or almost nobody, is actually building a Thumb1
> configuration then this would seem to indicate that this is just an
> obsolete technology and nobody would mind very much if support for it
> were removed from oe-core.

I also vote for option 3.

All the good work and effort that Martin has been doing keeping the
Thumb1 builds alive could then perhaps be redirected to testing Thumb2
(or some other case which isn't covered by the default oe-core CI
builds).

> p.
>

