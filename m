Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S9bS1-0006aE-2k
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 13:12:37 +0100
Received: by eaae1 with SMTP id e1so2430649eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 05:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1uc0oeJniJPewQ+xm4JJuhuGGahgeVg9n/j7sJGTF3M=;
	b=SqDX6dl2sH2P6WQ2sLzvzGiYx4qOIM5lZy/6Hpc2F9rjjkgAGqG9OWlVuayFLfEwK4
	LiOy6WOVvc+WwG/Sw26nuBJneHu0JPAv6PwQmM1lKc6N5PLdHUNw+YXfFDFGEPuWjLS5
	7N0jfJYIxSuYAR6wF5QEzkL+7Z61llpaKa2s37SJq/iR8MbKR+FjVfFleE8DTQObhEUn
	y2bIVwczo6Wrqi2MMo4Rv4SK3gpETh0Kt2e4w8+NncqbbiF305chirZu0/9ONyLH5uav
	UCNqmGShQL+NtiL2/joFmsptbFNhZvAFibabQYS0quKQgLS5tX6tS9vNXNuCy1qnuc3R
	BLFA==
Received: by 10.213.105.132 with SMTP id t4mr739562ebo.107.1332158625756;
	Mon, 19 Mar 2012 05:03:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d54sm48828267eei.9.2012.03.19.05.03.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 05:03:44 -0700 (PDT)
Date: Mon, 19 Mar 2012 13:03:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120319120342.GB3834@jama.jama.net>
References: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
	<BE489DAB-2E22-4B8F-A565-10C5DF842857@dominion.thruhere.net>
	<20120319115236.GA1947@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20120319115236.GA1947@mcrowe.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Mon, 19 Mar 2012 12:12:37 -0000
X-Groupsio-MsgNum: 19131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2012 at 11:52:36AM +0000, Mike Crowe wrote:
> Op 16 mrt. 2012, om 17:32 heeft Mike Crowe het volgende geschreven:
> > > The magic in rootfs_ipk.bbclass expects to generate debug package
> > > names by just appending '-dbg'.
>=20
> It turns out that the above was a local change so that statement was
> incorrect. Nevertheless the change probably makes sense anyway.
>=20
> > >                                 This breaks for eglibc because whilst
> > > the binary package has been renamed to libc6 the debug package is
> > > still called libc-dbg. This patch ensures that the debug package is
> > > renamed too.
> > > ---
> > > meta/classes/libc-common.bbclass |    1 +
> > > 1 files changed, 1 insertions(+), 0 deletions(-)
> > >=20
> > > diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-com=
mon.bbclass
> > > index 962f205..d0c1ab4 100644
> > > --- a/meta/classes/libc-common.bbclass
> > > +++ b/meta/classes/libc-common.bbclass
> > > @@ -27,4 +27,5 @@ python populate_packages_prepend () {
> > > 		bpn =3D d.getVar('BPN', True)
> > > 		d.setVar('PKG_'+bpn, 'libc6')
> > > 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
> > > +		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
> > > }
> =20
> On Fri, Mar 16, 2012 at 08:39:00PM +0100, Koen Kooi wrote:
> > Missing PR bump
>=20
> On eglibc?
>=20
> >                 and broken upgrade path.
>=20
> I'm having trouble coming up with a way to solve that. I think the
> libc6-dbg package needs to RPROVIDE, RREPLACE and RCONFLICT with
> libc-dbg but if I add the following:
>=20
>   d.setVar('RPROVIDES_' + bpn + '-dbg', bpn + '-dbg')
>   d.setVar('RCONFLICTS_' + bpn + '-dbg', bpn + '-dbg')
>   d.setVar('RREPLACES_' + bpn + '-dbg', bpn + '-dbg')

try to hardcode "libc" instead of bpn in value if you want

Provides: libc-dbg
Replaces: libc-dbg
Conflicts: libc-dbg


>=20
> Then the package names undergo translation and I get:
>=20
>   Provides: libc6-dbg
>   Replaces: libc6-dbg
>   Conflicts: libc6-dbg
>=20
> Which is clearly wrong. :(
>=20
> How would you recommend I provide backward compatibility for this
> change (assuming it is still seen as desirable?)
>=20
> Thanks for your comments.
>=20
> Mike.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9nIJ4ACgkQN1Ujt2V2gBxvGQCdFf2vqSvW1LAJMZEAz9DwbFtX
92IAnj0qM/kwtxbJYTOynoHCQKLAUwtb
=AQ68
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
