Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S0aky-0003PZ-Oi
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:38:57 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 60D2F4B017E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 16:30:33 +0100 (CET)
Date: Thu, 23 Feb 2012 16:30:32 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120223163032.0822e104@eb-e6520>
In-Reply-To: <1329828974.15011.7.camel@ted>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<1329828974.15011.7.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Thu, 23 Feb 2012 15:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Le Tue, 21 Feb 2012 12:56:14 +0000,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
>=20
> What was the output? (I realise I can find out)
>=20
> With usability issues like this, opening a bug in
> bugzilla.yoctoproject.org is a good idea, particularly as we've been
> focusing on cleaning up this kind of problem. Reporting them with a
> known reproducible test case helps a lot as when you're looking to try
> and fix these things, you need a good set of reproducers.=20
>=20
> As a quick plug for the work that's been done already, we've now worked
> through many of the issues that were reported so it is worth taking the
> time to report them! :)
>=20
I had also a bitbake failure after an error in an image and bitbake
exited without any information concerning the error (even when running
with -DDD I didn't managed to see a log - but I must admit I didn't
search in the whole history).

Basically I had :
XSERVER +=3D "    <=3D=3D=3D=3D missing \
	xf86-input-tslib \
	"
and bitbake exit with :
ERROR: Command execution failed: Exited with 1
et nothing more.

Eric



--=20
http://eukrea.com/en/news/104-2012


