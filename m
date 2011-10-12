Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RE4H0-0001lb-Bu
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:15:26 +0200
Received: by gyg8 with SMTP id 8so1023852gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:09:42 -0700 (PDT)
Received: by 10.223.16.82 with SMTP id n18mr612531faa.2.1318446581754;
	Wed, 12 Oct 2011 12:09:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b10sm5240188fam.1.2011.10.12.12.09.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 12:09:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E95DDD0.7020302@gravedo.de>
Date: Wed, 12 Oct 2011 21:09:39 +0200
Message-Id: <E575A7CF-9F72-418C-8143-9BA2701599BC@dominion.thruhere.net>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com> <4E95D811.7090105@gravedo.de>
	<1E1E70C9-6B15-497F-8571-78D2EF0CD081@dominion.thruhere.net>
	<4E95DDD0.7020302@gravedo.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [oe-core 1/4] qt4-embedded: remove dependency on tslib and use std. linux input
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
X-List-Received-Date: Wed, 12 Oct 2011 19:15:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 okt. 2011, om 20:34 heeft Simon Busch het volgende geschreven:

> On 12.10.2011 20:14, Koen Kooi wrote:
>>=20
>>=20
>> Op 12 okt. 2011 om 20:10 heeft Simon Busch <morphis@gravedo.de> het =
volgende geschreven:
>>=20
>>> On 12.10.2011 10:02, Eric B=E9nard wrote:
>>>> Hi,
>>>>=20
>>>> Le 12/10/2011 09:45, Martin Jansa a =E9crit :
>>>>> From: Simon Busch<morphis@gravedo.de>
>>>>>=20
>>>>> In most cases we don't need tslib in std. configuration as =
touchscreen
>>>>> access in most
>>>>> devices today is done with linux input interface. If some specific
>>>>> machine has a need for
>>>>> tslib support it should add the dependency in it's machine layer =
again
>>>>> and modify the
>>>>> profile script accordingly.
>>>>>=20
>>>> When using a resistive touchscreen, tslib is a common solution to =
handle
>>>> calibration and raw value processing : do you think this is a good =
thing
>>>> to remove this ?
>>>=20
>>> Thats up to the environment you are using qt4-embedded in. In my =
case
>>> the setup is a little bit more complicated. We're using tslib but =
not
>>> directly in qt4-embedded (we can get rid of tslib completely but =
time is
>>> missing).
>>>=20
>>> I removed the dependency from qt4-embedded as qt4-embedded in =
oe-core
>>> should be the general thing used in all environments and therefore
>>> should be only a minimal setup with minimal dependencies.
>>=20
>> No, it should work in most cases, breaking qt:e like is not =
acceptable.
>=20
> What is breaking qt:e in this case? For me it's just a feature =
reduction
> and not a break (as qt:e still works fine with the linux input =
interface).

When your TS is suddenly uncalibrated and jittery, it's a breakage, not =
a feature reduction.=


