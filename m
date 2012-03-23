Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB3m6-0001T2-IY
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:39:23 +0100
Received: by wgbdr12 with SMTP id dr12so1836993wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LHfqU2nSep/b1eIn09cwV7ZX3LHde3TpOrqungUGoiM=;
	b=hl0LmjmiMCkeh6I/0PqUE5WnilHjjGA56HxrsJ3ggx7UlmrQTJPQNXBkcP88gd3Hj7
	hfjiCGRlAsK0BxOryB4885rZqSB8d531Al5i8Qf2aJjMJ1sQRSfF0c62bJU/2D4Bex1Z
	xSKXevaRjazocdgPftYFyG2MmADWETgEQozSvMxM1fj6pOVSubrtVnORAN7ThEmM+WQ9
	qKaQQAX3YlqU/CLspgDFyFtAN4EwoVp0CSCAX0BoZVxD4TxkZtsJjAUQODG4YeUvyc6I
	zfAqSmeHpzE1+mb8nJjd3XkMut92y9gybYUIoKL3s0jUtRpoQtH1mbltZVj79d8u2CuR
	z2hw==
Received: by 10.216.137.163 with SMTP id y35mr6804359wei.33.1332505826642;
	Fri, 23 Mar 2012 05:30:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm22418478wib.9.2012.03.23.05.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:30:25 -0700 (PDT)
Date: Fri, 23 Mar 2012 13:30:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323123027.GE3879@jama.jama.net>
References: <1332485029-9148-1-git-send-email-Martin.Jansa@gmail.com>
	<1332494193.9740.382.camel@ted>
	<20120323093623.GB3879@jama.jama.net>
	<1332502793.9740.385.camel@ted>
	<20120323114938.GC3879@jama.jama.net>
	<1332505323.9740.402.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332505323.9740.402.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 12:39:23 -0000
X-Groupsio-MsgNum: 19532
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline

--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 12:22:03PM +0000, Richard Purdie wrote:
> On Fri, 2012-03-23 at 12:49 +0100, Martin Jansa wrote:
> > On Fri, Mar 23, 2012 at 11:39:53AM +0000, Richard Purdie wrote:
> > > On Fri, 2012-03-23 at 10:36 +0100, Martin Jansa wrote:
> > > > On Fri, Mar 23, 2012 at 09:16:33AM +0000, Richard Purdie wrote:
> > > > > On Fri, 2012-03-23 at 07:43 +0100, Martin Jansa wrote:
> > > > > > * /etc/modules-load.d/foo.conf is used by systemd like /etc/mod=
utils/foo was with sysvinit
> > > > > >=20
> > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > ---
> > > > > >  meta/classes/kernel.bbclass |   10 ++++++++--
> > > > > >  1 files changed, 8 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > Since these look identical couldn't we symlink them? I'm not a bi=
g fan
> > > > > of writing duplicate data to a package :/.
> > > >=20
> > > > OK I'll change it in v2
> > >=20
> > > Note that I'm wondering if we can just symlink the directory entirely
> > > rather than the files themselves. There may be a reason that is a bad
> > > idea but I don't know...
> >=20
> > There are different filenames (notice .conf in the end) so I have patch
> > doing symlinks for files not directories.
>=20
> I'd seen the modprobe.d conf files and thought here was some similarity.

but that's for module options e.g.

SHR root@gjama ~ $ cat /etc/modprobe.d/g_ether.conf
options g_ether dev_addr=3D00:1F:11:01:2C:9F host_addr=3D00:1F:11:01:2C:A0

not for module_autoload

> I have to admit I think systemd is nuts for requiring a copy of these
> files when it could have used the existing layout. It looks like change
> for the sake of change :(.

then why not patch=20
/usr/sbin/update-modules
to read /etc/modules-load.d/*.conf instead of /etc/modutils/* as this is
just simple script imported from debian to produce /etc/modules file
which is IMHO all what we need for old init script
(modutils-initscripts) to read.

> I'm nearly tempted to suggest we should just patch systemd to use the
> other filenames...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sbOIACgkQN1Ujt2V2gBzw5gCbBe24NzPVFT+8rXXAlSazfqPh
alwAnja3So4+QZTXa3hsdakMyZho3+ua
=2ZJG
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
