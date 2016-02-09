Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 81B206FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:32:03 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so154739187wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 16:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4ioJmjwthG0nsiGgm8Yj+fF+4CsrAf4JkpqnBOfIVTk=;
	b=AzQVOv4yfxARwxE9rIVC+0iqayEo7DzY/TivQ/ZtYoSgyno64Khy0vN6r9sncDY1VB
	YaT4unDKGeci866v4uVGmht7cI6eiZ9bT1SKriIa5jYAACySzJZ6TzU9Z2LOYfUtcFk9
	HDvlQ85lXOjdGNZVeYRckjqBxVx54ElvDFHwVaIbd39PEe+naERbVRtg1t7+AJAmSBFa
	xixtqB5/skn36qwmL+lit/noCZknTRa5nAlkuvi0BWptZHdaRLiQeT3Qk4VkqQj14zIh
	RC6U9bP+eru3idoLWb2Vy2RescAH4lp+o5fedEt4kdjCIjuCIfjpbXZH6F1SLLN4RS+t
	cVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4ioJmjwthG0nsiGgm8Yj+fF+4CsrAf4JkpqnBOfIVTk=;
	b=jw2arkfdjZo3gScKNO3uPOfNig5plvyJSihS5BGuXw6ZW77bAWCrGnrVCq75EwP53P
	huUFET4POzGOZpVEiwyxIMBhg4ynXVwj/qYMCmBT4sxXpLtZ+T6qjEu/WqvZTYzJRilU
	IewbqG4biIag1daVMwLdU/VILCRXEWyQn2xVCdj7hcsoyBPkev2sI44ZgBjKHq5FSMlX
	bxeopVytMXsJ7RhJu/md0nJvySYWJZD7Z9R6cIIa1H1jCbD+VIcIbzFPDzaQauKH19R6
	WqHj2UzXo8VCsQRg1l+32zG0F5OejqbkhgwNzqqafO6BFhRPzOGI6lkahCnCaSEtAfGi
	76Tg==
X-Gm-Message-State: AG10YOQFxf0WR/QZJr8/471CA4GpJbYHNXCfkOOYRNeHxyyJXYlQuSngTtDh87kvt8uPwxuSaqyBh7kd93g+ug==
MIME-Version: 1.0
X-Received: by 10.194.116.197 with SMTP id jy5mr29861671wjb.43.1454977923684; 
	Mon, 08 Feb 2016 16:32:03 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 16:32:03 -0800 (PST)
In-Reply-To: <CAJ86T=XVXo-2OLqQxejMF+1=vru9e9htaKE5LOzB0zLpwhn4TQ@mail.gmail.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
	<CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
	<CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
	<56B92C4D.2070507@windriver.com>
	<CAJ86T=WSV2Rpm2zjNmaJEd67=BogP4KHNTuHipOJnqPi9_csdA@mail.gmail.com>
	<CABcZANnKBabF-wg0zEWYSpbg5KUQEfpRWBvu4_VOkboqMPprcg@mail.gmail.com>
	<CAJ86T=XVXo-2OLqQxejMF+1=vru9e9htaKE5LOzB0zLpwhn4TQ@mail.gmail.com>
Date: Mon, 8 Feb 2016 16:32:03 -0800
Message-ID: <CAJ86T=VegzFvDi+yDuhuqu8f3yB-mRdU6gE7jhEmovSg7j3K8A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Tue, 09 Feb 2016 00:32:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 4:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Feb 8, 2016 at 4:13 PM, Christopher Larson <clarson@kergoth.com> wrote:
>> Target_cflags is an exported variable. It affects the checksums of every
>> task. Not ideal, but that's how it is today.
>
> So why wouldn't we just set TARGET_CFLAGS etc to "" in native.bbclass?

... with an appropriate over-ride for SECURITY_CFLAGS too.

>
>
>> On Mon, Feb 8, 2016 at 5:10 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> On Mon, Feb 8, 2016 at 4:01 PM, Mark Hatle <mark.hatle@windriver.com>
>>> wrote:
>>> > On 2/8/16 5:43 PM, Andre McCurdy wrote:
>>> >> On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross <ross.burton@intel.com>
>>> >> wrote:
>>> >>>
>>> >>> On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com>
>>> >>> wrote:
>>> >>>>
>>> >>>> Can you give an example? Looking at native.bbclass it seems to
>>> >>>> replace
>>> >>>> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
>>> >>>
>>> >>> Sure, so in doing a native build TARGET_CFLAGS is used.  But as
>>> >>> security_flags.inc was using TARGET_CFLAGS_append, the end result was
>>> >>> BUILD_CFLAGS appended with the security flags.
>>> >>
>>> >> Yes, for native, TARGET_CFLAGS will end up being "${BUILD_CFLAGS}
>>> >> ${SECURITY_CFLAGS}".
>>> >>
>>> >> However it shouldn't matter - native.bbclass sets CFLAGS to
>>> >> BUILD_CFLAGS, not TARGET_CFLAGS.
>>> >>
>>> >> Do you have an example where host gcc can legitimately be invoked with
>>> >> TARGET_CFLAGS?
>>> >
>>> > You have to remember the order of the operators.  _append says to make
>>> > the
>>> > append, AFTER everything else has been evaluated (and before _remove).
>>> > This
>>> > includes override behaviors.
>>> >
>>> > So if you do:
>>> >
>>> > TARGET_CFLAGS = "-deadbeef"
>>> > BUILD_CFLAGS = "-badc0ffee"
>>> > TARGET_CFLAGS_append = " -foobar"
>>> > TARGET_CFLAGS = "${BUILD_CFLAGS}"
>>> >
>>> > The final value of TARGET_CFLAGS is "-badc0ffee -foobar"
>>> >
>>> > Thus by changing the append to:
>>> >
>>> > TARGET_CFLAGS_append_class-target = " -foobar"
>>> > TARGET_CFLAGS_class-native = "${BUILD_CFLAGS}"
>>> >
>>> > In the case where the 'class-target' is the override you will get:
>>> >
>>> > TARGET_CFLAGS = "-deadbeef -foobar"
>>> >
>>> > In the case where the 'class-native' is the override you will get:
>>> >
>>> > TARGET_CFLAGS = "-badc0ffee"
>>>
>>> I'm not disputing that TARGET_CFLAGS can contain something bogus for a
>>> class-native build.
>>>
>>> I'm asking why does it matter?
>>>
>>> Setting TARGET_CFLAGS at all in native.bbclass is fairly recent and
>>> seems to be a workaround to avoid churning sstate:
>>>
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=05a70ac30b37cab0952f1b9df501993a9dec70da
>>>
>>> Is that perhaps still the real reason to avoid modifying TARGET_CFLAGS
>>> for a native build?
>>>
>>>
>>> > --Mark
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

