Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SINsI-0003Ho-OT
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 19:32:02 +0200
Received: by wera1 with SMTP id a1so1429768wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=oLtngHjo1XbVeJzJRdBc4Q6aQDyGcki1+6NFtpzGSfA=;
	b=BUhzkiZ+U5Z5qvkb+AcIQSCKyD8FxkfDdI+otRPptUreXjr4EoIcpzaf/9TnzXr54/
	doFg7s6+RQi6CkTisb1nc1EFz1kO/9Zo3ssC0hcUuxXWYkkY2cl6/ZYkzwqMZ4YckJHr
	BSysg6mj/bbLyYv862y2dFQtlWvfah9ouGM5NH+P9avIX6YxuZzCc8ro688wFyVaHOLM
	bZ+ob34ZwZ0/gfNXsdrIhzb/V/vRxrGvkysKgpd3llqZ04b6IpF49Ho8+wmGEXZCNr4m
	Hr3ZeZ0Xn/mnBualUseWBvHT+PPQIannjnbnCE3A5FIIZytQ7rmUO7YYpAoBfURtn3k1
	Fs6Q==
Received: by 10.180.95.197 with SMTP id dm5mr17570985wib.20.1334251362035;
	Thu, 12 Apr 2012 10:22:42 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm53596129wib.2.2012.04.12.10.22.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 10:22:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
Date: Thu, 12 Apr 2012 19:22:36 +0200
Message-Id: <D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlzWTyBzPaTHrzhlbAOlPvoeVmyIJ5VozmMmor1zYo/4gdgChmWFzbAWocLrDi/mUaUG62Z
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
X-List-Received-Date: Thu, 12 Apr 2012 17:32:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 18:55 heeft Khem Raj het volgende geschreven:

> On Thu, Apr 12, 2012 at 2:29 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 12 apr. 2012, om 11:02 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Wed, 2012-04-11 at 01:51 +0100, Julian Pidancet wrote:
>>>> On 04/09/12 19:01, Liu, Song wrote:
>>>>> Hi all,
>>>>>=20
>>>>> This is to restate and clarify the schedule for Yocto Project 1.2 =
M4 (milestone 4). If you are concerned or have patches you would like to =
merge, please see the following dates:
>>>>>=20
>>>>> 1. RC3 official patch cut-off time: 12:00AM April 8th, 2012, PDT
>>>>> 2. RC3 build: April 11th, 2012, PDT
>>>>> 3. RC4 official patch cut-off time: 12:00AM April 15th, 2012, PDT
>>>>> 4. RC4 build: April 18th, 2012, PDT
>>>>> 5. YP 1.2 release: April 27th, 2012, PDT
>>>>>=20
>>>>> You can also check out the schedule here: =
https://www.google.com/calendar/embed?height=3D600&wkst=3D1&bgcolor=3D%23F=
FFFFF&src=3Dmg0m150m30gs891eqqhtfu5jgg%40group.calendar.google.com&color=3D=
%238C500B&src=3Dsc7rov4ck552t2f0pav120t7r0%40group.calendar.google.com&col=
or=3D%23528800&src=3Dtheyoctoproject%40gmail.com&color=3D%23182C57&ctz=3DA=
merica%2FLos_Angeles
>>>>>=20
>>>>> Please feel free to let me and Beth know if you have any concerns =
or questions.
>>>>>=20
>>>>> Thanks!
>>>>> Song
>>>>> PM, Yocto Project
>>>>=20
>>>> Hi,
>>>>=20
>>>> I don't see any commits tagged for these milestones in
>>>> git.openembedded.org/openembedded-core at the moment. Will there be =
a
>>>> release tag or a release branch created on the git repository when =
YP
>>>> 1.2 comes out, to indicate people that there's a "stable" version =
of
>>>> oe-core they can use ?
>>>=20
>>> Yes, there will be a branch created on OE-Core.
>>>=20
>>> At this point the actual branch naming/tagging is a little in flux.
>>> There was some discussion about this at collaboration summit and the =
BSP
>>> summit but there was no conclusion.
>>>=20
>>> I've tried to write an email on the subject and it basically goes =
around
>>> in circles. Ideally we need a scheme which can be used in all the =
layers
>>> which doesn't contain numbers as these may conflict with various =
layer
>>> schemes. The poky release names at least do that. Ideally people =
also
>>> want something sortable with more context such as the year. Doing =
this
>>> without numbers is harder.
>>=20
>> I'm still a big fan of using 'yoctoproject-1.2' as substring for tags =
and branches. The objections I heard to that didn't make sense to me, =
but I see this as a purely technical matter where others see it as =
something different :)
>>=20
>=20
> I think that string is fine as long as its just for yocto but I think
> for OE-Core we are going to do a General release
> so tagging that with something yocto project will be very confusing
> unless we plan to do different releases of OE-Core for general
> availability
> and yocto project. I dont think we have bandwidth for that. And since
> poky repository makes a copy of OE-Core metadata it can be tagged in
> yoctoproject specific tags
>=20
> since OE-Core is at center of all layers I would propose that other
> layers when tagged contain OE-Core's release tag in their own tags
> name
>=20
> so something like <layer-tag>-<OE-Core-tag its targetting>

You just volunteered to handle all the "Does it work with yocto 1.2?" =
questions :)=20

Simply put: people are stupid, they need explicit PHB compliant names in =
tags, even if it isn't 100% politically correct to say "yocto" when we =
actually mean "oe-core".

Unless the yocto 1.2 release note state that it's based on oe-core "foo" =
and all layers compatible with "foo" use "foo" in tags/branches.=


