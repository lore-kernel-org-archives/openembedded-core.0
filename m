Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDv58-0008NC-Pi
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 11:26:34 +0200
Received: by dyk17 with SMTP id 17so10849dyk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 02:20:48 -0700 (PDT)
Received: by 10.223.92.144 with SMTP id r16mr45609668fam.23.1318411247734;
	Wed, 12 Oct 2011 02:20:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b10sm2677932fam.1.2011.10.12.02.20.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 02:20:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E954984.7020202@eukrea.com>
Date: Wed, 12 Oct 2011 11:20:41 +0200
Message-Id: <E9665FD1-F0CD-4ADB-941C-68FC58674D08@dominion.thruhere.net>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2011 09:26:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 okt. 2011, om 10:02 heeft Eric B=E9nard het volgende geschreven:

> Hi,
>=20
> Le 12/10/2011 09:45, Martin Jansa a =E9crit :
>> From: Simon Busch<morphis@gravedo.de>
>>=20
>> In most cases we don't need tslib in std. configuration as =
touchscreen access in most
>> devices today is done with linux input interface. If some specific =
machine has a need for
>> tslib support it should add the dependency in it's machine layer =
again and modify the
>> profile script accordingly.
>>=20
> When using a resistive touchscreen, tslib is a common solution to =
handle calibration and raw value processing : do you think this is a =
good thing to remove this ?

We ran into this at work and like Eric, I'm curious how calibration (and =
e.g. dejitter) works in the linux-input world combined with qt/e.

regards,

Koen=


