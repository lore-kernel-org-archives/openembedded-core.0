Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id A62196E9A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 15:04:11 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so1848471pbb.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 07:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=x0n0kaHDCFWYfSmR8nSgueFYaFRPhSWcEumC55+q0uI=;
	b=KsOKNVRlGjO+tJIDO0V5JygX1Nk/Gq/JpVqNxqrxYrYOQAh363sxRIqZkFlU74CIeC
	grHw7ifxE/A+puCVYSoHySfT0xeyH6C8yneXUDbC8SC3oYvt8q4KZqLP1ksi7MCc5yaJ
	GHOX+d5njnYSds5sooCA9FGDJJFpdIKVe1elBsWNTCPM+oL06XtXCYUMHQmzDI/OG3wR
	sR1l97bBuI86QuMBDRlofVkEMxa9BkV4jRzDxj5Rtz/UWSBw2kPmY8uUO7rIZafi3367
	dRLdY7aGrHoI94x9Nrmdn3jY89S1eAQD6PjZtYrVOpZ5bFy7LEFS0isxIxZgrNqjkwT8
	EO1w==
X-Gm-Message-State: ALoCoQkyi1mXQk2s8M9zahLqpe24zdD4sgJ6VWf2HkB0nyVHK+IPrcoBCZoLP3SugCKUtYdxOKNm
MIME-Version: 1.0
X-Received: by 10.68.197.66 with SMTP id is2mr8460753pbc.96.1391007852379;
	Wed, 29 Jan 2014 07:04:12 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 07:04:12 -0800 (PST)
In-Reply-To: <88EC4A0C-7B54-4385-845A-480394EEC20C@dominion.thruhere.net>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999042.19023.160.camel@phil-desktop.brightsign>
	<CAOMwXhP4y9MrxWDQzw8D9ukvoXSL1EBD0on3byix4cKu3-RdEQ@mail.gmail.com>
	<88EC4A0C-7B54-4385-845A-480394EEC20C@dominion.thruhere.net>
Date: Wed, 29 Jan 2014 15:04:12 +0000
X-Google-Sender-Auth: sdmKdBrTafsmlerHB5VMUrRzkkg
Message-ID: <CAOMwXhN0yt248PMCst-mn3E7=4YQutVRpeyjH9=HmOC-0UXiBQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Jan 2014 15:04:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 29, 2014 at 2:06 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 29 jan. 2014, om 13:39 heeft Laszlo Papp <lpapp@kde.org> het volgende geschreven:
>
>> On Wed, Jan 29, 2014 at 12:37 PM, Phil Blundell <pb@pbcl.net> wrote:
>>> On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>>>> Is there any obstacle why this cannot be /root as per default Unix
>>>> philosophy [1]?
>>>
>>> No.  This is distro policy and you (or your DISTRO) can set it to
>>> anything you like.
>>
>> The email is not about distributions, but the default value in Yocto
>> (the distribution generator itself) ...
>
> You mean OE, right? Yocto is 10^-something, the Yocto *Project* is an umbrella project contain lots of things, among which is OE, which can build a distro for you.

No, I mean Yocto.

I am not directly concerned about OE as I am not a direct user. I
would like to fix this in Yocto itself. It is fine if it is fixed in
OE proper or worked around in Yocto.

