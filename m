Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSkTu-0007BD-NI
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 08:09:27 +0100
Received: by lahe6 with SMTP id e6so79506lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 23:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mFvg1PKCI/5lYl9qR04RjYpcbK5ErJtxXuLbB1FVLFA=;
	b=R5KBevKpWFPMcPAwWAVAZzxG+G71wmRWjxaoj8V76yt/yK7dlU2WcIS3AItODqLNQq
	wqh4qab7nxP1pULhe4Vyip3CZ8UvQ2LvNuU9rrmJuOLlidCkUTxZ9BKn4xBUXAyTdWHV
	Ub806MHq6Nop2RrJXtUAFTdOffVeWx6yr1BgM=
Received: by 10.152.134.77 with SMTP id pi13mr11105445lab.21.1321945375784;
	Mon, 21 Nov 2011 23:02:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jb5sm11741763lab.15.2011.11.21.23.02.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 23:02:54 -0800 (PST)
Date: Tue, 22 Nov 2011 08:02:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111122070241.GN3565@jama.jama.net>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<1321899155-19575-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1321899155-19575-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH 2/2] pulseaudio: update to 1.1, delete 0.9.x
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
X-List-Received-Date: Tue, 22 Nov 2011 07:09:28 -0000
X-Groupsio-MsgNum: 12698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w6U88vdWm8UqIXvc"
Content-Disposition: inline

--w6U88vdWm8UqIXvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 07:12:35PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> As indicated in the subject, this is an RFC, please review and test.
>=20
> 1) the ARM_INSTRUCTIONSET workarounds have been removed, so for people us=
ing thumb1, please test

where is libjson?
ERROR: Nothing PROVIDES 'libjson' (but
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o_1.1.bb
DEPENDS on or otherwise requires it

Cheers,

> 2) this is only buildtested on armv7a, more buildtests and runtime tests =
are on their way, so please test=20

--w6U88vdWm8UqIXvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7LSREACgkQN1Ujt2V2gBxYgwCgmO9QMjWYJHP5Jl490NlgpP8a
e6sAn1zfWbaaPKlh1nKMAMn7X3+9wdQz
=L2/+
-----END PGP SIGNATURE-----

--w6U88vdWm8UqIXvc--
