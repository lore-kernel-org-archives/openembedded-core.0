Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 37C966EA16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 15:16:56 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so3827527wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 07:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=0rc3alRhhv+VJLtriVyrNNN21DmY5KObUf+rv7HccCo=;
	b=cvVwFAdCcHeh6w4qOIGD3jqV0J0IOQHz4t2ZEPhfZ9ZxU6q4WtwOQg7r4Qwyvt7/Ex
	pVfwNuRmOcbKCRl+NRXg1JH2SAWwRUG5k0kIRJMTUfThPUwSk7xGiUKOeGJm8a84eYtV
	Q9LK4tKgoLZJVY0FAGyxKQVAJ9NO+q1sR7NlE66giWRC4qxOpUMQnx65xwgSLu7/spGL
	Ldf5m2RDGCUdduchAshEoJNAzv3QE/4J7FHUz3VzYWeL3GjgDeuYnMg6WDIabapNgwEA
	NeIkEWOcjtve14zxqt+Div/TZTTE5y1+rbJ6vBhHPK7MbylTR9TDvdhJk9HBc3ur83Mm
	l6dA==
X-Gm-Message-State: ALoCoQmGg7Pp3UNHUhpMz+Qy8sSiMxZbkwo6q+FqPz8nJFyitbVVNN+RRBkANexxWmG+NX6ic1O8
X-Received: by 10.194.92.109 with SMTP id cl13mr5427368wjb.13.1391008616589;
	Wed, 29 Jan 2014 07:16:56 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id n15sm6036525wij.3.2014.01.29.07.16.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 07:16:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAOMwXhN0yt248PMCst-mn3E7=4YQutVRpeyjH9=HmOC-0UXiBQ@mail.gmail.com>
Date: Wed, 29 Jan 2014 16:16:57 +0100
Message-Id: <FC0E2AF3-5859-45FB-B0C6-5B53EEC26EEE@dominion.thruhere.net>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999042.19023.160.camel@phil-desktop.brightsign>
	<CAOMwXhP4y9MrxWDQzw8D9ukvoXSL1EBD0on3byix4cKu3-RdEQ@mail.gmail.com>
	<88EC4A0C-7B54-4385-845A-480394EEC20C@dominion.thruhere.net>
	<CAOMwXhN0yt248PMCst-mn3E7=4YQutVRpeyjH9=HmOC-0UXiBQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Mailer: Apple Mail (2.1827)
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
X-List-Received-Date: Wed, 29 Jan 2014 15:16:56 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 29 jan. 2014, om 16:04 heeft Laszlo Papp <lpapp@kde.org> het volgende =
geschreven:

> On Wed, Jan 29, 2014 at 2:06 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 29 jan. 2014, om 13:39 heeft Laszlo Papp <lpapp@kde.org> het =
volgende geschreven:
>>=20
>>> On Wed, Jan 29, 2014 at 12:37 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>> On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>>>>> Is there any obstacle why this cannot be /root as per default Unix
>>>>> philosophy [1]?
>>>>=20
>>>> No.  This is distro policy and you (or your DISTRO) can set it to
>>>> anything you like.
>>>=20
>>> The email is not about distributions, but the default value in Yocto
>>> (the distribution generator itself) ...
>>=20
>> You mean OE, right? Yocto is 10^-something, the Yocto *Project* is an =
umbrella project contain lots of things, among which is OE, which can =
build a distro for you.
>=20
> No, I mean Yocto.

So 10^-24. I have no idea how to convince the SI that 10^24 needs a home =
directory switch.

> I am not directly concerned about OE as I am not a direct user. I
> would like to fix this in Yocto itself. It is fine if it is fixed in
> OE proper or worked around in Yocto.

Inconceivable!

I think you are confusing 'Yocto Project' and 'Poky' here. I Please read =
up on what words mean before using them.



