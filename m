Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPHcT-0008EL-QG
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 21:20:46 +0200
Received: by mail-wg0-f47.google.com with SMTP id y10so6275379wgg.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 12:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fTcysksWzYf5BE4fntVyDkmeTwimPJ5JJYuKUQczxuk=;
	b=Z1dGaXag6NHyvrJp/15YNnG1g3+TTEr5gI6kQ4kGACFACU+hNj+1QtYGPwKRhBqGNW
	Sms5IQi1HprfcV3ANIoHvJU/PKCQwcnhMmsH+slJeLwQHmGaU84Un7QQGCz95KC6aDv4
	bFdFEE9Pcpgb53qYqieacZUc8yYAdmw9OTuanBVzBANRE/AyrwL6Siid/W27SWP5IX4D
	ZvFbxfjYy9fsJbEl7ot5MdZqddNbJShiX8YKwNx64aFORL9xwVSGQ9QjhX9ff0s/sxIg
	3Yw+h8LRvoG1G+Ti88QQ16mOzeWBi1W+6Kg1JbxxxLuap1arwVuAglewA4CJe1aMYoPy
	mryg==
X-Received: by 10.194.178.100 with SMTP id cx4mr33666852wjc.47.1365447806970; 
	Mon, 08 Apr 2013 12:03:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j4sm21418988wiz.10.2013.04.08.12.03.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 12:03:26 -0700 (PDT)
Date: Mon, 8 Apr 2013 21:03:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130408190328.GC2470@jama>
References: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
	<1365094008.6526.115.camel@ted>
	<20130404165547.GF1271@jama.dyndns-home.com>
	<1365115121.6526.121.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1365115121.6526.121.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
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
X-List-Received-Date: Mon, 08 Apr 2013 19:20:46 -0000
X-Groupsio-MsgNum: 37588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 11:38:41PM +0100, Richard Purdie wrote:
> On Thu, 2013-04-04 at 18:55 +0200, Martin Jansa wrote:
> > On Thu, Apr 04, 2013 at 05:46:48PM +0100, Richard Purdie wrote:
> > > On Thu, 2013-04-04 at 18:42 +0200, Martin Jansa wrote:
> > > > * fixes udev configure in run-postinsts failing with:
> > > >   update-rc.d: /etc/init.d/systemd-udev: file does not exist
> > > >   because systemd-udev is installed only with sysvinit in features
> > > >   but update-rc.d was always called from PN postinst
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/recipes-core/systemd/systemd_199.bb | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipe=
s-core/systemd/systemd_199.bb
> > > > index ba1d133..e574548 100644
> > > > --- a/meta/recipes-core/systemd/systemd_199.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_199.bb
> > > > @@ -239,6 +239,12 @@ INITSCRIPT_PACKAGES =3D "udev"
> > > >  INITSCRIPT_NAME_udev =3D "systemd-udevd"
> > > >  INITSCRIPT_PARAMS_udev =3D "start 03 S ."
> > > > =20
> > > > +python __anonymous() {
> > > > +    features =3D d.getVar("DISTRO_FEATURES", True).split()
> > > > +    if "sysvinit" not in features:
> > > > +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> > > > +}
> > > > +
> > > >  # TODO:
> > > >  # u-a for runlevel and telinit
> > >=20
> > > Would this make sense to be in systemd.bbclass?
> >=20
> > Similar logic is in systemd.bbclass already, but systemd is not inherit=
ed from
> > systemd and dbus recipes.
>=20
> Ok, fair enough. I hadn't realised that.
>=20
> > Also the version from systemd.bbclass does check also for systemd in
> > DISTRO_FEATURES, but that's not wanted here, because decision to instal=
l init.d
> > script is based only on sysvinit in DISTRO_FEATURES.
> >=20
> > Lot's of fun with all init systems sharing the same PN :/.

There is also error from prerm :/

//var/lib/opkg/info/dbus-1.prerm: line 3: /etc/init.d/dbus-1: No such file =
or directory

updatercd_prerm() {
if test "x$D" =3D "x"; then
        ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
fi
}

not sure if testing update-rc.d existence like in postinst/postrm=20
if type update-rc.d >/dev/null 2>/dev/null; then
is right way, checking ${INIT_D_DIR}/${INITSCRIPT_NAME}
existence will possibly hide some real issues...

sigh
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFjFIAACgkQN1Ujt2V2gBxhRwCdGiAarYSiSJjGL9OWGZAMSrSI
PMEAn2Fdeb+jKS/r9T6AFAwMZQELKbkX
=GGtG
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
