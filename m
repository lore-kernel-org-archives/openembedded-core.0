Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKvMn-0001Za-UD
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:46:36 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so1806660pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3u/zgPEHJtmzJRnAYOb9ZaPb7FiGIBKhP3FY7r0QKQU=;
	b=Z0xH6UZ1Qjb+c6f6cyy51t60/TtO2xFfoUwpBfswR7/TmoFJIUjblDSj8soYsJVFkR
	9PakN0QhPUGwjPnWOtGe+NkWXX46e7qjPCVjjYjutabkRg/+g8OvapJXYbnRQCxUkWoL
	EybHzY/m5v8GJrTuP2XHUP7CD/A+f59bH1/DMG6cUdAnbH43ZfjwZEaDJRf15BxoNrM/
	pl/oLOSKQoFbiDHyVPRftblUhz58RHRMidgJ4XqkjOxP7W0bTmu+49YHB19i0pZ1K5vi
	O0UU/c0dqpIJm36oOzCQHjKVDLdFZABbM7ptmOq9RJJ8Y2utRpdHfMN4nIz7fFnRhkSf
	ciIg==
X-Received: by 10.68.12.103 with SMTP id x7mr14756103pbb.37.1364408971731;
	Wed, 27 Mar 2013 11:29:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kl4sm22319650pbc.31.2013.03.27.11.29.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 11:29:30 -0700 (PDT)
Date: Wed, 27 Mar 2013 19:29:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130327182921.GD3254@jama>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
	<20130327160752.GB3254@jama>
	<31125A2C-DACE-4F85-B454-EB652073C558@gmail.com>
MIME-Version: 1.0
In-Reply-To: <31125A2C-DACE-4F85-B454-EB652073C558@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 18:46:41 -0000
X-Groupsio-MsgNum: 37176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Content-Disposition: inline

--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2013 at 11:00:16AM -0700, Khem Raj wrote:
>=20
> On Mar 27, 2013, at 9:07 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Wed, Mar 27, 2013 at 04:03:31PM +0100, Koen Kooi wrote:
> >>=20
> >> Op 27 mrt. 2013, om 13:08 heeft Ross Burton <ross.burton@intel.com> he=
t volgende geschreven:
> >>=20
> >>> From: Khem Raj <raj.khem@gmail.com>
> >>>=20
> >>> Tested on ppc and x86_64
> >>> compile tested for uclibc
> >>>=20
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>=20
> >> Since 199 has been released a few days back, how about upgrading to th=
at and drag in http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D942=
43ef299425d6c7089a7a05c48c9bb8f6cf3da ?
> >>=20
> >=20
> > also "systemd-journal" group should be created to get rid of
> > systemd-journald[44]: Failed to resolve 'systemd-journal' group: No suc=
h process
> >=20
> > I guess that SIGUSR1 is expected (I got this even after creating that
> > group):
> > systemd-journald[44]: Received SIGUSR1
> >=20
>=20
> Martin
>=20
> Do you have a patch for it ? if yes send my way I will add it to my updat=
es

not yet, please do it.

>=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFTOoEACgkQN1Ujt2V2gBzw+ACbBc7NFFuf4/J+21k6wzULIRiS
skQAmwZpzrDMg1ThjYGNyL1+/igUPk80
=fPDb
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
