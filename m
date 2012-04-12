Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SIGUj-0001th-9q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 11:39:13 +0200
Received: by wera1 with SMTP id a1so1131268wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 02:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Rt4jIAeVQdlhxhdXCJyezGcSCft65tv28dOsuBTF8PU=;
	b=o81qiVUAEK3uBTkujpC1RzkxFujpfWebk6RfgxjTHdKMPBnmaToWV5diF+2yfMNjWS
	jJqRHQR5ria31rmKi1dSFfPHf8ltHwniNR8vzN3MakvSAkFIwDqf1D4OOR0aFnMg/5ZX
	XFk6MtOjO++6QE+2NmjxKPdapn6H0atNcAf2Ww97+ckHTjxhZ1pKk8r8UFv9yQqmNwjJ
	cl5S8IMrqSVqF4zGXx2LtnHkYF5okMXTsHqSF6+ReLN9+JrGbVxipWKzmWOAYr+SA9k+
	K6hvC31vAVu4AKMS6dBPsyd57sCtDjO8OH6Lhu7w4GSSzDTZVPQaFrghvG/I2qG429rM
	or+Q==
Received: by 10.180.88.199 with SMTP id bi7mr4147436wib.12.1334222993356;
	Thu, 12 Apr 2012 02:29:53 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n8sm19622122wix.10.2012.04.12.02.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 02:29:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334221321.31685.24.camel@ted>
Date: Thu, 12 Apr 2012 11:29:47 +0200
Message-Id: <4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnGrQgwHHXJYH8TSYaK7AHH9SkGRihcWvWl8N9PnZ3vxuwdC/j1z8cOIiAh48RcQYgIYpzj
Cc: Julian Pidancet <julian.pidancet@gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2012 09:39:13 -0000
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

I'm still a big fan of using 'yoctoproject-1.2' as substring for tags =
and branches. The objections I heard to that didn't make sense to me, =
but I see this as a purely technical matter where others see it as =
something different :)

> I'm reluctant to change the numbering/branch scheme at this point in a
> release as its unfair to release engineering and the documentation
> maintainers.


"it's only software" :p

regards,

Koen=


