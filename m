Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SIQHi-0000xp-Ab
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 22:06:26 +0200
Received: by wera1 with SMTP id a1so1523651wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 12:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=cLVXfAGbeKCkZxUUQLkgt7iDnGkPMHhFn8VwRzg6D8A=;
	b=XILk9NsNEz7TdcopAA0T1A9cBBgX0eV6kf7C1kE084fRPtFBQUyFNU5ps7aFEO9NkB
	Pe+uG69JC5GEFEEWgpC2e5Mqio1lJVbnkXfGGq2s0PRpORDXr+9Gc/L5lhZgAAAFSd5D
	nKlhWqw4RA2ha9DPQ2xvtJt6q6rK9Z0KJf1pFgvhWLBGVnH5+ockyhkqVH3A40m+3pnv
	0nFdk0LvmymLreFFSlgfS+YEp66II+bMMFOO8Ckh9jGS+dZgvGHezdxfYBdPshTqpe+g
	c+SzHTp9uYhHOj8I/kYKPW0VI4nc48FLRUQN+DsLWs1s7QfjO92qR/Gc/tHsYav1W9JU
	4JaQ==
Received: by 10.180.107.104 with SMTP id hb8mr8758051wib.8.1334260626027;
	Thu, 12 Apr 2012 12:57:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm54515372wib.2.2012.04.12.12.57.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 12:57:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F873102.6020603@balister.org>
Date: Thu, 12 Apr 2012 21:57:02 +0200
Message-Id: <DE32AA93-7E17-480C-9027-DB6EA6F2A0C0@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>	<4F84D58F.8020608@gmail.com>
	<1334221321.31685.24.camel@ted>	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<1334256020.7309.45.camel@ted> <4F873102.6020603@balister.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmxLuNryLB7uVLdI8Zgm2nO+9tIiPCs3BXyngUFT5ufCb5dopA2eMc99l0Opjl6Aep1bhWB
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
X-List-Received-Date: Thu, 12 Apr 2012 20:06:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 21:46 heeft Philip Balister het volgende geschreven:

> On 04/12/2012 11:40 AM, Richard Purdie wrote:
>> On Thu, 2012-04-12 at 14:32 -0300, Otavio Salvador wrote:
>>> On Thu, Apr 12, 2012 at 14:22, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>> You just volunteered to handle all the "Does it work with yocto =
1.2?" questions :)
>>>>=20
>>>> Simply put: people are stupid, they need explicit PHB compliant =
names in tags, even if it isn't 100% politically correct to say "yocto" =
when we actually mean "oe-core".
>>>>=20
>>>> Unless the yocto 1.2 release note state that it's based on oe-core =
"foo" and all layers compatible with "foo" use "foo" in tags/branches.
>>>=20
>>> I think layers ought to have tags for both ...
>>>=20
>>> <layer>-oe-core-<tag>
>>> <layer>-yocto-<tag>
>>=20
>> This would be rather sad if it were necessary. The whole point is =
we're
>> trying to build things which are compatible with each other. If that
>> turns out not to be the case I want to fix it, not encourage it.
>=20
> We need a coherent tag name to use across layers. The Yocto Project is
> the umbrella project, so using the yocto-project in the tag name is a
> good way to show this coordination among projects to people not =
familiar
> with how things are working. (As Koen notes, this makes communication
> with people whose primary exposure to the Yocto Project is watching
> youtube videos)
>=20
> I do not want to see table containing Yocto Project release =
information
> and they relate to a set of seemingly random tags in other layers.
>=20
> Philip
>=20
> PS: For various reasons, the tag needs to be yocto-project.... not =
yocto....

"yoctoproject", without the hyphen to be consistent with the domainname =
:)=


