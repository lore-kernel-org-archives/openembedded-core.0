Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypIK-0007aC-N0
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:50:38 +0100
Received: by mail-pa0-f53.google.com with SMTP id hz1so439925pad.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QEnMnQOoJQSFjSPddAi/csXuuZ9x6vXEMhcqQGs4k88=;
	b=IR6PbCzAqQyM55OgCGFRJJ9yrcl4FACRpPRbX5K+UplMTpH0wmqrTalgfXi5ojSkjJ
	uh4FyKxCVBt69LXgZXw9DgWwkDJNzleKVzCgsYSDJzpueZA+2PHMT4aBERAxkNdbNNPD
	m9Ii9B2mWgd66AZhvlu+ngE6acnlbqDQbGTeRHmuysCH2X4Hc/phMGYVFJsaxGfWU+xa
	MBFxqxTPP5kpbjo6kUp/ZhfoHQ28qpTHye0dx2cFvv+cHQvyw8ln8RKsMzuMC/mpm6LM
	G/F8zIgaPMecc4Jx0IL46E7gS8dPNfKcUh9vJ7ZFBjzo7AyBb8C1YuZj3CxMLJzs8/MS
	7ciw==
X-Received: by 10.69.1.65 with SMTP id be1mr16980197pbd.66.1359142501313;
	Fri, 25 Jan 2013 11:35:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vn2sm1169108pbc.31.2013.01.25.11.34.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:34:59 -0800 (PST)
Date: Fri, 25 Jan 2013 20:34:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20130125193456.GE16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 19:50:39 -0000
X-Groupsio-MsgNum: 34467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline

--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 07:35:51PM +0100, Andreas M=FCller wrote:
> On Fri, Jan 25, 2013 at 7:06 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Jan 25, 2013 at 06:53:54PM +0100, Andreas M=FCller wrote:
> >> On Fri, Jan 25, 2013 at 6:50 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
> >> > Hi,
> >> >
> >> > Been chatting to Richard.  How about systemd ships a symlink to
> >> > multi-user, and the X11 init script packages change the symlink to
> >> > graphical in their postinst.
> >> >
> >> > (we must remember to put this in the release notes for anyone who has
> >> > a custom X init script)
> >> >
> >> > Ross
> >> >
> >> Have not yet tested but how about:
> >>
> >> pkg_postinst_systemd () {
> >> if [ -n "$D" ]; then
> >>       # no display-manager.service around?
> >>       if [ ! -e ${D}${systemd_unitdir}/systemd/system/display-manager.=
service -a \
> >
> > I think you wanted $D ^ here.
> Yes there are more of this but before cleaning up & run into tests:
> Would this find friends?
>=20
> > Cannot we just just u-a for default.target ? And each possible target
> > providing own u-a alternative (DMs with higher prio then systemd)?
> Sorry but I don't understand this

Something like:

systemd:
inherit update-alternatives
ALTERNATIVE_${PN} =3D "systemd-def-target"
ALTERNATIVE_TARGET[systemd-def-target] =3D "${systemd_unitdir}/system/multi=
-user.target"
ALTERNATIVE_LINK_NAME[systemd-def-target] =3D "${systemd_unitdir}/systemd/s=
ystem/default.target"
ALTERNATIVE_PRIORITY[systemd-def-target] ?=3D "1"

xserver-nodm-init and DMs:
inherit update-alternatives
ALTERNATIVE_${PN} =3D "systemd-def-target"
ALTERNATIVE_TARGET[systemd-def-target] =3D "${systemd_unitdir}/system/graph=
ical.target"
ALTERNATIVE_LINK_NAME[systemd-def-target] =3D "${systemd_unitdir}/systemd/s=
ystem/default.target"
ALTERNATIVE_PRIORITY[systemd-def-target] ?=3D "10"

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEC3mAACgkQN1Ujt2V2gBwH2QCgq7sQUfXdqYNyofFXvO808bgG
H7YAn2RJc+FR+udWjSWMYnLaW/WRnRmh
=4C/v
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
