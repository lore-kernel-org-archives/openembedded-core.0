Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCTb1-0002H9-1e
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 12:30:30 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so3108445pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 03:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aDIaS/fSASYPizHr+h4Ds31fe5ezBMkckapFGjCwuoE=;
	b=KyMDL7E4i/PzXLefU88GQgVa1F8MBLvTWSp+7s7i87++IXRZLIvTfJv1Eo+DrlLieQ
	MFFu7JltEKPToRo+J4yJaGi4w7zHnnpVyirgqSGHU2F2MhZZU7zIeZmEBSFagFb8yT0X
	2zfAQ/Exnpb6CrIeNN0xIOpNe6WosbXqz5/NRvrvG4YQzc8uAvHJvV8udQd8Mmjiismg
	cuZjF7Tfb5RIVJvQQ3tqe/brd2JR9Fd/Uuaiw3MWDfkrNPqbhLZcrITObRZQareT22SZ
	ZAbVXf+84yLaLm16WWvBgBecNv8o+JplkdzPtvgXYvbp/H5Cjh5eIDx9JvZ0uUQT87AZ
	RVyA==
X-Received: by 10.66.76.41 with SMTP id h9mr32257507paw.1.1362395630632;
	Mon, 04 Mar 2013 03:13:50 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 4sm9020829pbn.23.2013.03.04.03.13.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 03:13:49 -0800 (PST)
Date: Mon, 4 Mar 2013 12:13:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130304111337.GG3268@jama>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
	<CA+chaQe3c3aYV6xEYsScoMWTMexe9rR4UiKCAszTjG-xrad59Q@mail.gmail.com>
	<1362394572.29587.10.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1362394572.29587.10.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 11:30:33 -0000
X-Groupsio-MsgNum: 36181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Content-Disposition: inline

--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2013 at 10:56:12AM +0000, Richard Purdie wrote:
> On Mon, 2013-03-04 at 11:51 +0100, Martin Jansa wrote:
> > Shouldn't this list be defined in layer.conf like
> > SIGGEN_EXCLUDERECIPES_ABISAFE, so that other layers can extend that
> > list?
>=20
> I'm hoping we only have very small list of these problematic
> dependencies. If we end up with a large number of them then yes, we'd
> need to abstract it but I'd prefer to avoid that unless proven
> necessary.
>=20
> Is there a specific case you have in mind?

Isn't systemd-systemctl-native another candidate to be included?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE0geEACgkQN1Ujt2V2gBwXiQCgqPY/G6NQQq29pdCTU88sGII1
1lYAoKpS6vRq6DlQI8Uo716cOG7abVDw
=92j7
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--
