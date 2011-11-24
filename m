Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTd2v-0004nn-V5
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 18:25:14 +0100
Received: by bkbzs2 with SMTP id zs2so3029776bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:18:40 -0800 (PST)
Received: by 10.204.13.78 with SMTP id b14mr16013712bka.23.1322155120204;
	Thu, 24 Nov 2011 09:18:40 -0800 (PST)
Received: from [10.0.2.4] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	e20sm25895025fab.2.2011.11.24.09.18.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 09:18:39 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 24 Nov 2011 18:18:37 +0100
In-Reply-To: <4ECE77F9.5090703@balister.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECBE307.1080600@linaro.org> <4ECE77F9.5090703@balister.org>
Message-Id: <AEC348F4-E0E7-4267-A8AA-740EC42E6796@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Getting started on creating a layer for OE-Core
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
X-List-Received-Date: Thu, 24 Nov 2011 17:25:14 -0000
X-Groupsio-MsgNum: 12910
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5A46D208-B86A-4428-9AAC-4B1C274E89F0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5A46D208-B86A-4428-9AAC-4B1C274E89F0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 24 nov. 2011, om 17:59 heeft Philip Balister het volgende geschreven:

> On 11/22/2011 12:59 PM, Ken Werner wrote:
>> Hi,
>>=20
>> I'm currently reading the OpenEmbedded User Manual and wondering =
what's
>> the best way to add a layer for the Linaro toolchain components =
(Linaro
>> GCC, Linaro GDB). This is my first time with OE. I just setup the
>> environment and started to build an image that targets qemuarm =
(bitbake
>> is still building). Any suggestions or general help is much =
appreciated.
>=20
> Can you comment on what you expect to get out of the Linaro toolchain =
layer?
>=20
> As had been noted here, OE already has some of the Linaro work in the
> toolchains. However, we have had issues with some patches so we can't
> run a "complete Linaro toolchain". (Toolchain guys, correct me if I am
> wrong)

There are 2 sets of problems:

1) OE-core needs to support more than just ARMv7 and up
2) Not every patch is an improvement

For 1) we need to add patches and sometimes take out patches. For 2) we =
usually remove the patch that breaks things, but sometimes we add a =
backport.

[..]

> So I see the point of a dedicated Linaro tool layer being an excellent
> vehicle for testing Linaro's work on a diverse set of machines to make
> life easier for people using Linaro's work on other architectures.

The exact same can be said by including most if not all linaro patches =
into the default toolchain. Having said that, a layer with 'pure' =
versions of the toolchain, uboot, kernel, etc as reference is a nice =
thing to have. But since we only have a finite amount of effort to =
spread around I'd advice working on OE-core instead of a seperate =
sandbox.

regards,

Koen=

--Apple-Mail=_5A46D208-B86A-4428-9AAC-4B1C274E89F0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7OfHAACgkQMkyGM64RGpFcAQCdHTqDhCnQ/fCMwlF0WMBvJwYl
u6gAoJzEN+sFcCplz8Vw9q9g+H7XSMkY
=53J8
-----END PGP SIGNATURE-----

--Apple-Mail=_5A46D208-B86A-4428-9AAC-4B1C274E89F0--
