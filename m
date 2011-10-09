Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCnuK-00053w-Hs
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 09:34:48 +0200
Received: by bke11 with SMTP id 11so7087068bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x3fOHu5vNJ3qBbA53NetNmkPlglzYXOhV6jLMDQN35o=;
	b=gTtsd1exD8GLMJ3RBi2p2xRH99dRRFeHIyPNQvXdaTLjTRxtz/m1aBYKYaQ4NsTO5F
	TLrsDVn+oaTIPmDS99tbnBHOTj2DiTENteQNEAg+H6O7ILjAmWWgF6NE/A8HEybYFb8x
	lXIM8zeN2PLIZh6lnYVEUaTazIgWIPT7yCRG4=
Received: by 10.223.64.65 with SMTP id d1mr23169092fai.32.1318145348868;
	Sun, 09 Oct 2011 00:29:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n12sm23436810fan.9.2011.10.09.00.29.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 00:29:07 -0700 (PDT)
Date: Sun, 9 Oct 2011 09:29:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111009072900.GA3847@jama.jama.net>
References: <4E907597.3090507@balister.org>
	<CAMKF1soz1FCyCZwA2Oe14q2e=RrxVZmJ3iVjQ=-P+fUghRYP3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soz1FCyCZwA2Oe14q2e=RrxVZmJ3iVjQ=-P+fUghRYP3g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: binutils from meta-oe does build build
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
X-List-Received-Date: Sun, 09 Oct 2011 07:34:48 -0000
X-Groupsio-MsgNum: 10718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2011 at 06:01:36PM -0700, Khem Raj wrote:
> On Sat, Oct 8, 2011 at 9:08 AM, Philip Balister <philip@balister.org> wro=
te:
> > http://pastebin.com/M0Gw0Db2
> >
> > Basically, warnings are being treated as errors and the compile fails.
>=20
> you might add  --disable-werror to EXTRA_OECONF
> in meta-oe/recipes-devtools/binutils/binutils.inc

what about adding
-Wno-error=3Duninitialized
only to CFLAGS?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6RTTwACgkQN1Ujt2V2gBw9lQCgih6BMU6v9o0u8R/vtGeiixcW
7d4An0kmEnOHdD9TwGPK19Q6fOhOVLw7
=C9+9
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
