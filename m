Return-Path: <angstrom-dev@emagii.com>
Received: from smtprelay-b21.telenor.se (smtprelay-b21.telenor.se
	[195.54.99.212])
	by mail.openembedded.org (Postfix) with ESMTP id 22AC76BA14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 17:05:38 +0000 (UTC)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id C894AEBFFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 19:05:39 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtUeAI9pYVJT4ztUPGdsb2JhbAANTYt0tkCBNwMBAQEBOIJaAQEBAQIBOj8QC0ZDFAYTiACuE5MmjyMzB4MfgQoDmAmKQopr
X-IronPort-AV: E=Sophos;i="4.93,523,1378850400"; d="scan'208";a="413604474"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.117]) ([83.227.59.84])
	by ipb5.telenor.se with ESMTP; 18 Oct 2013 19:05:39 +0200
References: <52615ACB.1010203@emagii.com>
	<34C59EF9-AA69-48F2-ACE4-6BBAAA88FD4A@dominion.thruhere.net>
In-Reply-To: <34C59EF9-AA69-48F2-ACE4-6BBAAA88FD4A@dominion.thruhere.net>
Mime-Version: 1.0 (1.0)
Message-Id: <8D2F1DD0-3071-47B6-82E3-646A6C881708@emagii.com>
X-Mailer: iPad Mail (9B176)
From: Ulf Samuelsson <angstrom-dev@emagii.com>
Date: Fri, 18 Oct 2013 19:05:39 +0200
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with PREFERRED_VERSION/PREFERRED_PROVIDER for the kernel
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
X-List-Received-Date: Fri, 18 Oct 2013 17:05:39 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

In some cases, you might want to override a few things in the DISTRO.

Maybe an easy way to handle this would be if the DISTRO conf file=20
included an empty file at the end,=20
which can be overridden by a file in your own layer.

Best Regards
Ulf Samuelsson

18 okt 2013 kl. 18:31 skrev Koen Kooi <koen@dominion.thruhere.net>:

>=20
> Op 18 okt. 2013, om 17:59 heeft Ulf Samuelsson <angstrom-dev@emagii.com> h=
et volgende geschreven:
>=20
>> 1. If you define something in the <MACHINE>.conf and in <DISTRO>.conf
>>   then <DISTRO>.conf has higher priority.
>>   This is really non-intuitive.
>=20
> It is correct however, if the DISTRO defines it, it's a DISTRO setting tha=
t a MACHINE.conf really should stay away from.
>=20
> regards,
>=20
> KOen

