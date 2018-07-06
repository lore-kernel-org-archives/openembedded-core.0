Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9D87885D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 04:59:30 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so21174917ois.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 21:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=M1Yp4NBbi2GENc0RB0mTHoYTpwJ0+LO5llocBYcfknc=;
	b=TtT1k+MXLyDy2t43GwP03iokFW343I1yIh4ne5wk9vsLqmIk5hCXfcJINjT1me7JBp
	OLgJDj5LmCwffCoKAXmSRAh6lx7nQi7Kj7JV0QLTzFJ+pdoW3z0W1oz37ZX6ftfNa4wz
	iZ1z2FlLiIN/yDYNAVxpvykCticNpCtIDMKfeQVERCbeW2u7ju7ALnDd3Rj6VniUNddW
	SQ9sNn3aB3PyolwhpMIfx8FamPF6gvT1ofuqi737SuWrW0RzjNZ43WEk76ycIEFoaWoS
	s07haxLwZbhP7ykvpwRGvaCEHsoczCpWXdoHc3o4TQloZFhh2+62UtXX8Mm1iTZWvwZ2
	WA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=M1Yp4NBbi2GENc0RB0mTHoYTpwJ0+LO5llocBYcfknc=;
	b=pWYlQR2nwE4uJB/NWIkSu+nuyOulp2XqyIti4F8082+gPgjMk/pl0g5fe3IF6GDPWB
	FMmwUIW4JdGHUCrq5pDmvpw3jZmiDv93NjX6Co4FGiM/ljdtsnbb7gyNboEjbEo6LDyP
	d5O4FCLRmAQw43mbpU2smm5APL75fzW8HI/4x2PhLr72inZQ6a3gyRktrusOvMEBm8oA
	lcv0d4SyPgps6mqZzU1m3+mDDtJNP7+dySgtkn4NmVTKINzmTrTaLaKls0nli2SRxV0Q
	Pp4TXo+rgH9iHH1oKFAlsVw2dGUFypHbzSUHEtj2DSc7QJkJsKonjg8pC4pJCWgRTzv3
	KIwQ==
X-Gm-Message-State: APt69E2T0DUfUagSuKLPrmc568jYKeeimoRd0xDzGt4iNcHCXiR79mFf
	xF5LSWJ8IlUaHy06f4bN1KxdaBi2AXdgkdlsVBU=
X-Google-Smtp-Source: AAOMgpeXjsnvI0Nt5tHwC49FJFMq6lJVyZ0QZp2GeM2esG4qNenGU/nMIdn/m0EqFNlG81j+VW2jhvFnWpPHG/Y7MRk=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr10414948oih.38.1530853171414; 
	Thu, 05 Jul 2018 21:59:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 21:59:30 -0700 (PDT)
In-Reply-To: <CANNYZj-aniU5dteDkg_VWdRPVWJRP3Zs0et79LVyzzYwzrQD0w@mail.gmail.com>
References: <20171115124041.23289-1-patrick@advancedtelematic.com>
	<CAJ86T=W476NOCmnwYcfs57wmM1eOshyBaaeSgrF0D6XPgU1Esg@mail.gmail.com>
	<CANNYZj-aniU5dteDkg_VWdRPVWJRP3Zs0et79LVyzzYwzrQD0w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jul 2018 06:59:30 +0200
Message-ID: <CANNYZj_Hd5hf_=3SxsPby5c6OuZ=hN54dczz7OV0dALsGrdOKA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Fri, 06 Jul 2018 04:59:30 -0000
Content-Type: text/plain; charset="UTF-8"

Patrick's email is no longer valid, so we should probably just do the
revert without expecting a clarification.

Alex

2018-07-06 6:57 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> There's no problem in reverting the change, if there is no real need
> for it, just in case.
>
> Alex
>
> 2018-07-06 5:28 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>> On Wed, Nov 15, 2017 at 4:40 AM, Patrick Vacek
>> <patrick@advancedtelematic.com> wrote:
>>> From: Patrick Vacek <patrickvacek@gmail.com>
>>>
>>> For recipes that depend on native ca-certificates.crt, /etc should be
>>> added to the list of directories that automatically populate the
>>> sysroot, otherwise the file may not be there.
>>>
>>> Signed-off-by: Patrick Vacek <patrick@advancedtelematic.com>
>>> ---
>>>  meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
>>> index 59e7d51437..52a1a07f68 100644
>>> --- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
>>> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
>>> @@ -24,6 +24,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
>>>             file://sbindir.patch"
>>>
>>>  S = "${WORKDIR}/git"
>>> +SYSROOT_DIRS_class-native += "${sysconfdir}"
>>
>> This change has now been merged, but unfortunately it looks wrong.
>> This use of += with an over-ride doesn't achieve what you describe in
>> the commit message (the += will append "${sysconfdir}" to the
>> over-ride value and then the over-ride value will COMPLETELY REPLACE
>> the original value of SYSROOT_DIRS, not add to it).
>>
>> The change also appears to be unnecessary as ${sysconfdir} is appended
>> to SYSROOT_DIRS for -native recipes by default (via
>> SYSROOT_DIRS_NATIVE in staging.bbclass).
>>
>> Exactly what issue were you trying to solve?
>>
>>>
>>>  inherit allarch
>>>
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

