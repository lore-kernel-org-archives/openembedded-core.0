Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shm7h-0005pY-Pc
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 20:28:53 +0200
Received: by wgbdr1 with SMTP id dr1so845348wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/Yt+kwOEVVbYwtAMxU5JlqecD6rzaMvpf5la89YEbiU=;
	b=q4lPdMQ5U+/1YNNpLSRiB2tisahHbXLGER6oRZLvuciqwQqNkD2iVWurI1N2hTH3Oy
	bJXzLsQTY8IM07MNT6biQ3SGT277ySqozR24BI2/xzbAfOPWihANIcDclNj7MHoVdM+B
	bfsjCAbZm7xZAft/H2TtocdhGTL50MA7a5kDeCNRpob5d5VAPPcqiX9ymqjCVT0PwSm+
	KRoURPn1Sm6raEsJ95uZatNfH96zzj1iaFLUuHBwqoRTb+YV6wXHDybtFQJLiJFPpfL/
	XuqTuKeDpXWRejSl2YVir8njb7BEyMoUdokS9IeOSQRyjoa09SqdYQvrOJsVUxbu2DiI
	CrBA==
Received: by 10.216.144.228 with SMTP id n78mr14664258wej.26.1340302687782;
	Thu, 21 Jun 2012 11:18:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm91247032wib.4.2012.06.21.11.18.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 11:18:06 -0700 (PDT)
Date: Thu, 21 Jun 2012 20:18:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120621181806.GG9352@jama.jama.net>
References: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
	<6BA43A2F-5293-4CBD-9DE7-39D3ABD0AF88@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <6BA43A2F-5293-4CBD-9DE7-39D3ABD0AF88@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] Fetching single files
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
X-List-Received-Date: Thu, 21 Jun 2012 18:28:53 -0000
X-Groupsio-MsgNum: 23957
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 04:30:27PM +0200, Koen Kooi wrote:
>=20
> Op 21 jun. 2012, om 16:01 heeft Burton, Ross het volgende geschreven:
>=20
> > Hi,
> >=20
> > I was looking at updating the webkit-gtk package to the latest
> > upstream when I noticed that instead of just checking out the
> > repository it checks out a selection of directories and includes in
> > oe-core the essential top-level files.  I can see the rationale for
> > this: a full checkout of webkit includes the full test suite and web
> > site sources.
> >=20
> > However I'm not entirely keen on the package shipping the top-level
> > files in oe-core, as that is asking for trouble.  One solution would
> > be the ability to fetch a single file through the svn fetcher instead
> > of a directory, which svn can do using "svn export" (checking out a
> > file is an error).  This doens't bring any metadata along with it so
> > it isn't actually a checkout that can be updated in the future, but
> > for a single file I think this isn't a problem.
> >=20
> > In poky-contrib:ross/svn I've started implement a proof of concept on
> > this.  So far using the singlefile=3D1 parameter the export logic is
> > activated, the file is svn exported and stashed in the download
> > directory, suitable renamed.  The next step is to hook this into the
> > unpack stage so that the file gets renamed correctly on it's way to
> > the workdir.
> >=20
> > But before I start looking at this I thought I'd mail the list and see
> > if anyone has any comments.  So, anyone know of any problems, pitfalls
> > or better solutions?
>=20
> We didn't do single file fetches/checkouts in the past because it's a svn=
 1.6.x feature. I would be really happy if we declare that 1.6.x is the min=
imum we support. I would be even happier if we just fetch webkit (completel=
y) from git :)

We should drop subversion-native from ASSUME_PROVIDED and let distro
decide if the minimum is 1.6 or even 1.7

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2409

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/jZV0ACgkQN1Ujt2V2gBw9egCeJ0p27LtsZZEl5anP4RvrzbkH
xV4An2iX2aOLt+3hLymNBjl1oGcDxBgy
=QfRD
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
