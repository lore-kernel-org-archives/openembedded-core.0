Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFu85-0002Z8-Ln
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 23:26:53 +0100
Received: by mail-ye0-f175.google.com with SMTP id j12so277059yeg.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 15:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=k9eFKoEglfBKccoBbisxy2OxAoAuqjWisyf5ag3wKP8=;
	b=Z+iJMOJBebgiIBRrV3Q9us4NJSfDtEKxLRpSutGkwQg7y0Y74dISZPz59FfDRElnHA
	jSm/+mwAL9/KJHsEQQbwCbUPwWmu0RitI40WRt8gpyGUKZ0LLGWM58J+LAXUsiedP0PO
	zj7BQ13S2rHrSImzDGOIXyuW/5uwey08g4Pa/gVEyvtMCqIdEyk5HcipIHROVp4gwM/J
	QuHT0y0f27y07sk07Sll6w0tMHvq2NqVcQF6KE0JfUXTtN/lMnv0BfHeM7cZUXBfhAiv
	3kEA5OZtDsU7aByCBvO3cPgHKe/FUO/bojCt1RS/aFjM0/Kr+OHvL6H0T6JC32bL3uJj
	OpkA==
X-Received: by 10.236.148.164 with SMTP id v24mr13466888yhj.116.1363212596061; 
	Wed, 13 Mar 2013 15:09:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w2sm257285yhh.7.2013.03.13.15.09.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 15:09:54 -0700 (PDT)
Date: Wed, 13 Mar 2013 23:09:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130313220947.GF3260@jama>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
	<980599F4-DEED-41CF-B871-750758BD6D45@dominion.thruhere.net>
	<1363114248.9859.17.camel@ted>
	<492A89BB-593D-44E2-98B7-549EE53FFA56@dominion.thruhere.net>
	<1363202319.28128.36.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1363202319.28128.36.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 22:27:16 -0000
X-Groupsio-MsgNum: 36590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xa9f45Qb6lv8AimG"
Content-Disposition: inline

--xa9f45Qb6lv8AimG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 07:18:39PM +0000, Richard Purdie wrote:
> On Wed, 2013-03-13 at 10:09 +0100, Koen Kooi wrote:
> > Op 12 mrt. 2013, om 19:50 heeft Richard Purdie <richard.purdie@linuxfou=
ndation.org> het volgende geschreven:
> > > On Tue, 2013-03-12 at 08:42 +0100, Koen Kooi wrote:
> > >> Op 11 mrt. 2013, om 23:49 heeft Khem Raj <raj.khem@gmail.com> het vo=
lgende geschreven:
> > >> Upgrading between 1.3 and 1.4 is already impossible for non-systemd
> > >> related reasons.
> > >=20
> > > Which reasons?
> >=20
> > Warning, handwaving ahead: Renamed packages, differently split packages=
 et cetera.
>=20
> I thought we'd put Conflicts/Provides and other pieces in place to try
> and avoid this? If there are issues, I'm open to patches which help
> address the problems.

I try to report such issues as soon as they are introduced to developer
who introduced them, but quite often those emails got no reply and issue
is forgotten.

I know I should report them in bugzilla, but I usually use oe-commits
list to find what changed since my last successful opkg upgrade and it's
faster to just reply there then to create new bug report.

Most of those issues would be detected by developers if they build with
buildhistory enabled and do upgrade on target device.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xa9f45Qb6lv8AimG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFA+SsACgkQN1Ujt2V2gByhigCgpgOH6b/KRLykivgITVgJidg6
PlAAn3vI6BSiLZwi9JPSW/bZFU73Yo+d
=/h29
-----END PGP SIGNATURE-----

--xa9f45Qb6lv8AimG--
