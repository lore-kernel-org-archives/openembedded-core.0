Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Sy0sG-00052g-VI; Sun, 05 Aug 2012 15:28:05 +0200
Received: by wgbdr1 with SMTP id dr1so1693617wgb.24
	for <multiple recipients>; Sun, 05 Aug 2012 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Vov2jj0IYELJfer/cmyyutroy/ShX+hDgEkL8OlfetA=;
	b=GIZG5KN0a6L+/JmqHtt1EcS9CiFR5H0zC4Mmq0jR4IER/HyvWPVRe08fep7zPnwCRp
	ozfpXZP9UZrWtcycGPCHWQUU+3+71pPcKLQCZ567TnfyHWAyTvX7XmihE2Af7AdWQbnC
	+VYx4VWSRGU1KCtaPNvG0hshRsu9sl+1/k9/izoHk2nS/Xf5usQ3YNfWcJ/Wn5N90tnm
	bI5aBmZBdmPEFncm68IuxlV6Rd/cTTmY+B7iRQfYvAt8OkQ1vVl+od/JeFmEyoRAzAtl
	e6CwmAYVbZy9L7Q1oN4wjj4JfweCak+3FRDDErbOaR61JikTkf1FHVZcbta4IrKRJ0TP
	D28g==
Received: by 10.180.105.130 with SMTP id gm2mr10873724wib.6.1344172581622;
	Sun, 05 Aug 2012 06:16:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm14114776wiz.9.2012.08.05.06.16.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 06:16:20 -0700 (PDT)
Date: Sun, 5 Aug 2012 15:16:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120805131615.GC3267@jama.jama.net>
References: <20120731070518.61E5C10217@opal>
	<20120802221526.GC16306@jama.jama.net>
	<20120803071730.GA30148@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120803071730.GA30148@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Eggleton : qt4: allow recipes building commercial edition
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
X-List-Received-Date: Sun, 05 Aug 2012 13:28:05 -0000
X-Groupsio-MsgNum: 26919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2012 at 09:17:30AM +0200, Martin Jansa wrote:
> On Fri, Aug 03, 2012 at 12:15:26AM +0200, Martin Jansa wrote:
> > On Tue, Jul 31, 2012 at 07:05:17AM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 2be0058fc4acddab611637656183accd052b40eb
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D2be0058fc4acddab611637656183accd052b40eb
> > >=20
> > > Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > Date:   Tue Jul 31 00:31:00 2012 +0100
> > >=20
> > > qt4: allow recipes building commercial edition
> > >=20
> > > To enable building the commercial edition of Qt (through additional
> > > recipes that are *not* provided by OE-Core) we need to tweak a few
> > > things:
> > >=20
> > > * Don't make recipes that inherit qt4x11.bbclass depend on qt4-x11-fr=
ee
> > >   - instead add qt4-x11 to DEPENDS and then have qt4-x11-free include
> > >   this in its PROVIDES. A commercial equivalent recipe should do the
> > >   same.
> > > * Add a QT_LICENSE_FILE variable that can be used to specify the lice=
nse
> > >   file required by the commercial edition.
> > > * Add a QT_LICENSE_FLAGS variable which the recipe can set to select =
the
> > >   license option being used. The default of "-opensource" retains the
> > >   current behaviour; a commercial recipe should set it to "-commercia=
l".
> > >=20
> > > Fixes [YOCTO #2505].
> > >=20
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > After this patch I see, libdummy.prl created again
> > OE @ ~/projects/shr-chroot $ ll include/WebCore/libdummy.prl
> > -rw-r--r-- 1 bitbake bitbake 651 Aug  2 19:23 include/WebCore/libdummy.=
prl
> >=20
> > originally fixed by:
> > http://git.openembedded.org/openembedded-core/commit/?id=3D7d3fd68480d5=
4a8ef0d91a772df3506cd45ef2c2
> >=20
> > Do you have any idea why it's broken again? If you still have log.do_co=
nfigure logs, can you check for
> > WARNING: DESTDIR: Cannot access directory '/include/WebCore'
> > ?
> >=20
> > Cheers,
>=20

Ah, this isn't from qt4-x11-free, only that /include/WebCore should be,
but I've tried to reproduce it again and even after rebuilding
qt4-x11-free, qt4-x11-embedded, qt-mobility-embedded, qt-mobility-x11
it's not created now.

Will try for different arch, because last time I've seen it also only
for arm* and not x86 (which I was rebuilding now).

Cheers,

> Hmm even more this time:
> ISIS_OUT/
> ISIS_OUT/include
> ISIS_OUT/include/webkit
> ISIS_OUT/include/webkit/npapi
> ISIS_OUT/include/webkit/npapi/nptypes.h
> ISIS_OUT/include/webkit/npapi/npapi.h
> ISIS_OUT/include/webkit/npapi/npupp.h
> ISIS_OUT/include/webkit/npapi/npruntime.h
>=20
> Created in dir one level above dir from where bitbake was started.
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAech8ACgkQN1Ujt2V2gBzNjQCfZ4K1HvhBfXrHbycLmP6tfFN2
IcgAnAtC01PGMMiCsQrrA40ovVQVwFlZ
=VuZU
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
