Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVsYa-0000kh-LE
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:23:12 +0100
Received: by eaad13 with SMTP id d13so1341430eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:16:32 -0800 (PST)
Received: by 10.216.135.40 with SMTP id t40mr440547wei.41.1322691391589;
	Wed, 30 Nov 2011 14:16:31 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fi11sm3594844wbb.9.2011.11.30.14.16.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 14:16:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322690810.17484.55.camel@ted>
Date: Wed, 30 Nov 2011 23:16:25 +0100
Message-Id: <17E08F88-ED70-4CFC-98F5-DFFEDFCC128C@dominion.thruhere.net>
References: <1322680162-24126-1-git-send-email-koen@dominion.thruhere.net>
	<1322690810.17484.55.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gdbm 1.10: use lib_package.bbclass to match packaging with 1.8.x
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
X-List-Received-Date: Wed, 30 Nov 2011 22:23:12 -0000
X-Groupsio-MsgNum: 13339
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EADF6A5D-4F44-4DE4-9FEC-746816F762C1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EADF6A5D-4F44-4DE4-9FEC-746816F762C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 23:06 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-11-30 at 20:09 +0100, Koen Kooi wrote:
>> SOVERSION changed from 3 to 4, so PR bump for dependant recipes =
(perl, pulseaudio) are needed as well)
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-support/gdbm/gdbm_1.10.bb |    4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> I merged patches 1-3 to master, thanks.
>=20
> I had to fix up the pulseaudio one as you evidently had other patches
> applied before it (I can guess which ones).

The pulseaudio patch did mention that below the scissor line :)=

--Apple-Mail=_EADF6A5D-4F44-4DE4-9FEC-746816F762C1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WqzwACgkQMkyGM64RGpHhGACeMVn7Np3i43zMM9NbF03jBACy
/hcAnifyD6IWNeNCV3/zBzdNBR0mMqEg
=g8aK
-----END PGP SIGNATURE-----

--Apple-Mail=_EADF6A5D-4F44-4DE4-9FEC-746816F762C1--
