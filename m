Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8332578325
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:40:25 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 33so18158526wrz.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H0WNlN0KjBuHQ52aruQDCqgLpVdsSsgHoFMjmfc7KXA=;
	b=ZJz4dZr9T/SGI8lbVBrN/ZKvHQP1JQUwWP7Y5QddpM5DGYK1Svu8J/g251qLpzKSNc
	3HB6NBZT7b2y72JdB6cQ50zMkzxF86NK3fxsynj8nEmkp88YP13ALyumxPIzcBsy2ffp
	QKKR3xz33RYhLInWrFqL05qXedSYhzzyuwnCHj/0nrr9jbGWCQY3QnSlISVjg6xUH9o1
	2FFl6o7DvEhWHSC2MJgCXumBFuLdXSMbww++72y+ltYKKjGDrnqRBeyiOnm6LaWumvb0
	PPc2cn3Zoxdkx7JtaRlS5RMkWvrm1AdkAABbVYd9sdOxF8T0OXIXaJPQfmSsnE9Ytob0
	xL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H0WNlN0KjBuHQ52aruQDCqgLpVdsSsgHoFMjmfc7KXA=;
	b=ImOUMUDQrRCLZYbBPGYg+Xps/yzMPNBwzrRDxsM9SQInzUWSjs7y/We28bzDw5Hj/6
	rInzSjXUIRv4en0egsbpapSeEk1eoQGkzWDsqwc4fVUTVwky7GIUg4v0J2+knjzCl6n3
	imCxE3HelOXkxbqDaBwQr/yZC+Jg23hHlBmjNyWSqNHIAdIeIM/KCDHAImnvwA5Gl2pu
	kA1Yyfe09SnotnHpP31S4g6sfifDzMADsghOZU+iXui0ttCULAEbjQdGPrzGf/KeQFeb
	xccmMddHUM4eiv5+FszJnIUfhyNauis+pfcCK/x4Y3ai1WDwu89SDnGmFWlM3pAKwnl6
	WQjA==
X-Gm-Message-State: AIVw112BWapJm9mogjLha2h3U+TLer4mp70+Qdb5iSjQgV1hYg+Ig0co
	G+m4wUp1qybWfsIaMj8LFFQIpSGW3g==
X-Received: by 10.223.160.6 with SMTP id k6mr4559737wrk.220.1500579625990;
	Thu, 20 Jul 2017 12:40:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Thu, 20 Jul 2017 12:40:25 -0700 (PDT)
In-Reply-To: <CAJTo0LZ-goETzCb25RXab_ewnSENbcFucUDoEPmo48epdAfAdw@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
	<CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
	<CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
	<CAMKF1srdmXi-uxH9eX2wK2VYXpmCpkTLTvfZxY+5_OZo65Q-Sg@mail.gmail.com>
	<CAJTo0LZ-goETzCb25RXab_ewnSENbcFucUDoEPmo48epdAfAdw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 20 Jul 2017 12:40:25 -0700
Message-ID: <CAJ86T=XEYdhxaEcAgBGx48T63jBb61uPnF3u5czHJY8UbLb5aQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 19:40:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 July 2017 at 19:51, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> it does cause harm, by making the behaviour inconsistent and highly
>> dependent
>> upon build host.
>
> It *stops* behaviour being dependent on the build host, surely.  The problem
> is that some recipes use the host compiler when they're not meant to be and
> this can cause subtle (or not so subtle) breakage.

Is there an example of a recipe which doing that which went unnoticed?
Doesn't the fact that most recipes do get cross compiled (ie x86
target on an x86 host is the corner case) should mean that bugs like
that get flushed out pretty quickly?

