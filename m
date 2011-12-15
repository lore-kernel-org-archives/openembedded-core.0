Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rb7he-0006ho-Eo
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 10:34:14 +0100
Received: by faaa20 with SMTP id a20so2046818faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 01:27:16 -0800 (PST)
Received: by 10.180.92.234 with SMTP id cp10mr3289088wib.28.1323941236046;
	Thu, 15 Dec 2011 01:27:16 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hn15sm7389169wib.22.2011.12.15.01.27.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 01:27:14 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALT56yNAeCns9Ft4yr9fH2tnWtW-WERiJ=soKOqJGbHEJjVA4Q@mail.gmail.com>
Date: Thu, 15 Dec 2011 10:27:21 +0100
Message-Id: <CA067797-AB29-4EBA-8561-5ED321E9D0A8@dominion.thruhere.net>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<4EE7EA96.4080806@linux.intel.com>
	<CALT56yNAeCns9Ft4yr9fH2tnWtW-WERiJ=soKOqJGbHEJjVA4Q@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] kernel.bbclass: compile kernel and modules in a single task
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
X-List-Received-Date: Thu, 15 Dec 2011 09:34:14 -0000
X-Groupsio-MsgNum: 14235
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A67B5CE2-CA23-476F-ABD0-3AF0116A5007";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A67B5CE2-CA23-476F-ABD0-3AF0116A5007
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 14 dec. 2011, om 01:17 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> On Wed, Dec 14, 2011 at 4:15 AM, Darren Hart <dvhart@linux.intel.com> =
wrote:
>>=20
>>=20
>> On 12/13/2011 08:19 AM, Dmitry Eremin-Solenikov wrote:
>>> There is no point in compiling kernel modules in a separate task, =
run
>>> right after do_compile. On the other hand merging those tasks will =
e.g.
>>> make icecc used also for modules compilation, etc.
>>=20
>> This split was done intentionally to allow tasks to be inserted =
between
>> compile and compile_kernelmodules. See:
>=20
> Could you (or Koen) name any tasks that have to be inserted between =
kernel
> and modules compilation please?

Building external modules that are referenced by internal ones for =
example. But besides that, this also allows me to build just *Image =
quickly and not having to wait for the modules to build.=20=

--Apple-Mail=_A67B5CE2-CA23-476F-ABD0-3AF0116A5007
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7pvXkACgkQMkyGM64RGpE2pwCdFjZuuNW4ler8ES4OsKddTaB2
JnIAn0ME2FOwLyXeCS2DDBsTwKBFUKDt
=l9hr
-----END PGP SIGNATURE-----

--Apple-Mail=_A67B5CE2-CA23-476F-ABD0-3AF0116A5007--
