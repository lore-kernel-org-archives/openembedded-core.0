Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RE3Po-0000Bd-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 20:20:28 +0200
Received: by eyd9 with SMTP id 9so1032561eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 11:14:45 -0700 (PDT)
Received: by 10.223.15.147 with SMTP id k19mr200536faa.26.1318443284810;
	Wed, 12 Oct 2011 11:14:44 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n18sm4996090fah.2.2011.10.12.11.14.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 11:14:44 -0700 (PDT)
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com> <4E95D811.7090105@gravedo.de>
In-Reply-To: <4E95D811.7090105@gravedo.de>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <1E1E70C9-6B15-497F-8571-78D2EF0CD081@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 12 Oct 2011 20:14:30 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 12 Oct 2011 18:20:28 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



Op 12 okt. 2011 om 20:10 heeft Simon Busch <morphis@gravedo.de> het volgende=
 geschreven:

> On 12.10.2011 10:02, Eric B=C3=A9nard wrote:
>> Hi,
>>=20
>> Le 12/10/2011 09:45, Martin Jansa a =C3=A9crit :
>>> From: Simon Busch<morphis@gravedo.de>
>>>=20
>>> In most cases we don't need tslib in std. configuration as touchscreen
>>> access in most
>>> devices today is done with linux input interface. If some specific
>>> machine has a need for
>>> tslib support it should add the dependency in it's machine layer again
>>> and modify the
>>> profile script accordingly.
>>>=20
>> When using a resistive touchscreen, tslib is a common solution to handle
>> calibration and raw value processing : do you think this is a good thing
>> to remove this ?
>=20
> Thats up to the environment you are using qt4-embedded in. In my case
> the setup is a little bit more complicated. We're using tslib but not
> directly in qt4-embedded (we can get rid of tslib completely but time is
> missing).
>=20
> I removed the dependency from qt4-embedded as qt4-embedded in oe-core
> should be the general thing used in all environments and therefore
> should be only a minimal setup with minimal dependencies.

No, it should work in most cases, breaking qt:e like is not acceptable.






>=20
> If someone needs tslib for qt4-embedded for his machine layer he should
> include tslib support in the machine layer itself.
>=20
> regards,
> Simon
>=20
> --=20
> Simon Busch - http://mm.gravedo.de/blog/
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


