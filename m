Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0jTd-0000bi-DN
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:57:37 +0100
Received: by eaal10 with SMTP id l10so885131eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 16:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.207.200 as permitted sender) client-ip=10.14.207.200; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.207.200 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.207.200])
	by 10.14.207.200 with SMTP id n48mr31225eeo.71.1330044555752 (num_hops
	= 1); Thu, 23 Feb 2012 16:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Tw4tzgAb+D0I4om2ZuDHea0K5GGxPKdgOuPCja1Z7tc=;
	b=CaxMbvk1McEYveg2+dpYgHjOxxUAA7ZY5WepTwbGJj0Yprsrq+dUlbSNLmR5uME9TK
	zPPprZqr9FsBQzvJa9XblGIw7AXT5WVG29PHAq9uxQb7wSh5rxt2MhUw1Z+yq10/64Uf
	qhiI4/6KgOPgPlXWXHTx6sJTRaQAS9K1toV4s=
Received: by 10.14.207.200 with SMTP id n48mr13936eeo.71.1330044555655;
	Thu, 23 Feb 2012 16:49:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm11629138eeh.6.2012.02.23.16.49.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 16:49:14 -0800 (PST)
Date: Fri, 24 Feb 2012 01:49:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120224004912.GE3769@jama.jama.net>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
	<31839c0ee2b68d525cbfaff920b502537980bc33.1329993620.git.Martin.Jansa@gmail.com>
	<4F46DB93.9090107@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F46DB93.9090107@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] sstatesig: add pointercal-xinput to excluded machine specific configs
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
X-List-Received-Date: Fri, 24 Feb 2012 00:57:37 -0000
X-Groupsio-MsgNum: 17867
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AKuaMbydVAlrc5ow"
Content-Disposition: inline

--AKuaMbydVAlrc5ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 04:36:35PM -0800, Saul Wold wrote:
> On 02/23/2012 02:43 AM, Martin Jansa wrote:
> > * it's used by xinput-calibrator in meta-oe but contains just calibrati=
on data like pointercal does for tslib
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta/lib/oe/sstatesig.py |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index ee7cbad..080b722 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -27,7 +27,7 @@ def sstate_rundepfilter(fn, recipename, task, dep, de=
pname):
> >           return False
> >
> >       # Exclude well defined machine specific configurations which don'=
t change ABI
> > -    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-confi=
g-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'bas=
e-files']:
> > +    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-confi=
g-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'poi=
ntercal-xinput', 'base-files']:
> >           return False
> >
> >       # Default to keep dependencies
>=20
> This patch needs to be re-based to use RP's new=20
> SIGGEN_EXCLUDERECIPES_ABISAFE variable in layer.conf

Patch adding this to meta-oe's SIGGEN_EXCLUDERECIPES_ABISAFE was already
sent, so ignore this one.

Cheers,
>=20
> Thanks
> 	Sau!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AKuaMbydVAlrc5ow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9G3ogACgkQN1Ujt2V2gBxTxgCgqsH3SLJUtX5cIN3P0WRmCp6U
yJ4An1BnBV4lCEeMxuCKDv4w6LhtsdnW
=gion
-----END PGP SIGNATURE-----

--AKuaMbydVAlrc5ow--
