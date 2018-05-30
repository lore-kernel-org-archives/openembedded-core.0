Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84C0674AD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:58:30 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h5-v6so13322016qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 18:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VWTIGMcosXDFCJ3DGKTHWQtOaInlw4DfiIvnBE4GyHE=;
	b=Bu7kXwn+J9jE+DejEhrv52ZaGLrVqSmvpEmqpTRCyKJJvXYA9D6egltKcaK5MbaX33
	731QeQt7f8pUfJ0PiPWKY4PPYoGhFvpOu2J/pMYSs+uP09y0x6iOg4FXF1PB+9y/dcNC
	i1IeocEu93HX+riSEagHTMZMRcW2YVTGA/xrhfakRPF7cm+Ky2PGNWJ/mutpJ/Yo94F5
	IfZiHTjN4yEq+Czg2dM9arM284YxRlVaH43oHP8flcLaKXRO2xHmBXDj/HMcm0AKyQ5d
	4cIafHb2LamaE+oIdeaCn8k4w7/yKLHw3KPwGhOFOwTg5x14xKlY7fjoejOJtmikBOmZ
	Yu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VWTIGMcosXDFCJ3DGKTHWQtOaInlw4DfiIvnBE4GyHE=;
	b=UQmjhOoUjlg/3XJBG3appuaIjd5hbbCtm1rjEhwumH5BJJpfYoV3/aAmMDyCdU33t0
	jyx8G4otWFZRhZyuKYXvoGLlaNNaEZhrqG1WtF4EkjBTKgFkC9zNJLo8yPdz/Zll8xov
	sj2dgJdXM2h40GHmmQxE2gsHBI8R2HLn1TdYO1pTijhLHOzykvlFaKbayIldwP8KT8be
	L+s0lz/vI9kfo4l762BA0jrzDbDqb3LtMNutkqdjJnjX8ix3EAJ0GH9uuIXyRVXL/q+3
	4aVDaS6lL2JAhppfvoWJUMQGm+aVcBs96keCSv7PSkEXcV8TAw9YQF8epdYVY51h7c8H
	a4/Q==
X-Gm-Message-State: APt69E0PVTFzpTjeW59aA+UtSaglRfgk43ODg2BY1Zny4pFewt/gl0hn
	ML0x6NUi+NvDDgL1Hhc64kVgqkStdD4WlIlflkA=
X-Google-Smtp-Source: ADUXVKJg+p6D9/bOujaNRLMDZXdXt3mxKv4SJwHIiHlyZD8FOfbCU6+/K2uV8WFk55959BINXPzT2+c08IzZ+KtD6PU=
X-Received: by 2002:ac8:26ea:: with SMTP id 39-v6mr793654qtp.128.1527645511718;
	Tue, 29 May 2018 18:58:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Tue, 29 May 2018 18:58:01
	-0700 (PDT)
In-Reply-To: <1527624735.16911.121.camel@linuxfoundation.org>
References: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
	<CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
	<1527624735.16911.121.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 18:58:01 -0700
Message-ID: <CAMKF1soj5LnR3yq+g9_mixMKnFBaOROx6B2h8G-Qa9H9C6o6pA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Wed, 30 May 2018 01:58:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 1:12 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-05-29 at 12:13 -0700, Khem Raj wrote:
>> On Tue, May 29, 2018 at 11:41 AM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>> >
>> > This change looks wrong (or at least incomplete and lacking a
>> > decent
>> > explanation):
>> why do you think it is wrong ? I would be happy to make the
>> explanation more decent
>> if you have ideas please share.
>>
>> >
>> >
>> >   http://git.openembedded.org/openembedded-core/commit/?h=master-ne
>> > xt&id=fbec01f01fdad23d95271db063ee0a4d0ab44568
>> >
>> > It was never posted to the list but seems to have made it as far as
>> > master-next.
>
> I don't know where Ross got the patches from but I've taken over and he
> told me the patches in mut were ready. I didn't take this one however.

Thats right. since Ross has been testing gcc8 patchset
and reducing the number of patches needed for enabling gcc8 and this one seems
more benign, to go in independent of rest of gcc8 patches.

>
> My concern is the use of "remove" which I really prefer not to use in
> OE-Core. In core, its a sign that we have the overall structure wrong
> as we should never need to do this.

Yes and its a valid one. A better way would be to not use -mcpu for
recipes which
are not compiled for machine specifically, our tunes however are using
this extensively
and changing that probably should not be clubbed together with gcc
upgrade. the warning
emitted with gcc8 is just highlighting the problem that has been
latent. -mcpu is not
consistent across different architecture, x86 has removed it for arm
it means sum of
march+mtune etc.

on arm mcpu backfills either of march or mtune if not supplied on
cmdline, and in case
there are conflicts the rightmost setting wins, however this
precedence can then conflict
with builtin defaults, thats what we are seeing here.

I thought about proposing a separate series for removing -mtunes
atleast for arm. However such a change would
need very careful testing, since this can have runtime performance
impacts and other
optimization bugs etc. So regardless we should do it where we only use
-march and -mtune
combination which will let it target more broader spectrum of cpus and
users will be able
to generate pre-compiled binaries for larger base ISA so there are a
few advantages

leaving compiler do its job always results in best performing code in
my experience, adding
too many fine-tuning at global level are overkill anyway. apps ask for
specific opt flags themselves where needed, and if we have empirical
data where it proves helpful we can always do that at recipe level via
cflags.

>
> I'd like to understand why gcc-runtime needs this special treatment and
> whether there are other arm tunes which have the same issue? Should we
> be tweaking the main tune files in some way instead?
>

Yes we should be re-looking at how arm tune flles stagger various
compiler options
especially march/mtune/mcpu, but I would think that is a separate topic.

> Cheers,
>
> Richard
>
>

