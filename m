Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id A4E4B6FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 07:43:44 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id s79so7540110oie.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=Ikxqb9R9mZt7rcle0OvpW3V5aLgeBP83mXrqVQPNsU0=;
	b=yj+iFr/54lEwym3v48p5F059uXLTIeq/AIW5V663XhyvI5r1H2CuqmTIT4RJzu3gt5
	E+OGH8OEiUJugz7qttOSOHLUAnU3x5JWZWTTep/QregQG4eVa7TubtcVe7IRIQWNOjzr
	s3Vxd9U6ZBDY6BM9XpUylVann3RjMEGStBtqoVFOKGWi7jZNRPea1sjoHrBPFII6vXEa
	FkjLAxvbDUDwmoMmctqKQdlkhn/wDNL7FOLzCEtsoyH1fv6mO3YLwJ3fJiDpIUsf3hrk
	Z4ftInHCCTnAEzQCYK3WutqufJaZaWOokyfSnRoLpdyTYSZ4n+yZvZ5jWPJgA1ALAWri
	SLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=Ikxqb9R9mZt7rcle0OvpW3V5aLgeBP83mXrqVQPNsU0=;
	b=IFwHsxxueC+EKBdGBuZtUawJOs5NLP+geEnFRHI+uc6NLwUTBn+5BKwpbcrz/mddwe
	fIeXysiiIaOG6a8yN/vtqNN0932R4CGGirio5o2yHYf3Z4UHHfYRwJb3iyknkyDHhg+E
	j9MMOcD25xYIAR7VhnRikQlRtuoM2nl0IFXIw3vKlDgr+ihCPLdfS/D5KcnpLKb5jwok
	6pApms3T+e38wD26le631Kp+SAHg8YQAHgRxlR5wbyroQNdwdq5sAmVUfT/83mhlmCf9
	Y/LgOvoZYGSsavG1qvWSFO/t8Rpr2twWa/S747qZdW9KIb1BZJkPMlDtbOzU29PSKwhU
	G2Xw==
X-Gm-Message-State: AD7BkJIfs+3pP1D7DdX8ZHMqQNVK9iyxfSP+GCfQIlEQWcb3XIaWnuSapxbZFxQTvFmnnLETiy3p8TyCCTXuGw==
MIME-Version: 1.0
X-Received: by 10.157.5.97 with SMTP id 88mr13382311otw.183.1459842224238;
	Tue, 05 Apr 2016 00:43:44 -0700 (PDT)
Received: by 10.157.5.203 with HTTP; Tue, 5 Apr 2016 00:43:44 -0700 (PDT)
In-Reply-To: <CAMKF1srW021jUR3uPLiLcXRGBEGzCioA1EwpSMBCOHb9CF_q6A@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
	<CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
	<CAMKF1srW021jUR3uPLiLcXRGBEGzCioA1EwpSMBCOHb9CF_q6A@mail.gmail.com>
Date: Tue, 5 Apr 2016 09:43:44 +0200
Message-ID: <CAEHkU3X9+gW2YaqVftx475OfPwKLZ2WEEVEC-gMKE-yRAeXSOA@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Tue, 05 Apr 2016 07:43:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

2016-04-05 2:44 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Mon, Apr 4, 2016 at 12:56 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Apr 4, 2016 at 4:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sun, Apr 3, 2016 at 4:00 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> I added some text to bugzilla. The gist is: In poky the sources are
>>>>> not deployed.
>>>>
>>>> I don't understand that. If you mean playing sources in the -dbg
>>>> packages, poky does that too. Is there some specific configuration
>>>> Angstrom makes which triggers this?
>>>>
>>>> There was a bug in master recently which broke source file deployment
>>>> into -dbg packages but that was a bug everywhere which was then fixed
>>>> when we realised.

I gave some misleading information. I checked out poky a few days
before angstrom and thus poky did not include the commit which fixed
the deployment of the debug sources while angstrom did.
http://cgit.openembedded.org/openembedded-core/commit/meta/classes/package.=
bbclass?h=3Dmaster-next&id=3Decb56a6ae0c870af680da03db9d39703b525fc98

So with that patch applied my poky build does deploy the sources but
does not show the
host contamination warnings.
Sorry for the red heering.


@ Andreas
* Which version of cpio does your build host distribution ship
openSUSE Leap 42.1: cpio (GNU cpio) 2.11
Fedora 20: cpio (GNU cpio) 2.11

* do you see floods of host contamination warnings for shipped source files=
?
Yes, on both systems.

@ Richerd
> You could install a copy of our buildtools tarball, see if the problem
> goes away with that installed?

I will try that out. However, as I did setup a poky and an angstrom
build on the same machine likely the host build tools will not be the
culprit.

>>>
>>> Max, somewhere in thread you indicated angstrom 2015.12 release which
>>> would be actually using jethro
>>> and if it has been recently fixed in master than it would explain why
>>> it worked on poky/master and not on angstrom
>>> may be this fix should be cherry-picked to jethro.
>> I checked Angstrom master but did not find matching commit. Which
>> commit are you referring to?
>
> Just ensure that angstrom master is using master of OE-Core ( latest )
> and if problem still is there then second thing would be the toolchain it=
 uses
> might be coming from meta-linaro, now see if there are any gcc patches
> that are in OE-Core but not in meta-linaro which could cause this kind
> of stuff

Note that I tested this with qemux86. For x86 angstrom is not using
the linaro toolchain.
(And I usually build for ARM where I also see the issue)

>>
>> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

