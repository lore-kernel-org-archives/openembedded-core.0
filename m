Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvYGe-000322-6U
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 20:03:20 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so691257dad.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 10:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DE6wm2ZX/XzQGYGmI7wIfXdpioVBqVicAN0bKLnrEPY=;
	b=pUpsXcxWBVjNko8+wbnRAKOwslVPsQAqbEepG22xUxKNPgf4ihq2NHPWgNoAiZ7YtY
	dWDhxOo3tnViAAH5F0XkcHnJHg9qBgKPA0k0t3tt2JjqIoc+dQ93hHnCeT6UmxK8lrim
	CjPYk1xgp1VO55asWNvpeP7TIzGu9lwe/WtlEeVGXktIEy3RNRe3JZ+NpRNnJVLUfKVw
	Uhep/HqBiAFSQNwJtT6UGOSIRjOsY8ntWwpu+WL8vnQa6GD045wS4Yt1S78DMktO2CCs
	TpMWLznhoFsTx4mYBkP99vloZ/MoKV08v+n0KuqYmMNg0gnYpTBoHSEUQsP1TfIwK+XG
	yxLA==
X-Received: by 10.68.234.36 with SMTP id ub4mr5509773pbc.68.1358362077126;
	Wed, 16 Jan 2013 10:47:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qf7sm12722874pbb.49.2013.01.16.10.47.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 10:47:55 -0800 (PST)
Date: Wed, 16 Jan 2013 19:47:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130116184759.GG3002@jama>
References: <20130116115800.A69171034D@opal> <20130116140919.GD3002@jama>
	<1358350681.1665.31.camel@empanada>
	<CABcZAN=u7_BGuAQGhYF134PedRq0KkHrgBEtPoN1Tet_T-O6Lw@mail.gmail.com>
	<1358354428.1665.54.camel@empanada>
	<CABcZANmR8vAcEFwOWBf7PdufdZTCXwWFreegpREWj99EzH1caA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANmR8vAcEFwOWBf7PdufdZTCXwWFreegpREWj99EzH1caA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Tom Zanussi : lttng2-ust: rename to lttng-ust
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
X-List-Received-Date: Wed, 16 Jan 2013 19:03:24 -0000
X-Groupsio-MsgNum: 33913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline

--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 11:02:41AM -0700, Chris Larson wrote:
> On Wed, Jan 16, 2013 at 9:40 AM, Tom Zanussi <tom.zanussi@intel.com> wrot=
e:
>=20
> > This is for the userspace tracing part, lttng-ust, which AFAIK doesn't
> > require any kernel patches.
> >
>=20
> Yes, but the point was, as far as I know, the newer ust requires the newer
> kernel components, and the older requires the older kernel components, so
> technically the package upgrade on a device is likely to change the
> behavior.
>=20
> I didn't say the current version required patches, the point was about the
> upgrade path for this recipe. I suspect we're one of the only companies
> that was actually using the old recipes, and we don't particularly care
> about the binary package upgrade paths at this time, but again, this is
> *not* a particularly smooth binary package upgrade path. I expect we're
> fine with that, but I wanted make sure it was an explicit conscious choice
> of behavior, not something unexpected.

=46rom what you said it looks like recipe shouldn't be renamed in first
place.

I'm not interested in lttng, first I was commenting only about recipe
being renamed without RPROVIDES/RREPLEACES/RCONFLICTS combo and then I
was surprised to see that ERROR about version downgrade from
buildhistory.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD29d8ACgkQN1Ujt2V2gBw8KwCePdf4+Oa+B6WnFug9y1yw+MeW
4I4AoJZSWiJXtSckr9pDBxrQ8HcRVom2
=DV98
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--
