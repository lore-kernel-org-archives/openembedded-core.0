Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKRL1-0001gZ-6v
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 11:38:11 +0200
Received: by wibhm17 with SMTP id hm17so394554wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 02:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=8e8xUD1/meDaTssfJY/JjFipeODGaBWPhZFluBpzb8U=;
	b=GiT+hpkpPrue5HgwOnNzEcQQ/n/bmbfoFQ+FIWNvwUMqRvHPGSzEM26Rly+v9QWR6c
	R+dxxlZN9W+H0r3jk/TC7rcowZn2ImHGNS1Qwlx+NodkYl+RB49Mn1m7nfRdzirxeE8b
	HxwGbRy+bMHFblailXqJcXtpIjnZqXvNN7KrVWNeGc3VRvSL9OK7NHcdQQ2aIzhzpbge
	haHMe4nfuo0DKMTvYU/oysz/1eE16J941VXsodXQ8kne/gTuvG2eNNUjnB8Ta1Ex9sPI
	GDvtfniHCM8gacx4nWROzs6r1tGxkpafHRh50PutD/VdBbjZyu/c4nnQGPnbDFjZlK5A
	0/pA==
Received: by 10.180.81.37 with SMTP id w5mr4430885wix.16.1334741324012;
	Wed, 18 Apr 2012 02:28:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ea6sm33294734wib.5.2012.04.18.02.28.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 02:28:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334221321.31685.24.camel@ted>
Date: Wed, 18 Apr 2012 11:28:41 +0200
Message-Id: <818A5ABA-BD12-43CF-94FC-539A757435DD@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQms8u46t+FFTq4Ffomps3U74tJU4G4x1aUyufNn5n2tgkUQmkMV8Z6wSfd5LQpBZ/gOrTmA
Subject: Re: Yocto Project 1.2 M4 schedule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 09:38:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 11:02 heeft Richard Purdie het volgende geschreven:

> On Wed, 2012-04-11 at 01:51 +0100, Julian Pidancet wrote:
>> On 04/09/12 19:01, Liu, Song wrote:
>>> Hi all,
>>>=20
>>> This is to restate and clarify the schedule for Yocto Project 1.2 M4 =
(milestone 4). If you are concerned or have patches you would like to =
merge, please see the following dates:
>>>=20
>>> 1. RC3 official patch cut-off time: 12:00AM April 8th, 2012, PDT
>>> 2. RC3 build: April 11th, 2012, PDT
>>> 3. RC4 official patch cut-off time: 12:00AM April 15th, 2012, PDT
>>> 4. RC4 build: April 18th, 2012, PDT
>>> 5. YP 1.2 release: April 27th, 2012, PDT
>>>=20
>>> You can also check out the schedule here: =
https://www.google.com/calendar/embed?height=3D600&wkst=3D1&bgcolor=3D%23F=
FFFFF&src=3Dmg0m150m30gs891eqqhtfu5jgg%40group.calendar.google.com&color=3D=
%238C500B&src=3Dsc7rov4ck552t2f0pav120t7r0%40group.calendar.google.com&col=
or=3D%23528800&src=3Dtheyoctoproject%40gmail.com&color=3D%23182C57&ctz=3DA=
merica%2FLos_Angeles=20
>>>=20
>>> Please feel free to let me and Beth know if you have any concerns or =
questions.
>>>=20
>>> Thanks!
>>> Song
>>> PM, Yocto Project
>>=20
>> Hi,
>>=20
>> I don't see any commits tagged for these milestones in
>> git.openembedded.org/openembedded-core at the moment. Will there be a
>> release tag or a release branch created on the git repository when YP
>> 1.2 comes out, to indicate people that there's a "stable" version of
>> oe-core they can use ?
>=20
> Yes, there will be a branch created on OE-Core.=20
>=20
> At this point the actual branch naming/tagging is a little in flux.
> There was some discussion about this at collaboration summit and the =
BSP
> summit but there was no conclusion.
>=20
> I've tried to write an email on the subject and it basically goes =
around
> in circles. Ideally we need a scheme which can be used in all the =
layers
> which doesn't contain numbers as these may conflict with various layer
> schemes. The poky release names at least do that. Ideally people also
> want something sortable with more context such as the year. Doing this
> without numbers is harder.
>=20
> I'm reluctant to change the numbering/branch scheme at this point in a
> release as its unfair to release engineering and the documentation
> maintainers.

Any update on this? I'd like to have the angstrom scripts and =
repositories ready before the end of the week and having some form of =
agreement on branch/tag naming would be awesome.

regards,

Koen



