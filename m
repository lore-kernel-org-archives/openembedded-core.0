Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PurRb-0000P0-Q3
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 20:10:44 +0100
Received: by wyb38 with SMTP id 38so320858wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 11:09:15 -0800 (PST)
Received: by 10.216.167.65 with SMTP id h43mr1062711wel.17.1299092954993;
	Wed, 02 Mar 2011 11:09:14 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id n1sm141423weq.31.2011.03.02.11.09.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 11:09:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D6E93F7.8030903@windriver.com>
Date: Wed, 2 Mar 2011 20:09:13 +0100
Message-Id: <A74A967F-ECB6-417E-A9B4-64E2B8C1D988@dominion.thruhere.net>
References: <4D6E93F7.8030903@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: trying to use oe-core, and failing
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
X-List-Received-Date: Wed, 02 Mar 2011 19:10:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt 2011, om 20:01 heeft Mark Hatle het volgende geschreven:

> Ok, I'm trying to use oe-core...
>=20
> What I have done is git checkout of the openembedded-core repository, =
then
> checked out the bitbake repository.
>=20
> I run the poky-init-build-env, and attempt to build something..  I end =
up with
> an error:
>=20
> Failure expanding variable SRCPV, expression was =
${@bb.fetch2.get_srcrev(d){
> which triggered exception AttributeError: 'module' object has no =
attribute fetch2.
>=20
> So clearly something is wrong with my setup.  Is there a specific =
setup that
> should allow me to start helping with the cleanup?

You need something like =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/commit=
/?h=3Doe-core&id=3D03810d5813044a17731c2da6bbc627c7292033a8

regards,

Koen=


