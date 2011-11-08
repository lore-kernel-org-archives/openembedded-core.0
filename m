Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNnwW-0003oz-2Q
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 16:50:32 +0100
Received: by faat2 with SMTP id t2so670123faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 07:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T6OLi4yQaHwNR1g6AxE7XjjZ5QCnpnlP0tYIHkAA1BM=;
	b=d5XyPF9Kqh7Cclr6Kr84o5OmRwSeVrRtOkg5G3LetGYj4CdDcqEyv3rF7bQT52G5bJ
	ROs65KTFxC4lJ3F260wYUe0zLF7eg0fQlifT5hH9mp+RfyrNsfI7a2O36XXFJWgmKduh
	OD/jctFKoT/QEzEtLspW62/SeCb80MojKlo5Q=
Received: by 10.223.76.197 with SMTP id d5mr55920075fak.13.1320767052912;
	Tue, 08 Nov 2011 07:44:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm2582199fad.2.2011.11.08.07.44.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 07:44:12 -0800 (PST)
Date: Tue, 8 Nov 2011 16:44:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111108154410.GE3641@jama.jama.net>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
	<ea69345b97a6115caa6b77782f2fd58dd9eb2507.1320675529.git.Martin.Jansa@gmail.com>
	<4EB94C93.1080100@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4EB94C93.1080100@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 2/6] kbd: import from meta-oe
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
X-List-Received-Date: Tue, 08 Nov 2011 15:50:32 -0000
X-Groupsio-MsgNum: 12102
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline

--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2011 at 07:36:51AM -0800, Saul Wold wrote:
> On 11/07/2011 06:19 AM, Martin Jansa wrote:
> > * replaces console-tools used in keymaps
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-core/kbd/kbd_1.15.2.bb |   19 +++++++++++++++++++
> >   1 files changed, 19 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb
> >
> > diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kb=
d/kbd_1.15.2.bb
> > new file mode 100644
> > index 0000000..36e68a0
> > --- /dev/null
> > +++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
> > @@ -0,0 +1,19 @@
> > +DESCRIPTION =3D "This package contains keytable files and keyboard uti=
lities"
> > +# everything minus console-fonts is GPLv2+
> > +LICENSE =3D "GPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D587ce626d15bd61699a64a6b8a5=
afefb"
> > +
> > +inherit autotools gettext
> > +
> > +BBCLASSEXTEND =3D "native"
> > +
> > +SRC_URI=3D"${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
>=20
> Apparently this is not currently fetchable, do you have an updated=20
> location?  I found something at fossies.org, but the COPYING file is=20
> different that your checksum, so I am not sure of the differences.

Don't know about official mirror, but file on my premirror=20
http://build.shr-project.org/sources/kbd-1.15.2.tar.bz2
is the same as other google hits:
http://pkgs.fedoraproject.org/repo/pkgs/kbd/kbd-1.15.2.tar.bz2/e850eb91e4d3=
b94b194efe8e953204c5/kbd-1.15.2.tar.bz2
http://mirror.anl.gov/pub/linux/utils/kbd/kbd-1.15.2.tar.bz2

And I haven't found kbd-1.15.2.tar.bz2 (only 1.15.3) on fissies.org to comp=
are.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk65TkoACgkQN1Ujt2V2gBwbYwCeP3a+aYhpF5kaYrjo9FAmjY+3
888AoIQSjN3vkMKFl8mJfRmeo11olUDF
=Sw2g
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
