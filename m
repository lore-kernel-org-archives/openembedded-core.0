Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Udzjk-0003Ef-Bh
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 11:17:12 +0200
Received: by mail-pd0-f181.google.com with SMTP id p11so4513911pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=92dTYBm/sZJ9gbRvN4golwww9NXHIh2246FOhv619nk=;
	b=UEtgqMdCXrQC++FTwc/HFuCAn7Mo1RBcQY2q8wnFjW/SXw3kYa95xNKWAraY0JUAMR
	R5xiCdoPfFgt8FoYlx3+8E1LYWk+Lz+k82OuYL5VaE3RI0A7QqUIjHqdXI/Kw50xpWOy
	OCG9vyVNrIOkKQOi7IYGX4V8cczxvjZm7SKMLXm0Dg38i9EcH/MCFm4XQdHo3TXULJCl
	5jRecfwM2OI8vzWoPSh/9h9mfIKkJJkFParjdtLO6qkxA1c6RjdVxg6gb4A7fOIafxC2
	vgyoOFezUZIORJBRBCiCwyQ4cw/etBwhkrF1GYcpYQuYd02cqWZvw2BckeaxySiDXiKZ
	gtFw==
X-Received: by 10.66.72.36 with SMTP id a4mr22939132pav.133.1368953925280;
	Sun, 19 May 2013 01:58:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	gh9sm18952467pbc.37.2013.05.19.01.58.42 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 01:58:44 -0700 (PDT)
Date: Sun, 19 May 2013 10:58:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130519085835.GE3196@jama>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<20130519082432.GD3196@jama>
	<1368953701.16396.37.camel@pb-ThinkPad-R50e>
MIME-Version: 1.0
In-Reply-To: <1368953701.16396.37.camel@pb-ThinkPad-R50e>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Sun, 19 May 2013 09:17:13 -0000
X-List-Received-Date: Sun, 19 May 2013 09:17:13 -0000
X-Groupsio-MsgNum: 39425
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2013 at 09:55:01AM +0100, Phil Blundell wrote:
> On Sun, 2013-05-19 at 10:24 +0200, Martin Jansa wrote:
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <http://gcc.gnu.org/bugs.html> for instructions.
>=20
> Did you do that?  Please add the PR number to the check message so we
> can tell when it's been fixed.

Not yet, I'm trying to strip test case from pixman, but sofar I can
reproduce it only with significant chunk of pixman code.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYlDsACgkQN1Ujt2V2gBzoOQCfTCMcFq5/gLtrZCmpWtD9u4QR
LAQAoLC3rhaiQ8QkBDkRdLSiYoRJ+fXJ
=HL2y
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--
