Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tx4M4-0006Qp-Di
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 00:31:18 +0100
Received: by mail-we0-f178.google.com with SMTP id k14so166801wer.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 15:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=IbRXwAk/s7p83l0FM+lTf7K+N5VK6gKkQsmuAxhHhPQ=;
	b=07/bpizTrhKWgK3r2RZyHvc3PomdCpamypRmcxKnGQhApi9UflvCBd8jUy3JpxKBps
	S1+HowAX+uUiYiyykLLkNTvzMRP3WF/eQ/i3ducpH2U6TPS9ddVH1zrVnK7q5yA48fN0
	0Zvm3T2jS6ULyqmqRtk7B6DOm1wDtP1peI/5MRNNH2B9JjXG6w51efRiwZmYS+XjZdJK
	84uy1aAbNiLLHjaM8ceJ8T7185cmLku8Kaco6Um1TBAMn7IbDjWXRBRKddFl1bxY9QeF
	CqmkEm0hgwi5pyzjXVS+B9Ig1ig7kfSQc6hBLmTow/sA+0DcztB5L5g/R4T1Yw4zk1tj
	lDeg==
X-Received: by 10.194.71.244 with SMTP id y20mr23276221wju.19.1358723744885;
	Sun, 20 Jan 2013 15:15:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bd6sm14419279wib.10.2013.01.20.15.15.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 15:15:44 -0800 (PST)
Date: Mon, 21 Jan 2013 00:15:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130120231546.GK29386@jama.palm1.palmone.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<7c26b8f7417dfbe245926137acfa61d0f659488c.1358635193.git.ross.burton@intel.com>
	<20130120231240.GJ29386@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130120231240.GJ29386@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] default-providers: Automatically set PREFERRED_PROVIDER_udev
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
X-List-Received-Date: Sun, 20 Jan 2013 23:31:20 -0000
X-Groupsio-MsgNum: 34115
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline

--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 12:12:40AM +0100, Martin Jansa wrote:
> On Sat, Jan 19, 2013 at 10:47:05PM +0000, Ross Burton wrote:
> > From: Radu Moisan <radu.moisan@intel.com>
> >=20
> > This is a more generic way to set preferred provider for udev.
> > We expect to have multiple choices once we integrate other init
> > managers, and this way we can automatically set it considering
> > distro settings.
> >=20
> > Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/conf/distro/include/default-providers.inc |    1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf=
/distro/include/default-providers.inc
> > index 8ed703c..89b6465 100644
> > --- a/meta/conf/distro/include/default-providers.inc
> > +++ b/meta/conf/distro/include/default-providers.inc
> > @@ -37,3 +37,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?=3D "nativesdk-opk=
g"
> >  PREFERRED_PROVIDER_console-tools ?=3D "kbd"
> >  PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
> >  PREFERRED_PROVIDER_make ?=3D "make"
> > +PREFERRED_PROVIDER_udev ?=3D "${@base_contains('DISTRO_FEATURES','sysv=
init','udev','',d)}"
>=20
> 'systemd' missing in 4th param? or another
> "${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> ?

Ah ignore this, it's added in 05/10.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD8eqIACgkQN1Ujt2V2gByU1gCfc+htEbfOPyb2LV1LERbhzIX+
KkAAn0PXiGQ++KwtNHxngw2tIBhtkuVM
=mcsm
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--
