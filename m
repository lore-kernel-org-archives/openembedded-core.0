Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UHaJX-0002hj-6r
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 14:41:25 +0100
Received: by mail-da0-f50.google.com with SMTP id t1so1331477dae.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GgPlJ7IY4lD95LIlWL9ZJVqn3SGHmBjskpyN2gF6v0k=;
	b=v2onB2aOOnZ53OP6swzSn4T1NgsZ+8umbA0O29gYRwsKdw+Ifsd3Zy3fYFDUOc/g71
	UYP9QydxybisnL2dvKQTmmHKxjNDt9DmsVLjH2xySjk1aKKCBcj7CbUHBm4ol1T+uLt9
	hyvXOZ8SlY3haen34HDMMMKGUWIYtRGFrQ9MHDjxXA3tI19i57BcZOX5bp0aM3PfPoDZ
	zty5NwJVqtcSMStkTfbpaJvxkvIWyfq+Iq8E7yYHL0QDU89rkMIZB+ewwaC5sAdKrjtT
	ej3TLrFX+lgmwgVKi3aGnFiKF8oARUhgVMkz02q9fM/SzzaJ151ZbbI+zJbDsUvF+0aE
	Q28A==
X-Received: by 10.68.213.167 with SMTP id nt7mr28760556pbc.194.1363613072243; 
	Mon, 18 Mar 2013 06:24:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ve7sm8238866pab.11.2013.03.18.06.24.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 06:24:30 -0700 (PDT)
Date: Mon, 18 Mar 2013 14:24:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130318132422.GA13277@jama.dyndns-home.com>
References: <1363601408-5528-1-git-send-email-Martin.Jansa@gmail.com>
	<1363611880.16482.17.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1363611880.16482.17.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] icecc: Allow to use this bbclass together with external toolchains
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
X-List-Received-Date: Mon, 18 Mar 2013 13:41:38 -0000
X-Groupsio-MsgNum: 36699
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 01:04:40PM +0000, Richard Purdie wrote:
> On Mon, 2013-03-18 at 11:10 +0100, Martin Jansa wrote:
> > * original implementation by Antti Harju
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/icecc.bbclass | 37 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 33 insertions(+), 4 deletions(-)
>=20
> FWIW, I don't have strong opinions on icecc so I rely a lot on the
> experiences of its users to decide which patches to pull in. I assume
> this class requires the external toolchain to be installed on each
> machine in the pool?

Neither do I (my network access to icecc pool is slower then my CPUs),=20
that's mostly the reason why this was sent only as RFC for other users=20
of icecc and external toolchains to comment.

Right now some developers are using separate bbclass for our internal
toolchain, but the only functional difference of that bbclass is
included in this patch. I think it's better to have only one icecc class
compatible with all TCMODEs.

When distro sets EXTERNAL_TOOLCHAIN then it requires tc to be installed
on each machine doing OE builds already, so this change only takes advantag=
e=20
of the same tc when icecc is enabled.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFHFYYACgkQN1Ujt2V2gBz2hgCeJqApuXEy1IUxoNyQ8QAUDWUc
JQAAoJ5+GnG/SOyaHs00PKh7BHBTE0u3
=qTcF
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
