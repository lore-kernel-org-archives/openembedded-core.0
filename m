Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RjD0H-0002wq-I8
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:50:53 +0100
Received: by wgbdt12 with SMTP id dt12so1890407wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 08:43:26 -0800 (PST)
Received: by 10.181.13.208 with SMTP id fa16mr8434954wid.12.1325868206086;
	Fri, 06 Jan 2012 08:43:26 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f7sm3265712wiy.11.2012.01.06.08.43.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 08:43:21 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1325866615.14746.4.camel@ted>
Date: Fri, 6 Jan 2012 17:43:20 +0100
Message-Id: <D1209EE7-DEDD-4F90-B98D-C185FE16578E@dominion.thruhere.net>
References: <20120106100934.GA3879@jama.jama.net>
	<77ADD6E7-5632-4B1A-ABC3-6E4DAEEAE3B6@dominion.thruhere.net>
	<4F071A65.90708@windriver.com>
	<CABcZANk=sg=oj+KyVcBF=UoC460EV-QtiW4B=wKXPBSLrV4HOQ@mail.gmail.com>
	<1325866615.14746.4.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 16:50:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2012, om 17:16 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-01-06 at 09:04 -0700, Chris Larson wrote:
>> On Fri, Jan 6, 2012 at 8:59 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>>> On 1/6/12 4:34 AM, Koen Kooi wrote:
>>>>=20
>>>>=20
>>>> Op 6 jan. 2012, om 11:09 heeft Martin Jansa het volgende =
geschreven:
>>>>=20
>>>>> FWIW today I've noticed that systemd is going other way around
>>>>> =
http://www.freedesktop.org/wiki/Software/systemd/separate-usr-is-broken
>>>>=20
>>>>=20
>>>> And http://fedoraproject.org/wiki/Features/UsrMove
>>>>=20
>>>> I guess it's time to publish my angstrom branch doing that after =
the
>>>> holidays :)
>>>=20
>>>=20
>>> I respectfully disagree with both of the above URLs.
>>>=20
>>> The root partition is still very useful as a "small" set of =
applications and
>>> libraries required for booting.
>>>=20
>>> Most systems these days contain a combined root and usr partition, =
which is
>>> fine.  However, there are a lot of systems that I've worked on in =
the past
>>> and I expect in the future that, root being a small R/O system is =
necessary.
>>>=20
>>> initramfs can solve some problems, but introduces other issues.  =
Many of the
>>> systems I've worked on simple don't have enough flash to be able to =
store
>>> the bootloader, kernel and an initramfs [as well as other system =
items
>>> required by the devices].  In this case a base rootfs makes the most =
sense.
>>=20
>> In my opinion, what's proposed in the two links is a good thing even
>> for embedded. Not that we'd use that structure necessarily, but
>> removing the usr vs non-usr separation for binaries and libs is a =
good
>> thing regardless. Putting /usr in the rootfs still would still work
>> fine, or you could drop usr entirely and move everything to / the way
>> micro does.
>=20
> The nice thing is we have a system which can actually support the
> different options relatively easily and without much conflict.

Except that things like fs-perms.txt store hardcoded values :(=


