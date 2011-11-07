Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNXt2-0007Ep-S0
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 23:41:52 +0100
Received: by faat2 with SMTP id t2so3044589faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 14:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wV0fwXHdpoOrHDi09szazdGNjewLzPNAmIjBxn3pW6A=;
	b=XVcMLWyymxViWjvwGo+5UdU+IeGBcg/jvpnNRHu/gFCL9Bri6Ll8JGB7LDKBcnLJDr
	+Q+whiSgTMDIuHMn/ELHWMURPG9q0cxZar9e+caX+3CbqpQYQVuyth5fZciZux03+GGo
	1/bDjOZyLRlqCJ9JzggQfaTqoJDyyJ4PxoQAQ=
Received: by 10.223.6.15 with SMTP id 15mr49994221fax.4.1320705335649;
	Mon, 07 Nov 2011 14:35:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm33121325fab.8.2011.11.07.14.35.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 14:35:24 -0800 (PST)
Date: Mon, 7 Nov 2011 23:34:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111107223456.GA3641@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<4EB82DE0.3090504@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4EB82DE0.3090504@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Subversion-1.7.0 and arm/thumb work arounds
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
X-List-Received-Date: Mon, 07 Nov 2011 22:41:52 -0000
X-Groupsio-MsgNum: 12045
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2011 at 11:13:36AM -0800, Saul Wold wrote:
> On 10/21/2011 01:17 AM, Martin Jansa wrote:
> > Hi,
> >
> > arm mode was forced without PR bump, because if it was failing for some=
one he
> > will notice.
> >
> > Be carefull with using subversion-1.7.0 (read the commit message).
> >
> > Pulseaudio-1.1 was released, so hopefully this work arounds won't be ne=
eded
> > there or they could be resolved better with upgrade.
> >
> > Regards,
> >
> > The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476=
d6b3:
> >
> >    distro-tracking-fields: update fields for tzdata and gst-plugins-goo=
d (2011-10-20 13:07:16 +0100)
> >
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib jansa/pull2
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Djansa/pull2
> >
> > Martin Jansa (8):
> >    pulseaudio-0.9.23: inherit perlnative to work around build on host
> >      without XML/Parser.pm
> >    libatomics-ops: force ARM mode
> >    pulseaudio-0.9.23: force ARM mode
> >    webkit-gtk: force arm mode to work around binutils segfault
> Martin,
>=20
> What is the status of these various workarounds, did you do any further=
=20
> work to determine root causes, or do we still need these patches to do in?

I've only updated commit messages in branch and added the same
workaround for aspell which also fails for thumb.

All in jansa/pull

>=20
> Thanks
> 	Sau!
>=20
> >    apr: add native support
> >    neon: add native support
> >    apr-util: add native support
> >    subversion: add 1.7.0 with native support and negative D_P for now
> >
> >   .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++++++++
> >   .../subversion/subversion_1.7.0.bb                 |   37 +++++++++++=
+++++++++
> >   .../pulseaudio/libatomics-ops_1.2.bb               |    2 +
> >   .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
> >   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   17 +++++++++
> >   meta/recipes-support/apr/apr-util_1.3.12.bb        |    8 ++++
> >   meta/recipes-support/apr/apr_1.4.5.bb              |    2 +
> >   meta/recipes-support/neon/neon_0.29.5.bb           |    3 ++
> >   8 files changed, 86 insertions(+), 1 deletions(-)
> >   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/=
libtool2.patch
> >   create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.=
bb
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk64XRAACgkQN1Ujt2V2gBy/3gCdETT7cga4JBscPAMgMhRaHwYn
WZwAn2A+T0TpoWameYEjnkz2DoalsdmI
=nVx8
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
