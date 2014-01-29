Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6549C6EA0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 16:23:39 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id rd3so1948203pab.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 08:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=pTSoUl+uhVAVSAIixIaKt7YyGP2Qzggwt4QvyYoLDvc=;
	b=fQUQ/tzLOGq+fHaICXbzuxg5/FytKzggVF0Fm1CjQnUP515CeNhVuzAtPe7PIXxtlw
	JbbdZiSLYWTleVDPxpNZrGD+zdIiSEUkt82dq4M4BbUJtgPfrOk7nP1FBvzejUJ1YAUB
	p2c1MAo5YLDfecDr7po2RH/HHtKSXyDzEXjz+PlLKNtr8Cj0yDTv10dKLuCTOh3gRVlg
	2TmNNVGTTe2ViRZJkHG26wDLyW/YNjfYVxZ641uzrYpNlJ+6mq48ju8PnoWSHRDb+9D0
	Ph8R/RpfAU2sUVuHO43SLAN6G9XCknxFvp4PcqGgqGZ0BtDQfJ74A1gGM4DFRhECCgi5
	6suQ==
X-Gm-Message-State: ALoCoQl5nx9ISC5oXD6J5N2xmsUJwEsvJjKlZBk2aOwPkTxuW1EPshqHTFkYvxgrEH1ZLguwHLc4
MIME-Version: 1.0
X-Received: by 10.66.16.162 with SMTP id h2mr8774445pad.129.1391012620272;
	Wed, 29 Jan 2014 08:23:40 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 08:23:40 -0800 (PST)
In-Reply-To: <FC0E2AF3-5859-45FB-B0C6-5B53EEC26EEE@dominion.thruhere.net>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999042.19023.160.camel@phil-desktop.brightsign>
	<CAOMwXhP4y9MrxWDQzw8D9ukvoXSL1EBD0on3byix4cKu3-RdEQ@mail.gmail.com>
	<88EC4A0C-7B54-4385-845A-480394EEC20C@dominion.thruhere.net>
	<CAOMwXhN0yt248PMCst-mn3E7=4YQutVRpeyjH9=HmOC-0UXiBQ@mail.gmail.com>
	<FC0E2AF3-5859-45FB-B0C6-5B53EEC26EEE@dominion.thruhere.net>
Date: Wed, 29 Jan 2014 16:23:40 +0000
X-Google-Sender-Auth: zMDG-mulCUScOeEHNEBMsXQ78vE
Message-ID: <CAOMwXhOBp7c3nD9L4TAaZ-3CFfPyfFOB_kZWm-i3yCZeyf1UVA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 16:23:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 29, 2014 at 3:16 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 29 jan. 2014, om 16:04 heeft Laszlo Papp <lpapp@kde.org> het volgende geschreven:
>
>> On Wed, Jan 29, 2014 at 2:06 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 29 jan. 2014, om 13:39 heeft Laszlo Papp <lpapp@kde.org> het volgende geschreven:
>>>
>>>> On Wed, Jan 29, 2014 at 12:37 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>> On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>>>>>> Is there any obstacle why this cannot be /root as per default Unix
>>>>>> philosophy [1]?
>>>>>
>>>>> No.  This is distro policy and you (or your DISTRO) can set it to
>>>>> anything you like.
>>>>
>>>> The email is not about distributions, but the default value in Yocto
>>>> (the distribution generator itself) ...
>>>
>>> You mean OE, right? Yocto is 10^-something, the Yocto *Project* is an umbrella project contain lots of things, among which is OE, which can build a distro for you.
>>
>> No, I mean Yocto.
>
> So 10^-24. I have no idea how to convince the SI that 10^24 needs a home directory switch.

I am not sure what you mean, really, but either way: I would prefer
getting back on track.

>> I am not directly concerned about OE as I am not a direct user. I
>> would like to fix this in Yocto itself. It is fine if it is fixed in
>> OE proper or worked around in Yocto.
>
> Inconceivable!
>
> I think you are confusing 'Yocto Project' and 'Poky' here. I Please read up on what words mean before using them.

... or just listen to the user what he is writing... :-) I am a user
of Yocto project. I am reporting issues against Yocto, on the Yocto
issue tracker, etc. Fwiw, I am not even planning to use the "Poky"
distribution...

Either way, I do not wish to continue arguing over these words because
it is not that useful for anyone IMHO.

I would prefer more input about the actual proposal.

